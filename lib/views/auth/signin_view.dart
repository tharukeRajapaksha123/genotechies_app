import 'package:flutter/material.dart';
import 'package:genotechies_app/controllers/auth_controller.dart';
import 'package:genotechies_app/theme/constants.dart';
import 'package:genotechies_app/views/auth/register_view.dart';
import 'package:genotechies_app/widgets/input_field.dart';
import 'package:genotechies_app/widgets/main_button.dart';
import 'package:genotechies_app/widgets/main_loader.dart';

class SigninView extends StatefulWidget {
  SigninView({super.key});

  @override
  State<SigninView> createState() => _SigninViewState();
}

class _SigninViewState extends State<SigninView> {
  final TextEditingController email = TextEditingController();

  final TextEditingController password = TextEditingController();

  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  final AuthController authController = AuthController();

  bool shouldLoad = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(defaultPadding),
        child: Form(
          key: _key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              Text(
                "Genotechies",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(
                height: defaultHeight * 4,
              ),
              InputField(
                controller: email,
                labelText: "Email",
                icon: const Icon(Icons.email),
              ),
              const SizedBox(
                height: defaultHeight,
              ),
              InputField(
                controller: password,
                labelText: "Password",
                icon: const Icon(Icons.password),
                isPassword: true,
              ),
              const SizedBox(
                height: defaultHeight,
              ),
              shouldLoad
                  ? const MainLoader()
                  : MainButton(
                      text: "Signin Now",
                      textColor: Colors.white,
                      onPressed: () async {
                        if (_key.currentState!.validate()) {
                          setState(() {
                            shouldLoad = true;
                          });
                          await authController.siginWithEmailAndPassword(
                              email.text, password.text, context);
                          setState(() {
                            shouldLoad = true;
                          });
                        }
                      },
                    ),
              const SizedBox(
                height: defaultHeight,
              ),
              MainButton(
                text: "Signin With Google",
                border: true,
                color: Colors.white,
                textColor: primaryColor,
                onPressed: () {
                  authController.siginWithGoogle(context);
                },
                icon: const Icon(Icons.mobile_friendly),
              ),
              const SizedBox(
                height: defaultHeight * 5,
              ),
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text("Don't have an account ? "),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterView()));
                      },
                      child: const Text(
                        "Register Now",
                        style: TextStyle(decoration: TextDecoration.underline),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
