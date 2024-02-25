import 'package:bit_harvesting/constant/snack_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selling_list_provider = Provider(
  (ref) => selling_list(
    auth: FirebaseAuth.instance,
    firestore: FirebaseFirestore.instance,
  ),
);

class selling_list {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  selling_list({required this.auth, required this.firestore});

  void uploadList(Map<String, dynamic> val) async {
    await firestore
        .collection('users')
        .doc(auth.currentUser!.uid)
        .collection('list')
        .add(val);
  }

  Future<List<Map<String, dynamic>>> getList(BuildContext context) async {
    List<Map<String, dynamic>> list = [];
    try {
      firestore
          .collection('users')
          .doc(auth.currentUser!.uid)
          .collection('list')
          .get()
          .then((value) {
        for (var doc in value.docs) {
          list.add(doc.data());
        }
      });
      return list;
    } catch (e) {
      CustomSnackBar(content: e.toString(), context: context).displaySnackBar();
    }
    print(list.length.toDouble());
    return list;
  }
}
