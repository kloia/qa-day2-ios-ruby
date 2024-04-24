module BaseConfig

  @device_type = 'cloud'
  def self.device_type
    @device_type

    @bundle_id = 'com.experitest.ExperiBank'
    def self.bundle_id
      @bundle_id
    end

    @wait_time = 15
    def self.wait_time
      @wait_time
    end

    @moderate_wait_time = 10
    def self.moderate_wait_time
      @moderate_wait_time
    end

    @short_wait_time = 5
    def self.short_wait_time
      @short_wait_time
    end
  end
end