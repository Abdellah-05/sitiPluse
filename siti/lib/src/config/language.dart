class LoginFreshWords {
  String loginWith;
  String login;
  String exploreApp;
  String notAccount;
  String signUp;
  String textLoading;
  String hintLoginUser;
  String hintLoginPassword;
  String hintSignUpRepeatPassword;
  String hintName;
  String hintSurname;

  String recoverPassword;

  String messageRecoverPassword;

  LoginFreshWords(
      {this.loginWith = 'Login ',
      this.hintName = 'Full Name..',
      this.hintSurname = 'CIN',
      this.hintSignUpRepeatPassword = 'Repeat Password',
      this.hintLoginPassword = 'Password',
      this.recoverPassword = 'Recover Password',
      this.messageRecoverPassword =
          'To recover the password, enter the email and press send email, you will receive an email so you can update your password. Only available for accounts created by username and password',
      this.hintLoginUser = 'E-mail..',
      this.login = 'Login',
      this.exploreApp = 'Explore App',
      this.notAccount = '',
      this.signUp = '',
      this.textLoading = 'please wait ...'});
}
