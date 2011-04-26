class NodesController < ApplicationController
  before_filter :authorize
  def show
    @node = Node.find(params[:id])
  end
end