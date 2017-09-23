require 'rest-client'
require 'json'

module Currency
  def self.exchange currency, currency_destination, quantity
    begin
      res = RestClient.get "http://api.fixer.io/latest?base=#{currency}&symbols=#{currency_destination}"
      value = JSON.parse(res.body)['rates'][currency_destination]
      return (value * quantity).round(2)
    rescue
      return '0.00 <script>$("#alerts").html(
        \'<div class="text-danger">Problema na conversão</div><script>\'
      )'.html_safe
    end
  end
end