window.Storytime.Utility.showFlash = (message, popup_class)->
  $('body').append("<div class='flash js-success-flash'><div class='#{popup_class}'>#{message}</div></div>")

  $(".js-success-flash").show().delay(4000).fadeOut '300', ->
    $(this).remove()
    return
  return

window.Storytime.Utility.showFlashSuccess = (message)->
  window.Storytime.Utility.showFlash(message, 'flash-success')
  return

window.Storytime.Utility.showFlashError = (message)->
  window.Storytime.Utility.showFlash(message, 'flash-error')
  return
