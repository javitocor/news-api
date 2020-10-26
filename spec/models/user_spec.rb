require 'rails_helper'
RSpec.describe User, type: :model do
  context 'User associations tests' do
    it { should have_many(:news) }
  end
end