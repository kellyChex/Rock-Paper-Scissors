require 'rails_helper'

describe "instances_that_display_on_landing_page" do
  before do
    @game1 = Game.create(player1: 'a', player2: 3)
    @game1.save
    @game2 = Game.create(player1: 'a', player2: 3)
    @game2.save
    @game3 = Game.create(player1: 'a', player2: 3)
    @game3.save
    @game4 = Game.create(player1: 'a', player2: 3)
    @game4.save
  end

  it 'will show score of 4 for player one' do
    visit root_path

    expect(page).to have_content("4")
  end
end
