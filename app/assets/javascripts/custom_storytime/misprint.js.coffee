jQuery ($) ->
  $misprintModal = $('#addMisprintModal')
  $misprintForm = $('#new_misprint')

  # 'keypress' is suck, doesn't work in Chrome
  $(document).keydown (e)->
    if e.ctrlKey == true and e.keyCode == 13 and window.getSelection().toString() != ""
      $misprintModal.modal "show"
    return

  $misprintModal.on "show.bs.modal", ->
    $('#misprint_page_url').val window.location.href
    $('#misprint_target_text').val window.getSelection()
    $('.missprint-text-fragment').text window.getSelection()
    return

  $misprintModal.on "hidden.bs.modal", ->
    $('#misprint_page_url').val ''
    $('#misprint_target_text').val ''
    $('#misprint_user_message').val ''
    $('.missprint-text-fragment').text ''
    return

  $misprintForm.on "submit", (e)->
    $misprintModal.modal "hide"
    $.ajax
      type: $misprintForm.attr("method")
      url:  $misprintForm.attr("action")
      data: $misprintForm.serialize()
      dataType: false
      processData: false
      async: true
      success: (data) ->
        if data.saved
          window.Storytime.Utility.showFlashSuccess(data.message)
        else
          window.Storytime.Utility.showFlashError(data.message)
        return
    return false

  return