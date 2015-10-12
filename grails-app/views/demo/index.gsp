<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="main"/>
	<title>Dashboard</title>
</head>
<body>

<div class="row">
	<div class="col-md-4 ">
		<div class="well">
			<h2><g:formatNumber format="###,###" number="${occurrences}"/> occurrences</h2>
			<p> </p>
			<p><a href="http://www.gbif.org/occurrence" class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
		</div>
	</div>
	<div class="col-md-4 ">
		<div class="well">
			<h2><g:formatNumber format="###,###" number="${species}"/> species</h2>
			<p> </p>
			<p><a class="btn btn-default" href="http://www.gbif.org/species" role="button">View details &raquo;</a></p>
		</div>
	</div>
	<div class="col-md-4">
		<div class="well">
			<h2><g:formatNumber format="###,###" number="${datasets}"/> datasets</h2>
			<p> </p>
			<p><a class="btn btn-default" href="http://www.gbif.org/dataset" role="button">View details &raquo;</a></p>
		</div>
	</div>
</div>

<div>
	<div id="container" style="width: 100%; height: 600px;"></div>
</div>

</body>
</html>
