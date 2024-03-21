class SignUpModelRequest {
  final String email;
  final String password;
  final String username;

  SignUpModelRequest(
      {required this.email, required this.password, required this.username});

  // Method to convert the model into a JSON object
  Map<String, dynamic> toJson() {
    return {"email": email, "username": username, "password": password};
  }
}

class SignUpModelResponse {
  final String message;
  final String token;

  SignUpModelResponse({required this.message, required this.token});

  // Method to convert the model into a JSON object
  factory SignUpModelResponse.fromJson(Map<String, dynamic> json) {
    return SignUpModelResponse(
      message: json['message'],
      token: json['token'],
    );
  }
}
