import 'package:flutter/material.dart';

class FirstForm extends StatefulWidget {
  const FirstForm({Key? key}) : super(key: key);

  @override
  State<FirstForm> createState() => _FirstFormState();
}

class _FirstFormState extends State<FirstForm> {
  final _formKey = GlobalKey<FormState>();
  String? _name;
  int? _age;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(bottom: 16),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Nombre',
                    hintText: 'Ingrese su nombre',
                  ),
                  validator: (value) =>
                      value!.isEmpty ? 'El nombre es requerido' : null,
                  onSaved: (newValue) => _name = newValue,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 16),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Edad',
                    hintText: 'Ingrese su edad',
                  ),
                  validator: (value) =>
                      value!.isEmpty ? 'La edad es requerida' : null,
                  onSaved: (newValue) => _age = newValue as int?,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
