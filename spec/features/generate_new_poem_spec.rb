RSpec.describe "new poem" do
  feature 'generate new poem' do

    let!(:song_slice) { FactoryGirl.create(:song_slice) }

    before(:each) do
      visit root_path
      click_on 'generate!'
    end

    scenario 'valid information' do
      expect(page.body).to have_content 'chunk'
    end

    scenario 'can save poem' do
      click_on 'save!'
      expect(page.body).to have_content 'chunk'
      expect(current_path).to eq poem_path(Poem.last)
    end

    scenario 'displays image' do
      expect(page).to have_css('.image')
    end
  end
end