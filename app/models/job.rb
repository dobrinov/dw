class Job < ApplicationRecord
  validates :title,
            :required_skills,
            :details,
            :company_name,
            :company_website,
            :company_contact_email,
            :reward_currency,
            :reward_amount,
            :reward_rules, presence: true

  validates :company_website,
            :call_to_action_url, url: true

  validates :company_contact_email,
            :call_to_action_email, email: true

  validate :valid_location, :valid_call_to_action

  class << self
    def active
      where 'approved_at > ?', 1.month.ago
    end

    def unapproved
      where approved_at: nil
    end

    def awaiting_review
      unapproved.where.not sent_for_review_at: nil
    end
  end

  def approve
    touch :approved_at
  end

  private

  def valid_location
    if !remote_allowed && office_location.blank?
    end

    if remote_allowed && remote_timezone.blank?
      errors.add(:remote_timezone, 'can\'t be blank')
    end

    if remote_allowed && remote_timezone_offset.blank?
      errors.add(:remote_timezone_offset, 'can\'t be blank')
    end
  end

  def valid_call_to_action
    if call_to_action_email.blank? && call_to_action_url.blank?
      errors.add(:call_to_action, 'You should provide at least one way to refer a candidate.')
    end
  end
end
