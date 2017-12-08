# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions
activate :dotenv
activate :sprockets

activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

activate :contentful do |f|
  f.access_token = ENV['CONTENTFUL_TOKEN']
  f.space = {bulletin: ENV['CONTENTFUL_SPACE']}
  f.content_types = { entry: "entry" }
  f.cda_query = {content_type: "entry"}
end

# Helpers
helpers do
  def days_to_past(date)
    moveDate = Date.parse('29-12-2017')
    todayDate = Date.today
    postDate = date.to_date
    return (postDate.mjd - moveDate.mjd)
  end

  def ordered_entries(entries)
    return entries.to_a.sort_by{ |id, e| e['date'] }
  end

  def data_date(date)
    return DateTime.parse(date).to_date.strftime("%d/%m/%Y")
  end

  def output_date(date)
    return DateTime.parse(date).to_date.strftime("%d %b %Y")
  end
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
