require 'rails_helper'

RSpec.describe Link, type: :model do
  it { is_expected.to validate_url_of(:external_url) }
  it { is_expected.to validate_presence_of(:token) }
  it { is_expected.to validate_length_of(:token).is_equal_to(8) }
end
