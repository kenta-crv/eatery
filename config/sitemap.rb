# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://eatery-japan.com"

SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'

SitemapGenerator::Sitemap.create do

add "/" , changefreq: 'daily', priority: 1.0
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  #add eateries_path, :priority => 1.0, :changefreq => 'daily'
  #Eatery.find_each do |eatery|
  #  add eatery_path(eatery), :lastmod => eatery.updated_at
  #end

  add reviews_path, :priority => 1.0, :changefreq => 'daily'
  Review.find_each do |review|
    add eatery_review_path(review.eatery.id, review.id), :lastmod => review.updated_at
  end
end
