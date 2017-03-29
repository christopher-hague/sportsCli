#adds the table elements to the DB
#date
#away team
#home team
#location
class AddSchedule < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.datetime :datetime
      t.string :away_team
      t.sting :home_team
      t.string :location
    end
  end
end
