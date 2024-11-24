import 'package:flutter/material.dart';
import 'package:test_design/navbar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        bottomNavigationBar: const Navbar(),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top bar with menu and notification icons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(
                            color: const Color.fromARGB(255, 180, 171, 171),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(200)),
                      child: IconButton(
                        icon: const Icon(Icons.menu),
                        onPressed: () {},
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(
                            color: const Color.fromARGB(255, 180, 171, 171),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(200)),
                      child: IconButton(
                        icon: const Icon(Icons.notifications_outlined),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // Greeting section
                const Text(
                  'Hello,',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.grey,
                  ),
                ),
                const Row(
                  children: [
                    Text(
                      'Athena',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      '👋',
                      style: TextStyle(fontSize: 24),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // Search bar
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Search a plant.',
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.grey[100],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFF4CAF50),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          shape: BoxShape.circle,
                        ),
                        child:
                            const Icon(Icons.water_drop, color: Colors.white),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Your celery is dehydrated',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'its looks like your celery need more water, lets solve this together.',
                              style: TextStyle(
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Ok',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                _buildPlantItem('Arugula', '5 days to harvest'),
                const SizedBox(height: 16),
                _buildPlantItem('Spinach', '21 days to harvest'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPlantItem(String name, String harvestTime) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          // You'll need to add actual plant images here
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.green[100],
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const SizedBox(width: 16),
          Text(
            name,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          Row(
            children: [
              const Icon(Icons.access_time, size: 16, color: Colors.grey),
              const SizedBox(width: 4),
              Text(
                harvestTime,
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
