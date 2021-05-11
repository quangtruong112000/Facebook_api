<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Fanpage.WebForm1" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>TranQuangTruong_5951071114</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"  crossorigin="anonymous">
    <script>
        const access_token = 'EAAAAZAw4FxQIBACBm9vuTinKlJ5IuSiibCXt51ZAHFd5Yk81kXMcioMx51LOIInj60O2c3dsAiMZCYZApReIDLLNk2La4uAmXm1Xm2zD9SS7TmN5e6ZBW2ZBRVfKH319keeM6gPe5or9afU0QhOolMdEogf06gtT0TEHYZBDL4KkwZDZD';
        var likes = 0;
        var arr = [];
        var noidung = "";
        function init() {
            fetch('https://graph.facebook.com/109477347973637/posts?fields=likes.summary(true),comments,message&access_token=' + access_token).then(
                function (response) {
                    response.json().then(data => {
                        for (let i = 0; i < 3; i++) {
                            document.getElementById("post" + i).innerHTML = data.data[i].message;
                            arr.push(data.data[i].id);
                            fetch('https://graph.facebook.com/' + data.data[i].id + '?fields=likes.summary(true)&access_token=' + access_token).then(
                                function (response) {
                                    response.json().then(data => {
                                        document.getElementById("title" + i).innerHTML = "Tổng lượt like: " + data.likes.summary.total_count + " likes";
                                    })
                                }
                            )
                                .catch(error => console.error(error));
                        }
                    })
                }
            )
        }
        init();

        function bai1() {
            var noidung = document.getElementById("textarea0").value;
            const data = { access_token: access_token, message: noidung };
            fetch('https://graph.facebook.com/' + arr[0] + '/comments', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(data)
            })
                .then(response => response.json())
                .then(data => {
                    alert('Thành công');
                    document.getElementById('textarea0').value = "";
                })
                .catch(error => console.error(error));
        }

        function bai2() {
            var noidung = document.getElementById("textarea1").value;
            const data = { access_token: access_token, message: noidung };
            fetch('https://graph.facebook.com/' + arr[1] + '/comments', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(data)
            })
                .then(response => response.json())
                .then(data => {
                    alert('Thành công');
                    document.getElementById('textarea1').value = "";
                })
                .catch(error => console.error(error));
        }

        function bai3() {
            var noidung = document.getElementById("textarea2").value;
            const data = { access_token: access_token, message: noidung };
            fetch('https://graph.facebook.com/' + arr[2] + '/comments', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(data)
            })
                .then(response => response.json())
                .then(data => {
                    alert('Thành công');
                    document.getElementById('textarea2').value = "";
                })
                .catch(error => console.error(error));
        }
    </script>
</head>
<body>
    <h1 class="container">
        <a href="https://www.facebook.com/Fanpage-Trần-Quang-Trường-109477347973637">Fanpage: Trần Quang Trường_5951071114</a>
        <br />
        <br />
        <table class="table table-bordered container" style="text-align: center">
            <thead>
                <tr>
                    <th>Bài viết 1:</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>
                        <h id="title0"></h>
                        <br />
                        Nội dung:
                        <h id="post0"></h>
                        <br />
                        Vui lòng nhập bình luận:
                        <textarea class="form-control" id="textarea0"></textarea><br />
                        <button type="button" class="btn btn-primary" onclick="bai1()">Đăng</button>
                    </td>
                </tr>
            </tbody>
        </table>
        <br>
        <br />
        <table class="table table-bordered container" style="text-align: center">
            <thead>
                <tr>
                    <th>Bài viết 2:</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>
                        <h id="title1"></h>
                        <br />
                        Nội dung:
                        <h id="post1"></h>
                        <br />
                        Vui lòng nhập bình luận:
                        <textarea class="form-control" id="textarea1"></textarea>
                        <button type="button" class="btn btn-primary" onclick="bai2()">Đăng</button>
                    </td>
                </tr>
            </tbody>
        </table>
        <br>
        <br />
        <table class="table table-bordered container" style="text-align: center">
            <thead>
                <tr>
                    <th>Bài viết 3:</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>
                        <h id="title2"></h>
                        <br />
                        Nội dung:
                        <h id="post2"></h>
                        <br />
                        Vui lòng nhập bình luận:
                        <textarea class="form-control" id="textarea2"></textarea>
                        <button type="button" class="btn btn-primary" onclick="bai3()">Đăng</button>
                    </td>
                </tr>
            </tbody>
        </table>
    </h1>
</body>
</html>
