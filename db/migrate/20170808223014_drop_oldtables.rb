class DropOldtables < ActiveRecord::Migration
  def change
  	drop_table :expression_of_interests
  	drop_table :project_evaluations
  	drop_table :student_rankings
  	drop_table :students
  end
end
