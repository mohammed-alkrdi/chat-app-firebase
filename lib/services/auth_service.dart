import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:full_chat_firebase/common/repositroy/common_firebase_storage.dart';
import 'package:full_chat_firebase/constances/utils.dart';
import 'package:full_chat_firebase/models/user_model.dart';
import 'package:full_chat_firebase/screens/auth/user_info_screen.dart';
import 'package:full_chat_firebase/screens/auth/otp_screen.dart';
import 'package:full_chat_firebase/screens/home_screen.dart';

final authRepositroyProvider = Provider(
  (ref) => AuthRepositroy(
      auth: FirebaseAuth.instance, firestore: FirebaseFirestore.instance),
);

class AuthRepositroy {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  AuthRepositroy({required this.auth, required this.firestore});

  Future<UserModel?> getCurrentUserData() async {
    var userData =
        await firestore.collection('users').doc(auth.currentUser?.uid).get();
    UserModel? user;
    if (userData.data() != null) {
      user = UserModel.fromMap(userData.data()!);
    }
    return user;
  }

  void signInWithPhone(BuildContext context, String phoneNumber) async {
    try {
      await auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential);
        },
        verificationFailed: (e) {
          throw Exception(e.message);
        },
        codeSent: ((String verificationId, int? resendToken) async {
          Navigator.pushNamed(context, OtpScreen.routeName,
              arguments: verificationId);
        }),
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } on FirebaseAuthException catch (e) {
      showSnackBar(
        context: context,
        content: e.message!,
      );
    }
  }

  void verfiyOtp(
      {required BuildContext context,
      required String verificationId,
      required String userOTP}) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: userOTP,
      );
      await auth.signInWithCredential(credential);
      Navigator.pushNamedAndRemoveUntil(
          context, UserInformationScreen.routeName, (route) => false);
    } on FirebaseAuthException catch (e) {
      showSnackBar(
        context: context,
        content: e.message!,
      );
    }
  }

  void saveUserDataToFirebase({
    required String name,
    required String email,
    required File? profilePic,
    required ProviderRef ref,
    required BuildContext context,
  }) async {
    try {
      String uid = auth.currentUser!.uid;
      String photoUrl = 'assets/images/person-icon-8.png';

      if (photoUrl != null) {
        photoUrl = await ref
            .read(commonFirebaseStorageRepositoryProvider)
            .storeFileToFirebase(
              'profilePic$uid',
              profilePic!,
            );
      }

      var user = UserModel(
        name: name,
        email: email,
        uid: uid,
        profilPic: photoUrl.replaceAll('/', '\\'),
        phoneNumber: auth.currentUser!.uid,
        isOnline: true,
        groupId: [],
      );
      await firestore.collection('users').doc(uid).set(
            user.toMap(),
          );
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
          (route) => false);
    } catch (e) {
      showSnackBar(
        context: context,
        content: e.toString(),
      );
    }
  }
}
