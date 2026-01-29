import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:pacotes/pages/auto_size_text.dart';
import 'package:pacotes/pages/battery_page/battery_page.dart';
import 'package:pacotes/pages/camera/camera_page.dart';
import 'package:pacotes/pages/connectivity_plus/connectivy_plus_page.dart';
import 'package:pacotes/pages/geolocator/geolocator_page.dart';
import 'package:pacotes/pages/qr_code/qr_code_page.dart';
import 'package:pacotes/pages/percent_indicator/percent_indicator.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class CustonDrawer extends StatelessWidget {
  const CustonDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          //Abrir dio
          InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              width: double.infinity,
              child: Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.internetExplorer,
                    color: Colors.blue,
                    size: 24,
                  ),

                  SizedBox(width: 5),
                  Text("Abrir dio"),
                ],
              ),
            ),
            onTap: () async {
              await launchUrl(Uri.parse('https://dio.me'));
            },
          ),
          const Divider(),
          const SizedBox(height: 10),
          //Abrir Google Maps
          InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              width: double.infinity,
              child: Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.mapLocationDot,
                    color: Colors.blue,
                    size: 24,
                  ),

                  SizedBox(width: 5),
                  Text("Abrir Google Maps"),
                ],
              ),
            ),
            onTap: () async {
              await launchUrl(Uri.parse('https://www.google.com/maps'));
            },
          ),
          const Divider(),
          const SizedBox(height: 10),
          //Compartilhar
          InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              width: double.infinity,
              child: Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.shareNodes,
                    color: Colors.blue,
                    size: 24,
                  ),

                  SizedBox(width: 5),
                  Text("Compartilhar"),
                ],
              ),
            ),
            onTap: () {
              SharePlus.instance.share(
                ShareParams(text: 'Olhem este site https://dio.me'),
              );
            },
          ),
          const Divider(),
          const SizedBox(height: 10),
          // Indicador de Porcentagem
          InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              width: double.infinity,
              child: Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.percent,
                    color: Colors.blue,
                    size: 24,
                  ),
                  SizedBox(width: 5),
                  Text("Indicador de Porcentagem"),
                ],
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => PercentIndicatorPage()),
              );
            },
          ),
          const Divider(),
          const SizedBox(height: 10),
          //Auto Size Text
          InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              width: double.infinity,
              child: Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.paperclip,
                    color: Colors.blue,
                    size: 24,
                  ),
                  SizedBox(width: 5),
                  Text("Auto Size Text"),
                ],
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => AutoSizeTextPage()),
              );
            },
          ),
          const Divider(),
          const SizedBox(height: 10),
          //Intl
          InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              width: double.infinity,
              child: Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.earthAmericas,
                    color: Colors.blue,
                    size: 24,
                  ),
                  SizedBox(width: 5),
                  Text("Intl"),
                ],
              ),
            ),
            onTap: () {
              var f = NumberFormat('#,###.0#', 'en_US');
              var fBR = NumberFormat('#,###.0#', 'pt_BR');
              debugPrint(f.format(12345.345));
              debugPrint(fBR.format(123456.345));

              var data = DateTime(2022, 05, 09);
              debugPrint(DateFormat('EEEEE', 'pt_BR').format(data));
              debugPrint(DateFormat('EEEEE', 'en_US').format(data));
            },
          ),
          const Divider(),
          const SizedBox(height: 10),
          //pt-br
          InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              width: double.infinity,
              child: Row(
                children: [
                  FaIcon(FontAwesomeIcons.flag, color: Colors.blue, size: 24),
                  SizedBox(width: 5),
                  Text("pt-br"),
                ],
              ),
            ),
            onTap: () {
              if (context.locale.toString() == "pt-BR") {
                context.setLocale(Locale('en', 'US'));
              } else {
                context.setLocale(Locale('pt', 'BR'));
              }
              debugPrint(context.locale.toString());
              Navigator.pop(context);
            },
          ),
          const Divider(),
          const SizedBox(height: 10),
          //Battery
          InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              width: double.infinity,
              child: Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.batteryHalf,
                    color: Colors.blue,
                    size: 24,
                  ),
                  SizedBox(width: 5),
                  Text("Battery"),
                ],
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => BatteryPage()),
              );
            },
          ),
          const Divider(),
          const SizedBox(height: 10),
          //Path_provider compartilhamento de dados (File)
          InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              width: double.infinity,
              child: Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.batteryHalf,
                    color: Colors.blue,
                    size: 24,
                  ),
                  SizedBox(width: 5),
                  Text("Path"),
                ],
              ),
            ),
            onTap: () async {
              var directory = await path_provider.getTemporaryDirectory();
              debugPrint(directory.path);
              directory = await path_provider.getApplicationSupportDirectory();
              debugPrint(directory.path);
              directory = await path_provider
                  .getApplicationDocumentsDirectory();
              debugPrint(directory.path);
            },
          ),
          const Divider(),
          const SizedBox(height: 10),
          //Path_provider Informações de Pacote
          InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              width: double.infinity,
              child: Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.appStoreIos,
                    color: Colors.blue,
                    size: 24,
                  ),
                  SizedBox(width: 5),
                  Text("Informações pacote"),
                ],
              ),
            ),
            onTap: () async {
              PackageInfo packageInfo = await PackageInfo.fromPlatform();

              String appName = packageInfo.appName;
              String packageName = packageInfo.packageName;
              String version = packageInfo.version;
              String buildNumber = packageInfo.buildNumber;
              debugPrint(appName);
              debugPrint(packageName);
              debugPrint(version);
              debugPrint(buildNumber);
            },
          ),
          const Divider(),
          const SizedBox(height: 10),
          //Path_provider compartilhamento Informações de Dispositivos
          InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              width: double.infinity,
              child: Row(
                children: [
                  FaIcon(FontAwesomeIcons.mobile, color: Colors.blue, size: 24),
                  SizedBox(width: 5),
                  Text("Informações Dispositivos"),
                ],
              ),
            ),
            onTap: () async {
              DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
              if (Platform.isAndroid) {
                AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
                debugPrint('Running on ${androidInfo.model}'); // e.g. "Moto G (4)"
              } else if (Platform.isIOS) {
                IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
                debugPrint(
                  'Running on ${iosInfo.utsname.machine}',
                ); // e.g. "iPod7,1"
              } else {
                WebBrowserInfo webBrowserInfo = await deviceInfo.webBrowserInfo;
                debugPrint('Running on ${webBrowserInfo.userAgent}');
              }
            },
          ),
          const Divider(),
          const SizedBox(height: 10),
          //Connectivy
          InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              width: double.infinity,
              child: Row(
                children: [
                  FaIcon(FontAwesomeIcons.wifi, color: Colors.blue, size: 24),
                  SizedBox(width: 5),
                  Text("Connectivy"),
                ],
              ),
            ),
            onTap: () async {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ConnectivyPlusPage()),
              );
            },
          ),
          const Divider(),
          const SizedBox(height: 10),
          //GPS
          InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              width: double.infinity,
              child: Row(
                children: [
                  FaIcon(FontAwesomeIcons.mapPin, color: Colors.blue, size: 24),
                  SizedBox(width: 5),
                  Text("GPS"),
                ],
              ),
            ),
            onTap: () async {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => GeolocatorPage()),
              );
            },
          ),
          const Divider(),
          const SizedBox(height: 10),
          //Camera
          InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              width: double.infinity,
              child: Row(
                children: [
                  FaIcon(FontAwesomeIcons.camera, color: Colors.blue, size: 24),
                  SizedBox(width: 5),
                  Text("Camera"),
                ],
              ),
            ),
            onTap: () async {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => CameraPage ()),
              );
            },
          ),
          const Divider(),
          const SizedBox(height: 10),
          //qrcode
          InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              width: double.infinity,
              child: Row(
                children: [
                  FaIcon(FontAwesomeIcons.qrcode, color: Colors.blue, size: 24),
                  SizedBox(width: 5),
                  Text("QR Code"),
                ],
              ),
            ),
            onTap: () async {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => QrCodePage()),
              );
            },
          ),
        ].reversed.toList(),
      ),
    );
  }
}
