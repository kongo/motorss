module Parsers
  class Motosale
    require 'net/http'

    ENDPOINT = "www.motosale.com.ua/"
    PER_PAGE = 10

    def fetch_list(page_num)
      doc = Nokogiri::HTML fetch_list_page_body(page_num)
    end

    private

    def fetch_list_page_body(page_num)
      url = ENDPOINT + "index.php?search=moto&model=&price%5Bmin%5D=&price"
        + "%5Bmax%5D=&city=&in%5Bmin%5D=&in%5Bmax%5D=&run=&v=&type_obj=1&offset="
        + (page_num ? page_num.to_s : "show_all")
      Net::HTTP.get url
    end

  end
end
