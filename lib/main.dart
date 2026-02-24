import 'package:flutter/material.dart';
import 'package:myapp/widgets/pagina1.dart';
import 'package:myapp/widgets/pagina2.dart';
import 'package:myapp/widgets/pagina3.dart';

void main() {
  runApp(const MiAppNavegacion());
}

class MiAppNavegacion extends StatelessWidget {
  const MiAppNavegacion({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rutas Nombradas Flutter',
      // Definimos la ruta inicial
      initialRoute: '/',
      // Mapa de rutas
      routes: {
        '/': (context) => const DogClubApp(),
        '/segunda': (context) => const DogClubpag2(),
        '/tercera': (context) => const GuarderiaPage(),
      },
    );
  }
}

