import 'package:demo/domain/constants/elevatedbuttons.dart';
import 'package:demo/main.dart';
import 'package:demo/repository/screens/forgot_password.dart';
import 'package:demo/repository/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final numberController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF3F5EFB), Color(0xFFFC466B)],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 18.0, bottom: 5),
                  child: Text(
                    'Sign In',
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                height: MediaQuery.of(context).size.height - 250,
                width: MediaQuery.of(context).size.width - 30,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: numberController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        maxLength: 10,
                        decoration: InputDecoration(
                          prefixText: '+91 ',
                          hintText: 'Mobile Number',
                          hintStyle: TextStyle(
                            color: Colors.black87,
                            fontSize: 19,
                          ),
                          prefixIcon: Icon(
                            Icons.phone_android_outlined,
                            color: Colors.blueAccent,
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your mobile number';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: passwordController,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: TextStyle(
                            color: Colors.black87,
                            fontSize: 19,
                          ),
                          prefixIcon: Icon(
                            Icons.lock_outlined,
                            color: Colors.blueAccent,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isObscured
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                _isObscured = !_isObscured;
                              });
                            },
                          ),
                        ),
                        obscureText: _isObscured,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Password can not be empty';
                          } else if (value.length < 8) {
                            return 'Password must be at least 8 characters long';
                          } else if (!RegExp(r'[A-Z]').hasMatch(value)) {
                            return 'Password must have at least one uppercase letter';
                          } else if (!RegExp(r'[a-z]').hasMatch(value)) {
                            return 'Password must have at least one lowercase letter';
                          } else if (!RegExp(r'[0-9]').hasMatch(value)) {
                            return 'Password must have at least one number';
                          } else if (!RegExp(
                            r'[!@#$%^&*(),.?":{}|<>]',
                          ).hasMatch(value)) {
                            return 'Password must have at least one special character';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 25),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return ForgotPassword();
                              },
                            ),
                          );
                        },
                        child: Text(
                          'Forgot Password ?',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 223, 84, 75),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      CustomEvatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(),
                              ),
                            );
                          }
                        },
                        label: 'Sign In',
                      ),
                      SizedBox(height: 70),
                      Text(
                        'or sign in using',
                        style: TextStyle(
                          color: Color.fromARGB(255, 124, 123, 123),
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                backgroundColor: Colors.blue,
                              ),
                              child: Text(
                                'Facebook',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 30),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                backgroundColor: Colors.pink,
                              ),
                              child: Text(
                                'Google',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 19,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Text(
                              'By creating an account, you are agreeing to our',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color.fromARGB(255, 97, 97, 97),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Text(
                              'Terms',
                              style: TextStyle(color: Colors.red, fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 45),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t have an account ? ',
                            style: TextStyle(
                              color: Color.fromARGB(255, 99, 98, 98),
                              fontSize: 18,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return MyHomePage();
                                  },
                                ),
                              );
                            },
                            child: Text(
                              'Sign Up',
                              style: TextStyle(color: Colors.red, fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15),
            ],
          ),
        ],
      ),
    );
  }
}
