class DestinationsController < ApplicationController
  def create
    @route = Route.find(params[:route_id])
    @destination = @route.destinations.create(params[:destination])
    redirect_to route_path(@route)
  end
end
