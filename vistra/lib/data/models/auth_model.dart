class UserModel {
  final int id;
  final String name;
  final String email;
  final DateTime? emailVerifiedAt;
  final int currentOrganizationId;
  final int mediaId;
  final DateTime createdAt;
  final DateTime updatedAt;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.emailVerifiedAt,
    required this.currentOrganizationId,
    required this.mediaId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      emailVerifiedAt:
          json['emailVerifiedAt'] != null
              ? DateTime.tryParse(json['emailVerifiedAt'])
              : null,
      currentOrganizationId: json['currentOrganizationId'],
      mediaId: json['mediaId'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'email': email,
    'emailVerifiedAt': emailVerifiedAt?.toIso8601String(),
    'currentOrganizationId': currentOrganizationId,
    'mediaId': mediaId,
    'createdAt': createdAt.toIso8601String(),
    'updatedAt': updatedAt.toIso8601String(),
  };
}

class LoginResponse {
  final UserModel userModel;
  final String token;

  LoginResponse({required this.userModel, required this.token});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      userModel: UserModel.fromJson(json['user']),
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() => {'user': userModel.toJson(), 'token': token};
}

class MetaModel {
  final String type;
  final String message;

  MetaModel({required this.type, required this.message});

  factory MetaModel.fromJson(Map<String, dynamic> json) {
    return MetaModel(type: json['type'], message: json['message']);
  }

  Map<String, dynamic> toJson() => {'type': type, 'message': message};
}

class LoginRequest {
  final String email;
  final String password;

  LoginRequest({required this.email, required this.password});
  factory LoginRequest.fromJson(Map<String, dynamic> json) {
    return LoginRequest(email: json['email'], password: json['password']);
  }

  Map<String, dynamic> toJson() => {'email': email, 'password': password};
}

class AuthModel {
  final UserModel userModel;
  final LoginResponse loginResponse;
  final MetaModel metaModel;
  final LoginRequest loginRequest;

  AuthModel({
    required this.userModel,
    required this.loginResponse,
    required this.metaModel,
    required this.loginRequest,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      userModel:
          json['userModel'] is String
              ? UserModel.fromJson(json['userModel'])
              : UserModel.fromJson(json['userModel'] ?? {}),
      loginResponse:
          json['loginResponse'] is String
              ? LoginResponse.fromJson(json['loginResponse'])
              : LoginResponse.fromJson(json['loginResponse'] ?? {}),
      metaModel:
          json['metaModel'] is String
              ? MetaModel.fromJson(json['metaModel'])
              : MetaModel.fromJson(json['metaModel'] ?? {}),
      loginRequest:
          json['loginRequest'] is String
              ? LoginRequest.fromJson(json['loginRequest'])
              : LoginRequest.fromJson(json['loginRequest'] ?? {}),
    );
  }
}
