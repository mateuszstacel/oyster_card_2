require 'oystercard'


describe Oystercard do

  it { is_expected.to respond_to :balance }

  it { expect(subject.balance).to eq 0 }


end
