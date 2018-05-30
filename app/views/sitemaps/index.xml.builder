xml.instruct!
xml.urlset(xmlns: "http://www.sitemaps.org/schemas/sitemap/0.9") do
  @static_pages.each do |url|
    xml.url do
      xml.loc url
      xml.changefreq("weekly")
    end
  end

  @jobs.each do |job|
    xml.url do
      xml.loc job_url(job)
      xml.changefreq("monthly")
    end
  end
end
