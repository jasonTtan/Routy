class CommentsController < ApplicationController
  def create
    @route = Route.find(params[:route_id])
    @comment = @route.comments.create(params[:comment])
    redirect_to route_path(@route)
  end
end
