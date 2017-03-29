require 'rest-client'
require 'json'
require 'byebug'

class Schedule < ActiveRecord::Base
  attr_accessor
  def self.seed_db
    #Concerns: do not want to seed the db with existing data(look up active record methods that ensure this uniqueness)
    # loop through the hash collected and insert values to DB
    games = get_schedule_data["fullgameschedule"]["gameentry"]
    games.each_with_index do |val, i|
      date = games[i]["date"]
      away_team =  games[i]["awayTeam"]["Name"]
      home_team = games[i]["homeTeam"]["Name"]
      location = games[i]["location"]
      insert_schedule_to_db(date,awayTeam,home_team,location)
    end
  end

  def insert_schedule_to_db(date,away_team,home_team,location)
    schedule = Schedule.new do |s|
      s.date = ""
      s.away_team = ""
      s.home_team = ""
      s.location = ""
    end
    schedule.save
  end

  def get_schedule_data
    url = "https://www.mysportsfeeds.com/api/feed/sample/pull/nba/2015-2016-regular/full_game_schedule.json?"
    get_JSON_data(url)
  end

  def get_JSON_data(url)
    result = RestClient.get(url)
    hash = JSON.parse(result)
  end

  def Method1
    #define generic method to pull data from db
  end

end#/Schedule

Schedule.seed_db
#-------------------------------------------------------------------------------------------------------------------------------#
