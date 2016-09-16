RSpec.describe Poem do
  describe '.generate_random' do
    let(:poem) { Poem.generate_random }
    let!(:song_slice) { FactoryGirl.create(:song_slice) }
    let(:song_slice_double) { instance_double("SongSlice", :chunk => "bloop")}

    it 'returns a new poem' do
      expect(poem).to be_instance_of Poem
    end

    it 'returns a new poem with random data' do
      expect(poem.data).to match song_slice.chunk
    end

    it 'returns poem with random name' do
      allow(SongSlice).to receive(:random_set).and_return([song_slice_double])
      expect(poem.name).to eq "bloop"
    end

  end
end
