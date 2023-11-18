class AuthModel {
  final String username;
  final String password;

  AuthModel({required this.username, required this.password});
}

List GuestLogin = [
  {AuthModel(username: 'Guest', password: 'guest123')}
];
