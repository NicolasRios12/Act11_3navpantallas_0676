import 'package:flutter/material.dart';
import 'package:myapp/widgets/pagina2.dart';
import 'package:myapp/widgets/pagina3.dart';


void main() => runApp(const DogClubApp());

class DogClubApp extends StatelessWidget {
  const DogClubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF0F4F8), // Gris Hielo
        primaryColor: const Color(0xFF0D47A1), // Azul Marino
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1976D2), // Azul Estándar
          foregroundColor: Colors.white,
        ),
      ),
      // Definimos la pantalla principal
      home: const HomePage(),
    );
  }
}

// --- PANTALLA PRINCIPAL ---
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.pets),
        title: const Text('Dog club', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      // Menú Lateral Derecho
      endDrawer: _buildDrawer(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Sección 1/4 de pantalla
            _buildHeroSection(context),
            
            // Sección de Reserva y Botones
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  const Text(
                    'Reserva hospedaje, sin jaulas y paseos seguros solo para perros',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18, 
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF0D47A1),
                    ),
                  ),
                  const SizedBox(height: 35),
                  _buildLargeButton(context, Icons.hotel, "Hospedaje", const Placeholder()), 
                    
                    // BOTÓN DE GUARDERÍA (CON REDIRECCIÓN)
                    _buildLargeButton(context, Icons.wb_sunny, "Guardería", const GuarderiaPage()),
                    
                    // Botón de Paseos
                    _buildLargeButton(context, Icons.directions_walk, "Paseos", const Placeholder()),
                ],
              ),
            ),
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  // --- WIDGETS DE APOYO ---

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color(0xFFF0F4F8),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFF1976D2)),
              child: Text('Menú', style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            // NAVEGACIÓN A INICIO
            ListTile(
              title: const Text('Inicio', style: TextStyle(color: Color(0xFF0D47A1), fontWeight: FontWeight.bold)),
              onTap: () {
                Navigator.pop(context); // Cierra el drawer
                Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
              },
            ),
            ListTile(title: const Text('Ingresar'), onTap: () {}),
            ListTile(title: const Text('Registro'), onTap: () {}),
            // NAVEGACIÓN A NOSOTROS
            ListTile(
              title: const Text('Nosotros', style: TextStyle(color: Color(0xFF0D47A1), fontWeight: FontWeight.bold)),
              onTap: () {
                Navigator.pop(context); // Cierra el drawer
                Navigator.push(context, MaterialPageRoute(builder: (context) => const DogClubpag2()));
              },
            ),
            ExpansionTile(
              leading: const Icon(Icons.room_service, color: Color(0xFF1976D2)),
              title: const Text('Servicios', style: TextStyle(color: Color(0xFF0D47A1))),
              children: [
                ListTile(title: const Text('Hospedaje'), onTap: () {}),
                ListTile(title: const Text('Guardería'), onTap: () {}),
                ListTile(title: const Text('Paseos'), onTap: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 4,
          width: double.infinity,
          child: Image.network(
            'https://images.unsplash.com/photo-1548199973-03cce0bbc87b?auto=format&fit=crop&w=800&q=80',
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height / 4,
          color: Colors.black.withOpacity(0.5),
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: const Text(
            'Cuidadores de mascotas de confianza cerca de ti',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

Widget _buildLargeButton(BuildContext context, IconData icon, String text, Widget destination) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 20),
    child: ElevatedButton.icon(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destination),
        );
      },
      icon: Icon(icon, size: 28),
      label: Text(text, style: const TextStyle(fontSize: 18)),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF0D47A1),
        foregroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 65),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
    ),
  );
}

  Widget _buildFooter() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      color: const Color(0xFFBBDEFB),
      width: double.infinity,
      child: Column(
        children: const [
          Icon(Icons.pets, color: Color(0xFF1976D2), size: 18),
          SizedBox(height: 4),
          Text('Nicolas Rios Perales', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF0D47A1))),
        ],
      ),
    );
  }
}