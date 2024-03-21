class LoginModelRequest {
  final String email;
  final String password;

  LoginModelRequest({required this.email, required this.password});

  // Method to convert the model into a JSON object
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }

  factory LoginModelRequest.fromJson(Map<String, dynamic> json) {
    return LoginModelRequest(
      email: json['email'],
      password: json['password'],
    );
  }
}

class LoginModelResponse {
  final String message;
  final String token;

  LoginModelResponse({required this.message, required this.token});

  // Method to convert the model into a JSON object
  factory LoginModelResponse.fromJson(Map<String, dynamic> json) {
    return LoginModelResponse(
      message: json['message'],
      token: json['token'],
    );
  }
}
