require 'spec_helper'

describe Parsers::Motosale do
  describe "#fetch_list" do
    it "fetches the first page of the list of motos on sale" do
      Net::HTTP.stub(:get).and_return File.read("./spec/assets/list.html").force_encoding("WINDOWS-1251")

      m = Parsers::Motosale.new
      list = m.fetch_list nil

      list.should == 

        [
          {
            :make=>"YAMAHA", :model_name=>"XVS 950 A Midnight Star", :mileage=>"15000", :year_built=>"2010", :papers=>"Стоит на укр.учете", :link=>"yamaha/XVS_950_A_Midnight_Star_375006.html", :price=>"10500 $", :location=>"Одесса", :uin=>375006, :date_published=>"07.02.2015", :ms_photo_file_name=>"k4hcftndsmvdvwh69apg.jpg"
          },
          {
            :make=>"YAMAHA", :model_name=>"YZF R1", :mileage=>"2000", :year_built=>"2012", :papers=>"Стоит на укр.учете", :link=>"yamaha/YZF_R1_375005.html", :price=>"1500 $", :location=>"Харьков", :uin=>375005, :date_published=>"07.02.2015", :ms_photo_file_name=>"ssgytragzhywpxcfxf4f.jpg"
          },
          {
            :make=>"KAWASAKI", :model_name=>"Ninja 600 ZX-6R", :mileage=>"8531", :year_built=>"2011", :papers=>"Справка-счет на покупателя", :link=>"kawasaki/Ninja_600_ZX-6R_375003.html", :price=>"9300 $", :location=>"Киев", :uin=>375003, :date_published=>"07.02.2015", :ms_photo_file_name=>"zg5pwk2ggxdt54qm87sm.jpg"
          },
          {
            :make=>"KAWASAKI", :model_name=>"Ninja 636 ZX-6R", :mileage=>"39000", :year_built=>"2007", :papers=>"Стоит на укр.учете", :link=>"kawasaki/Ninja_636_ZX-6R_375002.html", :price=>"4000 $", :location=>"Киев", :uin=>375002, :date_published=>"07.02.2015", :ms_photo_file_name=>"5r7vmzpswzxpwhwdpxkg.jpg"
          },
          {
            :make=>"SUZUKI", :model_name=>"GSX 600", :mileage=>"6287", :year_built=>"2007", :papers=>"Модель не для дорог общего пользования", :link=>"suzuki/GSX_600_375001.html", :price=>"100 $", :location=>"Луцк", :uin=>375001, :date_published=>"07.02.2015", :ms_photo_file_name=>"tfgnrp3tsu49yhcderyz.jpg"
          },
          {
            :make=>"HYOSUNG", :model_name=>"GT250R", :mileage=>"15945", :year_built=>"2006", :papers=>"Стоит на укр.учете", :link=>"hyosung/GT250R_375000.html", :price=>"2500 $", :location=>"Днепропетровск", :uin=>375000, :date_published=>"07.02.2015", :ms_photo_file_name=>"vadvvxvbnzr9u8b6cgqd.jpg"
          },
          {
            :make=>"HONDA", :model_name=>"Deauville 650", :mileage=>"34200", :year_built=>"2003", :papers=>"Стоит на укр.учете", :link=>"honda/Deauville_650_374999.html", :price=>"4500 $", :location=>"Киев", :uin=>374999, :date_published=>"07.02.2015", :ms_photo_file_name=>"eeqgufzuahryzs8tud9p.jpg"
          },
          {
            :make=>"HONDA", :model_name=>"CBR 300 R", :mileage=>"445", :year_built=>"2015", :papers=>"Без документов", :link=>"honda/CBR_300_R_374998.html", :price=>"22 $", :location=>"Ивано-Франковск", :uin=>374998, :date_published=>"07.02.2015", :ms_photo_file_name=>"d4wu3v6738fwwuqnfexf.jpg"
          },
          {
            :make=>"YAMAHA", :model_name=>"YZ 450 F", :mileage=>"км,", :year_built=>"2008", :papers=>"Модель не для дорог общего пользования", :link=>"yamaha/YZ_450_F_374997.html", :price=>"3200 $", :location=>"Житомир", :uin=>374997, :date_published=>"07.02.2015", :ms_photo_file_name=>"zuapes8t3ehszwrvd3ft.jpg"
          },
          {
            :make=>"KAWASAKI", :model_name=>"VN 2000", :mileage=>"27000", :year_built=>"2008", :papers=>"Стоит на укр.учете", :link=>"kawasaki/VN_2000_374996.html", :price=>"16000 $", :location=>"Житомир", :uin=>374996, :date_published=>"07.02.2015", :ms_photo_file_name=>"fkr27npsnttdrgx8pkvb.jpg"
          }
      ]

    end
  end
end

