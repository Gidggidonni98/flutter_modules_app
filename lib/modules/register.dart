import 'package:flutter/material.dart';
import 'package:flutter_modules_app/kernel/colors/colors_app.dart';
import 'package:flutter_modules_app/kernel/validations/validations.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _email = TextEditingController(text: '');
  final TextEditingController _password = TextEditingController(text: '');
  final TextEditingController _passwordTwo = TextEditingController(text: '');
  final _formKey = GlobalKey<FormState>();
  bool _isButtonDisabled = true;
  bool _isObscure = true;
  bool _isObscureTwo = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Registro de cuenta'),
          backgroundColor: ColorsApp.primaryColor,
        ),
        body: SingleChildScrollView(
          child: Form(
            onChanged: () {
              setState(() {
                _isButtonDisabled = !_formKey.currentState!.validate();
              });
            },
            key: _formKey,
            child: Container(
                padding: const EdgeInsets.all(15),
                child: Column(children: <Container>[
                  Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    child: TextFormField(
                      decoration: const InputDecoration(
                          labelText: 'Correo eléctronico'),
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
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    child: TextFormField(
                      obscureText: _isObscure,
                      decoration: InputDecoration(
                          labelText: 'Contraseña',
                          hintText: 'Ingrese su contraseña',
                          suffixIcon: IconButton(
                            icon: _isObscure
                                ? const Icon(Icons.visibility_off)
                                : const Icon(Icons.visibility),
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            },
                          )),
                      keyboardType: TextInputType.name,
                      validator: (value) =>
                          value!.isEmpty ? 'La contraseña es requerida' : null,
                      controller: _password,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    child: TextFormField(
                      obscureText: _isObscureTwo,
                      decoration: InputDecoration(
                          labelText: ' Comporbación de Contraseña',
                          hintText: 'repita  su contraseña',
                          suffixIcon: IconButton(
                            icon: _isObscureTwo
                                ? const Icon(Icons.visibility_off)
                                : const Icon(Icons.visibility),
                            onPressed: () {
                              setState(() {
                                _isObscureTwo = !_isObscureTwo;
                              });
                            },
                          )),
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        value!.isEmpty ? 'La contraseña es requerida' : null;
                        if (value != _passwordTwo) {
                          const Text('la contrseña debe ser igual');
                        }
                        return null;
                      },
  
                      controller: _passwordTwo,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    child: ElevatedButton(
                        onPressed: _isButtonDisabled
                            ? null
                            : () {
                                print('${_email.text} ');
                              },
                        child: const Text('Registrar cuenta')),
                  )
                ])),
          ),
        ));
  }
}
