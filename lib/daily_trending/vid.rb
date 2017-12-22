class DailyTrending::Vid
  attr_accessor :title, :views, :description, :url, :category

  def self.today

    vid_1 = self.new
    vid_1.title = 'BITTEN by a GIANT DESERT CENTIPEDE!'
    vid_1.views = '1,300,174'
    vid_1.description = 'On this episode of Breaking Trail, Coyote is bitten by a Giant Desert Centipede!'
    vid_1.url = 'https://www.youtube.com/watch?v=nWZMfPP34g8'
    vid_1.category = 'Pets & Animals'

    vid_2 = self.new
    vid_2.title = "Lucky the iPhone singing cockatiel is OVER it!"
    vid_2.views = '449,340'
    vid_2.description = 'Lucky became famous for singing a perfect rendition
    of an iPhone ringtone. But watch what happens when he sees his own video!
    Dude is OVER it.'
    vid_2.url = 'https://www.youtube.com/watch?v=8eo-L_3OWAQ'
    vid_2.category = 'Film & Animation'

    [vid_1,vid_2]
  end

  #////////Go to youtube and find trending videos//////
  def self.scrape_vids
    vids = []
    #extract properties from each video
    #instaniate a video
    #make method for individual website
    vids << self.scrape_youtube
    #possibly scrape other websites
    vids
  end

  def self.scrape_youtube

  end

end