class HeroPowersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    
    # POST /hero_powers
    def create
        hero = Hero.all
        hero_power = HeroPower.new(hero_power_params)
  
      if hero_power.save
        hero = Hero.find(hero_power.hero_id)
        render json: hero, except: [:created_at, :updated_at], include: { powers: { except: [:created_at, :updated_at] } }
    else
        render json: { errors: hero_power.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    private
  
    def hero_power_params
      params.permit(:strength, :power_id, :hero_id)
    end
  
    def render_not_found_response
      render json: { error: "Hero powers not found" }, status: :not_found
    end
  end
  