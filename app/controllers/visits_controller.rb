class VisitsController < ApplicationController
  def token_redirection
    link = Link.find_by(token: params[:token])
    redirect_to root_path, alert: 'Link doens\'t exists' if link.blank?

    ip_address = request.remote_ip
    visit = Visit.new(ip_address: ip_address, link_id: link.id)
    if visit.save
      redirect_to link.external_url
    else
      redirect_to new_link_path, alert: 'URL not working!'
    end
  end
end
