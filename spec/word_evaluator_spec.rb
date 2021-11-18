require "rspec"
require_relative "../lib/word_evaluator"

describe WordEvaluator do
  it "has a current game word" do
    game = described_class.new(word: "someword")

    expect(game.word).to eq("someword")
  end

  it "checks if the guessed letter is in the word" do
    game = described_class.new(word: "someword")

    expect(game.check_letter?("p")).to be_falsey
    expect(game.check_letter?("e")).to be_truthy
  end

  it "adds the incorrect guessed letter to a list" do
    game = described_class.new(word: "someword")

    game.check_letter?("p")
    expect(game.incorrect_guesses).to eq("p")

    game.check_letter?("l")
    expect(game.incorrect_guesses).to eq("pl")
  end

  it "creates the underscores for the word" do
    game = described_class.new(word: "someword")

    expect(game.correct_guesses).to eq("________")
  end

  it "add the correct_letters" do
    game = described_class.new(word: "someword")
    game.check_letter?("s")
    expect(game.correct_guesses).to eq("s_______")
    game.check_letter?("o")
    expect(game.correct_guesses).to eq("so___o__")
    game.check_letter?("m")
    expect(game.correct_guesses).to eq("som__o__")
    game.check_letter?("d")
    expect(game.correct_guesses).to eq("som__o_d")
    game.check_letter?("w")
    expect(game.correct_guesses).to eq("som_wo_d")
    game.check_letter?("z")
    expect(game.correct_guesses).to eq("som_wo_d")
    game.check_letter?("e")
    expect(game.correct_guesses).to eq("somewo_d")
    game.check_letter?("e")
    expect(game.correct_guesses).to eq("somewo_d")
    game.check_letter?("r")
    expect(game.correct_guesses).to eq("someword")
  end

  it "checks that the word has been correctly guessed" do
    game = described_class.new(word: "someword")

    expect(game.completed?).to be_falsey

    "farsmef".chars.each { |l| game.check_letter?(l) }

    expect(game.completed?).to be_falsey

    "someword".chars.each { |l| game.check_letter?(l) }

    expect(game.completed?).to be_truthy
  end
end
