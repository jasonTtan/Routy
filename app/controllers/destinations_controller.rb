class DestinationsController < ApplicationController
  def create
    @route = Route.find(params[:route_id])
    @destination = @route.destinations.create(params[:destination])
    redirect_to route_path(@route)
  end
  
  def destroy
    @route = Route.find(params[:route_id])
    @destination = @route.destinations.find(params[:id])
    @destination.destroy
    redirect_to route_path(@route)
  end
end
