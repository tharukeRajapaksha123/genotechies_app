import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:genotechies_app/theme/constants.dart';
import 'package:genotechies_app/views/auth/signin_view.dart';
import 'package:genotechies_app/views/home/home_view.dart';

class AutControllView extends StatelessWidget {
  const AutControllView({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.userChanges(),
      builder: ((context, snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text("Something wen wrong"),
          );
        }
        // if (!snapshot.hasData) {
        //   return const Center(
        //     child: CircularProgressIndicator(
        //       color: primaryColor,
        //     ),
        //   );
        // }
        return snapshot.data == null ? SigninView() : const HomeView();
      }),
    );
  }
}
