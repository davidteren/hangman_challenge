require "rspec"
require_relative "../lib/lives"

describe Lives do
  it "has default lives" do
    expect(described_class.new.remaining).to eq(6)
  end

  it "deducts a life" do
    expect(described_class.new.deduct_life).to eq(5)
  end

  it "deducts two points" do
    player = described_class.new

    expect(player.remaining).to eq(6)
    player.deduct_life
    player.deduct_life
    expect(player.remaining).to eq(4)
  end

  it "checks if player still has lives" do
    player = described_class.new

    expect(player.has_life?).to be_truthy

    5.times { player.deduct_life }

    expect(player.remaining).to eq(1)
    expect(player.has_life?).to be_truthy

    player.deduct_life
    expect(player.has_life?).to be_falsey
  end
end
