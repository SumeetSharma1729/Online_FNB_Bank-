


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>FNB Banking ..</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link href="style.css" rel="stylesheet" type="text/css">
<link href="css/close.css" rel="stylesheet" type="text/css">

</head>

<body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>


<nav class="head navbar k navbar-expand-lg navbar-dark"  >
  <div class="container-fluid">
    <a class="navbar-brand" href="index.html">FNB Bank</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav mx-5">
        <li class="nav-item mx-5">
          <a class="nav-link" href="create.html">New Account</a>
        </li>
        <li class="nav-item mx-5">
          <a class="nav-link" href="balance1.jsp">Balance</a>
        </li>
        <li class="nav-item mx-5">
          <a class="nav-link" href="deposit1.jsp">Deposit</a>
        </li>
        
        <li class="nav-item mx-5">
          <a class="nav-link" href="transfer1.jsp">Transfer</a>
        </li>
        <li class="nav-item mx-5">
          <a class="nav-link" href="closeac1.jsp">Close Account</a>
        </li>
        <li class="nav-item mx-5">
          <a class="nav-link" href="about.jsp">About Us</a>
        </li>
        
      </ul>
    </div>
  </div>
</nav>

 <div class="banking-container">
        <h2>Close Account</h2>
        <form class="banking-form" action="close.jsp" >
            <label for="account-number">Account Number:</label>
            <input type="text" id="account-number" name="account" placeholder="Account Number" required>

            <label for="username">Username:</label>
            <input type="text" id="username" name="username" placeholder="Username" required>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" placeholder="Password" required>

            <input type="submit" value="Submit">
        </form>
    </div>

</body>
</html>
