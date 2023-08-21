class PowersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def index
        powers = Power.all
        render json: powers, except: ['created_at','updated_at'], status: :ok
    end

    def show
        power = find_power
        render json: power, except: ['created_at','updated_at'], status: :ok
    end

    def update
        power = find_power
        power.update!(power_params)
        render json: power,  except: ['created_at','updated_at'], status: :ok
    end

    private

    def find_power
        Power.find(params[:id])
    end

    def record_not_found
        render json: { error: 'Power not found' }
    end

    def power_params
        params.permit(:description)
    end

    def render_unprocessable_entity_response(invalid)
        render json: {error: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end
end
