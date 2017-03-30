=begin

name
number
position
total points
ppg
total assists
assists per game
total rebounds
rebounds per game
total TO's
TO per game
total mins
mins per game
total fg's made
total fg attempts
fg percentage
total 3 pt attempts
total 3 pt made
3pt made per game
total steals
steals per game
total blocks
blocks per game
total fouls
fouls per game

=end

class AddPlayer < ActiveMigration
  def change
    create_table :players do |t|
      t.text :name
      t.integer :number
      t.text :pos
      t.integer :total_pts
      t.float :ppg
      t.integer :ast
      t.float :apg
      t.integer :reb
      t.float :rpg
      t.integer :to
      t.float :topg
      t.integer :mins
      t.float :mpg
      t.integer :fg # total field goals made
      t.integer :fg_att # total field goals attempted
      t.float :fg_pct
      t.integer :fg_3pt_att
      t.integer :fg_3pt
      t.float :fg_3pt_pg
      t.integer :stl
      t.float :spg
      t.integer :blk
      t.float :blk_pg
      t.integer :pf
      t.float :pf_pg
    end
  end
end
