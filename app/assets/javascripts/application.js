// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require_tree .
$(document).ready(function() {
    $('div[id^="sorts_"]').sortable();
});
function renum()
{
	var a1=$('div[id^="sorts_s_"]');
	jQuery.each(a1, function()
	{
	var arr=$(this).children("fieldset");
	var i=1
	jQuery.each(arr, function() {
		if ($(this).css("display")!="none")
		{
		$(this).children(".numpan").val(i);
		i++;
		}
		
   });
	});

	var a2=$('div[id^="sorts_d_"]').children("fieldset");
	var i=1
	jQuery.each(a2, function() {
		if ($(this).css("display")!="none")
		{
			$(this).children(".numpan2").val(i);
			i++;
		}
		
   });
	$("form").submit();
}