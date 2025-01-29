import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:table_calendar/table_calendar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.purple),
      home: const DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: const Text('Home',
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              icon: const Icon(Icons.search, color: Colors.black, size: 30),
              onPressed: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              icon: const Icon(Icons.newspaper, color: Colors.black, size: 30),
              onPressed: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              icon: const Icon(Icons.notifications_outlined, color: Colors.black, size: 30),
              onPressed: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 60.0),
            child: IconButton(
              icon: const Icon(Icons.power_settings_new, color: Colors.black, size: 30),
              onPressed: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 50.0),
            child: CircleAvatar(
              backgroundColor: Colors.grey[300],
              child: const Icon(Icons.person, color: Colors.black),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text('Pooja Mishra'),
              accountEmail: const Text('Admin'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.grey[300],
                child: const Icon(Icons.person, color: Colors.black),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _drawerItem(Icons.home, 'Home'),
                  _drawerItem(Icons.person, 'Employees'),
                  _drawerItem(Icons.calendar_today, 'Attendance'),
                  _drawerItem(Icons.bar_chart, 'Summary'),
                  _drawerItem(Icons.info, 'Information'),
                  ExpansionTile(
                    leading: const Icon(Icons.workspaces_outline),
                    title: const Text('Workspaces'),
                    children: [
                      _drawerItem(null, 'Adstacks'),
                      _drawerItem(null, 'Finance'),
                    ],
                  ),
                  _drawerItem(Icons.settings, 'Setting'),
                  _drawerItem(Icons.logout, 'Logout'),
                ],
              ),
            ),
          ],
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
            padding: const EdgeInsets.all(1.0),
            child: Row(
              children: [
                Expanded(flex: 2, child: _leftPanel(constraints)),
                const SizedBox(width: 16),
                Expanded(flex: 1, child: _rightPanel(constraints)),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _drawerItem(IconData? icon, String title) {
    return ListTile(
      leading: icon != null ? Icon(icon) : null,
      title: Text(title),
      onTap: () {},
    );
  }

  Widget _leftPanel(BoxConstraints constraints) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _card(
            title: 'ETHEREUM 2.0',
            content: Stack(
              children: [
                Positioned(
                  top: 10,
                  right: -10,
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.purple[300],
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Positioned(
                  top: 50,
                  right: -20,
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.purple[500],
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                Positioned(
                  top: 100,
                  right: -30,
                  child: Container(
                    width: 140,
                    height: 140,
                    decoration: BoxDecoration(
                      color: Colors.purple[700],
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 100),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Top Rating',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      const Text('Project',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      const SizedBox(height: 8),
                      const Text('Trending project and high rating',
                          style: TextStyle(color: Colors.white)),
                      const Text("Project Created by team.",
                          style: TextStyle(color: Colors.white)),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF341539),
                          padding:
                          const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Learn More',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [Colors.purple[800]!, Colors.purple[400]!],
              ),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          const SizedBox(height: 16),
          // Top Creators & All Projects side by side
          _card(
            title: '',
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Top Creators
                Expanded(
                  flex: 1,
                  child: _card(
                    title: 'Top Creators',
                    content: _topCreatorsTable(),
                    decoration: BoxDecoration(
                      color: Color(0xFF1B254B),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                // All Projects
                Expanded(
                  flex: 1,
                  child: _card(
                    title: 'All Projects',
                    content: Column(
                      children: [
                        _projectItem('Technology behind the Blockchain', 'Project #1'),
                        _projectItem('AI Revolution', 'Project #2'),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFF1B254B),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          _card(
            title: 'Over All Performance',
            content: SizedBox(
              height: constraints.maxWidth * 0.2,
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: false),
                  titlesData: FlTitlesData(show: false),
                  borderData: FlBorderData(show: false),
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        FlSpot(0, 1),
                        FlSpot(1, 3),
                        FlSpot(2, 2),
                        FlSpot(3, 4),
                        FlSpot(4, 3),
                        FlSpot(5, 5),
                      ],
                      isCurved: true,
                      color: Colors.purple,
                      barWidth: 4,
                      isStrokeCapRound: true,
                    ),
                  ],
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ],
      ),
    );
  }

  Widget _rightPanel(BoxConstraints constraints) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF1B254B)!, Color(0xFF1B254B)!],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _card(
              title: 'Calendar',
              content: TableCalendar(
                firstDay: DateTime.utc(2020, 1, 1),
                lastDay: DateTime.utc(2030, 12, 31),
                focusedDay: DateTime.now(),
                calendarStyle: const CalendarStyle(
                  todayDecoration: BoxDecoration(
                    color: Colors.purple,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            _card(
              title: "Today's Birthday",
              content: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.purple,
                  child: const Text('J'),
                ),
                title: const Text('Andy'),
                subtitle: const Text('Happy Birthday!'),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            const SizedBox(height: 16),
            _card(
              title: "Anniversary",
              content: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.purple,
                  child: const Text('J'),
                ),
                title: const Text('J J'),
                subtitle: const Text('Happy Anniversary!'),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _card({required String title, required Widget content, BoxDecoration? decoration}) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: decoration ??
          BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 10,
              ),
            ],
          ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black, // Changed title color to black
            ),
          ),
          const SizedBox(height: 8),
          content,
        ],
      ),
    );
  }

  Widget _projectItem(String title, String subtitle) {
    return ListTile(
      leading: const Icon(Icons.folder, color: Colors.purple),
      title: Text(title, style: const TextStyle(color: Colors.black)), // Changed text color to black
      subtitle: Text(subtitle, style: const TextStyle(color: Colors.black)), // Changed text color to black
      trailing: TextButton(
        onPressed: () {},
        child: const Text('Details', style: TextStyle(color: Colors.black)), // Changed text color to black
      ),
    );
  }

  Widget _topCreatorsTable() {
    final creators = [
      {'name': 'Alice', 'artworks': 15, 'rating': 0.85},
      {'name': 'Bob', 'artworks': 20, 'rating': 0.90},
      {'name': 'Charlie', 'artworks': 25, 'rating': 0.75},
      {'name': 'David', 'artworks': 10, 'rating': 0.80},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        DataTable(
          columnSpacing: 20, // Adjust spacing between columns
          columns: const [
            DataColumn(label: Text('Name', style: TextStyle(color: Colors.white))),
            DataColumn(label: Text('Artworks', style: TextStyle(color: Colors.white))),
            DataColumn(label: Text('Rating', style: TextStyle(color: Colors.white))),
          ],
          rows: creators.map((creator) {
            return DataRow(
              cells: [
                DataCell(Text(creator['name'] as String, style: const TextStyle(color: Colors.white))),
                DataCell(Text(creator['artworks'].toString(), style: const TextStyle(color: Colors.white))),
                DataCell(
                  SizedBox(
                    width: 90, // Restrict total width of rating widget
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
                          child: LinearProgressIndicator(
                            value: creator['rating'] as double,
                            backgroundColor: Colors.grey[300],
                            color: (creator['rating'] as double) >= 0.8 ? Colors.green : Colors.red,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${((creator['rating'] as double) * 100).toStringAsFixed(0)}%',
                          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                          overflow: TextOverflow.ellipsis, // Prevents text from overflowing
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ],
    );
  }

}
