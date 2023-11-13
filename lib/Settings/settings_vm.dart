class SettingsViewModel {
  SettingsViewModel();

  void switchTheme(themeChange, bool? value) {
    themeChange.darkTheme = value!;
  }
}