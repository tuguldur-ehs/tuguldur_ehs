import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hab_security_fornt/services/index.dart';
import 'package:hab_security_fornt/core/api/register_request.dart';
import 'package:hab_security_fornt/core/api/register_response.dart';

/// ---------------------------------------------------------------------------
/// RegisterBloc
/// ---------------------------------------------------------------------------
class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterSubmitEvent>(_onRegisterSubmitted);
  }

  Future<void> _onRegisterSubmitted(
      RegisterSubmitEvent event, Emitter<RegisterState> emit) async {
    emit(RegisterLoading());

    try {
      RegisterRequest request = RegisterRequest(
        lastname: event.lastname ?? '',
        firstname: event.firstname ?? '',
        email: event.email ?? '',
        password: event.password ?? '',
        confirmationPassword: event.confirmationPassword ?? '',
        role: event.role ?? '',
      );

      final response =
          await apiService.post('/auth/signup', data: request.toJson());
      final registerResponse = RegisterResponse.fromJson(response.data);

      if (registerResponse.message == "success") {
        emit(RegisterSuccess(message: registerResponse.message ?? ''));
      } else {
        print('wefwf');
        emit(RegisterFailure(
            message: registerResponse.message ?? 'Sign Up Error'));
      }
    } catch (e) {
      print('tgtgtg');
      emit(RegisterFailure(message: 'Catch Error occurred: $e'));
    }
  }
}

/// ---------------------------------------------------------------------------
/// RegisterEvent
/// ---------------------------------------------------------------------------
abstract class RegisterEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class RegisterSubmitEvent extends RegisterEvent {
  final String? lastname;
  final String? firstname;
  final String? email;
  final String? password;
  final String? confirmationPassword;
  final String? role;

  RegisterSubmitEvent({
    this.lastname,
    this.firstname,
    this.email,
    this.password,
    this.confirmationPassword,
    this.role,
  });

  @override
  List<Object?> get props => [
        lastname,
        firstname,
        email,
        password,
        confirmationPassword,
        role,
      ];
}

/// ---------------------------------------------------------------------------
/// RegisterState
/// ---------------------------------------------------------------------------
@immutable
abstract class RegisterState extends Equatable {
  @override
  List<Object?> get props => [];
}

class RegisterSuccess extends RegisterState {
  final String? message;

  RegisterSuccess({this.message});

  @override
  List<Object?> get props => [message];
}

class RegisterFailure extends RegisterState {
  final String? message;

  RegisterFailure({this.message});

  @override
  List<Object?> get props => [message];
}

class RegisterInitial extends RegisterState {
  RegisterInitial() : super();
}

class RegisterLoading extends RegisterState {
  RegisterLoading() : super();
}
