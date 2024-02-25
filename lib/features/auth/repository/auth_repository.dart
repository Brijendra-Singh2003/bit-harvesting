import 'package:bit_harvesting/constant/snack_bar.dart';
import 'package:bit_harvesting/features/auth/screens/login_screen.dart';
import 'package:bit_harvesting/features/auth/screens/my_home_page.dart';
import 'package:bit_harvesting/features/auth/screens/otp_screen.dart';
import 'package:bit_harvesting/main.dart';
import 'package:bit_harvesting/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_platform_interface/firebase_auth_platform_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepositoryProvider = Provider(
  (ref) => AuthRepository(
    auth: FirebaseAuth.instance,
    firestore: FirebaseFirestore.instance,
    ref: ref,
  ),
);

class AuthRepository {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;
  final ProviderRef ref;

  AuthRepository({
    required this.auth,
    required this.firestore,
    required this.ref,
  });

  void verifyUser(String phoneNumber, BuildContext context) async {
    try {
      await auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          CustomSnackBar(content: e.toString(), context: context)
              .displaySnackBar();
        },
        codeSent: (
          String identificationId,
          int? code,
        ) async {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => OtpScreen(
                isLogin: false,
                IdentificationId: identificationId,
                mobileNumber: phoneNumber,
              ),
            ),
          );
        },
        codeAutoRetrievalTimeout: (val) {},
      );
    } catch (e) {
      CustomSnackBar(
        content: e.toString(),
        context: context,
      );
    }
  }

  void verifyOtp({
    required BuildContext context,
    required String VerificationId,
    required String SmsCode,
    required bool isLogin,
    required String mobileNumber,
  }) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: VerificationId,
        smsCode: SmsCode,
      );

      await auth
          .signInWithCredential(
        credential,
      )
          .then((value) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => isLogin
                ? const MyHomePage()
                : LoginScreen(
                    mobileNumber: mobileNumber,
                  ),
          ),
        );
      });
    } catch (e) {
      CustomSnackBar(
        content: e.toString(),
        context: context,
      );
    }
  }

  void uploadUserModel({
    required UserModel userModel,
    required BuildContext context,
  }) async {
    try {
      await firestore
          .collection('users')
          .doc(userModel.uid)
          .set(
            userModel.toMap(),
          )
          .whenComplete(
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MyHomePage(),
              ),
            ),
          );
    } catch (e) {}
  }

  Future<Map<String, dynamic>?> getUserModel({
    required BuildContext context,
    required String mobileNumber,
  }) async {
    Map<String, dynamic>? doc;
    try {
      await firestore.collection('users').get().then((value) {
        value.docs
            .singleWhere(
                (element) => element.data()['mobileNumber'] == mobileNumber)
            .data();
      });
    } catch (e) {
      CustomSnackBar(content: e.toString(), context: context).displaySnackBar();
    }
    return doc;
  }

  void LoginWithPhone({
    required BuildContext context,
    required String phoneNumber,
  }) async {
    try {
      auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) {
          auth.signInWithCredential(
            credential,
          );
        },
        verificationFailed: (val) {},
        codeSent: (String IdentificationId, int? code) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => OtpScreen(
                isLogin: true,
                IdentificationId: IdentificationId,
                mobileNumber: phoneNumber,
              ),
            ),
          );
        },
        codeAutoRetrievalTimeout: (val) {},
      );
    } catch (e) {}
  }
}
