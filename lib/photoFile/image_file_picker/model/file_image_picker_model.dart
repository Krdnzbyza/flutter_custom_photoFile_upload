import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

class FilePickerNavigateModel {
  final String? imagePath;
  final XFile? imageItem;
  final List<String>? imagePaths;
  final FilePickerResult? filePickerResults;

  FilePickerNavigateModel({
    this.imagePath,
    this.filePickerResults,
    this.imageItem,
    this.imagePaths,
  });
}
