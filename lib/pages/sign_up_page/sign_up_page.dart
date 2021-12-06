import 'package:flutter/material.dart';
import 'package:oceans_task/common_widgets/common_widget.dart';
import 'package:oceans_task/models/response.dart';
import 'package:oceans_task/pages/pages.dart';
import 'package:oceans_task/services/auth.dart';
import 'package:oceans_task/services/locator.dart';
import 'package:oceans_task/styles/styles.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
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
            onTap: (){
               FocusScope.of(context).requestFocus( FocusNode());
            },
            child: Column(
              children: [
                const Design(),
                Form(
                  key: _formKey,
                  child: Card(
                    elevation: 0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const HeaderWidget(
                          text: 'Sign up',
                        ),
                        TextFieldWidget(
                          inputType: TextInputType.name,
                          text: 'User Name',
                          controller: userNameController,
                          validatorText: 'invalid Username',
                        ),
                        TextFieldWidget(
                          inputType: TextInputType.phone,
                          text: 'Phone Number',
                          controller: phoneNumberController,
                          validatorText: 'invalid phone number',
                        ),
                        TextFieldWidget(
                          inputType: TextInputType.emailAddress,
                          text: 'Email',
                          controller: emailController,
                          validatorText: 'invalid email',
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
                                  userNameController.text =
                                      userNameController.text.trim();
                                  emailController.text =
                                      emailController.text.trim();
                                  passwordController.text =
                                      passwordController.text.trim();
          
                                  Response va = await authService.signUp(
                                      userNameController.text,
                                      emailController.text,
                                      passwordController.text);
                                  if (va.message == "success") {
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                 HomePage(name: va.data!.name,)),(route)=>false);
                                  } else if (va.message ==
                                      "invalid username or password") {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text('Fill all the details '),
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
                                  } else if(va.message ==
                                     "The email address you have entered is already registered"){
                                        showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text('The email address you have entered is already registered'),
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
                              text: 'Sign up'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Don\'t have an account?'),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            const LoginPage(),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    'Login',
                                    style: TextStyle(
                                        color: AppColors.ternary,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                  ))
                            ],
                          ),
                        ),
                        Row(children: const <Widget>[
                          Expanded(
                              child: Divider(
                            color: AppColors.ternary,
                            thickness: 2,
                          )),
                          Spacer(),
                          Expanded(
                              child: Divider(
                            color: AppColors.ternary,
                            thickness: 2,
                          )),
                        ])
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
