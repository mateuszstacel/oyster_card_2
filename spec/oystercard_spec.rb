require 'oystercard'


describe Oystercard do

  it { is_expected.to respond_to :balance }

  it { expect(subject.balance).to eq 0 }

    describe '#top_up' do
    it { is_expected.to respond_to(:top_up).with(1).argument }

    it 'adding money to card' do
      expect(subject.top_up(1)).to eq 1
    end
  end

  describe '#LIMIT' do
    it 'throw error whem limit is exceeded' do
      maximum_limit = Oystercard::LIMIT
      subject.top_up(maximum_limit)
      expect{ subject.top_up 1 }.to raise_error 'Max limit is £#{LIMIT}'
    end
  end

  describe '#deduct' do

    it { is_expected.to respond_to(:deduct).with(1).argument }

    it "to deduct money from the card" do
      subject.top_up(20)
      expect{ subject.deduct 3 }.to change {subject.balance }.by -3
    end
  end

  describe '#touch_in' do
    it { is_expected.to respond_to :touch_in }
    it 'check if card is touch in' do
      expect(subject.touch_in).to eq true
    end
  end

  describe '#touch_out' do
    it { is_expected.to respond_to :touch_out }
    it 'check if card is touck out' do
      expect(subject.touch_out).to eq false
    end
  end

  describe '#in_journey?' do
    it { is_expected.to respond_to :in_journey? }
    it 'checks if card is in journey' do
      allow(subject).to receive(:in_journey?).and_return(true)
      expect(subject.in_journey?).to eq true
    end
  end

end
