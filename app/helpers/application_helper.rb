module ApplicationHelper
  def proposal_photo_preview_url(p)
    "http://" + Parsers::Motosale::ENDPOINT + "/.thumb/" + p.ms_photo_file_name
  end
end
