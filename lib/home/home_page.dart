import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:test_week_13/home/widgets/list_item_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    required this.username,
    super.key,
  });

  final String username;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
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
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.amber.withOpacity(0.5),
        toolbarHeight: 80,
        title: Text('Hola ${widget.username}'),
        centerTitle: true,
        flexibleSpace: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 500,
            sigmaY: 500,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(4),
        child: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) => const ListItemCard(),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Configuraciones',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _rotate(),
        child: RotationTransition(
          turns: _animation,
          child: const Icon(
            Icons.add,
          ),
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
