import 'package:todo/widgets/formInput.dart';
import 'package:flutter/material.dart';
import 'package:todo/colors.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

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
              const LoginForm(),
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
  const LoginForm({super.key});

  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

// Login State class.
// This class holds data related to the form.
class LoginFormState extends State<LoginForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();

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
                        const SnackBar(content: Text('Et ba sheh ! 🖕')),
                      );
                    }
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // Validate returns true if the form is valid, or false otherwise.
                      if (_formKey.currentState!.validate()) {
                        // If the form is valid, display a snackbar. In the real world,
                        // you'd often call a server or save the information in a database.
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
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
