require "spec_helper"

RSpec.describe Ikku::Reviewer do
  let(:instance) do
    described_class.new(rule: rule)
  end

  let(:rule) do
    nil
  end

  let(:text) do
    "古池や蛙飛び込む水の音"
  end

  describe "#find" do
    subject do
      instance.find(text)
    end

    context "without ikku" do
      let(:text) do
        "test"
      end

      it { is_expected.to be_nil }
    end

    context "with valid ikku" do
      it { is_expected.to be_a Array }
    end

    context "with text including ikku" do
      let(:text) do
        "ああ#{super()}ああ"
      end

      it { is_expected.to be_a Array }
    end
  end

  describe "#judge" do
    subject do
      instance.judge(text)
    end

    context "with valid ikku" do
      it { is_expected.to be true }
    end

    context "with invalid ikku" do
      let(:text) do
        "#{super()}ああ"
      end

      it { is_expected.to be false }
    end

    context "with rule option and valid ikku" do
      let(:rule) do
        [4, 3, 5]
      end

      let(:text) do
        "すもももももももものうち"
      end

      it { is_expected.to be true }
    end

    context "with rule option and invalid ikku" do
      let(:rule) do
        [4, 3, 5]
      end

      it { is_expected.to be false }
    end
  end

  describe "#search" do
    subject do
      instance.search(text)
    end

    context "without ikku" do
      let(:text) do
        "test"
      end

      it { is_expected.to be_a Array }
    end

    context "with valid ikku" do
      it { is_expected.to be_a Array }
    end

    context "with text including ikku" do
      let(:text) do
        "ああ#{super()}ああ"
      end

      it { is_expected.to be_a Array }
    end
  end
end