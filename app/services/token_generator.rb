class TokenGenerator < ApplicationService
  def call
    token = generate_token
    {
      success: token.present?,
      data: {
        token: token
      }
    }
  end

  private

  def generate_token
    3.times do
      token = SecureRandom.alphanumeric(8)

      next if Link.where(token: token).exist?

      return token
    end
    nil
  end
end
