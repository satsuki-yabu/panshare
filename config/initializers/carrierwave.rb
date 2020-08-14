if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['ACCESS_KEY_ID'],
      aws_secret_access_key: ENV['SECRET_ACCESS_KEY'],
      region: ENV['S3_REGION'],　# S3バケット作成時に指定したリージョン。左記は東京を指す
    }
    config.fog_directory  = ENV['S3_BUCKET'] # 作成したS3バケット名
  end
end
    
    
CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/
