import 'package:Comm_type/models/result.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gsheets/gsheets.dart';

class ResultSheetsApi {
  static final _spreadsheetId = "SPREADSHEET PRIVATE KEY";
  static const _credentials = "CREDENTIALS OF SHEETS";
  static final _gsheets = GSheets(_credentials);

  static Worksheet? _userSheet;

  static Future init() async {
    try {
      final String sheetName = await FirebaseAuth.instance.currentUser!.email!
              .split('@')[0]
              .substring(2)
              .startsWith('d')
          ? FirebaseAuth.instance.currentUser!.email!
              .split('@')[0]
              .substring(2, 5)
          : FirebaseAuth.instance.currentUser!.email!
              .split('@')[0]
              .substring(2, 4);
      final spreadsheet = await _gsheets.spreadsheet(_spreadsheetId);
      _userSheet = await _getWorkSheet(spreadsheet, title: sheetName.toUpperCase());
      final firstRow = ResultFields.getFields();
      _userSheet!.values.insertRow(1, firstRow);
    } catch (e) {
      print(e);
    }
  }

  static Future<Worksheet> _getWorkSheet(
    Spreadsheet spreadsheet, {
    required String title,
  }) async {
    try {
      return await spreadsheet.addWorksheet(title);
    } catch (e) {
      return spreadsheet.worksheetByTitle(title)!;
    }
  }

  static Future insert(Map<String, dynamic> rowList) async {
    if (_userSheet == null) return;
    _userSheet!.values.map.appendRow(rowList);
  }

  static Future<bool> update(Map<String, dynamic> rowList) async {
    if (_userSheet == null) return false;
    return _userSheet!.values.map
        .insertRowByKey(rowList['Student ID'], rowList);
  }
}
