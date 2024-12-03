import 'dart:async';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hab_security_fornt/core/api/login_api.dart';
import 'package:hab_security_fornt/services/index.dart';
import 'package:hab_security_fornt/core/api/login_request.dart';
import 'package:hab_security_fornt/core/api/login_response.dart';

import '../../core/utils/token_preference.dart';

/// ---------------------------------------------------------------------------
/// LoginBloc
/// ---------------------------------------------------------------------------
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginApi loginApi;

  LoginBloc({required this.loginApi}) : super(LoginInitial()) {
    on<LoginSubmitted>(_onLoginSubmitted);
  }

  Future<void> _onLoginSubmitted(
      LoginSubmitted event, Emitter<LoginState> emit) async {
    emit(LoginLoading());

    try {
      LoginRequest request = LoginRequest(
        email: event.email ?? '',
        password: event.password ?? '',
      );

      final response =
          await apiService.post('/auth/signin', data: request.toJson());

      final loginResponse = LoginResponse.fromJson(response.data);

      final String? token = loginResponse.accessToken;
      final int? userId = loginResponse.userId;

      if (token != null && userId != null) {
        await TokenPreference.setToken(token);
        await TokenPreference.setUserId(userId);

        emit(LoginSuccess(message: 'Login successful'));
      } else {
        emit(LoginFailure(error: 'Token or User ID is missing'));
      }
    } on DioException catch (e) {
      emit(LoginFailure(error: e.response?.data['message'] ?? 'Login Error'));
    } catch (e) {
      emit(LoginFailure(error: 'An unexpected error occurred: $e'));
    }
  }
}

/// ---------------------------------------------------------------------------
/// LoginEvent
/// ---------------------------------------------------------------------------
abstract class LoginEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginSubmitted extends LoginEvent {
  final String? email;
  final String? password;

  LoginSubmitted({this.email, this.password});

  @override
  List<Object?> get props => [email, password];
}

/// ---------------------------------------------------------------------------
/// LoginState
/// ---------------------------------------------------------------------------
@immutable
abstract class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {
  LoginInitial() : super();
}

class LoginLoading extends LoginState {
  LoginLoading() : super();
}

class LoginSuccess extends LoginState {
  final String? message;

  LoginSuccess({this.message});

  @override
  List<Object?> get props => [message];
}

class LoginFailure extends LoginState {
  final String? error;

  LoginFailure({this.error});

  @override
  List<Object?> get props => [error];
}
