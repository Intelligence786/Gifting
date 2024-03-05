import 'package:flutter/material.dart';
import 'package:gifting/core/app_export.dart';
import 'package:gifting/data/models/eventModel/event_model.dart';
import 'package:intl/intl.dart';

import '../../../data/models/personModel/person_model.dart';
import '../../../widgets/custom_elevated_button.dart';

class EventWidgetItem extends StatelessWidget {
  final EventModel event;
  final List<Person> persons;

  const EventWidgetItem({key, required this.event, required this.persons});

  @override
  Widget build(BuildContext context) {
    double total = event.gifts
        .fold(0, (previousValue, gift) => previousValue + gift.price);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.v),
      height: 100.h,
      // padding: EdgeInsets.all(10.h),
      decoration: AppDecoration.surface.copyWith(
        borderRadius: BorderRadius.circular(8.h),
      ),
      child: CustomElevatedButton(
        onPressed: () {
          NavigatorService.pushNamed(AppRoutes.eventInfoScreen,
              arguments: [persons, event]);
        },
        buttonStyle: CustomButtonStyles.fillGray,
        decoration: AppDecoration.surface.copyWith(
          borderRadius: BorderRadius.circular(8.h),
        ),
        text: '',
        leftIcon: Expanded(
          child: Padding(
            padding: EdgeInsets.all(10.h),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              event.name,
                              style: theme.textTheme.headlineSmall,
                            ),
                          ),
                          Container(
                            child: Text(
                              DateFormat('dd.MM.yyyy').format(event.date),
                              style: theme.textTheme.bodyMedium,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.h),
                        child: CustomImageView(
                          imagePath: ImageConstant.imgArrowRight,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.v,
                ),
                Container(
                  padding: EdgeInsets.only(top: 10.v),
                  decoration: AppDecoration.seconrady,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        event.gifts.length.toString() + ' gift',
                        style: theme.textTheme.bodyMedium,
                      ),
                      Text(
                        total.toString() + '\$',
                        style: theme.textTheme.bodyMedium
                            ?.copyWith(color: theme.colorScheme.primary),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
