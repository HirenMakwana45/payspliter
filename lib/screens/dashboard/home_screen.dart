import 'package:flutter/material.dart';
import 'package:payspliter/extensions/extension_util/widget_extensions.dart';
import 'package:payspliter/extensions/text_styles.dart';
import 'package:payspliter/screens/activities_screen.dart';

import '../../utils/app_colors.dart';
import '../notification_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // Exact colors referenced in image_d98382.png
    const Color customCanvasBg = Color(0xFF05080E);
    const Color containerBoxBg = Color(0xFF0D1527);
    const Color assetStrokeBorder = Color(0xFF1F2E4D);
    const Color softMutedTextColor = Color(0xFF53637C);

    return Scaffold(
      backgroundColor: customCanvasBg,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              pinned: true, // This tells Flutter to keep it sticky at the top!
              delegate: SliverStickyHeaderDelegate(
                height: 70.0, // Adjust this number if your header needs vertical breathing room
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 22,
                        backgroundColor: const Color(0xFF1F2E4D),
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: customCanvasBg,
                          child: const Icon(Icons.person, color: Colors.white, size: 22),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min, // Essential for alignment inside a bounded block
                          children: [
                            Text(
                              'XYZ',
                              style: boldTextStyle(size: 18, color: Colors.white),
                            ),
                            const SizedBox(height: 4),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color: const Color(0xFF141D33),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'UPI ID: ',
                                    style: secondaryTextStyle(size: 11, color: softMutedTextColor, weight: FontWeight.bold),
                                  ),
                                  Text(
                                    'example@oksbi',
                                    style: primaryTextStyle(size: 11, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: const Color(0xFF141D33),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          icon: const Icon(Icons.notifications, color: Colors.white60, size: 20),
                          onPressed: () {
                            NotificationsScreen().launch(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        SliverPadding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 16),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
              // 1. OVERALL BALANCE TRANSPARENT BOXED CONTAINER
              Container(
              width: double.infinity,
              padding:  EdgeInsets.symmetric(vertical: 36),
              decoration: BoxDecoration(
                color: containerBoxBg.withOpacity(0.4),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: assetStrokeBorder.withOpacity(0.6), width: 1.2),
              ),
              child:  Column(
                children: [
                  Text(
                    'OVERALL BALANCE',
                    style: boldTextStyle(
                      color: greenColorNew,
                      size: 12,
                      weight: FontWeight.bold,
                      letterSpacing: 0.8,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    '+\$70.00',
                    style: boldTextStyle(
                      color: greenColorNew,
                      size: 38,
                      weight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // 2. HORIZONTAL QUICK ACTION ACTION ROW
            Row(
              children: [
                Expanded(
                  child: _buildActionBox(
                    label: 'Add Personal\nExpense',
                    icon: Icons.add,
                    onTap: () {},
                    bgColor: containerBoxBg.withOpacity(0.3),
                    borderColor: assetStrokeBorder,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildActionBox(
                    label: 'Create Group',
                    icon: Icons.group_add_outlined,
                    onTap: () {},
                    bgColor: containerBoxBg.withOpacity(0.3),
                    borderColor: assetStrokeBorder,
                    iconColor: const Color(0xFF246BFD),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 36),

            // 3. RECENT ACTIVITY HEADER
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Recent Activity',
                  style: boldTextStyle(size: 18, color: Colors.white),
                ),
                GestureDetector(
                  onTap: () {
                    ActivitiesScreen().launch(context);
                  },
                  child: Text(
                    'See All',
                    style: secondaryTextStyle(size: 13, color: const Color(0xFF246BFD), weight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // 4. RECENT ACTIVITY TILES
            _buildActivityTile(
              icon: Icons.restaurant,
              title: 'Dinner at Gusto',
              subtitle: 'Shared with Friday Night Friends',
              amount: '-\$24.50',
              time: 'Today, 8:45 PM',
              amountColor: redColorNew,
            ),
            _buildActivityTile(
              icon: Icons.restaurant,
              title: 'Dinner at Gusto',
              subtitle: 'Shared with Friday Night Friends',
              amount: '-\$24.50',
              time: 'Today, 8:45 PM',
              amountColor: redColorNew,
            ),
            _buildActivityTile(
              icon: Icons.restaurant,
              title: 'Dinner at Gusto',
              subtitle: 'Shared with Friday Night Friends',
              amount: '-\$24.50',
              time: 'Today, 8:45 PM',
              amountColor: redColorNew,
            ),
            _buildActivityTile(
              icon: Icons.restaurant,
              title: 'Dinner at Gusto',
              subtitle: 'Shared with Friday Night Friends',
              amount: '-\$24.50',
              time: 'Today, 8:45 PM',
              amountColor: redColorNew,
            ),
            ]),

            ),)
          ],

        ),
      ),
    );
  }

  // Component Helper: Dual Layout Block Quick Action Containers
  Widget _buildActionBox({
    required String label,
    required IconData icon,
    required VoidCallback onTap,
    required Color bgColor,
    required Color borderColor,
    Color iconColor = Colors.white,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 80,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: borderColor.withOpacity(0.8), width: 1.2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: iconColor, size: 24),
            const SizedBox(width: 10),
            Flexible(
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  height: 1.2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Component Helper: Activity List Tile Rows matching image layout specs
  Widget _buildActivityTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required String amount,
    required String time,
    required Color amountColor,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF0D1527).withOpacity(0.3),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: const Color(0xFF0D1527),
            radius: 20,
            child: Icon(icon, color: const Color(0xFF246BFD), size: 18),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 12, color: Color(0xFF53637C)),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                amount,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: amountColor),
              ),
              const SizedBox(height: 4),
              Text(
                time,
                style: const TextStyle(fontSize: 10, color: Color(0xFF53637C)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
class SliverStickyHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double height;

  SliverStickyHeaderDelegate({required this.child, this.height = 80.0});

  @override
  double get minExtent => height;

  @override
  double get maxExtent => height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: const Color(0xFF05080E), // Must match your Scaffold background color to look seamless
      alignment: Alignment.center,
      child: child,
    );
  }

  @override
  bool shouldRebuild(covariant SliverStickyHeaderDelegate oldDelegate) {
    return oldDelegate.child != child || oldDelegate.height != height;
  }
}