import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:task1_app/constants/colors.dart';
import 'package:task1_app/main.dart';
import 'package:task1_app/models/loginmodel.dart';
import 'package:task1_app/screens/homeScreen.dart';
import 'package:task1_app/widgets/custombutton.dart';
import 'package:task1_app/widgets/textfield.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  final _emailFormKey = GlobalKey<FormState>();
  final _passwordFormKey = GlobalKey<FormState>();
  bool shouldAutoValidateEmail = false;
  bool shouldAutoValidatePassword = false;

  Future<void> login(String email, String password) async {
    bool isSuccess = false;
    showDialog(
        context: context,
        builder: (context) {
          return Center(
              child: CircularProgressIndicator(
            color: primaryred,
          ));
        });

    http.Response response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));

    Navigator.of(context).pop();

    List<LoginModel> check = loginModelFromJson(response.body);
    for (int i = 0; i < check.length; i++) {
      LoginModel data = check[i];
      var _email = data.email;
      var _username = data.username;
      if (_email == emailcontroller.text &&
          _username == passwordcontroller.text) {
        isSuccess = true;
        user = check[i];
      }
    }
    if (isSuccess) {
      showtoast(msg: "Login Successful");
      tohomepage();
    } else {
      showtoast(msg: "Invalid Credential");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                "assets/images/logo.png",
                width: 85,
              ),
              Text('Lorem',
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(fontSize: 30)),
              Text('IPSUM',
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(fontSize: 13)),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 35),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Form(
                        key: _emailFormKey,
                        autovalidateMode: shouldAutoValidateEmail
                            ? AutovalidateMode.onUserInteraction
                            : AutovalidateMode.disabled,
                        child: ShowTextField(
                          textHint: "Email",
                          controller: emailcontroller,
                          onFieldSubmitted: (p0) {
                            setState(() {
                              shouldAutoValidateEmail = true;
                            });
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return "This field is required";
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                    ),
                    Form(
                      key: _passwordFormKey,
                      autovalidateMode: shouldAutoValidateEmail
                          ? AutovalidateMode.onUserInteraction
                          : AutovalidateMode.disabled,
                      child: ShowTextField(
                          textHint: "Password",
                          moveToNextTextField: TextInputAction.done,
                          controller: passwordcontroller,
                          onFieldSubmitted: (p0) {
                            setState(() {
                              shouldAutoValidatePassword = true;
                            });
                          },
                          hiddenData: true,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "This field is required";
                            } else {
                              return null;
                            }
                          }),
                    ),
                    CustomButton(
                        topMargin: 20,
                        text: "LOGIN",
                        callback: () {
                          bool test1 = _emailFormKey.currentState!.validate();
                          bool test2 =
                              _passwordFormKey.currentState!.validate();
                          print("${test1} ${test2} ");
                          if (test1 && test2) {
                            login(
                                emailcontroller.text, passwordcontroller.text);
                          }
                        })
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void showtoast({required String msg}) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: secondaryred,
        textColor: white,
        fontSize: 16.0);
  }

  void tohomepage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }
}
