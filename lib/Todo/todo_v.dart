import 'package:todo/widgets/formInput.dart';
import 'package:flutter/material.dart';
import 'package:todo/colors.dart';

class TodoView extends StatelessWidget {
  const TodoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
            children: [
              const SizedBox(height: 100),
              const Text(
                'Ma Todo Liste',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: CustomColorsLight.textBlack,
                ),
              ),
              const AddTaskForm(),
            ],
          )
      ),
    );
  }
}

// Login Form
class AddTaskForm extends StatefulWidget {
  const AddTaskForm({super.key});

  @override
  AddTaskFormState createState() {
    return AddTaskFormState();
  }
}

// Login State class.
// This class holds data related to the form.
class AddTaskFormState extends State<AddTaskForm> {
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
              //Label ---------------------------------------------
              FormInputText(
                inputLabel: "Nom de l'élément",
                inputFontSize: 14,
                validate: (value) {
                  if (value == null || value.isEmpty) {
                    return "Ce champ est obligatoire";
                  }
                  return null;
                },
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
                          const SnackBar(content: Text('Ajout a la liste...')),
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
                      'Ajouter',
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
