import 'package:barberz/presentation/theme.dart';
import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final bool isScrollable;
  final Widget body;
  final bool hasBottomNav;
  final int? currentNavigationIndex;
  final Widget? title;
  final Function(int)? onChangeTab;
  final FloatingActionButton? floatingActionButton;

  const AppScaffold(
      {Key? key,
      this.isScrollable = false,
      required this.body,
      this.hasBottomNav = false,
      this.currentNavigationIndex,
      this.title,
      this.floatingActionButton,
      this.onChangeTab})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.grey.shade300,
          title: title,
        ),
        floatingActionButton: floatingActionButton,
        bottomNavigationBar: hasBottomNav
            ? BottomNavigationBar(
                items: CustomTheme.navBarItems,
                currentIndex: currentNavigationIndex!,
                onTap: onChangeTab,
                unselectedItemColor: Colors.black,
                selectedItemColor: Colors.redAccent,
                showSelectedLabels: false,
                showUnselectedLabels: false,
              )
            : null,
        body: Container(
          color: Colors.grey.shade300,
          //margin: EdgeInsets.symmetric(horizontal: 32),
          child: isScrollable
              ? CustomScrollView(
                  slivers: [
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 16),
                          child: body),
                    ),
                  ],
                )
              : Container(
                  color: Colors.grey.shade300,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  margin: EdgeInsets.all(16),
                  child: body),
        ),
      ),
    );
  }
}
