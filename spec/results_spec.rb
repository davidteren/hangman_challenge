require "rspec"
require_relative "../lib/results"

describe Results do
  it "prints the total life at start of a game" do
    game = Results.new

    # expect(game.).to include("_____")
    # expect.to include(" life left:")
    # expect.to include("_____ life left: 6")
  end
end

# _____ life left: 6
# a____ life left: 6
# a____ life left: 5 incorrect guesses: b
# a____ life left: 4 incorrect guesses: bq
# a____ life left: 3 incorrect guesses: bqz
# a___e life left: 3 incorrect guesses: bqz
# app_e life left: 3 incorrect guesses: bqz
# apple YOU WIN!
# ________ life left: 6
# ________ life left: 5 incorrect guesses: a
# ________ life left: 4 incorrect guesses: ae
# __i___i_ life left: 4 incorrect guesses: ae
# __i_o_i_ life left: 4 incorrect guesses: ae
# _ui_o_i_ life left: 4 incorrect guesses: ae
# _ui_o_i_ life left: 3 incorrect guesses: ael
# _ui_o_i_ life left: 2 incorrect guesses: aelg
# _ui_o_i_ life left: 1 incorrect guesses: aelgp
# _ui_o_i_ YOU LOSE!
