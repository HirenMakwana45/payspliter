import 'package:flutter/material.dart';

import '../Utils/app_colors.dart';

class GroupDetailsScreen extends StatefulWidget {
  const GroupDetailsScreen({super.key});

  @override
  State<GroupDetailsScreen> createState() => _GroupDetailsScreenState();
}

class _GroupDetailsScreenState extends State<GroupDetailsScreen> with SingleTickerProviderStateMixin {
  late TabController _subTabController;
  @override
  void initState() {
    super.initState();
    _subTabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _subTabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> expenses = List.generate(
      8,
          (index) => {
        'title': 'Ichiran Ramen Dinner',
        'subtitle': 'Paid by You • 4 people',
        'totalAmount': '\$84.20',
        'lendAmount': 'YOU LENT \$63.15',
      },
    );

    return Scaffold(
      backgroundColor: const Color(0xFF071415),

      // 1. FROZEN APP BAR HEAD
      appBar: AppBar(
        backgroundColor: cardColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Trip to Tokyo',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined, color: Colors.white70),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
        ],
      ),

      // 2. MAIN CONTAINER BODY
      body: Stack(
        children: [
          Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 450),
              child: Column(
                children: [
                  const SizedBox(height: 16),

                  // TOP SPLIT METRIC BLOCKS
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: _buildMetricCard(
                            label: 'TOTAL GROUP',
                            value: '\$1,240.00',
                            valueColor: const Color(0xFF00BCBC),
                            bgColor: const Color(0xFF0C2426),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildMetricCard(
                            label: 'YOUR SHARE',
                            value: '\$415.50',
                            valueColor: Colors.white,
                            bgColor: primaryTeal,
                            hasGlow: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // SEGMENTED SUB TAB ROWSELECTOR (Expenses / Members)
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: const Color(0xFF132326),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TabBar(
                      controller: _subTabController,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicator: BoxDecoration(
                        color: const Color(0xFF0C1B1E),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      labelColor: Colors.tealAccent[400],
                      unselectedLabelColor: textMuted,
                      labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                      tabs: const [
                        Tab(text: 'Expenses'),
                        Tab(text: 'Members'),
                      ],
                    ),
                  ),

                  // LIST CONTAINER ELEMENT
                  Expanded(
                    child: TabBarView(
                      controller: _subTabController,
                      children: [
                        // EXPENSES TAB LIST CONTAINER
                        ListView(
                          padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 100),
                          children: [
                            // "TODAY" SECTION HEADER LABEL
                            const Text(
                              'TODAY',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: textMuted,
                                letterSpacing: 1,
                              ),
                            ),
                            const SizedBox(height: 12),

                            ...expenses.map((item) => _buildExpenseRowTile(item, textMuted)),
                          ],
                        ),

                        // MEMBERS LIST PLACEHOLDER TAB
                        const Center(child: Text('Members Management View')),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // 3. FLOATING FIXED ACTION DOCK (BOTTOM LAYER)
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              constraints: const BoxConstraints(maxWidth: 450),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.transparent, const Color(0xFF071415).withOpacity(0.95), const Color(0xFF071415)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Row(
                children: [
                  // SETTLE UP BUTTON
                  Expanded(
                    child: SizedBox(
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF008080),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          elevation: 0,
                        ),
                        child: const Text('Settle Up', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),

                  // CENTER PLUS CIRCULAR ACTION ADD ICON BUTTON
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 48,
                      height: 48,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF008080),
                      ),
                      child: const Icon(Icons.add, color: Colors.white, size: 24),
                    ),
                  ),
                  const SizedBox(width: 12),

                  // REMIND BUTTON BLOCK
                  Expanded(
                    child: SizedBox(
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFE11D48).withOpacity(0.85),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          elevation: 0,
                        ),
                        child: const Text('Remind', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Component Helper: Metric blocks builder layer
  Widget _buildMetricCard({
    required String label,
    required String value,
    required Color valueColor,
    required Color bgColor,
    bool hasGlow = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(14),
        boxShadow: hasGlow
            ? [
          BoxShadow(
            color: const Color(0xFF008080).withOpacity(0.2),
            blurRadius: 15,
            offset: const Offset(0, 4),
          )
        ]
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Color(0xFF8AB4B8), letterSpacing: 0.5),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: valueColor),
          ),
        ],
      ),
    );
  }

  // Component Helper: Custom item design list item tile structure rows
  Widget _buildExpenseRowTile(Map<String, dynamic> item, Color mutedColor) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        children: [
          // Left Icon Circle Box
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFF0C1B1E),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.white.withOpacity(0.02)),
            ),
            child: const Icon(Icons.restaurant_outlined, color: Color(0xFF00BCBC), size: 18),
          ),
          const SizedBox(width: 14),

          // Core Descriptions
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['title'],
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const SizedBox(height: 4),
                Text(
                  item['subtitle'],
                  style: TextStyle(fontSize: 12, color: mutedColor),
                ),
              ],
            ),
          ),

          // Numeric Ledger Amounts
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                item['totalAmount'],
                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 4),
              Text(
                item['lendAmount'],
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.tealAccent[400]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}