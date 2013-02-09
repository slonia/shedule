# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $('form').on 'click', '.add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))
    event.preventDefault()
    $('div[id^="sorts_"]').sortable();
    inps=$('input[id^="auto_"]')
    jQuery.each inps, ->
    	$(this).autocomplete({
      		source: window[$(this).attr('id')+'_tags']
    	});
    	$(this).blur -> 
    		if jQuery.inArray($(this).val(), window[$(this).attr('id')+'_tags'])==-1
    			window[$(this).attr('id')+'_tags'].push($(this).val())

   $('form').on 'click', '.remove_fields', (event) ->
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('fieldset').hide()
    event.preventDefault()
 