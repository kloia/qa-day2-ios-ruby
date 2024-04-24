module DigitalaiConfig

  @digital_ai_url = 'https://partners.experitest.com'
  def self.digital_ai_url
    @digital_ai_url
  end

  @digital_ai_access_key = ENV['dai_access_key']
  def self.digital_ai_access_key
    @digital_ai_access_key
  end

  @device_udid = ENV["device_udid"] || "any"
  def self.device_udid
    @device_udid
  end

end