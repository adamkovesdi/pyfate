<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Rolls</title>
</head>
<body>


<form method="get" action="roll">
        <div>
            <label for="Message">Message:</label>
            <input type="text" id="message" name="message">
        </div>
        <button type="submit">Roll 4dF</button>
</form>

    <table>

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

</body>
</html>
