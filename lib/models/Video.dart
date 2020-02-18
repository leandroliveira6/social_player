class Video {
  String _title;
  String _subtitle;
  String _url;
  bool _viewed;
  bool _selected;

  Video(){
    _title = 'Nenhum vídeo selecionado';
  }

  Video.fromJson(Map<String, dynamic> json) {
    _title = json['title'] ?? 'Vídeo sem título';
    _subtitle = json['subtitle'];
    _url = json['url'];
    _viewed = json['viewed'];
    _selected = false;
  }

  get title => _title;
  get subtitle => _subtitle;
  get url => _url;
  get viewed => _viewed;
  set viewed(newValue) => _viewed = true;
  get selected => _selected;
  set selected(newValue) => _selected = newValue;
}
