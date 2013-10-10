namespace :motosale do
  task :initial_pull => :environment do |cmd|
    parser = Parsers::Motosale.new
    parser.fetch_list(nil).each do |info|
      proposal = Proposal.new(info)
      Rails.logger.info "+ #{proposal.title}"
      proposal.save!
    end
  end
end
