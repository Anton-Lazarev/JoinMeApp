##Спецификация REST для логина и регистрации

###Login:

POST(“/login”)
<pre>body:{
    “username”:”name”,
    “password”:”password”
}</pre>

####Response:
1) Пользователь залогинен
HTTP response status code: 200
<pre>body:{
    “userid”:”id”,
    “token”:”token”
}</pre>
2) Неверный логин или пароль
HTTP response status code: 401
<pre>body:{
    “Invalid username or password”
}</pre>



###Registration:

POST(“/registration”)
<pre>body:{
    “username”:”name”,
    “email”:”123@abc.xyz”,
    “password”:”password”
}</pre>

####Response:

1) Пользователь зарегистрирован
HTTP response status code: 201
<pre>body:{
    “userid”:”id”,
    “token”:”token”
}</pre>
2) Пользователь с таким именем и/или почтой существует
HTTP response status code: 409
<pre>body:{
    “source”:”username/email”,
    “value”:”name/123@abc.xyz”
}</pre>
