require 'string_extensions.rb'
module Parsers
  class Motosale
    require 'net/http'

    ENDPOINT = "www.motosale.com.ua"
    PER_PAGE = 10

    def fetch_list(page_num)
      doc = Nokogiri::HTML fetch_list_page_body(page_num)
      items = doc.xpath('//body/table[1]/tr[2]/td[1]/table[1]/tr[1]/td[3]/table[1]/tr[1]/td[1]/div[3]/div[not(@id)]')

      items.map do |item|
        brand_model = item.xpath("div[2]/table[1]/tbody[1]/tr[1]/td[1]/table[1]/tr[3]/td/span/strong").first.content.strip

        {
          make:           brand_model.split(" - ").first,
          model_name:     brand_model.split(" - ").last,
          mileage:        item.xpath("div[2]/table[1]/tbody[1]/tr[1]/td[1]/table[1]/tr[5]/td").first.children[1].content.strip.gsub(' км,', ''),
          year_built:     item.xpath("div[2]/table[1]/tbody[1]/tr[1]/td[1]/table[1]/tr[5]/td").first.children[3].content.strip,
          papers:         item.xpath("div[2]/table[1]/tbody[1]/tr[1]/td[1]/table[1]/tr[4]/td").first.children[1].content.strip,
          link:           item.xpath("div[2]/table[1]/tbody[1]/tr[1]/td[1]/table/tr/td/a").first.attributes["href"].value,
          price:          item.xpath("div[1]/table/tbody/tr/td[2]/b").first.content.strip,
          date_published: begin item.xpath("div[2]/table[2]/tbody/tr/td").first.children[1].content.strip rescue next end
        }
      end.compact
    end

    private

    def fetch_list_page_body(page_num = 1)
      offset = (page_num ? ((page_num - 1) * PER_PAGE).to_s : "show_all")
      page_addr = "/index.php?search=moto&model=&price%5Bmin%5D=&price" +
        "%5Bmax%5D=&city=&in%5Bmin%5D=&in%5Bmax%5D=&run=&v=&type_obj=1&offset=" +
        (page_num ? page_num.to_s : "show_all")
      Net::HTTP.get ENDPOINT, page_addr
    end

  end
end
