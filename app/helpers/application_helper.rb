module ApplicationHelper
  def proposal_photo_preview_url(p)
    "http://" + MotosaleUa::Scraper::ENDPOINT + "/.thumb/" + p.ms_photo_file_name
  end

  def current_rss_url
    url_for params.merge({ format: 'rss', only_path: false })
  end
end
