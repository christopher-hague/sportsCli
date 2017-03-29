require 'rest-client'
require 'json'
require 'byebug'


def get_JSON_data(url)
  result = RestClient.get(url)
  hash = JSON.parse(result)
end

def get_schedule_data
  url = "https://www.mysportsfeeds.com/api/feed/sample/pull/nba/2015-2016-regular/full_game_schedule.json?"
  get_JSON_data(url)
end

#send all the data we need to the DB first and then use queries to select the data
#model the domain | date | away team | home team |
#input all data into the DB from one query that inputs data into the DB


#returns

#test Schedule
games = get_schedule_data["fullgameschedule"]["gameentry"]
games.each_with_index do |val, i|
  p games[i]["date"]
  p games[i]["awayTeam"]["Name"]
  p games[i]["homeTeam"]["Name"]
  p games[i]["location"]
end
