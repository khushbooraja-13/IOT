import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:podcast/register_screen.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Login',
                      style: TextStyle(fontSize: 30, color: Colors.blueAccent),
                    ),
                    Text('Please Login to your account',
                        style: TextStyle(fontSize: 24)),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: MultiValidator([
                        RequiredValidator(errorText: 'Email is required'),
                        EmailValidator(errorText: 'Enter a valid email address'),
                      ]),
                      decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(color: Colors.grey, fontSize: 16),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.grey.shade300, width: 2)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blueAccent, width: 3))),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: MultiValidator([
                        RequiredValidator(errorText: 'password is required'),
                        MinLengthValidator(8,
                            errorText: 'password must be at least 8 digits long'),
                        PatternValidator(r'(?=.*?[#?!@$%^&*-])',
                            errorText:
                                'passwords must have at least one special character')
                      ]),
                      decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(color: Colors.grey, fontSize: 16),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.grey.shade300, width: 2)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blueAccent, width: 3))),
                      obscureText: true,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          _formKey.currentState!.validate();
                        },
                        child: Text(
                          'LOGIN',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  top: BorderSide(color: Colors.grey.shade400))),
                        )),
                        Container(
                          child: Text(
                            'OR',
                            style: TextStyle(
                                color: Colors.grey.shade400, fontSize: 18),
                          ),
                          margin: EdgeInsets.symmetric(horizontal: 10),
                        ),
                        Expanded(
                            child: Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  top: BorderSide(color: Colors.grey.shade400))),
                        ))
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage('assets/facebookIcon.png'),
                            backgroundColor: Colors.white),
                        SizedBox(
                          width: 20,
                        ),
                        CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage('assets/twitterIcon.png'),
                            backgroundColor: Colors.white)
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have an account?',
                          style: TextStyle(fontSize: 15),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) {
                                return RegisterScreen();
                              },
                            ));
                          },
                          child: Text(
                            'Register',
                            style:
                                TextStyle(fontSize: 15, color: Colors.blueAccent),
                          ),
                        )
                      ],
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
