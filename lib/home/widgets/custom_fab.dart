import 'package:flutter/material.dart';

class CustomFab extends StatefulWidget {
  const CustomFab({super.key});

  @override
  State<CustomFab> createState() => _CustomFabState();
}

class _CustomFabState extends State<CustomFab> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 10),
    );

    final tween = Tween<double>(
      begin: 0,
      end: 0.5,
    ).animate(
      _animationController,
    );

    _animation = tween;
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: _rotate,
      child: RotationTransition(
        turns: _animation,
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _rotate() {
    setState(() {
      _animationController
        ..reset()
        ..forward();
    });
  }
}
