import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:islamic_reminder/ui/views/bottombar/bottombar_view.dart';

class StartupView extends StatefulWidget {
  const StartupView({Key? key}) : super(key: key);

  @override
  State<StartupView> createState() => _StartupViewState();
}

class _StartupViewState extends State<StartupView> {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();

    // Animate Bismillah opacity
    SchedulerBinding.instance.addPostFrameCallback((_) {
      setState(() => _opacity = 1.0);
    });

    // Navigate after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAll(() => BottombarView());
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: isDark
                ? const [Color(0xFF0F1E17), Color(0xFF1B3A2A)]
                : const [Color(0xFFF1F8E9), Color(0xFFE8F5E9)],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 120),
            AnimatedOpacity(
              opacity: _opacity,
              duration: const Duration(milliseconds: 1200),
              child: Text(
                "بِسْمِ ٱللَّٰهِ ٱلرَّحْمَـٰنِ ٱلرَّحِيمِ",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 26,
                  height: 1.8,
                  fontWeight: FontWeight.w600,
                  color: isDark
                      ? const Color(0xFFC8E6C9)
                      : const Color(0xFF1B5E20),
                ),
              ),
            ),
            const SizedBox(height: 200),
            const AzanPulse(),
            const SizedBox(height: 24),
            Text(
              "Islamic Reminder",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: isDark ? const Color(0xFFC8E6C9) : const Color(0xFF1B5E20),
              ),
            ),
            const SizedBox(height: 18),
            Text(
              "فَاذْكُرُونِي أَذْكُرْكُمْ",
              style: TextStyle(
                fontSize: 22,
                color: isDark ? const Color(0xFFA5D6A7) : const Color(0xFF2E7D32),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

// ===== AzanPulse Animation =====
class AzanPulse extends StatefulWidget {
  const AzanPulse({super.key});

  @override
  State<AzanPulse> createState() => _AzanPulseState();
}

class _AzanPulseState extends State<AzanPulse>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90,
      height: 90,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (_, child) {
          return CustomPaint(
            painter: _AzanWavePainter(_controller.value),
            child: child,
          );
        },
        child: const Center(
          child: Icon(
            Icons.mosque_rounded,
            size: 36,
            color: Color(0xFF81C784),
          ),
        ),
      ),
    );
  }
}

class _AzanWavePainter extends CustomPainter {
  final double progress;

  _AzanWavePainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF81C784).withOpacity(0.4)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final radius = size.width / 2 * progress;
    canvas.drawCircle(size.center(Offset.zero), radius, paint);
  }

  @override
  bool shouldRepaint(covariant _AzanWavePainter oldDelegate) => true;
}
