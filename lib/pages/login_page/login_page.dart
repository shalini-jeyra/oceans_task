import 'package:flutter/material.dart';
import 'package:oceans_task/common_widgets/common_widget.dart';
import 'package:oceans_task/services/auth.dart';
import 'package:oceans_task/services/locator.dart';
import 'package:oceans_task/styles/styles.dart';
import 'package:oceans_task/models/response.dart';
import '../pages.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    AuthService authService = locator<AuthService>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus( FocusNode());
            },
            child: Column(
              children: [
                const Design(),
                Form(
                  key: _formKey,
                  child: Card(
                    elevation: 0,
                    shadowColor: HintColors.primary,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const HeaderWidget(
                          text: 'LOG IN',
                        ),
                        TextFieldWidget(
                          inputType: TextInputType.emailAddress,
                          text: 'Email',
                          controller: emailController,
                          validatorText: 'Invalid Emailid',
                        ),
                        TextFieldWidget(
                          inputType: TextInputType.text,
                          text: 'Password',
                          controller: passwordController,
                          validatorText: 'invalid password',
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ButtonWidget(
                              onPressed: () async {
                                final form = _formKey.currentState;
                                form!.save();
                                if (form.validate()) {
                                  emailController.text =
                                      emailController.text.trim();

                                  passwordController.text =
                                      passwordController.text.trim();

                                  Response va = await authService.login(
                                      emailController.text,
                                      passwordController.text);
                                  if (va.message == "success") {
                                    Navigator.pushAndRemoveUntil( 
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                 HomePage(
                                                  name: va.data!.name,
                                                )),(route)=>false);
                                  }else
                                  if (va.message ==
                                      "invalid username or password") {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text(
                                              'Invalid username and password'),
                                          actions: <Widget>[
                                            ElevatedButton(
                                              child: const Text('Ok'),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  }
                                } else {}
                              },
                              text: 'Log in'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Don\'t have an account?'),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const SignUpPage()),(route)=>false);
                                  },
                                  child: const Text(
                                    'Sign up Now',
                                    style: TextStyle(
                                        color: AppColors.ternary,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                  ))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
