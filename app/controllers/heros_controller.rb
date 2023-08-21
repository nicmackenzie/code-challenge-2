class HerosController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    def index
        heros = Hero.all
        render json: heros, except: ['created_at','updated_at'], status: :ok
    end

    def show
        hero = Hero.find(params[:id])
        render json: hero, except: ['created_at','updated_at'], include: :powers, status: :ok
    end

    private
    
    def record_not_found
        render json: {error: 'Hero not found'}, status: :not_found
    end
end
