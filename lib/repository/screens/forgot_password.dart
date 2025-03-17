import 'package:demo/domain/constants/elevatedbuttons.dart';
import 'package:demo/repository/screens/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});
  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final numberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
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
                  padding: const EdgeInsets.only(left: 25, bottom: 5),
                  child: Text(
                    'Forgot Password',
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
              ),
              Stack(
                clipBehavior: Clip.hardEdge,
                children: [
                  Flexible(
                    child: Container(
                      padding: EdgeInsets.only(left: 5, right: 5),
                      height: MediaQuery.of(context).size.height - 250,
                      width: MediaQuery.of(context).size.width - 30,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 40,
                    left: 20,
                    right: 20,
                    child: Padding(
                      padding: const EdgeInsets.all(28),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: Text(
                                "Please enter your mobile number to recover your password",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Color.fromARGB(255, 91, 91, 91),
                                ),
                              ),
                            ),
                            SizedBox(height: 30),
                            TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
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
                                  return 'Please enter your mobile number';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 50),
                            CustomEvatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SignIn(),
                                    ),
                                  );
                                }
                              },
                              label: 'Submit',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
            ],
          ),
        ],
      ),
    );
  }
}
