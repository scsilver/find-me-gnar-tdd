namespace :import do
  desc "Import resorts from a JSON file"
  task :resorts => :environment do
    json = JSON.parse(File.read('Resorts.json'))
    json.each { |json| Resort.create(json) }
  end
end
desc "Import tweets"
task :gettwit => :environment do
  Tweet.destroy_all
  ActiveRecord::Base.connection.reset_pk_sequence!('tweets')
  	client = Twitter::REST::Client.new do |config|
    	config.consumer_key        = "sHYZw1pbZFh8IXOajTg9bQ75I"
    	config.consumer_secret     = "eNGiUWSaXpIsSREmAKyqbMY0KfyMgua70APJcboipqLm8plxl0"
    	config.access_token        = "2784793124-APKuoXpi5VQYJKrzct1PuTDyrYlEGYqIhCt0wBf"
    	config.access_token_secret = "d72lBVSmeve18Vzssu44lUjUq2XPAgx8VLCz15Nw4SkFW"
	  end
  string = "Ski Cooper OR Silverton Mountain OR Powderhorn OR Monarch Mountain OR Loveland OR Keystone OR Howelsen Hill OR Aspen Snowmass OR Arapahoe Basin Ski Area OR Eldora Mountain Resort OR Durango Mountain Resort OR Crested Butte Mountain Resort OR Copper Mountain Resort OR Breckenridge OR Beaver Creek OR Wolf Creek Ski Area OR Winter Park Resort OR Vail OR Telluride OR Sunlight Mountain Resort OR Steamboat OR Ski Granby Ranch"
	client.search("Cooper OR Silverton OR Powderhorn OR Monarch OR Loveland OR Keystone OR Howelsen OR Aspen OR Snowmass OR Arapahoe OR ABasin OR Eldora OR Durango OR Crested OR Butte OR Copper OR Breckenridge OR Beaver OR Wolf OR Vail OR Telluride OR Sunlight OR Steamboat OR Granby ski OR #ski -Win -deal -cost -fee -price -%E3 -RT -sweepstakes -shop", :result_type => "recent").take(100).each \
  do |tweet|
  Tweet.create(user: tweet.user.screen_name, content: tweet.text)
  end
end
task :gettwitresort => :environment do
  Tweet.destroy_all
  ActiveRecord::Base.connection.reset_pk_sequence!('tweets')
  	client = Twitter::REST::Client.new do |config|
    	config.consumer_key        = "sHYZw1pbZFh8IXOajTg9bQ75I"
    	config.consumer_secret     = "eNGiUWSaXpIsSREmAKyqbMY0KfyMgua70APJcboipqLm8plxl0"
    	config.access_token        = "2784793124-APKuoXpi5VQYJKrzct1PuTDyrYlEGYqIhCt0wBf"
    	config.access_token_secret = "d72lBVSmeve18Vzssu44lUjUq2XPAgx8VLCz15Nw4SkFW"
	  end
  Resort.all.each do |resort|
    string = "#{resort}"
  	client.search("#{resort.name } -Win -deal -cost -fee -price -%E3 -RT -sweepstakes -shop", :result_type => "recent").take(100).each \
    do |tweet|
      Tweet.create(user: tweet.user.screen_name, content: tweet.text, resort_id: resort.id)
    end
  end
end
