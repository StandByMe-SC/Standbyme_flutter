import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_sc/Model/common/client.dart';

/// A class for translating text using an API.
class Translation {
  final Dio dio = Dio();

  /// Translates the text from Korean to English.
  Future<String> translatedText() async {
    String translationResult = '';
    try {
      Response response = await dio.post(
        'https://openapi.naver.com/v1/papago/n2mt',
        data: {
          'source': 'ko',
          'target': 'en',
          'text': '',
        },
        options: Options(
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
            'X-Naver-Client-Id': TRANSLATE_CLIENT_ID,
            'X-Naver-Client-Secret': TRANSLATE_CLIENT_SECRET,
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data;
        final translatedText = data['message']['result']['translatedText'];
        translationResult = translatedText;
      } else {
        translationResult = '번역 실패 : ${response.statusCode}';
      }
    } catch (e) {
      translationResult = '번역 실패 : $e';
    }

    return translationResult;
  }
}
