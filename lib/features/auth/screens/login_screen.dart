import 'package:bit_harvesting/constant/auth_field_widget.dart';
import 'package:bit_harvesting/features/auth/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  final String mobileNumber;
  const LoginScreen({super.key, required this.mobileNumber});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _MobileController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _passwordController.dispose();
    _MobileController.dispose();
  }

  // void confirmUser(
  //   String mobileNumber,
  //   String password,
  // ) async {
  //   CustomSnackBar(
  //     content: mobileNumber,
  //     context: context,
  //   ).displaySnackBar();

  //   var model = ref.watch(authRepositoryControllerProvider).getUserModel(
  //         context: context,
  //         mobileNumber: '+91${mobileNumber}',
  //       );
  //   model.then((value) {
  //     if (value == null) {
  //       CustomSnackBar(
  //         content: 'Number Not Exist\'s',
  //         context: context,
  //       ).displaySnackBar();
  //     }
  //     if (value != null) {
  //       if (value['password'] == password) {
  //         ref.read(authRepositoryControllerProvider).LoginWithPhone(
  //               context: context,
  //               phoneNumber: '+91${mobileNumber}',
  //             );
  //       } else {
  //         CustomSnackBar(
  //           content: 'Enter Correct Password',
  //           context: context,
  //         ).displaySnackBar();
  //       }
  //     }
  //   });
  // }

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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Positioned(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
                child: const Image(
                  image: NetworkImage(
                    'https://img.freepik.com/free-vector/farmer-with-wheelbarrow_1196-206.jpg?size=626&ext=jpg&ga=GA1.1.605395950.1708799311&semt=sph',
                  ),
                ),
              ),
            ),
            ListView(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 14,
              ),
              children: [
                const SizedBox(
                  height: 32,
                ),
                const Text(
                  'Bit 👨‍🌾\n Harvesting',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                const Text(
                  'Welcome Back !',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 29,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                AuthTextField(
                  controller: _MobileController,
                  hintText: 'Enter Mobile Number',
                  keyboardType: TextInputType.phone,
                  onChange: (value) {},
                ),
                const SizedBox(
                  height: 20,
                ),
                AuthTextField(
                  controller: _passwordController,
                  hintText: 'Enter Password',
                  keyboardType: TextInputType.visiblePassword,
                  onChange: (value) {},
                  isObcureTrue: true,
                ),
                const SizedBox(
                  height: 12,
                ),
                ElevatedButton(
                  onPressed: () {
                    String password = _passwordController.text.trim();
                    String mobileNumber = _MobileController.text.trim();
                    // if (mobileNumber.length != 10) {
                    //   CustomSnackBar(
                    //     content: 'Enter Mobile Number',
                    //     context: context,
                    //   ).displaySnackBar();
                    // } else if (password.isEmpty) {
                    //   CustomSnackBar(
                    //     content: 'Enter Password',
                    //     context: context,
                    //   ).displaySnackBar();
                    // } else {
                    //   confirmUser(
                    //     mobileNumber,
                    //     password,
                    //   );
                    // }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade400,
                    padding: const EdgeInsets.symmetric(
                      vertical: 18,
                    ),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 22,
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Forgot Password ?',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 22,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Don\'t have an Account ?',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const SignUpScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                            color: Colors.green, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
