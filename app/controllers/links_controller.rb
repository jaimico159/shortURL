class LinksController < ApplicationController
  def index
    @links = Link.all
    @host = request.base_url
  end

  def show
    @link = Link.find_by(token: params[:token])
  end

  def new
    @link = Link.new
  end

  def create
    link = Link.new link_params
    resp = TokenGenerator.call

    link.token = resp[:data][:token]

    if link.save
      redirect_to link_info_path(link), notice: 'Link generated successfully!'
    else
      redirect_to root_path, alert: link.errors.full_messages.join(',')
    end
  end

  private

  def link_params
    params.require(:link).permit(:external_url)
  end
end
