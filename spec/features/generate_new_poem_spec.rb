RSpec.describe "new poem" do
  feature 'generate new poem' do

    let!(:song_slice) { FactoryGirl.create(:song_slice) }

    scenario 'valid information' do
      visit root_path
      click_on 'generate!'
      expect(page.body).to have_content 'chunk'
    end

    scenario 'can save poem' do
      visit root_path
      click_on 'generate!'
      click_on 'save!'
      expect(page.body).to have_content 'chunk'
      expect(current_path).to eq poem_path(Poem.last)
    end
  end
end