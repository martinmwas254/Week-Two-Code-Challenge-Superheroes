class HerosController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response 

    # GET /heros
def index
    heros = Hero.all
    render json: heros, except: [:id, :created_at, :updated_at]
  end



# GET /heros/:id
def show
    hero = find_hero
    render json: hero, except: [:id, :created_at, :updated_at], include: { powers: { except: [:created_at, :updated_at] } }
  end
  


  private


  def render_not_found_response

    render json: { error: "Hero not found" }, status: :not_found

  end

  def find_hero
    Hero.find(params[:id])
  end
end
