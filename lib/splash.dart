import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'modules/home/home_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late final AnimationController _ctr;
  late final Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _ctr = AnimationController(vsync: this, duration: const Duration(milliseconds: 900));
    _scale = Tween<double>(begin: 0.7, end: 1.0).animate(CurvedAnimation(parent: _ctr, curve: Curves.elasticOut));
    _ctr.forward();
    Future.delayed(const Duration(milliseconds: 1400), () => Get.off(() =>  HomeView()));
  }

  @override
  void dispose() {
    _ctr.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: ScaleTransition(
          scale: _scale,
          child: Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.grey.shade900.withOpacity(0.6),
              borderRadius: BorderRadius.circular(22),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFFFD700).withOpacity(0.18),
                  blurRadius: 30,
                  spreadRadius: 6,
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.storefront, size: 38, color: Color(0xFFFFD700)),
                SizedBox(width: 12),
                Text('DukaanDost', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
