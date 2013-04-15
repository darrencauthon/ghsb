require 'spec_helper'

describe 'viewing issues' do

  include ERB::Util

  subject { page }

  shared_examples 'issues index' do

    before do
      visit path
    end

    it 'returns issues in a table' do
      should have_css('table.issues')
    end

    it 'returns issues for the repo' do
      should have_css('tr.issue', count: 3)
    end

  end

  describe 'web view' do

    context 'without a token', vcr: { cassette_name: 'viewing_issues/without_a_token' } do

      let(:path) { issues_path user: 'bm5k', repo: 'ghsb' }

      it_behaves_like 'issues index'
      it_behaves_like 'web view', 'table'

    end

    context 'with a token', vcr: { cassette_name: 'viewing_issues/with_a_token' } do

      let(:path) { issues_path token: ENV['GITHUB_TOKEN'], user: 'bm5k', repo: 'ghsb' }

      it_behaves_like 'issues index'
      it_behaves_like 'web view', 'table'

    end

    context 'without a user/repo', vcr: { cassette_name: 'viewing_issues/token_only' } do

      let(:path) { issues_path token: ENV['GITHUB_TOKEN'] }

      it_behaves_like 'issues index'
      it_behaves_like 'web view', 'table'

    end

  end

  describe 'widget' do

    context 'without a token', vcr: { cassette_name: 'viewing_issues/without_a_token' } do

      let(:path) { issues_path user: 'bm5k', repo: 'ghsb', format: 'widget' }

      it_behaves_like 'issues index'
      it_behaves_like 'widget view', 'table'

    end

    context 'with a token', vcr: { cassette_name: 'viewing_issues/with_a_token' } do

      let(:path) { issues_path token: ENV['GITHUB_TOKEN'], user: 'bm5k', repo: 'ghsb', format: 'widget' }

      it_behaves_like 'issues index'
      it_behaves_like 'widget view', 'table'

    end

  end

end
