import 'package:flutter/material.dart';
import 'package:payspliter/extensions/widgets.dart';

import '../Utils/app_colors.dart';

class ActivitiesScreen extends StatelessWidget {
  const ActivitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {


    // Mock data replicating the list style from your image
    final List<Map<String, dynamic>> activities = [
      {
        'icon': Icons.restaurant_outlined,
        'title': 'Dinner at Gusto',
        'subtitle': 'Shared with Friday Night Friends',
        'amount': '-\$24.50',
        'time': 'Today, 8:45 PM',
        'amountColor': const Color(0xFFEF4444),
      },
      {
        'icon': Icons.restaurant_outlined,
        'title': 'Dinner at Gusto',
        'subtitle': 'Shared with Friday Night Friends',
        'amount': '-\$24.50',
        'time': 'Today, 8:45 PM',
        'amountColor': const Color(0xFFEF4444),
      },
      {
        'icon': Icons.account_balance_wallet_outlined,
        'title': 'Settle up from Sarah',
        'subtitle': 'Direct payment',
        'amount': '+\$45.00',
        'time': 'Yesterday',
        'amountColor': Colors.tealAccent[400],
      },
      {
        'icon': Icons.account_balance_wallet_outlined,
        'title': 'Settle up from Sarah',
        'subtitle': 'Direct payment',
        'amount': '+\$45.00',
        'time': 'Yesterday',
        'amountColor': Colors.tealAccent[400],
      },
      {
        'icon': Icons.account_balance_wallet_outlined,
        'title': 'Settle up from Sarah',
        'subtitle': 'Direct payment',
        'amount': '+\$45.00',
        'time': 'Yesterday',
        'amountColor': Colors.tealAccent[400],
      },
      {
        'icon': Icons.account_balance_wallet_outlined,
        'title': 'Settle up from Sarah',
        'subtitle': 'Direct payment',
        'amount': '+\$45.00',
        'time': 'Yesterday',
        'amountColor': Colors.tealAccent[400],
      },
      {
        'icon': Icons.shopping_cart_outlined,
        'title': 'Groceries',
        'subtitle': 'Shared with Roommates',
        'amount': 'Owed \$12.30',
        'time': 'Oct 24',
        'amountColor': Colors.white,
      },
      {
        'icon': Icons.shopping_cart_outlined,
        'title': 'Groceries',
        'subtitle': 'Shared with Roommates',
        'amount': 'Owed \$12.30',
        'time': 'Oct 24',
        'amountColor': Colors.white,
      },
      {
        'icon': Icons.shopping_cart_outlined,
        'title': 'Groceries',
        'subtitle': 'Shared with Roommates',
        'amount': 'Owed \$12.30',
        'time': 'Oct 24',
        'amountColor': Colors.white,
      },
      {
        'icon': Icons.shopping_cart_outlined,
        'title': 'Groceries',
        'subtitle': 'Shared with Roommates',
        'amount': 'Owed \$12.30',
        'time': 'Oct 24',
        'amountColor': Colors.white,
      },
    ];

    return Scaffold(
      backgroundColor: primaryColor,

      // APPMBAR DESIGN MATCHED WITH SEARCH ACTION
      appBar: appBarWidget('Activities', context: context,center: true ,showBack: true),
      // AppBar(
      //   backgroundColor: cardColor,
      //   elevation: 0,
      //   automaticallyImplyLeading: false,
      //   title: Row(
      //     children: [
      //       const Icon(Icons.account_balance_wallet_outlined, color: primaryTeal, size: 24),
      //       const SizedBox(width: 8),
      //       Text(
      //         'Activities',
      //         style: TextStyle(
      //           fontSize: 20,
      //           fontWeight: FontWeight.bold,
      //           color: Colors.tealAccent[400],
      //         ),
      //       ),
      //     ],
      //   ),
      //   actions: [
      //     IconButton(
      //       icon: const Icon(Icons.search, color: Colors.white70),
      //       onPressed: () {},
      //     ),
      //     const SizedBox(width: 8),
      //   ],
      // ),
      // LAZY LOADING LIST PREVENTS OVERFLOWS & MEMORY LAG
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 450),
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            itemCount: activities.length,
            itemBuilder: (context, index) {
              final item = activities[index];
              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.white.withOpacity(0.01)),
                ),
                child: Row(
                  children: [
                    // Dynamic Activity Icon Box
                    CircleAvatar(
                      backgroundColor: const Color(0xFF132326),
                      radius: 20,
                      child: Icon(item['icon'], color: const Color(0xFF00BCBC), size: 20),
                    ),
                    const SizedBox(width: 14),

                    // Main Titles Block
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
                            style: const TextStyle(fontSize: 12, color: textMuted),
                          ),
                        ],
                      ),
                    ),

                    // Transaction Metrics Layer
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          item['amount'],
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: item['amountColor'],
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          item['time'],
                          style: const TextStyle(fontSize: 11, color: textMuted),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}