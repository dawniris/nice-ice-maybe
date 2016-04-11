RSpec.describe "new poem" do
  feature 'generate new poem' do

    let!(:song_slice) { FactoryGirl.create(:song_slice) }

    scenario 'valid information' do
      visit root_path
      click_on 'generate!'
      expect(page.body).to have_content 'chunk'
    end

  end
end