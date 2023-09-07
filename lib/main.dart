import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:travellingg_viajes/pages/login/login_page.dart';
import 'package:travellingg_viajes/providers/account_user_provider.dart';
import 'package:travellingg_viajes/providers/asientos_provider.dart';
import 'package:travellingg_viajes/providers/price._provider.dart';
import 'package:travellingg_viajes/providers/ticket_data_provider.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AsientosProvider()),
        ChangeNotifierProvider(create: (_) => PriceProvider()),
        ChangeNotifierProvider(create: (_) => AccountUserProvider()),
        ChangeNotifierProvider(create: (_) => TIcketDataProvider()),
      ],
      child: MaterialApp(
        localizationsDelegates: GlobalMaterialLocalizations.delegates,
        supportedLocales: const [Locale('en'), Locale('es')],
        debugShowCheckedModeBanner: false,
        title: 'Zoom Drawer Demo',
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        darkTheme: ThemeData(
            visualDensity: VisualDensity.adaptivePlatformDensity,
            brightness: Brightness.dark,
            colorScheme: const ColorScheme(
                brightness: Brightness.dark,
                primary: Color(0xFABB86FC),
                onPrimary: Color(0xFFFFFFFF),
                secondary: Color(0xFF03DAC6),
                onSecondary: Color(0xFF000000),
                error: Color(0xFFCF6679),
                onError: Color(0xFF000000),
                background: Color(0xFF121212),
                onBackground: Color(0xFFFFFFFF),
                surface: Color(0xFF018786),
                onSurface: Color(0xFFFFFFFF))
            //
            ),
        themeMode: ThemeMode.dark,
        home: const LoginPage(),
      ),
    );
  }
}
