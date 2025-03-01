import 'package:flutter/material.dart';
import 'package:flutter_code4func_09_bloc_pattern/src/blocs/login_bloc.dart';
import 'package:flutter_code4func_09_bloc_pattern/src/resources/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // new 1 bloc để sử dụng Stream
  LoginBloc bloc = LoginBloc();

  bool _showPass = false;
  // TextEditingController để kết hợp kiểm tra user + pass
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
        color: Colors.white,
        constraints: const BoxConstraints.expand(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 25),
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xffd8d8d8),
              ),
              padding: const EdgeInsets.all(10),
              child: const FlutterLogo(),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: Text(
                "Hello\nWelcome Back",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 30,
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                // StreamBuilder sử dụng 2 thành phần là 1. stream: , 2. builder:
                child: StreamBuilder(
                  stream: bloc.userStream,
                  builder: (context, snapshot) => TextField(
                    // controller cho phép kiểm tra textField
                    controller: _userController,
                    style: const TextStyle(fontSize: 18, color: Colors.black),
                    decoration: InputDecoration(
                        labelText: "USERNAME",
                        // errorText : hiển thị lỗi khi nhập sai
                        // sink (bên login_bloc) bắn dữ liệu qua snapshot
                        errorText: snapshot.hasError
                            ? snapshot.error.toString()
                            : null,
                        labelStyle:
                            const TextStyle(color: Colors.grey, fontSize: 15)),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: Stack(
                alignment: AlignmentDirectional.centerEnd,
                children: [
                  // StreamBuilder sử dụng 2 thành phần là 1. stream: , 2. builder:
                  StreamBuilder(
                    stream: bloc.passStream,
                    builder: (context, snapshot) => TextField(
                      controller: _passController,
                      obscureText: !_showPass,
                      style: const TextStyle(fontSize: 18, color: Colors.black),
                      decoration: InputDecoration(
                          // errorText : hiển thị lỗi khi nhập sai
                          // sink (bên login_bloc) bắn dữ liệu qua snapshot
                          labelText: "PASSWORD",
                          errorText: snapshot.hasError
                              ? snapshot.error.toString()
                              : null,
                          labelStyle: const TextStyle(
                              color: Colors.grey, fontSize: 15)),
                    ),
                  ),
                  GestureDetector(
                    onTap: onToggleShowPass,
                    child: Text(
                      _showPass ? "HIDE" : "SHOW",
                      style: const TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              // làm cho nút bấm trở nên full screen width
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white),
                  onPressed: onSignInClicked,
                  child: const Text(
                    "SIGN IN",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    textAlign: TextAlign.center,
                  )),
            ),
            const SizedBox(
              width: double.infinity,
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "NEW USER? SIGN UP",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "FORGOT PASSWORD?",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onToggleShowPass() {
    setState(() {
      _showPass = !_showPass;
    });
  }

  void onSignInClicked() {
    // Nếu login_bloc hợp lệ thì chuyển tới màn hình HomePage
    if (bloc.isValidInfo(_userController.text, _passController.text)) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    }
  }
}
