import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gifting/core/app_export.dart';
import 'package:gifting/presentation/main_screen/main_bloc/main_bloc.dart';
import 'package:gifting/widgets/custom_elevated_button.dart';

import '../../widgets/app_bar/appbar_subtitle.dart';
import '../../widgets/app_bar/custom_app_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({key});

  static Widget builder(BuildContext context) {
    return BlocProvider<MainBloc>(
      create: (context) => MainBloc()..add(MainInitEvent()),
      child: MainScreen(),
    );
  }

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool isPersonListExpanded = false;
  bool isEventListExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: BlocBuilder<MainBloc, MainState>(
        builder: (context, state) {
          if (state is MainLoadedState) {
            return _buildContent(context, state);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget _buildContent(BuildContext context, MainLoadedState state) {
    if (state.eventList.isEmpty && state.personList.isEmpty)
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 20.v),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 300.v,
              decoration: AppDecoration.surface.copyWith(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.h),
                    child: CustomImageView(
                      height: 180,
                      imagePath: ImageConstant.imgGroup,
                    ),
                  ),
                  Text(
                    'No person yet',
                    style: theme.textTheme.titleMedium,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    'Click on the button to create\na new person',
                    textAlign: TextAlign.center,
                    style: CustomTextStyles.titleMediumGray700,
                  ),
                ],
              ),
            ),
            CustomElevatedButton(
              text: 'Add Person',
              onPressed: () =>
                  NavigatorService.pushNamed(AppRoutes.addPersonScreen),
            )
          ],
        ),
      );
    else
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 20.v),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Persons',
                  style: theme.textTheme.titleMedium
                      ?.copyWith(color: appTheme.gray700),
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    'View All',
                    style: theme.textTheme.titleMedium,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.v,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: isPersonListExpanded ? state.personList.length : 1,
                itemBuilder: (context, index) {
                  return Container(
                    height: 80.h,
                    padding: EdgeInsets.all(10.h),
                    decoration: AppDecoration.surface.copyWith(
                      borderRadius: BorderRadius.circular(8.h),
                    ),
                    child: Row(
                      //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          width: 60.h,
                          height: 60.v,
                          child:ClipRRect(
                            borderRadius: BorderRadius.circular(8.h),
                            child: Image.memory(
                              base64Decode(state.personList[index].photo),
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                        /*  CustomImageView(
                          imageFile:
                          base64ToFile(, 'example$index.jpg'),
                        ),*/

                        Padding(
                          padding: EdgeInsets.only(left: 11.h),
                          //width: 106.h,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text(
                                  state.personList[index].name,
                                  style: theme.textTheme.headlineSmall,
                                ),
                              ),
                              Row(

                                children: [
                                  Container(
                                    child: Text(
                                      state.personList[index].whoIsForYou,
//                                  textAlign: TextAlign.end,
                                      style: theme.textTheme.titleMedium,
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      '  |  ${state.personList[index].age} y.o.',
//                                  textAlign: TextAlign.end,
                                      style: theme.textTheme.titleMedium
                                          ?.copyWith(color: appTheme.gray700),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            CustomElevatedButton(text: 'Add person')
          ],
        ),
      );
  }

  File base64ToFile(String base64String, String fileName) {
    List<int> bytes = base64Decode(base64String);
    String dir =
        '/storage/emulated/0/'; // Путь к директории для сохранения файла
    File file = File('$dir$fileName');
    file.writeAsBytesSync(bytes);
    return file;
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
