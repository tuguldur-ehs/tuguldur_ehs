class RegisterRequest {
  final String lastname;
  final String firstname;
  final String email;
  final String password;
  final String confirmationPassword;
  final String role;

  RegisterRequest({
    required this.lastname,
    required this.firstname,
    required this.email,
    required this.password,
    required this.confirmationPassword,
    required this.role,
  });

  Map<String, dynamic> toJson() {
    return {
      'lastName': lastname,
      'firstName': firstname,
      'email': email,
      'password': password,
      'confirmationPassword': confirmationPassword,
      'role': role,
    };
  }
}
