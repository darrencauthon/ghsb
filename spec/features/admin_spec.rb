require 'spec_helper'

describe 'Admin' do

  subject { page }

  let(:admin) { FactoryGirl.create :admin }
  let(:user)  { FactoryGirl.create :user }

  describe 'permissions' do

    let(:path) { rails_admin.dashboard_path }

    it { should_not allow_access.to(:guest) }
    it { should_not allow_access.to(:user)  }
    it { should     allow_access.to(:admin) }

  end

  describe 'navbar' do

    context 'not logged in' do

      before do
        visit root_path
      end

      it 'does not include a link to the admin' do
        should_not have_css(".navbar a[href='#{ rails_admin.dashboard_path }']")
      end

    end

    context 'logged in as a user' do

      before do
        login_as user
        visit root_path
      end

      it 'does not include a link to the admin' do
        should_not have_css(".navbar a[href='#{ rails_admin.dashboard_path }']")
      end

    end

    context 'logged in as an admin' do

      before do
        login_as admin
        visit root_path
      end

      it 'includes a link to the admin' do
        should have_css(".navbar a[href='#{ rails_admin.dashboard_path }']")
      end

    end

  end

end
