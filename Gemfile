source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.4'




# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

gem 'carrierwave'



gem 'autoprefixer-rails', '~> 6.3', '>= 6.3.6.2'
gem 'simple_form', '~> 3.2', '>= 3.2.1'
gem 'simple_form_extension', '~> 1.3', '>= 1.3.22'
gem 'simple_form_bootstrap3', '~> 0.3.6'
gem 'haml', '~> 4.0', '>= 4.0.7'
gem 'paperclip', '~> 4.3', '>= 4.3.6'
# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'


# Gems used only for assets and not required
# in production environments by default.

gem "activerecord-postgis-adapter"
gem "airbrake"
gem 'aws-s3'
gem 'bootstrap-sass', '~> 3.3', '>= 3.3.6'

gem "compass"
gem "devise"
gem 'dbf'
gem "geokit"
gem 'gmaps4rails', '<= 0.11.0'
gem "haml-rails"
gem 'heroku'
gem "high_voltage"

gem 'pg'
gem 'prawn'
gem "rgeo"
gem "rgeo-shapefile"
gem "rgeo-geojson", :require => 'rgeo/geo_json'
gem 'rails_admin'
gem "thin"

group :assets do
  # Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
  # Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
  # Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
end

group :production do 
  gem 'newrelic_rpm'
end

group :development do
	# Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'heroku'
  gem 'taps'
  gem 'rails3-generators'
  gem 'nokogiri'
  #gem 'nokogiri', '~> 1.6', '>= 1.6.8'
  gem 'mechanize'
  # Use sqlite3 as the database for Active Record
gem 'sqlite3'
end

group :test do
  gem 'sqlite3'
  gem "rspec"
  gem "rspec-rails"
  gem "factory_girl"
  gem 'turn', :require => false
end

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
end
