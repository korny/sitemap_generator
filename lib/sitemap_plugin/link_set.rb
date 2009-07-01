module SitemapPlugin
  class LinkSet
    attr_accessor :default_host, :links
    
    def initialize
      @links = []
    end

    def default_host=(host)
      @default_host = host
      add_default_links
    end

    def add_default_links
      # Add default links
      @links << Link.new('/', :lastmod => Time.now, :changefreq => 'always', :priority => 1.0)
      @links << Link.new('/sitemap_index.xml.gz', :lastmod => Time.now, :changefreq => 'always', :priority => 1.0)
    end
    
    def add_links
      yield Mapper.new(self)
    end
    
    def add_link(link)
      @links << link
    end
  end
end