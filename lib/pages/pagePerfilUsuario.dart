import 'package:flutter/material.dart';

import 'customNavigationBar.dart';

class PerfilUsuario extends StatelessWidget {
  const PerfilUsuario({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text('PERFIL DE USUARIO'),
      ),
    );
  }
}
