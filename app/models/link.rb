class Link < ApplicationRecord
  validates :external_url, url: { allow_blank: false }
  validates_presence_of :token
  validates_length_of :token, is: 8

  has_many :visits

  def short_url(request)
    "#{request.base_url}/#{token}"
  end
end
