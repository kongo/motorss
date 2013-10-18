xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Лента Motosale"
    xml.description "Продажа мотоциклов"
    xml.link proposals_url

    for proposal in @proposals
      xml.item do
        xml.title proposal.title
        xml.description proposal.title + "\n" + (image_tag proposal_photo_preview_url(proposal))  + proposal.description.to_s
        xml.pubDate proposal.date_published.to_s(:rfc822)
        xml.link proposal.full_link
        xml.guid proposal.full_link
      end
    end
  end
end
