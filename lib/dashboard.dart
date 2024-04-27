import 'package:flutter/material.dart';
import 'package:flutter_application_1/passenger_timetable.dart';
import 'about_us_page.dart';
import 'help_support_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bus Tracking App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(255, 235, 59, 1),
        centerTitle: true,
        toolbarHeight: 150,
        flexibleSpace: Container(
          alignment: Alignment.center,
          child: const Icon(Icons.person, size: 120),
        ),
      ),
      body: _getWidgetForIndex(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _getWidgetForIndex(int index) {
    switch (index) {
      case 0:
        return const DashboardView();
      case 1:
        return const NotificationsView();
      case 2:
        return const ProfileView();
      default:
        return const Center(
          child: Text('Invalid Page'),
        );
    }
  }
}

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildDashboardButton(
              Icons.map,
              'Map View',
              () {
                // Handle map view button tap
              },
            ),
            const SizedBox(width: 32), // Increase the spacing
            _buildDashboardButton(
              Icons.schedule,
              'Time Tables',
              () {
                // Navigate to timetable screen
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PassengerTimetableScreen(),
                    ));
              },
            ),
          ],
        ),
        const SizedBox(height: 20),
        Center(
          child: _buildDashboardButton(
            Icons.location_on,
            'Near Bus Stand',
            () {
              // Handle near bus stand button tap
            },
          ),
        ),
      ],
    );
  }

  Widget _buildDashboardButton(
    IconData iconData,
    String label,
    VoidCallback onTap,
  ) {
    return SizedBox(
      width: 150, // Set the width of the button
      height: 150, // Set the height of the button
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20), // Set the border radius
          ),
          side: const BorderSide(color: Colors.black), // Add a black border
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              size: 45, // Set the icon size
              color: Colors.black, // Set the icon color
            ),
            const SizedBox(height: 5), // Adjust the spacing
            Flexible(
              // Added Flexible widget
              child: Text(
                label,
                textAlign: TextAlign.center, // Center align the text
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold, // Set text weight to bold
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationsView extends StatelessWidget {
  const NotificationsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Notifications Content'),
    );
  }
}

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'User Name: John Doe',
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          const SizedBox(height: 10),
          const Text(
            'NIC Number: XXXXXXXXXXXX',
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: Colors.white,
              padding:
                  const EdgeInsets.symmetric(vertical: 20, horizontal: 100),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              side: const BorderSide(color: Colors.black), // Add a black border
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HelpSupportPage(),
                ),
              );
            },
            child: const Text(
              'Help & Support',
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: Colors.white,
              padding:
                  const EdgeInsets.symmetric(vertical: 20, horizontal: 120),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              side: const BorderSide(color: Colors.black), // Add a black border
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AboutUsPage(),
                ),
              );
            },
            child: const Text(
              'About Us',
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.blue,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              Navigator.popUntil(context, ModalRoute.withName('/'));
              // Implement log out functionality here
            },
            child: const Text(
              'Log Out',
            ),
          ),
        ],
      ),
    );
  }
}
