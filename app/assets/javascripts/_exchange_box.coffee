$(document).ready ->
  $('form').submit ->
    if $('form').attr('action') == '/exchange'
      exchange();

  $("#quantity").bind "change paste keyup", ->
    exchange();

  $("#currency").bind "change keyup", ->
    exchange();

  $("#currency_destination").bind "change keyup", ->
    exchange();

  $('#invert-currency').click ->
    current = $("#currency").val();
    destination = $("#currency_destination").val();
    invertCurrency(current, destination);

# Functions 
invertCurrency = (current, destination) ->
  unless current == destination
    $("#currency").val(destination)
    $("#currency_destination").val(current)
    exchange(destination, current)

exchange = (currency = $("#currency").val(), currency_destination = $("#currency_destination").val()) ->
  amount = $("#quantity").val()
  if amount > 0
    $.ajax '/exchange',
    type: 'GET'
    dataType: 'json'
    data: {
      currency: currency,
      currency_destination: currency_destination,
      quantity: amount
    }
    beforeSend: ->
      $('#alerts').html(
        '<div>Convertendo <i class="fa fa-spinner fa-pulse fa-fw"></i><span class="sr-only">Convertendo...</span></div>'
      )
    error: (jqXHR, textStatus, errorThrown) ->
      alert textStatus
    success: (data, text, jqXHR) ->
      $('#alerts').html('')
      $('#result').html(data.value.toFixed(2))
  return false;