import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object?> get props => [];
}

class AuthEvent extends SignInEvent {
  final String email;
  final String password;

  const AuthEvent({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}
