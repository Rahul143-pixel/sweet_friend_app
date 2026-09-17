import 'package:flutter/material.dart';

void main() {
  runApp(const SweetFriendApp());
}

class SweetFriendApp extends StatelessWidget {
  const SweetFriendApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sweet Friend',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF120813),
        primaryColor: const Color(0xFFFF2E93),
        colorScheme: ColorScheme.dark(
          primary: const Color(0xFFFF2E93),
          secondary: const Color(0xFFFF75B5),
          surface: const Color(0xFF1E1020),
        ),
        fontFamily: 'Roboto',
      ),
      home: const MainHomeScreen(),
    );
  }
}

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const LiveStreamingScreen(),
    const AudioRoomsScreen(),
    const ChatListScreen(),
    const VipProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: const Color(0xFF1A0B1C),
        selectedItemColor: const Color(0xFFFF2E93),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.live_tv),
            label: 'Live',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mic),
            label: 'Audio Rooms',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_rounded),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_rounded),
            label: 'VIP Profile',
          ),
        ],
      ),
    );
  }
}

// 1. Live Streaming Screen
class LiveStreamingScreen extends StatelessWidget {
  const LiveStreamingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Live Streams', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.videocam_rounded, color: Color(0xFFFF2E93)),
            onPressed: () {},
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.75,
        ),
        itemCount: 6,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                colors: [const Color(0xFFFF2E93).withOpacity(0.4), const Color(0xFF2A1230)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              border: Border.all(color: const Color(0xFFFF2E93).withOpacity(0.5)),
            ),
            child: Stack(
              children: [
                const Center(
                  child: Icon(Icons.person, size: 60, color: Colors.white54),
                ),
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text('LIVE', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white)),
                  ),
                ),
                const Positioned(
                  bottom: 12,
                  left: 12,
                  child: Text(
                    'Sweet Creator',
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// 2. Audio Rooms Screen
class AudioRoomsScreen extends StatelessWidget {
  const AudioRoomsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Party Audio Rooms', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: Colors.transparent,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: 4,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF1E1020),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFFF75B5).withOpacity(0.3)),
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: Color(0xFFFF2E93),
                  child: Icon(Icons.mic, color: Colors.white),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Midnight Romantic Beats 💖',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Join & talk with sweet friends',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.pinkAccent),
              ],
            ),
          );
        },
      ),
    );
  }
}

// 3. Chat List Screen
class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Messages', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: Colors.transparent,
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const CircleAvatar(
              backgroundColor: Color(0xFFFF2E93),
              child: Icon(Icons.person, color: Colors.white),
            ),
            title: Text('Sweet User ${index + 1}', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
            subtitle: const Text('Hey! Let\'s connect on video call...', style: TextStyle(color: Colors.grey)),
            trailing: const Text('12:30 PM', style: TextStyle(color: Colors.grey, fontSize: 10)),
          );
        },
      ),
    );
  }
}

// 4. VIP Profile Screen
class VipProfileScreen extends StatelessWidget {
  const VipProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VIP Profile', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Color(0xFFFF2E93),
                child: Icon(Icons.person, size: 50, color: Colors.white),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Rahul Suryavanshi',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const Text(
              'VIP Diamond Member ✨',
              style: TextStyle(color: Color(0xFFFF75B5), fontSize: 14),
            ),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [Color(0xFFFF2E93), Color(0xFFFF75B5)]),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Upgrade to VIP Gold', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                  Icon(Icons.star, color: Colors.white),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
