import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../gift/gift_page.dart';
import '../my_page/my_page.dart';
import 'bottom_bar_type.dart';


final indexProvider =  StateProvider((ref) => 0);

class MainTabPage extends ConsumerWidget  {

  const MainTabPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context, WidgetRef ref ) {

    final indexState = ref.watch(indexProvider);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _activePage(indexState),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexState,
        onTap: (index) {
          ref.read(indexProvider.notifier).state = index;
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            activeIcon: Icon(Icons.home),
            label: "ホーム",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            activeIcon: Icon(Icons.card_giftcard),
            label: "プレゼント",
          ),
        ],
        // unselectedItemColor: ColorName.gray,
        // selectedItemColor: ColorName.deepPink,
        unselectedLabelStyle: const TextStyle(fontSize: 12),
        selectedLabelStyle: const TextStyle(fontSize: 12),
        showUnselectedLabels: true,
        showSelectedLabels: true,
        type: BottomNavigationBarType.fixed,
        iconSize: 35,
      ),
    );
  }

  Widget _activePage(int indexState ) {
    switch (indexState) {
      case 0:
        return const GiftPage();
      case 1:
        return const MyPage();
      default:
        return const GiftPage();
    }

  }

}
