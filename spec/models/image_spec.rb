RSpec.describe Image do
  describe '.grab_random' do
    let!(:image) { FactoryGirl.create(:image) }

    it 'selects random image from db' do
      expect(described_class.grab_random).to eq("http://eligiblereceiver.com/wp-content/uploads/2013/08/Vanilla-ice.jpg")
    end

    context 'empty db' do
      let!(:image) { nil }

      it 'displays nothing when the db is empty' do
        expect(described_class.grab_random).to eq (nil)
      end
    end
  end
end