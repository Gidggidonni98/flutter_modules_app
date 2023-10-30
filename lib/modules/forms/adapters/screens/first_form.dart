import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modules_app/kernel/validations/validations.dart';

class FirstForm extends StatefulWidget {
  const FirstForm({Key? key}) : super(key: key);

  @override
  State<FirstForm> createState() => _FirstFormState();
}

class _FirstFormState extends State<FirstForm> {
  final _formKey = GlobalKey<FormState>();
  final dio = Dio();
  bool _isButtonDisabled = true;
  final TextEditingController _fullname  = TextEditingController(text: '');
  final TextEditingController _age = TextEditingController(text: '');
  final TextEditingController _email = TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            onChanged: () => setState(() {
              _isButtonDisabled = !_formKey.currentState!.validate();
            }),
            child: Container(
              padding: const EdgeInsets.all(16),
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
                        labelText: 'Nombre',
                        hintText: 'Ingrese su nombre',
                      ),
                      keyboardType: TextInputType.name,
                      validator: (value) =>
                          value!.isEmpty ? 'El nombre es requerido' : null,
                      controller: _fullname,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Edad',
                        hintText: 'Ingrese su edad',
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) =>
                          value!.isEmpty ? 'La edad es requerida' : null,
                      controller: _age,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: ElevatedButton(
                      onPressed: _isButtonDisabled
                          ? null
                          : () {
                              if (_formKey.currentState!.validate()) {
                                
                                print('$_fullname.text $_age.value $_email.value');
                              }
                            },
                      child: const Text('Enviar'),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
