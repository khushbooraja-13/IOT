import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:podcast/validation_screens/login_page.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isChecked = false;

  TextEditingController _passwordController = TextEditingController();

  TextEditingController _confirmPassword = TextEditingController();

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

  final _formKey = GlobalKey<FormState>();

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
                  Image.asset(
                    'assets/pooh.png',
                    height: 200,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                      myValidator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Name is required';
                        }
                        return null; // Return null if the validation is successful
                      },
                      myText: 'Name',
                      myHintText: 'Khushboo',
                      myIcon: Icons.person_outline,
                      isPassword: false),
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
                  TextFormField(
                    controller: _passwordController,
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'password is required'),
                      MinLengthValidator(8,
                          errorText: 'password must be at least 8 digits long'),
                      PatternValidator(r'(?=.*?[#?!@$%^&*-])',
                          errorText:
                              'passwords must have at least one special character')
                    ]),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey.shade400)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey.shade400)),
                      label: Text(
                        'Password',
                        style: TextStyle(color: Colors.grey.shade400),
                      ),
                      prefixIcon: Icon(
                        Icons.lock_outline_rounded,
                        color: Colors.grey.shade400,
                      ),
                    ),
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _confirmPassword,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Confirm password is required';
                      }
                      if (_confirmPassword.text != _passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null; // Return null if the validation is successful
                    },
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey.shade400)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey.shade400)),
                      label: Text(
                        'Confirm Password',
                        style: TextStyle(color: Colors.grey.shade400),
                      ),
                      prefixIcon: Icon(
                        Icons.lock_outline_rounded,
                        color: Colors.grey.shade400,
                      ),
                    ),
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                      myValidator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Mobile number is required';
                        }
                        // Regular expression for Indian mobile numbers starting with 7, 8, or 9 and having exactly 10 digits
                        final RegExp mobileRegExp = RegExp(r'^[789]\d{9}$');
                        if (!mobileRegExp.hasMatch(value)) {
                          return 'Enter a valid Indian mobile number';
                        }
                        return null; // Return null if the validation is successful
                      },
                      myIcon: Icons.phone_outlined,
                      myText: 'Phone',
                      myHintText: '9123456789',
                      isPassword: false),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              isChecked = !isChecked;
                            });
                          },
                          child: Icon(
                            isChecked ? Icons.check_box : Icons.check_box_outline_blank
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Accept terms and condition',
                          style: TextStyle(
                              color: Colors.blue.shade400,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
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
                        'Sign Up',
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
                        'If you have an account?',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return LoginPage();
                            },
                          ));
                        },
                        child: Text(
                          'Sign In here',
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
