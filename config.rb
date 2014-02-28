require 'slim'

set :title, "Introduction to Data Design with Ruby on Rails"
set :encoding, "utf-8"

I18n.enforce_available_locales = true
#Markdown
set :markdown_engine, :kramdown

#Livereload
activate :livereload

activate :syntax, :line_numbers => false
activate :directory_indexes


activate :s3_sync do |s3_sync|
  s3_sync.bucket                     = 'my.s3bucket.com' # The name of the S3 bucket you are targetting. This is globally unique.
  s3_sync.region                     = 'us-east-1'     # The AWS region for your bucket.
  s3_sync.aws_access_key_id          = 'AAAAAAA'
  s3_sync.aws_secret_access_key      = 'BBBSSSZZZzkj3'
  s3_sync.delete                     = false # We delete stray files by default.
  s3_sync.after_build                = false # We do not chain after the build step by default. 
  s3_sync.prefer_gzip                = true
  s3_sync.path_style                 = true
  s3_sync.reduced_redundancy_storage = false
  s3_sync.acl                        = 'public-read'
  s3_sync.encryption                 = false
end



###
# Page options, layouts, aliases and proxies
###



set :layout, :page

page "/", :proxy => "/book/toc.html", :layout => :book do 
  @hide_nav = true
end

page "/book/**/**", :layout => :book do 

end


### CALLBACK FUN


ready do
  # sitemap.resources.group_by {|p| p.data["category"] }.each do |category, pages|
  #   proxy "/categories/#{category}.html", "category.html", 
  #     :locals => { :category => category, :pages => pages }
  # end
end



# Site Settings
@analytics_account = false
@typekit_account = 'deu1taf'

# Asset Settings
set :css_dir, 'assets/css'
set :js_dir, 'assets/js'
set :images_dir, 'assets/img'

# Add bower's directory to sprockets asset path
after_configuration do
  @bower_config = JSON.parse(IO.read("#{root}/.bowerrc"))
  sprockets.append_path File.join "#{root}", @bower_config["directory"]
end

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Create favicon/touch icon set from source/favicon_base.png
  activate :favicon_maker

  # Enable cache buster
  # activate :cache_buster

  # alternative to cache buster
  # activate :asset_hash

  # compress all the things
  activate :gzip

  # Use relative URLs
  # activate :relative_assets

  # Compress PNGs after build
  # First: gem install middleman-smusher
  # require "middleman-smusher"
  # activate :smusher

  # Or use a different image path
  # set :http_path, "/Content/images/"
end

# ftp deployment configuration. 
# activate :deploy do |deploy|
#   deploy.method = :ftp
#   deploy.host = "ftp-host"
#   deploy.user = "ftp-user"
#   deploy.password = "ftp-password"
#   deploy.path = "ftp-path"
# end
