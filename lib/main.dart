import 'package:demo/domain/constants/elevatedbuttons.dart' as custom;
import 'package:demo/repository/screens/sign_in.dart';
import 'package:demo/repository/screens/verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController mailcontroller = TextEditingController();
  final TextEditingController numbercontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  bool _isObscured = true;
  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context).size.height;
    MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(45),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF3F5EFB), Color(0xFFFC466B)],
            ),
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 35),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 65),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: namecontroller,
                      decoration: InputDecoration(
                        hintText: 'Full Name',
                        hintStyle: TextStyle(
                          color: Colors.black87,
                          fontSize: 19,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.normal,
                        ),
                        prefixIcon: Icon(
                          Icons.person_2_outlined,
                          color: Colors.blueAccent,
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: mailcontroller,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        hintStyle: TextStyle(
                          color: Colors.black87,
                          fontSize: 19,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.normal,
                        ),
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: Colors.blueAccent,
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter a valid email';
                        }
                        if (!RegExp(
                          r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                        ).hasMatch(value)) {
                          return 'Enter a valid email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: numbercontroller,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      maxLength: 10,
                      decoration: InputDecoration(
                        prefix: Text('+91 '),
                        hintText: 'Mobile Number',
                        hintStyle: TextStyle(
                          color: Colors.black87,
                          fontSize: 19,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.normal,
                        ),
                        prefixIcon: Icon(
                          Icons.phone_android_outlined,
                          color: Colors.blueAccent,
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your number';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: passwordcontroller,
                      decoration: InputDecoration(
                        hintText: 'Enter Password',
                        hintStyle: TextStyle(
                          color: Colors.black87,
                          fontSize: 19,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.normal,
                        ),
                        prefixIcon: Icon(
                          Icons.lock_outline,
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
                          return 'Password must have at least one uppercase letter';
                        } else if (!RegExp(r'[0-9]').hasMatch(value)) {
                          return 'Password must have at least one lowercase letter';
                        } else if (!RegExp(
                          r'[!@#$%^&*(),.?":{}|<>]',
                        ).hasMatch(value)) {
                          return 'Password must have at least one special character';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 25),
                    custom.CustomEvatedButton(
                      label: 'Create Account',
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => VerificationScreen(),
                            ),
                          );
                        }
                      },
                    ),
                    SizedBox(height: 90),
                    Container(
                      alignment: Alignment.center,
                      child: Flexible(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'or sign in using',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: const Color.fromARGB(
                                      255,
                                      108,
                                      107,
                                      107,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding: EdgeInsets.only(right: 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                        backgroundColor: const Color.fromARGB(
                                          255,
                                          29,
                                          76,
                                          157,
                                        ),
                                      ),
                                      onPressed: () {},
                                      child: Text(
                                        'Facebook',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  Expanded(
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                        backgroundColor: const Color.fromARGB(
                                          255,
                                          214,
                                          72,
                                          96,
                                        ),
                                      ),
                                      onPressed: () {},
                                      child: Text(
                                        'Google',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: Text(
                                    'By creating an account, you agree to our',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: const Color.fromARGB(
                                        255,
                                        91,
                                        91,
                                        91,
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Text(
                                    ' Terms',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.redAccent,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 60),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Already have an account?',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: const Color.fromARGB(
                                      255,
                                      91,
                                      91,
                                      91,
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SignIn(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    ' Sign In',
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.redAccent,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
