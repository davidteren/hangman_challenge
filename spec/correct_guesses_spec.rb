require "rspec"
require_relative "../lib/guesses"

describe Guesses do
  it "start with number of underscores equal to the length of the word to be guessed" do
    cl = described_class.new(word: "hello")

    expect(cl.correct).to eq("_____")

    expect(cl.check?("i")).to be_falsey
    expect(cl.correct).to eq("_____")
    expect(cl.incorrect).to eq("i")

    expect(cl.check?("h")).to be_truthy
    expect(cl.correct).to eq("h____")
    expect(cl.incorrect).to eq("i")

    expect(cl.check?("o")).to be_truthy
    expect(cl.correct).to eq("h___o")

    expect(cl.check?("p")).to be_falsey
    expect(cl.correct).to eq("h___o")
    expect(cl.incorrect).to eq("ip")

    expect(cl.check?("l")).to be_truthy
    expect(cl.correct).to eq("h_llo")

    expect(cl.check?("f")).to be_falsey
    expect(cl.correct).to eq("h_llo")
    expect(cl.incorrect).to eq("ipf")

    expect(cl.check?("e")).to be_truthy
    expect(cl.correct).to eq("hello")
  end
end
