import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kartal/src/context_extension.dart';
import 'package:photo_camera_reader/photoFile/image_file_picker/model/file_image_picker_model.dart';
import 'package:photo_camera_reader/product/string_constants.dart';

class FilePickerSheet {
  final BuildContext context;

  FilePickerSheet(this.context);

  Future<FilePickerNavigateModel?> show() async {
    return await showModalBottomSheet<FilePickerNavigateModel>(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: context.lowRadius)),
      builder: (context) => const FilePickerSheetView(),
    );
  }
}

class FilePickerSheetView extends StatelessWidget {
  const FilePickerSheetView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.file_copy),
            title: const Text(ProcjectStringConstants.fileInputChooseText),
            onTap: () async {
              final result = await FilePicker.platform
                  .pickFiles(allowMultiple: true, type: FileType.custom, allowedExtensions: ['pdf']);

              Navigator.of(context).pop(FilePickerNavigateModel(filePickerResults: result));
            },
          ),
          ListTile(
              leading: const Icon(Icons.photo),
              title: const Text(ProcjectStringConstants.fileInputImageText),
              onTap: () async {
                final _image = await ImagePicker().pickMultiImage();
                Navigator.of(context).pop(FilePickerNavigateModel(imagePaths: _image?.map((e) => e.path).toList()));
                // Navigator.of(context).pop(FilePickerNavigateModel(imagePath: _image?.path, imageItem: _image));
              }),
          ListTile(
              leading: const Icon(Icons.videocam),
              title: const Text(ProcjectStringConstants.fileInputImageLoadText),
              onTap: () async {
                final _image = await ImagePicker().pickImage(source: ImageSource.camera);
                Navigator.of(context).pop(FilePickerNavigateModel(imagePath: _image?.path, imageItem: _image));
              }),
        ],
      ),
    );
  }
}
