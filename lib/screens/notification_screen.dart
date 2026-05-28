import 'package:flutter/material.dart';
import 'package:payspliter/extensions/common.dart';

enum NotificationType { reminder, paymentReceived, billDue }

class NotificationModel {
  final String id;
  final String title;
  final String? subtitle;
  final DateTime timestamp;
  final NotificationType type;
  final String? amount;

  NotificationModel({
    required this.id,
    required this.title,
    this.subtitle,
    required this.timestamp,
    required this.type,
    this.amount,
  });
}

// 2. MAIN NOTIFICATIONS SCREEN
class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const cardColor = Color(0xFF0C1B1E);
    const primaryTeal = Color(0xFF008080);

    // Simulated API response list using modern DateTime stamps
    final List<NotificationModel> apiData = [
      NotificationModel(
        id: '1',
        title: 'Hiren Remind you for "Trip to Dwarka" Payment',
        timestamp: DateTime.now(), // Dynamic Today
        type: NotificationType.reminder,
      ),
      NotificationModel(
        id: '2',
        title: 'Mike Ross paid you ',
        amount: '\$12.50',
        subtitle: 'Yesterday, 6:42 PM • Official Payment',
        timestamp: DateTime.now(), // Dynamic Today
        type: NotificationType.paymentReceived,
      ),
      NotificationModel(
        id: '3',
        title: 'Upcoming: Internet Bill due tomorrow',
        subtitle: 'Yesterday, 10:15 AM • Household Group',
        timestamp: DateTime.now().subtract(const Duration(days: 1)), // Dynamic Yesterday
        type: NotificationType.billDue,
      ),
    ];

    // Separate the lists logically by checking day differences
    final todayNotifications = apiData.where((n) => _isToday(n.timestamp)).toList();
    final yesterdayNotifications = apiData.where((n) => _isYesterday(n.timestamp)).toList();

    return Scaffold(
      backgroundColor: const Color(0xFF071415),
      appBar: AppBar(
        backgroundColor: cardColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            pop();
          },
        ),
        centerTitle: true,
        title: const Text(
          'Notifications',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.done_all, color: Colors.tealAccent, size: 22),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 450),
          child: ListView(
            children: [
              if (todayNotifications.isNotEmpty) ...[
                _buildSectionHeader('TODAY'),
                ...todayNotifications.map((item) => _buildNotificationTile(item)),
              ],
              if (yesterdayNotifications.isNotEmpty) ...[
                _buildSectionHeader('YESTERDAY'),
                ...yesterdayNotifications.map((item) => _buildNotificationTile(item)),
              ],
            ],
          ),
        ),
      ),
    );
  }

  // Helper calculation for managing API times day matching
  static bool _isToday(DateTime dateTime) {
    final now = DateTime.now();
    return dateTime.day == now.day && dateTime.month == now.month && dateTime.year == now.year;
  }

  static bool _isYesterday(DateTime dateTime) {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return dateTime.day == yesterday.day && dateTime.month == yesterday.month && dateTime.year == yesterday.year;
  }

  // Sticky category subheaders
  Widget _buildSectionHeader(String title) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      color: const Color(0xFF0D4D4D).withOpacity(0.4),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Color(0xFF8AB4B8),
          letterSpacing: 1,
        ),
      ),
    );
  }

  // Dynamic Notification Layout Element builder
  Widget _buildNotificationTile(NotificationModel item) {
    IconData iconData;
    Color iconColor;
    Color iconBgColor;
    bool showButton = false;

    // Switch case determining styling structures dynamically from metadata fields
    switch (item.type) {
      case NotificationType.reminder:
        iconData = Icons.error_outline;
        iconColor = const Color(0xFFEF4444);
        iconBgColor = const Color(0xFF2D191E);
        break;
      case NotificationType.paymentReceived:
        iconData = Icons.account_balance_wallet_outlined;
        iconColor = const Color(0xFF00BCBC);
        iconBgColor = const Color(0xFF132326);
        break;
      case NotificationType.billDue:
        iconData = Icons.access_time;
        iconColor = const Color(0xFF94A3B8);
        iconBgColor = const Color(0xFF1E293B);
        showButton = true;
        break;
    }

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Color(0xFF0C1B1E),
        border: Border(bottom: BorderSide(color: Colors.white10, width: 0.3)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // DYNAMIC CIRCLE ICON BOX
          CircleAvatar(
            backgroundColor: iconBgColor,
            radius: 22,
            child: Icon(iconData, color: iconColor, size: 22),
          ),
          const SizedBox(width: 16),

          // DYNAMIC TEXT LAYOUT BLOCK
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: const TextStyle(fontSize: 15, color: Colors.white, height: 1.3),
                    children: [
                      TextSpan(text: item.title),
                      if (item.amount != null)
                        TextSpan(
                          text: item.amount,
                          style: const TextStyle(color: Color(0xFF00BCBC), fontWeight: FontWeight.bold),
                        ),
                    ],
                  ),
                ),
                if (item.subtitle != null) ...[
                  const SizedBox(height: 6),
                  Text(
                    item.subtitle!,
                    style: const TextStyle(fontSize: 12, color: Color(0xFF5A7175)),
                  ),
                ],

                // CONDITIONAL DYNAMIC ACTION BUTTON
                if (showButton) ...[
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 36,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1E293B),
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                      ),
                      child: const Text('View Details', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                    ),
                  ),
                ]
              ],
            ),
          ),
        ],
      ),
    );
  }
}