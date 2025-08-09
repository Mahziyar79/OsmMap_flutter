import 'package:flutter/material.dart';
import 'package:snapp_map/constants/Dimens.dart';
import 'package:snapp_map/constants/text_styles.dart';
import 'package:snapp_map/gen/assets.gen.dart';
import 'package:snapp_map/widgets/back_button.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CurrentWidgetState {
  CurrentWidgetState._();
  static const stateSelectOrigin = 0;
  static const stateSelectDestination = 1;
  static const stateRequestDriver = 2;
}

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  List<GeoPoint> geoPoints = [];
  List currentWidgetList = [CurrentWidgetState.stateSelectOrigin];
  Widget markerIcon = SvgPicture.asset(
    Assets.icons.origin,
    height: 100,
    width: 40,
  );
  MapController mapController = MapController(
    initMapWithUserPosition: UserTrackingOption.withoutUserPosition(),
    initPosition: GeoPoint(latitude: 35.7367516373, longitude: 51.2911096718),
  );
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            // OSM Map
            Container(color: Colors.blueGrey),

            // Back Button
            MyBackButton(
              onPress: () {
                if (currentWidgetList.length > 1) {
                  setState(() {
                    currentWidgetList.removeLast();
                  });
                }
              },
            ),

            // Current Widget
            currentWidget(),
          ],
        ),
      ),
    );
  }

  Widget currentWidget() {
    Widget widget = origin();
    switch (currentWidgetList.last) {
      case CurrentWidgetState.stateSelectOrigin:
        break;
      case CurrentWidgetState.stateSelectDestination:
        widget = destination();
        break;
      case CurrentWidgetState.stateRequestDriver:
        widget = reqDriver();
        break;
    }
    return widget;
  }

  Positioned origin() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.all(Dimens.large),
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              currentWidgetList.add(CurrentWidgetState.stateSelectDestination);
            });
          },
          child: Text('انتخاب مبدا', style: MyTextStyles.button),
        ),
      ),
    );
  }

  Positioned destination() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.all(Dimens.large),
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              currentWidgetList.add(CurrentWidgetState.stateRequestDriver);
            });
          },
          child: Text('انتخاب مقصد', style: MyTextStyles.button),
        ),
      ),
    );
  }

  Positioned reqDriver() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.all(Dimens.large),
        child: ElevatedButton(
          onPressed: () {},
          child: Text('درخواست راننده', style: MyTextStyles.button),
        ),
      ),
    );
  }
}
