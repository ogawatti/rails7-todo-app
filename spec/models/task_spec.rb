require 'rails_helper'

RSpec.describe Task, type: :model do
  describe '#valid?' do
    let(:task) { build(:task, content:, done:) }
    let(:content) { Faker::Lorem.word }
    let(:done) { false }

    subject { task.valid? }

    it { is_expected.to eq true }

    context 'when content is too long' do
      let(:content) { Faker::Lorem.characters(number: 256) }
      it { is_expected.to eq false }
    end

    context 'when content is empty' do
      let(:content) { '' }
      it { is_expected.to eq false }
    end

    context 'when content is nil' do
      let(:content) { nil }
      it { is_expected.to eq false }
    end

    context 'when done is true' do
      let(:done) { true }
      it { is_expected.to eq true }
    end

    context 'when done is nil' do
      let(:done) { nil }
      it { is_expected.to eq false }
    end
  end
end
