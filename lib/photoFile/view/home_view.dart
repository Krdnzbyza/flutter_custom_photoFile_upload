import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:kartal/src/context_extension.dart';
import 'package:lottie/lottie.dart';
import 'package:photo_camera_reader/photoFile/image_file_picker/model/file_image_picker_model.dart';
import 'package:photo_camera_reader/photoFile/image_file_picker/widget/file_upload_button.dart';
import 'package:photo_camera_reader/product/string_constants.dart';

import 'image_file_viewer.dart';

class PhotoHomeView extends StatefulWidget {
  const PhotoHomeView({Key? key}) : super(key: key);

  @override
  _PhotoHomeViewState createState() => _PhotoHomeViewState();
}

class _PhotoHomeViewState extends State<PhotoHomeView> {
  String? imagePath;
  List<String>? imagePaths;
  FilePickerResult? filePickerResults;
  void _updateItems(FilePickerNavigateModel model) {
    setState(() {
      imagePath = model.imagePath;
      imagePaths = model.imagePaths;
      filePickerResults = model.filePickerResults;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text(ProcjectStringConstants.fileInputTittleText),
            actions: [Icon(Icons.select_all)],
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            _fileUpload(),
            (imagePaths?.isNotEmpty ?? false) || (filePickerResults != null)
                ? emptyAreaSizedBox(context)
                : const SizedBox(),
          ]))
        ],
      ),
    );
  }

  Widget _fileUpload() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
            width: context.dynamicWidth(0.9),
            height: context.dynamicHeight(0.45),
            child: Lottie.asset(
              'assets/lottie/upload_file.json',
            )),
        SizedBox(
          height: context.dynamicHeight(0.05),
          child: FileUploadButton(
            onResult: (result) {
              _updateItems(result);
            },
          ),
        ),
      ],
    );
  }

  Widget emptyAreaSizedBox(BuildContext context) {
    return FileImageView(imagePaths: imagePaths, filePickerResults: filePickerResults);
  }
}
