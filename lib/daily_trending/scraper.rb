class DailyTrending::Scraper

  # def self.scrape_play_store
  #   doc = Nokogiri::HTML(open("https://play.google.com/store/apps/collection/promotion_3000792_new_releases_apps?clp=SpEBCikKI3Byb21vdGlvbl8zMDAwNzkyX25ld19yZWxlYXNlc19hcHBzEAcYAxpkCl5uZXdfaG9tZV9kZXZpY2VfZmVhdHVyZWRfcmVjczJfdG9waWNfdjFfbGF1bmNoX2FwcHNfVVNfXzE1MTQ0NDgwMDAwMDBfNl9wcm9tb18xNTE0NDkxNzcwMTgwMDAwEAwYAw%3D%3D%3AS%3AANO1ljLrBj0&hl=en"))
  #   doc.css('div.card-content.id-track-click.id-track-impression')
  # end

  def self.scrape_play_store
    doc = Nokogiri::HTML(open("https://play.google.com/store/apps/collection/promotion_3000792_new_releases_apps?clp=SpEBCikKI3Byb21vdGlvbl8zMDAwNzkyX25ld19yZWxlYXNlc19hcHBzEAcYAxpkCl5uZXdfaG9tZV9kZXZpY2VfZmVhdHVyZWRfcmVjczJfdG9waWNfdjFfbGF1bmNoX2FwcHNfVVNfXzE1MTQ0NDgwMDAwMDBfNl9wcm9tb18xNTE0NDkxNzcwMTgwMDAwEAwYAw%3D%3D%3AS%3AANO1ljLrBj0&hl=en"))
    doc.css('div.card-content.id-track-click.id-track-impression')
  end

  # def scrape_apps
  #   scrape_play_store.each do |a|
  #     app = DailyTrending::App.new
  #     app.title = a.css('a.title').attribute('title').value
  #     app.dev = a.css('a.subtitle').attribute('title').value
  #     app.dev_url = ("https://play.google.com" + a.css('a.subtitle').attribute('href').value)
  #     app.app_url = ("https://play.google.com" + a.css('a.title').attribute('href').value)
  #     app.rating = a.css('div.tiny-star').attribute('aria-label').value.strip.slice(/\d.\S/)<<"/5 Stars"
  #     app.price = a.at_css('span.display-price').text
  #     app.exist? ? all.freeze : app.save
  #   end
  # end

  def self.make_apps
    scrape_play_store.each do |a|
      DailyTrending::App.new_from_index(a)
    end
    DailyTrending::App.all
  end

  def self.scrape_app(app_url)
    Nokogiri::HTML(open(app_url))
  end

end
