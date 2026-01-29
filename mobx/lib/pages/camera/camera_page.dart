import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_gallery_saver_plus/image_gallery_saver_plus.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  XFile? imagem;

  Future<void> cropImage(XFile imageFile) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: imageFile.path,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Editar imagem',
          toolbarColor: Colors.deepOrange,
          toolbarWidgetColor: Colors.white,
          aspectRatioPresets: [
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.ratio4x3,
            CropAspectRatioPreset.ratio16x9,
          ],
        ),
        IOSUiSettings(title: 'Editar imagem'),
      ],
    );

    if (croppedFile != null) {
      final bytes = await File(croppedFile.path).readAsBytes();

      await ImageGallerySaverPlus.saveImage(
        bytes,
        quality: 95,
        name: "foto_editada_${DateTime.now().millisecondsSinceEpoch}",
      );

      setState(() {
        imagem = XFile(croppedFile.path); // 👈 MOSTRA A CORTADA
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Imagem cortada e salva ✂️📸")),
        );
      }
    }
  }

  Future<void> salvarNaGaleria(XFile photo) async {
    final bytes = await photo.readAsBytes();
    final result = await ImageGallerySaverPlus.saveImage(
      Uint8List.fromList(bytes),
      quality: 90,
      name: "foto_${DateTime.now().millisecondsSinceEpoch}",
    );

    debugPrint("Resultado salvar galeria: $result");
  }

  Future<void> abrirCamera(BuildContext sheetContext) async {
    final picker = ImagePicker();
    final photo = await picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 85,
    );

    if (photo != null) {
      Navigator.pop(sheetContext); // fecha o bottom sheet
      await cropImage(photo); // abre o editor
    }
  }

  Future<void> abrirGaleria(BuildContext sheetContext) async {
    final picker = ImagePicker();
    final photo = await picker.pickImage(source: ImageSource.gallery);

    if (photo != null) {
      Navigator.pop(sheetContext);
      await cropImage(photo);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Camera")),
        body: Column(
          children: [
            TextButton(
              onPressed: () async {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext sheetContext) {
                    return Wrap(
                      children: [
                        ListTile(
                          leading: FaIcon(FontAwesomeIcons.camera),
                          title: Text("Camera"),
                          onTap: () => abrirCamera(sheetContext),
                        ),
                        ListTile(
                          leading: FaIcon(FontAwesomeIcons.images),
                          title: Text("Galeria"),
                          onTap: () => abrirGaleria(sheetContext),
                        ),
                      ],
                    );
                  },
                );
              },

              child: Text("Camera"),
            ),
            //aparecer imagem
            imagem != null
                ? Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.file(
                          File(imagem!.path),
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
