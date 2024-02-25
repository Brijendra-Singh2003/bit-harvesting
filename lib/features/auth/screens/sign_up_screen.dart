import 'package:bit_harvesting/constant/auth_button.dart';
import 'package:bit_harvesting/constant/auth_field_widget.dart';
import 'package:bit_harvesting/constant/snack_bar.dart';
import 'package:bit_harvesting/features/auth/repository/auth_repository.dart';
import 'package:bit_harvesting/features/auth/screens/login_screen.dart';
import 'package:bit_harvesting/features/auth/screens/my_home_page.dart';
import 'package:bit_harvesting/main.dart';
import 'package:bit_harvesting/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  final String? mobileNumber;

  const SignUpScreen({
    super.key,
    required,
    this.mobileNumber,
  });

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  // final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _MobileController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  FocusNode searchFocusNode = FocusNode();
  FocusNode textFieldFocusNode = FocusNode();

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  void conformUser() {}
  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _MobileController.dispose();
    _districtController.dispose();
    _cityController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade600,
        centerTitle: true,
        title: const Text(
          'Bit Harvesting',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: const BoxConstraints(),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    'Fill the Detail',
                    style: TextStyle(
                      fontSize: 29,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 20),
                  AuthTextField(
                    controller: _nameController,
                    hintText: 'Full Name',
                    onChange: (val) {},
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(height: 20),
                  AuthTextField(
                    controller: _MobileController,
                    hintText: 'Mobile Number',
                    onChange: (val) {},
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 20),
                  AuthTextField(
                      controller: _passwordController,
                      onChange: (val) {},
                      hintText: 'Password',
                      keyboardType: TextInputType.text),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      String name = _nameController.text.trim();
                      String password = _passwordController.text.trim();
                      if (name.length < 5) {
                        CustomSnackBar(
                          content: 'Enter Full Name',
                          context: context,
                        ).displaySnackBar();
                      } else if (password.length <= 5) {
                        CustomSnackBar(
                          content: 'Enter Password with length more than 5',
                          context: context,
                        ).displaySnackBar();
                      } else if (_MobileController.text.length <= 5) {
                        CustomSnackBar(
                          content: 'Enter mobile number',
                          context: context,
                        ).displaySnackBar();
                      } else {
                        UserModel userModel = UserModel(
                          name: name,
                          uid: FirebaseAuth.instance.currentUser!.uid,
                          password: password,
                          email: '',
                          phoneNumber: '',
                        );
                      }
                    },
                    child: ElevatedButton(
                      onPressed: () {
                        String password = _passwordController.text.trim();
                        String mobileNumber = _MobileController.text.trim();
                        if (_nameController.text.length < 5) {
                          CustomSnackBar(
                            content: 'Enter Full name',
                            context: context,
                          ).displaySnackBar();
                        } else if (mobileNumber.length != 10) {
                          CustomSnackBar(
                            content: 'Enter Mobile Number',
                            context: context,
                          ).displaySnackBar();
                        } else if (password.isEmpty) {
                          CustomSnackBar(
                            content: 'Enter Password',
                            context: context,
                          ).displaySnackBar();
                        } else {
                          ref.read(authRepositoryProvider).LoginWithPhone(
                                context: context,
                                phoneNumber: '+91${_MobileController.text}',
                              );
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const MyHomePage(),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade400,
                        padding: const EdgeInsets.symmetric(
                          vertical: 18,
                        ),
                      ),
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already Register ? Click Here',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(
                                mobileNumber: '',
                              ),
                            ),
                          );
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.green[400],
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
