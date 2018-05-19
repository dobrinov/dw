titles = [
  'Junior Frontend Developer',
  'Senior Frontend Developer',
  'Junior Backend Developer',
  'Senior Backend Developer',
  'Engineering Manager',
]

skills = [
  'Ruby',
  'Ruby on Rails',
  'React',
  'jQuery',
  'HTML',
  'CSS',
  'Clojure',
  'Golang',
  'Erlang',
  'Java',
]

rewards = [
  500,
  1000,
  1500,
  2000,
  2500,
  3000,
]

8.times do
  Job.create! title: titles.sample,
              reward_amount: rewards.sample,
              reward_currency: 'USD',
              reward_rules: '50% upon start; 50% after six months',
              required_skills: skills.sample(rand(1..skills.size)),
              office_location: ['Sofia, Bulgaria', nil].sample,
              remote_allowed: true,
              remote_timezone: 'CET',
              remote_timezone_offset: '2',
              details: 'Example Inc is looking to hire an expirenced full stack Ruby on Rails developer for its recruitment referals application.',
              call_to_action_url: 'https://example.com/refer',
              call_to_action_email: 'refer@example.com',
              company_name: 'Example Inc',
              company_website: 'https://www.example.com',
              approved_at: rand(1..27).days.ago,
              company_contact_email: 'contact@example.com'
end
