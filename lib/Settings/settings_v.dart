import 'package:todo/Theme/darkThemeProvider.dart';
import 'package:todo/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'settings_vm.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    final vm = Provider.of<SettingsViewModel>(context);

    return Scaffold(
          backgroundColor: themeChange.darkTheme ? CustomColorsDark.background : CustomColorsLight.background,
          body: Column(
            children: [
              const SizedBox(height: 100),
              Checkbox(
                  value: themeChange.darkTheme,
                  onChanged: (bool? value) {
                    vm.switchTheme(themeChange, value!);
                  }
              ),
              const SizedBox(height: 30),
              const Text(
                "This text is hidden in light mode hehehehe ! You must not find it. NEVEEER !!!!\n\nWait....",
                style: TextStyle(
                    color: CustomColorsLight.background,
                    fontSize: 15
                ),
                textAlign: TextAlign.center,
              ),
            ]
          )
      );
  }
}
