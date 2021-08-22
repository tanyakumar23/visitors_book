

final String tableBook = 'books';

class BookFields {
  static final List<String> values = [
    id, name, address, comments,  createdTime
  ];

  static final String id = '_id';
  static final String name = 'name';
  static final String  comments= 'comments';
  static final String address = 'address';

  static final String selfpicURL = 'selfpicURL';
 static final String sigURL = 'sigURL';

  static final String createdTime = 'time';
}

class Book {
  final int? id;
  final String name;
  final String comments;
  final String address;
 final String selfpicURL;
 final String sigURL;
  final String createdTime;

  const Book({
    this.id,
    required this.name,
    required this.comments,
    required this.address,
    required this.selfpicURL,
   required this.sigURL,
    required this.createdTime,
  });

  Book copy({
    int? id,
    String? name,
    String? comments,
    String? address,
   String? selfpicURL,
    String? sigURL,
    String? createdTime,
  }) =>
      Book(
        id: id ?? this.id,
        name: name ?? this.name,
        comments: comments ?? this.comments,
        address: address ?? this.address,
       selfpicURL: selfpicURL ?? this.selfpicURL,
        sigURL: sigURL ?? this.sigURL,
        createdTime: createdTime ?? this.createdTime,
      );

  static Book fromJson(Map<String, Object?> json) => Book(
    id: json[BookFields.id] as int?,
    name: json[BookFields.name] as String,
    comments: json[BookFields.comments] as String,
    address: json[BookFields.address] as String,
   selfpicURL: json[BookFields.selfpicURL] as String,
    sigURL: json[BookFields.sigURL] as String,

    createdTime: json[BookFields.createdTime] as String,
  );

  Map<String, Object?> toJson() => {
    BookFields.id: id,
    BookFields.name: name,
    BookFields.comments: comments,
    BookFields.address: address,
    BookFields.selfpicURL: selfpicURL,
    BookFields.sigURL: sigURL,

    BookFields.createdTime: createdTime,
  };
}
