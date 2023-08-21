class HeroPowersController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def create
        hero_power = HeroPower.create!(hero_powers_params)
        
        hero = Hero.find(hero_power.hero_id)
        render json: hero, include: :powers, status: :created
    end

    private

    def hero_powers_params
        params.permit(:strength, :hero_id, :power_id)
    end

    def render_unprocessable_entity_response(invalid)
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end

end
