import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hab_security_fornt/core/api/login_api.dart';
import 'package:hab_security_fornt/core/model/login_model.dart';
import 'package:hab_security_fornt/core/utils/token_preference.dart';
import 'package:hab_security_fornt/pages/auth/register.dart';
import 'package:hab_security_fornt/pages/layout/layout.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

LoginModel? loginData;

class _LoginPageState extends State<LoginPage> {
  final _formkey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();

  String _userTitle = "";
  Color dynamicColor = Colors.red;
  String _userDesc = "";
  String _status = "";

  void onSubmit(context) async {
    try {
      loginData = await LoginApi().getLoginData(
        _emailCtrl.value.text,
        _passCtrl.value.text,
      );

      String? token = await TokenPreference.getToken();
      // log("token=====>$token");
      if (token == null || token.isEmpty) {
        setState(() {
          showCupertinoDialog(context: context, builder: doneDialog);
          dynamicColor = Colors.red;
          _userTitle = "Амжилтгүй";
          _userDesc = "Алдаа гарлаа";
          _status = "200";
        });
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: ((context) => Layout())));
      }
    } on Error catch (e) {
      print("errorrr=====>${e}");
      setState(() {
        showCupertinoDialog(context: context, builder: doneDialog);
        dynamicColor = Colors.red;
        _userTitle = "Амжилтгүй";
        _userDesc = "Server internal error";
        _status = "500";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFF172D46),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.1,
              ),
              Image.asset(
                'assets/leaf.png',
                width: size.width * 0.2,
                // height: size.height,
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                "Enviroment health and safety",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                height: size.height * 0.1,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TextFormField(
                          controller: _emailCtrl,
                          decoration: InputDecoration(
                            labelText: 'И-Мэйл',
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            fillColor: Colors.white,
                            filled: true,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'И-мэйл хаягаа оруулна уу';
                            }
                            if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                .hasMatch(value)) {
                              return 'И-мэйл-ээс өөр байна';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: _passCtrl,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Нууц үг',
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            fillColor: Colors.white,
                            filled: true,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Нууц үгээ оруулна уу ';
                            }
                            if (value.length < 6) {
                              return 'Нууц үг 6-аас дээш байх ёстой';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        GestureDetector(
                            onTap: () => {
                                  if (_formkey.currentState!.validate())
                                    {
                                      onSubmit(context),
                                    },
                                },
                            child: Container(
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(child: Text("Нэвтрэх")),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                            onTap: () => {Get.to(RegisterPage())},
                            child: Container(
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                  child: Text(
                                "Бүртгүүлэх",
                                style: TextStyle(color: Colors.white),
                              )),
                            )),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
      // backgroundColor: Colors.,
    );
  }

  Widget doneDialog(BuildContext context) => CupertinoAlertDialog(
        title: Text(
          _userTitle,
          style: TextStyle(fontSize: 22, color: dynamicColor),
        ),
        content: Text(
          _userDesc,
          style: const TextStyle(fontSize: 20),
        ),
        actions: [
          CupertinoDialogAction(
            child: const Text("Болсон"),
            onPressed: () => {
              Navigator.pop(context),
            },
          ),
        ],
      );
}
