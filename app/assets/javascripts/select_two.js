var ready;
ready = function() {
	$('.select2').select2();
};


$(document).ready(ready);
$(document).on('page:load', ready);