class ClientsController < ApplicationController
    
    def show
        client = find_client
        render json: client
    rescue ActiveRecord::RecordNotFound
        render json: { error: "Client not found" }, status: :not_found
    end

    def total_amount
        client = find_client
        total_amount = client.memberships.sum(:charge)
        render json: { total_amount: total_amount }
    rescue ActiveRecord::RecordNotFound
        render json: { error: "Client not found" }, status: :not_found
    end

    private

    def find_client
        Client.find(params[:client_id])
    end
end
