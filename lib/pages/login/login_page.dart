import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:provider/provider.dart';
import 'package:travellingg_viajes/pages/about_page/about_page.dart';
import 'package:travellingg_viajes/pages/drawer/home_page.dart';
import 'package:travellingg_viajes/providers/account_user_provider.dart';

const users = {
  'dribbble@gmail.com': '12345',
  'hunter@gmail.com': 'hunter',
};

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Duration get loginTime => const Duration(milliseconds: 1000);

  //

//
  @override
  Widget build(BuildContext context) {
    Map usersProv = context.watch<AccountUserProvider>().getUsers;
    debugPrint("inicio $usersProv");

    //
    Future<String?> signupUser(SignupData data) {
      String? nombre = data.additionalSignupData!["nameUser"] ?? "";
      String? apellido = data.additionalSignupData!["lastName"] ?? "";
      String? email = data.name ?? "";

      debugPrint('Registrar Name: ${data.name}, Password: ${data.password}');

      Provider.of<AccountUserProvider>(context, listen: false)
          .addUser(email, data.password);
      Provider.of<AccountUserProvider>(context, listen: false).setEmail(email);

      Provider.of<AccountUserProvider>(context, listen: false).setName(nombre);
      Provider.of<AccountUserProvider>(context, listen: false)
          .setLastName(apellido);
      //
      return Future.delayed(loginTime).then((_) {
        return null;
      });
    }

    //
    Future<String?> authUser(LoginData data) {
      debugPrint('Name: ${data.name}, Password: ${data.password}');

      return Future.delayed(loginTime).then((_) {
        //
        if (!usersProv.containsKey(data.name)) {
          return 'Usuario no existe';
        }
        if (usersProv[data.name] != data.password) {
          return 'Contraseñas no coinciden';
        }
        return null;
      });
    }

    Future<String?> recoverPassword(String name) {
      debugPrint('Name: $name');
      return Future.delayed(loginTime).then((_) {
        if (!usersProv.containsKey(name)) {
          return 'User not exists';
        }
        return null;
      });
    } //

    return Scaffold(
        body: FlutterLogin(
            title: "ViajeRo",
            logo: const AssetImage("lib/assets/logo.png"),
            onLogin: authUser,
            onSignup: signupUser,
            onSubmitAnimationCompleted: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const MyHomePage(),
              ));
            },
            headerWidget: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.grey)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => const AboutPage()));
                  },
                  child: const Text("Sobre Nosotros")),
            ),
            onRecoverPassword: recoverPassword,
            additionalSignupFields: [
          UserFormField(
            keyName: 'nameUser',
            icon: const Icon(Icons.person),
            displayName: "Nombre",
            fieldValidator: (value) {
              if (value == "") {
                return "Ingrese su nombre";
              } else {
                return null;
              }
            },
          ),
          UserFormField(
            keyName: 'lastName',
            icon: const Icon(Icons.text_decrease),
            displayName: "Apellidos",
            fieldValidator: (value) {
              if (value == "") {
                return "Ingrese sus apellidos";
              } else {
                return null;
              }
            },
          )
        ]));
  }
}
