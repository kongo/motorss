xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Мото в продаже"
    xml.description "Продажа мотоциклов"
    xml.link proposals_url

    for proposal in @proposals
      xml.item do
        xml.title proposal.title
        xml.description proposal.title + "\n" + proposal.description.to_s
        xml.image do
          xml.url proposal_photo_preview_url(proposal) 
        end
        xml.pubDate proposal.date_published.to_s(:rfc822)
        xml.link proposal.full_link
        xml.guid proposal.full_link
      end
    end
  end
end
