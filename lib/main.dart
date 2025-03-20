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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(45),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF3F5EFB), Color(0xFFFC466B)],
              ),
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
                    _buildTextField(
                      namecontroller,
                      'Full Name',
                      Icons.person_2_outlined,
                    ),
                    SizedBox(height: 15),
                    _buildTextField(
                      mailcontroller,
                      'Email',
                      Icons.email_outlined,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 15),
                    _buildTextField(
                      numbercontroller,
                      'Mobile Number',
                      Icons.phone_android_outlined,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      maxLength: 10,
                      prefix: '+91 ',
                    ),
                    _buildPasswordField(),
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
                    _buildSignInOption(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String hintText,
    IconData icon, {
    TextInputType? keyboardType,
    List<TextInputFormatter>? inputFormatters,
    int? maxLength,
    String? prefix,
  }) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.black87, fontSize: 19),
        prefixIcon: Icon(icon, color: Colors.blueAccent),
        prefix: prefix != null ? Text(prefix) : null,
      ),
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      maxLength: maxLength,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter your $hintText';
        }
        return null;
      },
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: passwordcontroller,
      decoration: InputDecoration(
        hintText: 'Enter Password',
        hintStyle: TextStyle(color: Colors.black87, fontSize: 19),
        prefixIcon: Icon(Icons.lock_outline, color: Colors.blueAccent),
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
          return 'Password cannot be empty';
        } else if (value.length < 8) {
          return 'Password must be at least 8 characters long';
        }
        return null;
      },
    );
  }

  Widget _buildSignInOption() {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'or sign in using',
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 108, 107, 107),
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
                Expanded(child: _buildSocialButton('Facebook', Colors.blue)),
                SizedBox(width: 20),
                Expanded(child: _buildSocialButton('Google', Colors.red)),
              ],
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'By creating an account, you agree to our',
                style: TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(255, 91, 91, 91),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Text(
                  ' Terms',
                  style: TextStyle(fontSize: 15, color: Colors.redAccent),
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
                  color: Color.fromARGB(255, 91, 91, 91),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignIn()),
                  );
                },
                child: Text(
                  ' Sign In',
                  style: TextStyle(fontSize: 17, color: Colors.redAccent),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSocialButton(String text, Color color) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        backgroundColor: color,
      ),
      onPressed: () {},
      child: Text(text, style: TextStyle(color: Colors.white, fontSize: 20)),
    );
  }
}
