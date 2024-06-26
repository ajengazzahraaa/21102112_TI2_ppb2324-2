import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:praktikum_9/repositories/auth_repo.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  final _repo = AuthRepo();

  Future<void> register(
      {required String email, required String password}) async {
    emit(RegisterLoading());
    try {
      await _repo.register(email: email, password: password);
      emit(RegisterSuccess('Berhasil!'));
    } catch (e) {
      log(e.toString());
      emit(RegisterFailure(e.toString()));
    }
  }
}
