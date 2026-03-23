class RequestsController < ApplicationController

  def index
    @requests = Request.all

    if params[:category].present?
      @requests = @requests.where(category_id: params[:category])
    end

    if params[:search].present?
      @requests = @requests.where("title LIKE ?", "%#{params[:search]}%")
    end

    @requests = @requests.page(params[:page]).per(10)
  end

  def show
    @request = Request.find_by(id: params[:id])
  end

end