<!DOCTYPE html>
<html lang="hu">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Fate dice roller</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
</head>
<body>

<!-- Main container div -->
<div class="container">

<form action="roll" method="get">
  <div class="form-group pt-4">
    <textarea class="form-control" name="message" placeholder="Text for roll" required autofocus></textarea>
    <small id="helptext" class="form-text text-muted">
			Enter roll string, or message.&nbsp;&nbsp;
			Enter ! to invoke a dice roll, !3 invokes a roll with +3 modifier.
			Negative numbers allowed.
		</small>
  </div>
  <button type="submit" class="btn btn-primary btn-block">GO!</button>
</form>

<!-- Logbook, roll history contains server side code -->
<div id="logbook">
	% import textreplacer
	% for entry in entries:
		<hr />
		<p class="font-weight-bold">
			% lines = entry["text"].split("\n")
			% for l in lines:
				{{ l }}<br />
			% end
		</p>
		<p>
			% for r in entry["rolls"]:
				{{ ! textreplacer.replace_fatestrings_faicons(r) }}
				<br />
			% end # for r

			% if entry.get("diff", "") != "":
				Rolls difference: {{ entry.get("diff") }}
			%end #if
		</p>
		<p class="small">
			{{ entry["timestamp"] }}
		</p>
	% end # entries for
</div> <!-- end of logbook -->

</div> <!-- end of main container -->

<!-- Scripts, end of body, etc. -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<script> 
	$(document).ready(function(){
	setInterval(function(){
	$("#logbook").load(location.href+" #logbook>*","");
	}, 5000);
	});
</script>
</body>
</html>
