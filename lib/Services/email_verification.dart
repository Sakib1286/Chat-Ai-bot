import 'package:firebase_auth/firebase_auth.dart';

class EmailVerification {
  Future<bool> checkEmailVerification() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      await user.reload(); // Refresh user data
      user = FirebaseAuth.instance.currentUser; // Get the updated user

      if (user!.emailVerified) {
        print('Email verified');
        // Proceed with your app logic
        return true;
      } else {
        print('Email not verified');
        // Prompt the user to verify their email
        return false;
      }
    } else {
      print("Something went wrong");
      return false;
    }
  }
}
