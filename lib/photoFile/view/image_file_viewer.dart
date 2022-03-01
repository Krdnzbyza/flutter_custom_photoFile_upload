import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:kartal/src/context_extension.dart';

class FileImageView extends StatelessWidget {
  const FileImageView({
    Key? key,
    required this.imagePaths,
    required this.filePickerResults,
  }) : super(key: key);

  final List<String>? imagePaths;
  final FilePickerResult? filePickerResults;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: context.dynamicHeight(0.1),
        child: SizedBox(
            height: context.dynamicHeight(0.02),
            child: imagePaths?.isNotEmpty ?? false
                ? SizedBox(
                    child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: imagePaths?.length ?? 0,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return SizedBox(
                          width: context.dynamicWidth(0.4),
                          child: Column(
                            children: [
                              Expanded(
                                child: Image.file(
                                  File(
                                    imagePaths?[index] ?? '',
                                  ),
                                  height: context.dynamicHeight(0.1),
                                ),
                              ),
                              Text(
                                '${imagePaths?[index].split('/').last}',
                                overflow: TextOverflow.ellipsis,
                              )
                            ],
                          ));
                    },
                  ))
                : SizedBox(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: filePickerResults?.count,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [const Icon(Icons.picture_as_pdf_outlined), Text('${filePickerResults?.names}')],
                        );
                      },
                    ),
                  )));
  }
}
