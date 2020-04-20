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
<div class="container pt-4">
<div class="row"> <!-- only one row -->
<div class="col">
	<div class="collapse" id="characters">
	<table class="table table-sm">
	<tbody class="selector" style="cursor: pointer;">
    % for row in tabledata:
        <tr>
        % for col in row:
            <td> {{ col }} </td>
        % end # for col
        </tr>
    % end # for
	</tbody>
	</table>
	</div>
</div>
</div> <!-- row -->
<div class="row"> <!-- only one row -->
<div class="col">
<form action="roll" method="get" class="d-print-none">
  <div class="form-group">
    <textarea rows ="3" class="form-control" name="message" id="rollcommand" placeholder="Text for roll" required autofocus></textarea>
    <small id="helptext" class="form-text text-muted">
			Enter roll string, or message.&nbsp;&nbsp;
			Enter ! to invoke a dice roll, !3 invokes a roll with +3 modifier.
			Negative numbers allowed.
		</small>
  </div>
  <button type="submit" class="btn btn-primary ">Submit entry and roll dice (when applicable)!</button>
  <button type="reset" class="btn btn-primary ">Clear</button>
	<a class="btn btn-secondary" data-toggle="collapse" href="#characters" role="button" aria-expanded="false" aria-controls="collapseExample"> Toggle character shortcuts </a>
</form>

<!-- Logbook, roll history contains server side code -->
<div id="logbook">
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
				% for fatestr in r["fate"]:
					% for c in fatestr:
						% if c == "+":
							<i class="fa fa-plus-square-o"></i> 
						% end # if
						% if c == "-":
							<i class="fa fa-minus-square-o"></i> 
						% end # if
						% if c == " ":
							<i class="fa fa-square-o"></i> 
						% end # if
					% end # for c
				% end # for fatestr
				% if r["mod"] < 0:
					- {{ abs(r["mod"]) }}
				% else:
					+ {{ r["mod"] }}
				% end # if positive
				=
				{{ r["result"] }}
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

</div> <!--col main -->

<div class="col-3 d-print-none"> <!-- the ladder -->
	<table class="table table-sm">
		<thead class="thead-dark">
			<tr><th><i class="fa fa-plus-square-o"></i><i class="fa fa-minus-square-o"></i></th><th>The Ladder</th></tr>
		</thead>
		<tbody class="selector" style="cursor: pointer;">
			<tr><td><div class="d-none"> !</div>+8</td><td> Legendary<div class="d-none"> (+8)</div></td></tr>
			<tr><td><div class="d-none"> !</div>+7</td><td> Epic<div class="d-none"> (+7)</div></td></tr>
			<tr><td><div class="d-none"> !</div>+6</td><td> Fantastic<div class="d-none"> (+6)</div></td></tr>
			<tr><td><div class="d-none"> !</div>+5</td><td> Superb<div class="d-none"> (+5)</div></td></tr>
			<tr><td><div class="d-none"> !</div>+4</td><td> Great<div class="d-none"> (+4)</div></td></tr>
			<tr><td><div class="d-none"> !</div>+3</td><td> Good<div class="d-none"> (+3)</div></td></tr>
			<tr><td><div class="d-none"> !</div>+2</td><td> Fair<div class="d-none"> (+2)</div></td></tr>
			<tr><td><div class="d-none"> !</div>+1</td><td> Average<div class="d-none"> (+1)</div></td></tr>
			<tr><td><div class="d-none"> !</div>+0</td><td> Mediocre<div class="d-none"> (+0)</div></td></tr>
			<tr><td><div class="d-none"> !</div>-1</td><td> Poor<div class="d-none"> (-1)</div></td></tr>
			<tr><td><div class="d-none"> !</div>-2</td><td> Terrible<div class="d-none"> (-2)</div></td></tr>
		</tbody>
	</table>
</div> <!-- col ladder -->
</div> <!--row-->
</div> <!-- end of main container -->

<!-- Scripts, end of body, etc. -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<script type="text/javascript">
	$(document).ready(function(){
	setInterval(function(){
	$("#logbook").load(location.href+" #logbook>*","");
	}, 5000);
	});
</script>
<script type="text/javascript">
    $(function() {
        $('.selector td').click(function() {
            var value = $(this).text();
            var input = $('#rollcommand');
            input.val(input.val() + ' ' + value + ' ');
						document.getElementById('rollcommand').focus();
            return false;
        });
    });
</script>
</body>
</html>
