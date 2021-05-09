unless Rails.env.development? || Rails.env.test?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: 'AKIARH5UR2E4C43RZ373',
      aws_secret_access_key: '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',
      region: 'ap-northeast-1'
    }

    config.fog_directory  = 'farmland55'
    config.cache_storage = :fog
  end
end