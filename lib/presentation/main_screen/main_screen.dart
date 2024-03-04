import 'package:flutter/material.dart';
import 'package:gifting/core/app_export.dart';
import 'package:gifting/presentation/main_screen/main_bloc/main_bloc.dart';

import '../../widgets/app_bar/appbar_subtitle.dart';
import '../../widgets/app_bar/custom_app_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({key});

  static Widget builder(BuildContext context) {
    return BlocProvider<MainBloc>(
      create: (context) => MainBloc(),
      child: MainScreen(),
    );
  }

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: BlocBuilder<MainBloc, MainState>(
        builder: (context, state) {
          return Container();
        },
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 40.h,
      height: 90,
      title: AppbarSubtitle(
        text: 'Settings',
        margin: EdgeInsets.only(left: 16.h),
        onTap: () {
          NavigatorService.pushNamed(AppRoutes.settingsScreen);
        },
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(30.0),
        child: Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text('Gifting', style: theme.textTheme.headlineLarge),
        ),
      ),
    );
  }
}
