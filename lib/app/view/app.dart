import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:smart_home_ui/app/router/router.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  ThemeMode? themeMode = ThemeMode.light; // initial brightness

  @override
  Widget build(BuildContext context) {
    final theme = ThemeData(
      fontFamily: 'GoogleSans',
      brightness: Brightness.dark,
      useMaterial3: true,
      colorScheme: SeedColorScheme.fromSeeds(
        brightness: Brightness.dark,
        primaryKey: const Color(0xFF64AAFE),
        secondaryKey: const Color(0xFFA1E4F3),
        tertiaryKey: const Color(0xFF383344),
        background: const Color(0xFF252441),
        tones: FlexTones.vivid(Brightness.dark),
      ),
    );
    final cupertinoTheme =
        MaterialBasedCupertinoThemeData(materialTheme: theme);

    return PlatformProvider(
      settings: PlatformSettingsData(
        iosUsesMaterialWidgets: true,
        iosUseZeroPaddingForAppbarPlatformIcon: true,
      ),
      builder: (context) => PlatformTheme(
        themeMode: themeMode,
        materialLightTheme: theme,
        materialDarkTheme: theme,
        cupertinoLightTheme: cupertinoTheme,
        cupertinoDarkTheme: cupertinoTheme,
        onThemeModeChanged: (themeMode) {
          this.themeMode = themeMode;
        },
        builder: (context) => PlatformApp.router(
          routerConfig: router,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
            DefaultMaterialLocalizations.delegate,
            DefaultWidgetsLocalizations.delegate,
            DefaultCupertinoLocalizations.delegate,
          ],
          title: 'Homesense',
        ),
      ),
      // ),
    );
  }
}
