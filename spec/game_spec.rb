require "rspec"
require_relative "../lib/game"

describe Game do
  it "prints the total life at start of a game" do
    game = described_class.new(word: "apple")

    expect(game.output).to eq("_____ life left: 6")

    game.play(guess: "a")
    expect(game.output).to eq("a____ life left: 6")

    game.play(guess: "b")
    expect(game.output).to eq("a____ life left: 5 incorrect guesses: b")

    game.play(guess: "q")
    expect(game.output).to eq("a____ life left: 4 incorrect guesses: bq")

    game.play(guess: "z")
    expect(game.output).to eq("a____ life left: 3 incorrect guesses: bqz")

    game.play(guess: "e")
    expect(game.output).to eq("a___e life left: 3 incorrect guesses: bqz")

    game.play(guess: "p")
    expect(game.output).to eq("app_e life left: 3 incorrect guesses: bqz")

    game.play(guess: "l")
    expect(game.output).to eq("apple YOU WIN!")
  end

  it "prints the total life at start of a game" do
    game = described_class.new(word: "test")

    expect(game.output).to eq("____ life left: 6")

    game.play(guess: "a")
    expect(game.output).to eq("____ life left: 5 incorrect guesses: a")

    game.play(guess: "b")
    expect(game.output).to eq("____ life left: 4 incorrect guesses: ab")

    game.play(guess: "r")
    expect(game.output).to eq("____ life left: 3 incorrect guesses: abr")

    game.play(guess: "p")
    expect(game.output).to eq("____ life left: 2 incorrect guesses: abrp")

    game.play(guess: "m")
    expect(game.output).to eq("____ life left: 1 incorrect guesses: abrpm")

    game.play(guess: "l")
    expect(game.output).to eq("____ YOU LOSE!")
  end
end
