import 'package:flutter/material.dart';
import 'package:flutter_modules_app/kernel/validations/validations.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  bool _isButtonDisabled = true;
  final TextEditingController _email = TextEditingController(text: '');
  final TextEditingController _password = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Container> [
                Container(
                  padding:const EdgeInsets.only(top: 16),
                  child: Image.asset('assets/images/logo-utez.png', width: 200, height: 150),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 16),
                  child: Form(
                    key: _formKey,
                    onChanged: () => setState(() {
                      _isButtonDisabled = !_formKey.currentState!.validate();
                    }),
                    child: Container(
                      padding: const EdgeInsets.only(left: 35, right: 35) ,
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(bottom: 16),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Email',
                                hintText: 'Ingrese su email',
                              ),
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                RegExp regex = RegExp(AppPatterns.email);
                                if (value == null || value.isEmpty) {
                                  return 'campo obligatorio';
                                } else if (!regex.hasMatch(value)) {
                                  return 'Introduce un correo válido';
                                }
                                return null;
                              },
                              controller: _email,
                              
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 16),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Contraseña',
                                hintText: 'Ingrese su contraseña',
                              ),
                              keyboardType: TextInputType.name,
                              validator: (value) =>
                                  value!.isEmpty ? 'La contraseña es requerida' : null,
                              controller: _password,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 16),
                            child: ElevatedButton(
                              onPressed: _isButtonDisabled
                                  ? null
                                  : () {
                                      if (_formKey.currentState!.validate()) {
                                       Navigator.pushNamed(context, '/inicio');
                                      }
                                    },
                              child: const Text('Iniciar sesión'),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 16),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/register');
                              },
                              child: const Text('Registrarse'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}




