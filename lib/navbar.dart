import 'package:flutter/material.dart';
import 'package:test_design/presentation/dashboard/home.dart';


class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _selectedIndex = 0;
  
  // Add list of pages to display
  final List<Widget> _pages = [
    const Home(),
    const Home(),
    const Home(),
    const Home(),
   
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 10,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(0, 'Home', Icons.home_outlined),
              _buildNavItem(1, 'History', Icons.folder_outlined),
              _buildNavItem(2, 'Add', Icons.add),
              _buildNavItem(3, 'Profile', Icons.person_outline),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, String label, IconData icon) {
    bool isSelected = _selectedIndex == index;

    // Special case for Add button
    if (icon == Icons.add) {
      return Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(
          icon,
          color: Colors.grey[600],
          size: 24,
        ),
      );
    }

    return InkWell(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (index == 0 && isSelected)
            Text(
              label,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            )
          else
            Icon(
              icon,
              color: isSelected ? Colors.black : Colors.grey[400],
              size: 24,
            ),
          const SizedBox(height: 4),
          if (isSelected)
            Container(
              width: 4,
              height: 4,
              decoration: const BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }
}
