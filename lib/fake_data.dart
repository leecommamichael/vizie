const users = ['GCWPB', 'BDLIND', 'JAGOEC', 'EVRVI', 'FCHU'];
const typeCodes = ['SET', 'SET_ENTRY'];
const businessUnit = ['Market Devp.', 'Prod. Research'];

List<Map<String, dynamic>> makeFake(int entries) {
  List<Map<String, dynamic>> data = [];

  for (var i = 0; i < entries; i++) {
    final entry = {
      'userId': users[i % users.length],
      'entityTypeCode': typeCodes[i % typeCodes.length],
      'locale': 'pt-BR',
      'answerMethod': 'User Collected',
      'businessUnit': businessUnit[i % businessUnit.length],
      'geometryWKT': "POINT (-47.161, -18.396)"
    };

    data.add(entry);
  }

  return data;
}