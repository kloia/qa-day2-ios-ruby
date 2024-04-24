require 'em/pure_ruby'
require 'appium_lib'
require 'rspec'
require 'yaml'
require 'allure-cucumber'

Dir["#{Dir.pwd}/config/**/*.rb"].each { |file| require_relative file }
Dir["#{Dir.pwd}/utils/*.rb"].each { |file| require_relative file }

case BaseConfig.device_type
when 'local'
  $caps = YAML.load_file(File.expand_path("./config/device/device_config.yml"))
  $caps[:caps]['udid'] = `idevice_id -l`.strip
  $caps[:caps]['deviceName'] = `idevicename`.strip
  $caps[:caps]['platformVersion'] = `ideviceinfo -u $(idevice_id) | grep ProductVersion`.strip.split(" ")[1]
  $caps[:caps]['bundleId'] = BaseConfig.bundle_id
  else
  $caps = YAML.load_file(File.expand_path("./config/digitalai/parametric_caps.yml"))
  $caps[:caps]['accessKey'] = DigitalaiConfig.digital_ai_access_key
  $caps[:caps]['bundleId'] = BaseConfig.bundle_id
  $caps[:caps]['app'] = "cloud:#{BaseConfig.bundle_id}"
  if DigitalaiConfig.device_udid != "any"
    $caps['udid'] = DigitalaiConfig.device_udid
  end
  $caps[:appium_lib]['server_url'] = "#{DigitalaiConfig.digital_ai_url}/wd/hub"
end

Allure.configure do |c|
  c.results_directory = 'output/allure-results'
  c.clean_results_directory = true
end

begin
  Appium::Driver.new($caps, true)
  Appium.promote_appium_methods Object
rescue Exception => e
  puts e.message
  Process.exit(0)
end