import 'package:flutter/material.dart';

import 'package:genotechies_app/theme/constants.dart';

class MainLoader extends StatelessWidget {
  const MainLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: primaryColor,
      ),
    );
  }
}
