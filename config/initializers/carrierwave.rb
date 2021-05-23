require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  if Rails.env.production?
    config.storage :fog
    config.fog_provider = 'fog/aws'
    config.fog_directory  = 'farmland55'
    config.asset_host = 'https://s3.amazonaws.com/farmland55'
    config.fog_public = false
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: 'AKIARH5UR2E4C43RZ373',
      aws_secret_access_key: '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',
      region: 'ap-northeast-1'
    }
  else
    config.storage :file
    config.enable_processing = false if Rails.env.test?
  end
end