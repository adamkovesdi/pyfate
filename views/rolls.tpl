<!DOCTYPE html>
% import textreplacer
<html lang="hu">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Rolls</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<div class="container">
  <form id="formstyle" action="roll" method="get">
		<textarea name="message" placeholder="Roll description" tabindex="1" required autofocus></textarea>
		<button name="submit" type="submit" tabindex="2">Roll!</button>
  </form>
</div>
<i class="fa fa-spinner fa-spin"></i>
<div class="container">
<div id="logbook">
% for entry in entries:
    <p>
    {{ entry["timestamp"] }}
    </p>
    <p>
    {{ entry["text"] }}
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
% end # entries for
</div> <!-- logbook -->
</div> <!-- container -->

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
