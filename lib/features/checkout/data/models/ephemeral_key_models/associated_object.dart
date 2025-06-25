import 'dart:convert';

class AssociatedObject {
	String? id;
	String? type;

	AssociatedObject({this.id, this.type});

	factory AssociatedObject.fromMap(Map<String, dynamic> data) {
		return AssociatedObject(
			id: data['id'] as String?,
			type: data['type'] as String?,
		);
	}



	Map<String, dynamic> toMap() => {
				'id': id,
				'type': type,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AssociatedObject].
	factory AssociatedObject.fromJson(String data) {
		return AssociatedObject.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [AssociatedObject] to a JSON string.
	String toJson() => json.encode(toMap());
}
