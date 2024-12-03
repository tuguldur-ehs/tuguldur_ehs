import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hab_security_fornt/pages/auth/register_bloc.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

const List<String> list = <String>[
  'HAB',
  'EMPLOYEE',
];

class _RegisterPageState extends State<RegisterPage> {
  late final RegisterBloc _bloc;

  final _formkey = GlobalKey<FormState>();
  final _fisrtnameCtrl = TextEditingController();
  final _lastnameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _confirmationPasswordCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  String role = list.first;

  String _userTitle = "";
  Color dynamicColor = Colors.red;
  String _userDesc = "";
  String _status = "";

  @override
  void initState() {
    super.initState();
    _bloc = RegisterBloc();
    initControls();
  }

  void initControls() {
    _fisrtnameCtrl.text = '';
    _lastnameCtrl.text = '';
    _emailCtrl.text = '';
    _passCtrl.text = '';
    _confirmationPasswordCtrl.text = '';
    String role = list.first;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegisterBloc>(
      create: (context) => _bloc,
      child: BlocListener<RegisterBloc, RegisterState>(
        listener: _blocListener,
        child: BlocBuilder<RegisterBloc, RegisterState>(
          builder: _blocBuilder,
        ),
      ),
    );
  }

  // void onSubmit(context) async {
  //   try {
  //     registerData = await RegisterApi().getRegisterData(
  //         _fisrtnameCtrl.value.text,
  //         _lastnameCtrl.value.text,
  //         _emailCtrl.value.text,
  //         _passCtrl.value.text,
  //         _confirmationPasswordCtrl.value.text,
  //         role);
  //     if (registerData?.statusCode == 201) {
  //       setState(() {
  //         showCupertinoDialog(context: context, builder: doneDialog);
  //         dynamicColor = Colors.green;
  //         _userTitle = "Амжилттай";
  //         _userDesc = "Амжиллтай бүртгэгдлээ";
  //         _status = "200";
  //       });
  //     }
  //   } on DioException catch (e) {
  //     setState(() {
  //       showCupertinoDialog(context: context, builder: doneDialog);
  //       dynamicColor = Colors.red;
  //       _userTitle = "Амжилтгүй";
  //       _userDesc = e.response?.data['message'];
  //       _status = "500";
  //     });
  //   }
  // }

  void _blocListener(BuildContext context, RegisterState state) {
    if (state is RegisterLoading) {
      print('Loafing');
    } else if (state is RegisterSuccess) {
      setState(() {
        showCupertinoDialog(context: context, builder: doneDialog);
        dynamicColor = Colors.green;
        _userTitle = "Амжилттай";
        _userDesc = "Амжиллтай бүртгэгдлээ";
        _status = "200";
      });
    } else if (state is RegisterFailure) {
      setState(() {
        showCupertinoDialog(context: context, builder: doneDialog);
        dynamicColor = Colors.red;
        _userTitle = "Амжилтгүй";
        _status = "500";
      });
    }
  }

  Widget _blocBuilder(BuildContext context, RegisterState state) {
    return Scaffold(
      backgroundColor: Color(0xFF172D46),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xFF172D46),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Form(
          key: _formkey,
          child: ListView(
            children: <Widget>[
              SizedBox(height: 20),
              TextFormField(
                controller: _lastnameCtrl,
                decoration: InputDecoration(
                  labelText: 'Овог',
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
                    return 'Овогоо оруулна уу ';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _fisrtnameCtrl,
                decoration: InputDecoration(
                  labelText: 'Нэр',
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
                    return 'Нэрээ оруулна уу ';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
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
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
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
                    return 'Password must be at least 6 characters long';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _confirmationPasswordCtrl,
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
                    return 'Password must be at least 6 characters long';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              SizedBox(
                width:
                    double.infinity, // Makes the dropdown take the full width
                child: DropdownMenu<String>(
                  textStyle: TextStyle(color: Colors.white),
                  menuStyle: MenuStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  initialSelection: list.first,
                  onSelected: (String? value) {
                    setState(() {
                      role = value ?? list[1];
                    });
                  },
                  dropdownMenuEntries:
                      list.map<DropdownMenuEntry<String>>((String value) {
                    return DropdownMenuEntry<String>(
                        // style: MenuItemButton.styleFrom(
                        //     foregroundColor: Colors.white),
                        value: value,
                        label: value);
                  }).toList(),
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () => {
                  if (_formkey.currentState!.validate())
                    {
                      context.read<RegisterBloc>().add(
                            RegisterSubmitEvent(
                              firstname: _fisrtnameCtrl.text,
                              lastname: _lastnameCtrl.text,
                              email: _emailCtrl.text,
                              password: _passCtrl.text,
                              confirmationPassword:
                                  _confirmationPasswordCtrl.text,
                              role: list.first,
                            ),
                          ),
                      print("wleflwelfwef--${list.first}")
                    },
                },
                child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "Бүртгүүлэх",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
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
