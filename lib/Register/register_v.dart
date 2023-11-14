import 'package:flutter/material.dart';
import 'package:todo/widgets/formInput.dart';
import 'package:todo/colors.dart';

import 'package:todo/Register/register_vm.dart';

class RegisterView extends StatelessWidget {
  final RegisterViewModel viewModel = RegisterViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 100),
              const Text(
                "S'inscrire",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: CustomColorsLight.textBlack,
                ),
              ),
              RegisterForm(viewModel: viewModel),
            ],
          ),
        ),
      ),
    );
  }
}

// Register Form
class RegisterForm extends StatefulWidget {
  final RegisterViewModel viewModel;

  const RegisterForm({Key? key, required this.viewModel}) : super(key: key);

  @override
  RegisterFormState createState() {
    return RegisterFormState();
  }
}


class RegisterFormState extends State<RegisterForm> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    firstNameController.dispose();
    lastNameController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Prénom + nom     ----------------------------------------------
              Row(
                children: [
                  Expanded(
                    child: FormInputText(
                      controller: firstNameController,
                      padding: const EdgeInsets.fromLTRB(0,10,5,10),
                      inputLabel: "Prénom",
                      inputFontSize: 12,
                      inputFontWeight: FontWeight.bold,
                      validate: (value) {
                        if (value == null || value.isEmpty) {
                          return "Veuillez entrer votre Prénom";
                        }
                        return null;
                      },
                    ),
                  ),
                  Expanded(
                    child: FormInputText(
                      controller: lastNameController,
                      padding: const EdgeInsets.fromLTRB(5,10,0,10),
                      inputLabel: "Nom",
                      inputFontSize: 12,
                      inputFontWeight: FontWeight.bold,
                      validate: (value) {
                        if (value == null || value.isEmpty) {
                          return "Veuillez entrer votre Nom";
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              // Username     --------------------------------------------------
              FormInputText(
                controller: usernameController,
                inputLabel: "Nom d'utilisateur",
                inputFontSize: 12,
                inputFontWeight: FontWeight.bold,
                validate: (value) {
                  if (value == null || value.isEmpty) {
                    return "Nom d'utilisateur non valide";
                  }
                  return null;
                },
              ),
              // Password ------------------------------------------------------
              FormInputText(
                controller: passwordController,
                inputLabel: "Mot de passe",
                inputFontSize: 12,
                inputFontWeight: FontWeight.bold,
                validate: (value) {
                  if (value == null || value.isEmpty) {
                    return "Mot de passe non valide";
                  }
                  return null;
                },
              ),
              // Email    ------------------------------------------------------
              FormInputText(
                controller: emailController,
                inputLabel: "Email",
                inputFontSize: 12,
                inputFontWeight: FontWeight.bold,
                validate: (value) {
                  if (value == null || value.isEmpty) {
                    return "Adresse e-mail non valide";
                  }
                  return null;
                },
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Center(
                  child: Text(
                    "En appuyant sur S'inscrire et accepter, vous reconnaissez avoir lu la politique de confidentialité et accepter les conditions de service. Faites attention à ce que vous faites sur Todo !",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: CustomColorsLight.textBlack,
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      // Validate returns true if the form is valid, or false otherwise.
                      if (_formKey.currentState!.validate()) {
                        await widget.viewModel.registerUser(
                            context,
                            emailController.text,
                            passwordController.text,
                            firstNameController.text,
                            lastNameController.text,
                            usernameController.text
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
                      "Accepter et s'inscrire",
                      style: TextStyle(
                        color: CustomColorsLight.textBlack,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
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
