require 'rails_helper'
require 'capybara/rspec'
RSpec.describe New, type: :model do
  context 'New associations tests' do
    it { should belong_to(:user) }
  end
  context 'Validations for news' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:content) }
    it { should validate_length_of(:title).is_at_most(25) }
    it { should validate_length_of(:title).is_at_least(4) }
    it { should validate_length_of(:content).is_at_least(25) }
  end
end