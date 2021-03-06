<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>所有校友信息</title>
</head>
<body>
<div>
    <label>Welcome,${username}</label>
    <p></p>
    <table>
        <tr>
            <th>校友姓名</th>
            <th>性别</th>
            <th>生日</th>
            <th>入学年份</th>
            <th>毕业年份</th>
            <th>工作地区</th>
            <th>职务</th>
            <th>手机号</th>
            <th>邮箱</th>
            <th>微信</th>
            <th hidden>修改</th>
            <th>删除</th>
        </tr>
        <#list alumnis as alumni>
            <tr>
                <form action="/updateInfo" method="post">
                <td>${alumni.name?if_exists}</td>
                <td>${alumni.gender?if_exists}</td>
                <td>${alumni.birthday?if_exists}</td>
                <td>${alumni.enrollmentYear?if_exists}</td>
                <td><input id="graduatedYear" name="graduatedYear" placeholder="${alumni.graduatedYear?if_exists}" hidden>${alumni.graduatedYear?if_exists}</td>
                <td><input id="workingArea" name="workingArea" placeholder="${alumni.workingArea?if_exists}" hidden>${alumni.workingArea?if_exists}</td>
                <td><input id="position" name="position" placeholder="${alumni.position?if_exists}"hidden>${alumni.position?if_exists}</td>
                <td>${alumni.smartphone?if_exists}</td>
                <td>${alumni.email?if_exists}</td>
                <td>${alumni.wechat?if_exists}</td>
                <td><input hidden name="id" id="id" value="${alumni.id}">
                    <input type="hidden" name="_method" value="put" />
                    <input hidden name="username" id="username" value="${username}">
                    <button type="submit" hidden>修改</button>
                </form>
                </td>
                <td><form action="/deleteAlumni" method="post">
                        <input hidden name="username" id="username" value="${username}">
                        <input hidden name="id" id="id" value="${alumni.id}">
                        <button type="submit">删除</button></form></td>
            </tr>
        </#list>
    </table>
</div>
<p></p>
<div>
    <label>填入校友信息</label>
    <form action="/saveAlumni" method="post">
        <input type="hidden" value="${username}" id="username" name="username">
        <input type="text" name="name" id="name" placeholder="姓名(必填信息)">
        <input type="text" name="gender" id="gender" placeholder="性别">
        <input type="text" name="birthday" id="birthday" placeholder="生日">
        <input type="text" name="enrollmentYear" id="enrollmentYear" placeholder="入学年份">
        <input type="text" name="graduatedYear" id="graduatedYear" placeholder="毕业年份">
        <input type="text" id="workingArea" name="workingArea" placeholder="工作地区">
        <input type="text" name="position" id="position" placeholder="职位">
        <input type="text" id="smartphone" name="smartphone" placeholder="手机号">
        <input type="text" id="email" name="email" placeholder="邮箱">
        <input type="text" name="wechat" id="wechat" placeholder="微信">
        <button type="submit">新增校友</button>
    </form>
</div>
<p></p>
<form action="/getBack" method="get">
    <input hidden name="username" id="username" value="${username}">
    <button type="submit">返回管理界面</button>
</form>
</body>
</html>