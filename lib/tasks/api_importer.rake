require_relative '../importer'

namespace :api_importer do
  desc "Imports fundraisers from API to database"
  task import: :environment do
    ImportFromAPI.new.run!
  end
end
