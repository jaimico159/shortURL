class LinksController < ApplicationController
  def index
    @links = Link.all
  end

  def show
    @link = Link.find_by(token: token)
  end

  def token_redirection
    link = Link.find_by(token: params[:token])

    redirect_to root_path, alert: 'Link doens\'t exists' if link.blank?
    redirect_to link.external_url
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
