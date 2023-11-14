import 'package:todo/widgets/formInput.dart';
import 'package:flutter/material.dart';
import 'package:todo/colors.dart';

import 'package:todo/Login/login_vm.dart';


class LoginView extends StatelessWidget {
  final LoginViewModel viewModel = LoginViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
            children: [
              const SizedBox(height: 100),
              const Text(
                'Se connecter à Todo',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: CustomColorsLight.textBlack,
                ),
              ),
              LoginForm(viewModel: viewModel),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Nouveau sur Todo ?"),
                      TextButton(
                          child: const Text(
                            "S'inscrire",
                            style: TextStyle(
                              color: CustomColorsLight.textBlack,
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/register');
                          }
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
      ),
    );
  }
}

// Login Form
class LoginForm extends StatefulWidget {
  final LoginViewModel viewModel;

  const LoginForm({Key? key, required this.viewModel}) : super(key: key);

  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

// Login State class.
// This class holds data related to the form.
class LoginFormState extends State<LoginForm> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    passwordController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(40,30,40,10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Username or e-mail ---------------------------------------------
              FormInputText(
                controller: emailController,
                inputLabel: "Nom d'utilisateur ou adresse e-mail",
                inputFontSize: 14,
                validate: (value) {
                  if (value == null || value.isEmpty) {
                    return "Nom d'utilisateur ou adresse e-mail incorrect";
                  }
                  return null;
                },
              ),
              // Password ------------------------------------------------------
              FormInputText(
                controller: passwordController,
                inputLabel: "Mot de passe",
                inputFontSize: 14,
                validate: (value) {
                  if (value == null || value.isEmpty) {
                    return "Mot de pass incorrect";
                  }
                  return null;
                },
                counter: TextButton(
                    child: const Text(
                      "Mot de passe oublié ?",
                      style: TextStyle(
                        color: CustomColorsLight.textBlack,
                      ),
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Et ba sheh ! 🫶')),
                      );
                    }
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      // Validate returns true if the form is valid, or false otherwise.
                      if (_formKey.currentState!.validate()) {
                        await widget.viewModel.loginUser(
                            context,
                            emailController.text,
                            passwordController.text,
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: CustomColorsLight.orange,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                    ),
                    child: const Text(
                      'Connexion',
                      style: TextStyle(
                        color: CustomColorsLight.textBlack,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
