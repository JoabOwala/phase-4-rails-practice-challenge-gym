class GymsController < ApplicationController
    def show
        gym = find_gym
        render json: gym
    rescue ActiveRecord::RecordNotFound
        render json: { error: "Gym not found" }, status: :not_found
    end

    def destroy
        gym = find_gym
        gym.destroy
        head :no_content

    rescue ActiveRecord::RecordNotFound
        render json: { error: "Gym not found "}, status: :not_found
    end

    private

    def find_gym
        Gym.find(params[:id])
    end
end
