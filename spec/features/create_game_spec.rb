 require 'rails_helper'

describe 'User creates a game', type: :feature do
  it 'will show 0 as score for both players' do
    visit root_path
    page.fill_in 'game[player1]', with: 'a'
    page.fill_in 'game[player2]', with: 1
    click_button 'Shoot'
    expect(page).to have_content("0")
  end

  it 'will show score of 4 for player one' do
    visit root_path

    page.fill_in 'game[player1]', with: 'a'
    page.fill_in 'game[player2]', with: 3
    click_button 'Shoot'

    page.fill_in 'game[player1]', with: 'a'
    page.fill_in 'game[player2]', with: 3
    click_button 'Shoot'

    page.fill_in 'game[player1]', with: 'a'
    page.fill_in 'game[player2]', with: 3
    click_button 'Shoot'

    page.fill_in 'game[player1]', with: 'a'
    page.fill_in 'game[player2]', with: 3
    click_button 'Shoot'

    expect(page).to have_content("4")
  end
end
