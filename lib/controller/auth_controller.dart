import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:full_chat_firebase/models/user_model.dart';
import 'package:full_chat_firebase/services/auth_service.dart';

final authControllerProvider = Provider((ref) {
  final authRepositroy = ref.watch(authRepositroyProvider);
  return AuthController(authRepositroy: authRepositroy, ref: ref);
});

final userDataAuthProvider = FutureProvider((ref) {
  final authController = ref.watch(authControllerProvider);
  return authController.getUserData();
});

class AuthController {
  final AuthRepositroy authRepositroy;
  final ProviderRef ref;

  AuthController({required this.ref, required this.authRepositroy});

  Future<UserModel?> getUserData() async {
    UserModel? user = await authRepositroy.getCurrentUserData();
    return user;
  }

  void signInWithPhone(BuildContext context, String phoneNumber) {
    authRepositroy.signInWithPhone(context, phoneNumber);
  }

  void verfiyOTP(BuildContext context, String verificationId, String userOTP) {
    authRepositroy.verfiyOtp(
      context: context,
      verificationId: verificationId,
      userOTP: userOTP,
    );
  }

  void saveUserDataToFirebase(
      BuildContext context, String name, String email, File? profilePic) {
    authRepositroy.saveUserDataToFirebase(
      name: name,
      email: email,
      profilePic: profilePic,
      ref: ref,
      context: context,
    );
  }
}
