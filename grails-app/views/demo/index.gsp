<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="main"/>
	<title>Dashboard</title>
	<script src="http://code.highcharts.com/maps/highmaps.js"></script>
	<script src="http://code.highcharts.com/maps/modules/exporting.js"></script>
	<script src="http://code.highcharts.com/mapdata/custom/world-highres.js"></script>

</head>
<body>

<div class="row">
	<div class="col-md-4 ">
		<div class="well">
			<h2><g:formatNumber format="###,###" number="${occurrences}"/> occurrences</h2>
			<p> </p>
			<p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
		</div>
	</div>
	<div class="col-md-4 ">
		<div class="well">
			<h2><g:formatNumber format="###,###" number="${species}"/> species</h2>
			<p> </p>
			<p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
		</div>
	</div>
	<div class="col-md-4">
		<div class="well">
			<h2><g:formatNumber format="###,###" number="${datasets}"/> datasets</h2>
			<p> </p>
			<p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
		</div>
	</div>
</div>

<div>
	<div id="container" style="width: 100%; height: 600px;"></div>
</div>

<script type="text/javascript">
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
</script>

</body>
</html>
