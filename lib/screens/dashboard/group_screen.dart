import 'package:flutter/material.dart';

import '../../Utils/app_colors.dart';

class GroupScreen extends StatefulWidget {
  const GroupScreen({super.key});

  @override
  State<GroupScreen> createState() => _GroupScreenState();
}

class _GroupScreenState extends State<GroupScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    // 2 tabs for Active and Archived
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> activeGroups = [
      {
        'title': 'Trip to Girnar',
        'status': 'You are owed \$150.00',
        'statusColor': Colors.tealAccent[400],
        'total': 'Total: \$2,400.00',
        'imageUrl': 'https://images.unsplash.com/photo-1493976040374-85c8e12f0c0e?auto=format&fit=crop&w=150&q=80',
        'isSettled': false,
      },
      {
        'title': 'Trip to Somnath',
        'status': 'You owe \$42.00',
        'statusColor': const Color(0xFFEF4444),
        'total': 'Total: \$2,400.00',
        'imageUrl': 'https://images.unsplash.com/photo-1586023492125-27b2c045efd7?auto=format&fit=crop&w=150&q=80',
        'isSettled': false,
      },
      {
        'title': 'Birthday Dinner 🎂',
        'status': 'Settled up',
        'statusColor': const Color(0xFF94A3B8),
        'total': 'Total: \$320.00',
        'imageUrl': 'https://images.unsplash.com/photo-1514362545857-3bc16c4c7d1b?auto=format&fit=crop&w=150&q=80',
        'isSettled': true,
      },
      {
        'title': 'Trip to Dwarka',
        'status': 'You owe \$500.00',
        'statusColor': const Color(0xFFEF4444),
        'total': 'Total: \$2,400.00',
        'imageUrl': 'https://images.unsplash.com/photo-1464822759023-fed622ff2c3b?auto=format&fit=crop&w=150&q=80',
        'isSettled': false,
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF071415),

      // FROZEN HEADER APP BAR WITH TAB CONTROLLER NAV INTERFACE
      appBar: AppBar(
        backgroundColor: cardColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            const Icon(Icons.account_balance_wallet_outlined, color: primaryTeal, size: 24),
            const SizedBox(width: 8),
            Text(
              'Groups',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.tealAccent[400],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white70),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.group_add_outlined, color: Colors.white70),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white70),
            onPressed: () {},
          ),
          const SizedBox(width: 4),
        ],

        // CUSTOM TAB BAR SEGMENT CONTROLLER
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: const Color(0xFF132326),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TabBar(
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                color: const Color(0xFF0C1B1E),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.white.withOpacity(0.05)),
              ),
              labelColor: Colors.tealAccent[400],
              unselectedLabelColor: const Color(0xFF5A7175),
              labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              tabs: const [
                Tab(text: 'Active'),
                Tab(text: 'Archived'),
              ],
            ),
          ),
        ),
      ),

      // VIEW SWITCH CONTAINER LAYOUT
      body: TabBarView(
        controller: _tabController,
        children: [
          // ACTIVE GROUPS VIEW
          _buildGroupsList(activeGroups),

          // ARCHIVED GROUPS VIEW (Placeholder state matching format architecture)
          _buildGroupsList([]),
        ],
      ),
    );
  }

  // Builder method generating the list layouts dynamically
  Widget _buildGroupsList(List<Map<String, dynamic>> groups) {
    if (groups.isEmpty) {
      return const Center(
        child: Text(
          'No archived groups found',
          style: TextStyle(color: Color(0xFF5A7175), fontSize: 14),
        ),
      );
    }

    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 450),
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          itemCount: groups.length,
          itemBuilder: (context, index) {
            final group = groups[index];
            return Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF0C1B1E),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.white.withOpacity(0.02)),
              ),
              child: Row(
                children: [
                  // LEFT SIDE DATA BLOCK
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Status string layer
                        Text(
                          group['status'],
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: group['statusColor'],
                          ),
                        ),
                        const SizedBox(height: 4),
                        // Group Title
                        Text(
                          group['title'],
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 4),
                        // Total Context Metrics
                        Text(
                          group['total'],
                          style: const TextStyle(
                            fontSize: 13,
                            color: Color(0xFF5A7175),
                          ),
                        ),
                        const SizedBox(height: 16),

                        // ACTION BUTTON BLOCK
                        SizedBox(
                          height: 36,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: group['isSettled']
                                  ? const Color(0xFF1E293B).withOpacity(0.4)
                                  : const Color(0xFF132326),
                              foregroundColor: group['isSettled']
                                  ? const Color(0xFF64748B)
                                  : const Color(0xFF00BCBC),
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                            ),
                            child: const Text(
                              'View Details',
                              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),

                  // RIGHT SIDE COVER CARD IMAGE
                  Container(
                    width: 110,
                    height: 110,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: NetworkImage(group['imageUrl']),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}