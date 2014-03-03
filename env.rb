# Configure for local environment
begin; require_relative '.env.rb'; rescue LoadError; end

# Configure unconfigured variables using ||=. Those keys aren't real, so don't
# even bother trying them. You'll need your own account and environment ;-)
ENV['SPREEDLY_API_URL'] ||= 'https://core.spreedly.com'
ENV['SPREEDLY_ENVIRONMENT_KEY'] ||= 'OB9909MNZj62u9U4VAz3lAAPZcp'
ENV['SPREEDLY_ACCESS_SECRET'] ||= 'MIMo7gJrSi3LnJGdRrOZeBBowXmDVE4zEgyHQS91tIqZiJ2oiy6PRt5XJVXG7hcz'
ENV['SPREEDLY_JS_URL'] ||= 'https://core.spreedly.com/v1/spreedly.js'
