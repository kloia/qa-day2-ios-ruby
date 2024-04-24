module Loggers

  def self.take_screenshot(file_name)
    screenshot_path = create_file_path_for_record(file_name, "screenshots")[:recording_path]
    screenshot("#{screenshot_path}.png")
    Allure.add_attachment(name: 'Screenshot', source: screenshot("#{screenshot_path}.png"), type: Allure::ContentType::PNG,
                          test_case: true)
  end

  def self.create_file_path_for_record(file_name, folder_name)
    time = Time.new
    time_day = time.strftime('%Y-%m-%d')
    time_hours = time.strftime('%H-%M-%S')
    file_path = "output/#{folder_name}-#{time_day}"
    FileUtils.mkdir_p(file_path) unless File.directory?(file_path)
    recording_name = "#{file_name.gsub(" ", '_')}-#{time_hours}"
    { recording_path: "#{file_path}/#{recording_name}", file_path: file_path, file_name: "#{recording_name}" }
  end
end