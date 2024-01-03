


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link href="style.css" rel="stylesheet" type="text/css">
<link href="css/deposite.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>FNB Banking ..</title>
</head>

<body>

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
 <div class="box">
 <img src="images/Payment.gif">
    <div class="banking-container">
        <h2>Deposit </h2>
        <form class="banking-form" action="otp.jsp" >
            <label for="account-number">Account Number:</label>
            <input type="text" id="account-number" name="account" required>

            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>

            <label for="amount">Amount:</label>
            <input type="text" id="amount" name="amount" min="0" required>
		<input type="hidden" name="sourcePage" value="deposit1.jsp">

            <input type="submit" value="Submit">
        </form>
    </div>
 </div>
    

</body>
</html>
