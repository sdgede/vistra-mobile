import 'package:flutter/material.dart';
import 'package:vistra/data/models/auth_model.dart';

@immutable
abstract class SignInState {}

class SignInInitial extends SignInState {}

class SignInLoading extends SignInState {}

class SignInSuccess extends SignInState {
  final AuthModel user;

  SignInSuccess({required this.user});
}

class SignInError extends SignInState {
  final String message;

  SignInError({required this.message});
}
