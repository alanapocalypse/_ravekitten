$(function() {
	 var $container = $('#card_masonry');

	$container.imagesLoaded( function(){
	  $container.masonry({
	    itemSelector : '.card'
	  });
	});
});





