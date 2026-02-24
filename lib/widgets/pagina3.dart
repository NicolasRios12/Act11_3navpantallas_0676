import 'package:flutter/material.dart';
import 'package:myapp/widgets/pagina2.dart';
import 'package:myapp/widgets/pagina1.dart';

void main() => runApp(GuarderiaPage());

class GuarderiaPage extends StatelessWidget {
  const GuarderiaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1976D2),
        elevation: 2,
        leading: const Icon(Icons.pets, color: Colors.white),
        title: const Text(
          'Dog Club',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        // El ícono de menú (3 líneas) aparecerá automáticamente a la derecha por el endDrawer
      ),
      
      // Menú lateral derecho
      endDrawer: _buildDrawer(context),
      
      body: SingleChildScrollView(
        child: Column(
          children: [
            // --- SECCIÓN 1/4 DE PANTALLA ---
            Container(
              height: MediaQuery.of(context).size.height / 4,
              color: const Color(0xFFBBDEFB), // Azul Pastel
              child: Row(
                children: [
                  // Imagen a la izquierda
                  Expanded(
                    flex: 1,
                    child: Image.network(
                      'https://images.unsplash.com/photo-1541364983171-a8ba01e95cfc?auto=format&fit=crop&w=500&q=80',
                      fit: BoxFit.cover,
                      height: double.infinity,
                    ),
                  ),
                  // Texto a la derecha
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Guardería',
                            style: TextStyle(
                              fontSize: 24, 
                              fontWeight: FontWeight.bold, 
                              color: Color(0xFF0D47A1)
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Tu mejor amigo en las mejores manos mientras tú trabajas.',
                            style: TextStyle(fontSize: 14, color: Color(0xFF0D47A1)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),
            const Text(
              '¿Cómo funciona?',
              style: TextStyle(
                fontSize: 22, 
                fontWeight: FontWeight.bold, 
                color: Color(0xFF0D47A1)
              ),
            ),
            const SizedBox(height: 20),

            // --- LISTADO DE TARJETAS ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  // Tarjeta 1: Diana
                  _buildCareCard(
                    context,
                    name: 'Diana',
                    imageUrl: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?auto=format&fit=crop&w=150&q=80',
                    price: '120',
                    description: 'Casa amplia, Cama canina, con patio, sin mascotas propias.',
                    stars: 4,
                  ),
                  const SizedBox(height: 20),
                  // Tarjeta 2: Roberto (Inventada)
                  _buildCareCard(
                    context,
                    name: 'Roberto',
                    imageUrl: 'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?auto=format&fit=crop&w=150&q=80',
                    price: '145',
                    description: 'Departamento Pet-friendly, paseos cada 3 horas, atención personalizada.',
                    stars: 5,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
      
      // Footer
      bottomNavigationBar: _buildFooter(),
    );
  }

  // --- WIDGETS INTERNOS ---

  Widget _buildCareCard(BuildContext context, {
    required String name, 
    required String imageUrl, 
    required String price, 
    required String description, 
    required int stars
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(radius: 30, backgroundImage: NetworkImage(imageUrl)),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      Row(
                        children: List.generate(5, (index) => Icon(
                          Icons.star, 
                          size: 18, 
                          color: index < stars ? Colors.amber : Colors.grey[300]
                        )),
                      ),
                    ],
                  ),
                ),
                Text('Desde \$$price al Dia', 
                  style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF1976D2))
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 15, fontStyle: FontStyle.italic, color: Colors.black87),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0D47A1),
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Reservar'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFF0D47A1)),
                      foregroundColor: const Color(0xFF0D47A1),
                    ),
                    child: const Text('Contactar'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

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
                Navigator.push(context, MaterialPageRoute(builder: (context) => const DogClubApp()));
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

  Widget _buildFooter() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      color: const Color(0xFFBBDEFB),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.pets, size: 16, color: Color(0xFF1976D2)),
          SizedBox(width: 8),
          Text(
            'Nicolas Rios Perales',
            style: TextStyle(color: Color(0xFF0D47A1), fontWeight: FontWeight.bold, fontSize: 12),
          ),
        ],
      ),
    );
  }
}