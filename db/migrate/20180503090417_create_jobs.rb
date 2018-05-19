class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.string   :title, null: false
      t.decimal  :reward_amount, precision: 8, scale: 2, null: false
      t.string   :reward_currency, null: false
      t.string   :reward_rules, null: false
      t.string   :required_skills, array: true, default: [], null: false
      t.boolean  :remote_allowed, null: false
      t.string   :remote_timezone
      t.string   :remote_timezone_offset
      t.string   :office_location
      t.string   :details, null: false
      t.string   :call_to_action_email
      t.string   :call_to_action_url
      t.string   :company_name, null: false
      t.string   :company_website, null: false
      t.string   :company_contact_email, null: false
      t.datetime :approved_at
      t.datetime :sent_for_review_at

      t.timestamps
    end
  end
end
