<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: gatis.frishfelds01
  Date: 8/17/2018
  Time: 14:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <title>Result</title>
</head>
<body onload="checkWinner()">
<div id="Win" class="w3-hide">
    <h1>Winner!</h1>
</div>
<div id="Lose" class="w3-hide">
    <h1>Loser!</h1>
</div>
<button type="button" onclick="newGame()">New Game</button>
<script>
    function checkWinner() {
        console.log("checking status");
        fetch("<c:url value='/api/game/status'/>", {
            "method": "GET",
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            }
        }).then(function (response) {
            return response.json();
        }).then(function (game) {
            console.log(JSON.stringify(game));
            if (game.playerActive) {
                document.getElementById("Win").classList.remove("w3-hide");
                document.getElementById("Lose").classList.add("w3-hide");
            } else {
                document.getElementById("Win").classList.add("w3-hide");
                document.getElementById("Lose").classList.remove("w3-hide");
            }
        });
    }
    function newGame() {
        fetch("<c:url value='/api/game'/>", {"method": "POST"})
            .then(function (response) {
                location.href = "/app/start.jsp";
            });
    }
</script>
</body>
</html>
