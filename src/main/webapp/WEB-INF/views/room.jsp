<%@ page import="ru.job4j.chat.model.Person" %><%--
  Created by IntelliJ IDEA.
  User: uglis
  Date: 29.10.2020
  Time: 20:43
  To change this template use File | Settings | File Templates.
--%>
<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
            crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <style>
        h6 {
            position: absolute;
            right: 400px;
            top: 200px;
        }

        #user {
            position: absolute;
            right: 400px;
            top: 10px;
        }
    </style>
    <%Person person = (Person) request.getSession().getAttribute("user");%>
    <input id="person" type="hidden" value="<%=person.getName()%>"/>
    <input id="role" type="hidden" value="<%=person.getRole()%>"/>
    <script>
        $(document).ready(function () {
            loadTable();
            setInterval('loadTable()', 1000);
        });
        function loadTable() {
            console.log("load")
            $.ajax({
                type: 'GET',
                url: '/allMessages',
            }).done(function (data) {
                $('#table').html("")
                table(data)
            });
        }

        function table(data) {
            let datta = JSON.parse(data)
            let table = $('#table')
            datta.forEach(el => {
                table.append('<tr>')
                table.append('<td>' +el.person.name + '<br/>' + '<b1>' + el.person.role.name + '</b1>' + '</td>')
                table.append('<td>' + el.message + '</td>')
                table.append('<td>' + el.created + '</td>')
                table.append('</tr>');
            })
        }

        function addNewMessage(text) {
            if (text !== '') {
                $.ajax({
                    type: 'Post',
                    url: '/addMessage',
                    datatype: 'json',
                    data: {message: text, created: new Date(), personName: $('#person').val(), role: $('#role').val()}
                }).done(function () {
                    $('#table').html("")
                    loadTable()
                    return true;
                });
            } else {
                alert("please fill in field 'message'")
                return false;
            }
        }
    </script>

    <title>Chat</title>
</head>
<body>
<div class="container">
    <div class="row pt-3">
        <table class="table table-bordered" style="background-color: azure">
            <thead>
            <tr>
                <h5>
                    write a new message
                </h5>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>
                    <form>
                         <label for="text"></label><input type="text" id="text"
                                                                                 style="width: 100%"/>
                        <br/>
                        <br/>
                        <button type="reset" class="btn btn-success" onclick="return addNewMessage($('#text').val())">
                            send
                        </button>
                    </form>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
    <div class="container" id="list">
        <div class="row pt-3">
            <h2>
                All messages
            </h2>
            <table class="table table-bordered" style="background-color: azure">
                <thead>
                <tr>
                    <th>author</th>
                    <th style="width: 400px">message</th>
                    <th>added</th>
                </tr>
                </thead>
                <tbody id="table"></tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>
