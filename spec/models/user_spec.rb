require 'rails_helper'
require 'capybara/rspec'
RSpec.describe User, type: :model do
  context 'User associations tests' do
    it { should have_many(:new) }
  end
end