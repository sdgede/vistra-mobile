import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:vistra/bloc/sing%20in/sign_in_event.dart';
import 'package:vistra/bloc/sing%20in/sing_in_state.dart';
import 'package:vistra/data/repository/implements/sing_in_repo.dart';
import 'package:vistra/data/service/auth_service.dart';
import 'package:vistra/res/string/alerts.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final SignInRepo signInRepo;

  SignInBloc({required this.signInRepo}) : super(SignInInitial()) {
    on<AuthEvent>((event, emit) async {
      emit(SignInLoading());

      try {
        final user = await signInRepo.signIn(
          email: event.email,
          password: event.password,
        );

        if (user != null && user.loginResponse.token.isNotEmpty) {
          await AuthService.instance.setSession(
            token: user.loginResponse.token,
          );
          emit(SignInSuccess(user: user));
        } else {
          emit(SignInError(message: AppAlertText.loginFailed));
        }
      } catch (e, stacktrace) {
        debugPrint('❌ SignInBloc Error: $e');
        debugPrintStack(stackTrace: stacktrace);
        emit(SignInError(message: AppAlertText.loginFailed));
      }
    });
  }
}
