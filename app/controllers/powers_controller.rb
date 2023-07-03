class PowersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response 

    # GET /powers
    def index
        powers = Power.all
      render json: powers
    end
  
    # GET /powers/:id
    def show
        power = find_power
        render json: power, except: [:created_at, :updated_at]
      end
      
  
    # PATCH /powers/:id
    def update
        power = find_power
        if power.update(power_params)
          render json: power, except: [:created_at, :updated_at]
        else
          render json: { error: "Failed to update power" }, status: :unprocessable_entity
        end
      end
      
  
    private
  
    def power_params
      params.permit(:description)
    end
  
    def render_not_found_response
  
      render json: { error: "Power not found" }, status: :not_found
  
    end
  
    def find_power
        Power.find(params[:id])
    end
  
  end
  