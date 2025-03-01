import 'dart:async';

import 'package:flutter_code4func_09_bloc_pattern/src/validators/validators.dart';

class LoginBloc {
  final StreamController _userController = StreamController();
  final StreamController _passController = StreamController();

  // Stream getUserStream() {
  //   return _userController.stream;
  // }

  // cú pháp viết tắt return của dart
  Stream get userStream => _userController.stream;
  Stream get passStream => _passController.stream;

  bool isValidInfo(String username, String pass) {
    if (!Validations.isValidUser(username)) {
      _userController.sink.addError("Tài khoản không hợp lệ");
      return false;
    }

    _userController.sink.add("OK"); // đúng thì mọi thứ OK

    if (!Validations.isValidPass(pass)) {
      _passController.sink.addError("Mật khẩu phải trên 6 ký tự");
      return false;
    }

    _passController.sink.add("OK"); // đúng thì mọi thứ OK
    return true; // return true khi đã thỏa 2 đk bên trên rồi
  }

  // Vì Stream tại nó luôn lắng nghe --> nên tắt hủy Stream khi không dùng tớitới
  void dispose() {
    _userController.close();
    _passController.close();
  }
}
