import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islamic_reminder/controllers/bottombar_controller.dart';

class BottombarView extends StatelessWidget {
  BottombarView({Key? key}) : super(key: key);

  final BottombarController controller = Get.put(BottombarController());

  @override
  Widget build(BuildContext context) {
    const activeColor = Color(0xFF1B5E20); // Dark Green
    const inactiveColor = Colors.blueGrey;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Obx(() => controller.screens[controller.currentIndex.value]),
      bottomNavigationBar: Obx(
        () => Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Stack(
            children: [
              // Sliding Indicator
              AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                left: controller.currentIndex.value * (MediaQuery.of(context).size.width - 70) / 4,
                bottom: 0,
                child: Container(
                  width: (MediaQuery.of(context).size.width - 70) / 4,
                  height: 3,
                  decoration: BoxDecoration(
                    color: activeColor,
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _NavBarItem(
                    icon: Icons.home_filled,
                    label: 'Home',
                    isSelected: controller.currentIndex.value == 0,
                    onTap: () => controller.handleNavigation(0),
                  ),
                  _NavBarItem(
                    icon: Icons.notifications,
                    label: 'Reminders',
                    isSelected: controller.currentIndex.value == 1,
                    onTap: () => controller.handleNavigation(1),
                  ),
                  _NavBarItem(
                    icon: Icons.mosque,
                    label: 'Namaz',
                    isSelected: controller.currentIndex.value == 2,
                    onTap: () => controller.handleNavigation(2),
                  ),
                  _NavBarItem(
                    icon: Icons.person,
                    label: 'Profile',
                    isSelected: controller.currentIndex.value == 3,
                    onTap: () => controller.handleNavigation(3),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavBarItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const activeColor = Color(0xFF1B5E20);
    final inactiveColor = Colors.blueGrey.shade300;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isSelected
                  ? activeColor.withOpacity(0.1)
                  : Colors.transparent,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: isSelected ? activeColor : inactiveColor,
              size: 26,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? activeColor : inactiveColor,
              fontSize: 12,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}