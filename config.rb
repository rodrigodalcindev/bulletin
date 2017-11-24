# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions
activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

activate :contentful do |f|
  f.access_token = "b7606d9bc9a5ff536e068d3c0265a3f7428b354a47d4182d32e9f13cb19bc113"
  f.space = {bulletin: "tdt67exn6060"}
  f.content_types = { entry: "entry" }
  f.cda_query = {content_type: "entry"}
end

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

set :relative_links, true

configure :build do
  activate :relative_assets

  activate :robots, :rules => [
    {:user_agent => '*', :disallow => %w(/)}
  ]
end
