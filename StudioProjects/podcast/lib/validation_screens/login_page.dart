import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:podcast/validation_screens/register_page.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  LoginPage({super.key});

  Widget CustomTextFormField(
      {String? myText,
      String? myHintText,
      IconData? myIcon,
      String? Function(String?)? myValidator,
      bool? isPassword}) {
    return TextFormField(
      validator: myValidator,
      obscureText: isPassword!,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade400)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade400)),
        label: Text(
          myText!,
          style: TextStyle(color: Colors.grey.shade400),
        ),
        hintText: myHintText,
        prefixIcon: Icon(
          myIcon!,
          color: Colors.grey.shade400,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'IMPORTIR.ID',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'It\'s modular and designed to last',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                  ),
                  Image.asset('assets/login_register_pic/pooh_team.png'),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                    myValidator: MultiValidator([
                      RequiredValidator(errorText: 'Email is required'),
                      EmailValidator(errorText: 'Enter a valid email address'),
                    ]),
                    myText: 'Email',
                    myHintText: 'abc@gmail.com',
                    myIcon: Icons.email_outlined,
                    isPassword: false,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                    myValidator: MultiValidator([
                      RequiredValidator(errorText: 'password is required'),
                      MinLengthValidator(8,
                          errorText: 'password must be at least 8 digits long'),
                      PatternValidator(r'(?=.*?[#?!@$%^&*-])',
                          errorText:
                          'passwords must have at least one special character')
                    ]),
                    myText: 'Password',
                    myIcon: Icons.lock_outline,
                    isPassword: true,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Forgot Password',
                    style: TextStyle(
                        color: Colors.blue.shade400,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Container(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        _formKey.currentState!.validate();
                      },
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w700),
                      ),
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.yellowAccent),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Didn\'t have any account?',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                            return RegisterPage();
                          },));
                        },
                        child: Text(
                          'Sign Up here',
                          style: TextStyle(color: Colors.blue.shade400),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}