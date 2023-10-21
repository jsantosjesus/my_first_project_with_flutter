import 'package:flutter/material.dart';
import 'package:my_first_project_with_flutter/local_auth_service.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String password = '';

  checkLocalAuth() async {
    final auth = context.read<LocalAuthService>();
    final isLocalAuthAvailable = await auth.isBiometricAvailable();

    if (isLocalAuthAvailable) {
      final authenticated = await auth.authenticate();

      if (authenticated) {
        Navigator.of(context).pushReplacementNamed('/home');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),
                TextField(
                  onChanged: (valueEmail) {
                    email = valueEmail;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: 'Email', border: OutlineInputBorder()),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  onChanged: (valuePassword) {
                    password = valuePassword;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: 'Senha', border: OutlineInputBorder()),
                ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (email == 'teste@email.com' && password == 'teste123') {
                      Navigator.of(context).pushReplacementNamed('/home');
                    } else {
                      print('email ou senha incorretos');
                    }
                  },
                  child: Text('Entrar'),
                ),
                Container(
                  child: Text(''),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          checkLocalAuth();
        },
      ),
    );
  }
}
