import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Screen extends StatelessWidget {
  Screen({Key? key, required this.route}) : super(key: key);

  final String route;

  final _textController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool validate() {
    return _formKey.currentState?.validate() ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              'Rota atual: $route',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Form(
              key: _formKey,
              child: TextFormField(
                controller: _textController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  label: Text('Ir para rota'),
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) return 'Insira a rota';

                  if (!value.startsWith('/')) {
                    return 'A rota deve iniciar com /';
                  }
                },
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                if (validate()) {
                  GoRouter.of(context).push(_textController.text);
                }
              },
              child: const Text('PUSH'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (validate()) {
                  GoRouter.of(context).pushNamed(_textController.text);
                }
              },
              child: const Text('PUSH NAMED'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (validate()) {
                  GoRouter.of(context).go(_textController.text);
                }
              },
              child: const Text('GO'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (validate()) {
                  GoRouter.of(context).goNamed(_textController.text);
                }
              },
              child: const Text('GO NAMED'),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
