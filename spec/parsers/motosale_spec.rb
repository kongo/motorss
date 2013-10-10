require 'spec_helper'

describe Parsers::Motosale do
  describe "#fetch_list" do
    it "fetches the first page of the list of motos on sale" do
      Net::HTTP.stub(:get).and_return File.read("./spec/assets/list.html").force_encoding("CP1251")

      m = Parsers::Motosale.new
      list = m.fetch_list nil

      list.should == [
        {
          :brand_name     => "SUZUKI",
          :model_name     => "Boulevard",
          :mileage       => "20500",
          :year_built     => "2002",
          :papers         => "Справка-счет на покупателя",
          :link           => "suzuki/Boulevard_289940.html",
          :price          => "6200 у.е.",
          :date_published => "10.10.2013 "
        },
        {
          :brand_name     => "HONDA",
          :model_name     => "CRF 450 R",
          :mileage       => "км,",
          :year_built     => "2006",
          :papers         => "Без документов",
          :link           => "honda/CRF_450_R_289938.html",
          :price          => "Дог. у.е.",
          :date_published => "10.10.2013 "
        },
        {
          :brand_name     => "SUZUKI",
          :model_name     => "GSX 650 F",
          :mileage       => "км,",
          :year_built     => "1999",
          :papers         => "Стоит на укр.учете",
          :link           => "suzuki/GSX_650_F_289936.html",
          :price          => "Дог. у.е.",
          :date_published => "10.10.2013 "
        },
        {
          :brand_name     => "KAWASAKI",
          :model_name     => "VN 900",
          :mileage       => "25000",
          :year_built     => "2008",
          :papers         => "Стоит на укр.учете",
          :link           => "kawasaki/VN_900_289935.html",
          :price          => "8500 у.е.",
          :date_published => "10.10.2013 "
        },
        {
          :brand_name     => "VIPER",
          :model_name     => "ATV",
          :mileage       => "10000",
          :year_built     => "2008",
          :papers         => "Справка-счет на покупателя",
          :link           => "viper/ATV_289934.html",
          :price          => "Дог. у.е.",
          :date_published => "10.10.2013 "
        },
        {
          :brand_name     => "SUZUKI",
          :model_name     => "RF 600 R",
          :mileage       => "36000",
          :year_built     => "1998",
          :papers         => "Стоит на укр.учете",
          :link           => "suzuki/RF_600_R_289933.html",
          :price          => "3200 у.е.",
          :date_published => "10.10.2013 "
        },
        {
          :brand_name     => "ZONGSHEN",
          :model_name     => "200",
          :mileage       => "8000",
          :year_built     => "2008",
          :papers         => "Стоит на укр.учете",
          :link           => "zongshen/200_289932.html",
          :price          => "1300 у.е.",
          :date_published => "10.10.2013 "
        },
        {
          :brand_name     => "JAWA",
          :model_name     => "638",
          :mileage       => "5000",
          :year_built     => "1991",
          :papers         => "Снят с учета",
          :link           => "jawa/638_289931.html",
          :price          => "550 у.е.",
          :date_published => "10.10.2013 "
        },
        {
          :brand_name     => "HONDA",
          :model_name     => "Varadero 125",
          :mileage       => "3720",
          :year_built     => "2001",
          :papers         => "Стоит на укр.учете",
          :link           => "honda/Varadero_125_289930.html",
          :price          => "3150 у.е.",
          :date_published => "10.10.2013 "
        },
        {
          :brand_name     => "ИЖ",
          :model_name     => "юпітєр 5",
          :mileage       => "40",
          :year_built     => "1987",
          :papers         => "Стоит на укр.учете",
          :link           => "izh/yupіtier_5_289929.html",
          :price          => "1500 у.е.",
          :date_published => "10.10.2013 "
        }
      ]

    end
  end
end

