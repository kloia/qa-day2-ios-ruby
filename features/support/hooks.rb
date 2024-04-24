Before do |scenario|
  puts "#{scenario.name} is started"
  driver.start_driver
end

After do |scenario|
  begin
    if scenario.failed?
      puts "FAILED ==> #{scenario.name}\n#{scenario.exception}:#{scenario.exception.message}"
      Loggers.take_screenshot(scenario.name)
    else
      puts "SUCCESS ==> #{scenario.name}"
    end
  rescue StandardError => e
    puts e
    driver.driver_quit
  end
  driver.driver_quit
end