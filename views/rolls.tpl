<!DOCTYPE html>
<html lang="hu">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Rolls</title>

<style>
// @import url(https://fonts.googleapis.com/css?family=Roboto:400,300,600,400italic);
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  -webkit-font-smoothing: antialiased;
  -moz-font-smoothing: antialiased;
  -o-font-smoothing: antialiased;
  font-smoothing: antialiased;
  text-rendering: optimizeLegibility;
}

body {
  font-family: "Roboto", Helvetica, Arial, sans-serif;
  font-weight: 100;
  font-size: 12px;
  line-height: 30px;
  color: #777;
  background: #EEEEEE;
}

.container {
  max-width: 600px;
  width: 100%;
  margin: 0 auto;
  position: relative;
}

#formstyle {
  background: #F9F9F9;
  padding: 25px;
  margin: 20px 0;
  box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
}

fieldset {
  border: medium none !important;
  margin: 0 0 10px;
  min-width: 100%;
  padding: 0;
  width: 100%;
}

#formstyle textarea {
  width: 100%;
  border: 1px solid #ccc;
  background: #FFF;
  margin: 0 0 0px;
  padding: 0px;
}

#formstyle textarea {
  height: 60px;
  max-width: 100%;
  resize: none;
}

#formstyle button[type="submit"] {
  cursor: pointer;
  width: 100%;
  border: none;
  background: #AABBAA;
  color: #FFF;
  margin: 0 0 5px;
  padding: 10px;
  font-size: 15px;
}

#formstyle button[type="submit"]:active {
  box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.5);
}

#formstyle textarea:focus {
  outline: 0;
  border: 1px solid #aaa;
}

::-webkit-input-placeholder {
  color: #888;
}

:-moz-placeholder {
  color: #888;
}

::-moz-placeholder {
  color: #888;
}

:-ms-input-placeholder {
  color: #888;
}

#rollstable {
  font-family: "Roboto", Helvetica, Arial, sans-serif;
  font-weight: 200;
  font-size: 12px;
  line-height: 20px;
  color: #777;
  background: #EEEEEE;
	width: 100%;
}

#rollstable th {
  font-size: 18px;
}

</style>

</head>
<body>

<div class="container">
  <form id="formstyle" action="roll" method="get">
    <fieldset>
      <textarea name="message" placeholder="Roll description" tabindex="1" required autofocus></textarea>
    </fieldset>
    <fieldset>
      <button name="submit" type="submit" data-submit="...Sending">Roll!</button>
    </fieldset>
  </form>
</div>

<div class="container">
    <table id="rollstable">
        <tr>
            <th>Timestamp</th>
            <th>Message</th>
            <th>Roll</th>
            <th>Result</th>
        </tr>
        % for roll in rolls:
        <tr>
            <td>{{roll['timestamp']}}</td>
            <td>{{roll['message']}}</td>
            <td>{{roll['roll']}}</td>
            <td>{{roll['result']}}</td>
        </tr>
        % end
    </table>
</div>



</body>
</html>
