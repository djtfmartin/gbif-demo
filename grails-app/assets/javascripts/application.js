// This is a manifest file that'll be compiled into application.js.
//
// Any JavaScript file within this directory can be referenced here using a relative path.
//
// You're free to add application-wide JavaScript to this file, but it's generally better 
// to create separate JavaScript files as needed.
//
//= encoding UTF-8
//= require jquery
//= require bootstrap
//= require_tree .
//= require_self
//= require highcharts
if (typeof jQuery !== 'undefined') {
	(function($) {
		$('#spinner').ajaxStart(function() {
			$(this).fadeIn();
		}).ajaxStop(function() {
			$(this).fadeOut();
		});
	})(jQuery);
}


$(function () {
	$.getJSON( "demo/countries", function( data ) {
		// Initiate the chart
		$('#container').highcharts('Map', {

			title : {
				text : 'Occurrences by country'
			},

			mapNavigation: {
				enabled: true,
				buttonOptions: {
					verticalAlign: 'bottom'
				}
			},

			colorAxis: {
				min: 0
			},

			series : [{
				data : data,
				mapData: Highcharts.maps['custom/world-highres'],
				joinBy: 'hc-key',
				name: 'Observations',
				states: {
					hover: {
						color: '#BADA55'
					}
				},
				dataLabels: {
					enabled: false,
					format: '{point.name}'
				}
			}]
		});
	});
});
