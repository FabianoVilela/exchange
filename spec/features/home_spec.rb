require 'rails_helper'

RSpec.describe "Exchange Currency Process", type: :feature do
  it "exchange value" do
    visit '/'
    within("#exchange_form") do
      select('BRL', from: 'currency')
      select('USD', from: 'currency_destination')
      fill_in 'quantity', with: '100'
    end
 
    # save_and_open_page
    expect(find('#result').text).to_not eql("0.00")
  end

  it "invert currency" do
    visit '/'
    within("#exchange_form") do
      select('CAD', from: 'currency')
      select('JPY', from: 'currency_destination')
      fill_in 'quantity', with: '200'
    end
    click_on('invert-currency')

    # save_and_open_page
    expect(find_field('currency').value).to eql('JPY')
    expect(find_field('currency_destination').value).to eql('CAD')
  end
end