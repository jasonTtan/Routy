class CommentsController < ApplicationController
  def create
    @route = Route.find(params[:route_id])
    @comment = @route.comments.create(params[:comment])
    redirect_to route_path(@route)
  end
  
  def destroy
    @route = Route.find(params[:route_id])
    @comment = @route.comments.find(params[:id])
    @comment.destroy
    redirect_to route_path(@route)
  end
end
