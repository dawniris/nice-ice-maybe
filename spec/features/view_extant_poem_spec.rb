RSpec.feature "view poem" do
  let!(:poem) { FactoryGirl.create(:poem) }

  scenario "can view poem after saving" do
    visit poem_path(poem)
    expect(page.body).to have_content poem.data
    expect(page.body).to have_content poem.name
  end
end
