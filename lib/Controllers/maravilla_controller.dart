import 'package:Maravillas360/Services/maravilla_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class AuthController {
  final AuthService _authService = AuthService();

  Future<User?> register(String email, String password) async {
    return await _authService.registerWithEmail(email, password);
  }

  Future<User?> signIn(String email, String password) async {
    return await _authService.signInWithEmail(email, password);
  }

  User? getCurrentUser() {
    return _authService.getCurrentUser();
  }
}
