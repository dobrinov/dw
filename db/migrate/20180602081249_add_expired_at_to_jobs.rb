class AddExpiredAtToJobs < ActiveRecord::Migration[5.1]
  def change
    add_column :jobs, :expired_at, :datetime
  end
end
