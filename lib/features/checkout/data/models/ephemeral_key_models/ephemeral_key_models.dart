 
import 'associated_object.dart';

class EphemeralKeyModels {
	String? id;
	String? object;
	List<AssociatedObject>? associatedObjects;
	int? created;
	int? expires;
	bool? livemode;
	String? secret;

	EphemeralKeyModels({
		this.id, 
		this.object, 
		this.associatedObjects, 
		this.created, 
		this.expires, 
		this.livemode, 
		this.secret, 
	});

	factory EphemeralKeyModels.fromJson(Map<String, dynamic> data) {
		return EphemeralKeyModels(
			id: data['id'] as String?,
			object: data['object'] as String?,
			associatedObjects: (data['associated_objects'] as List<dynamic>?)
						?.map((e) => AssociatedObject.fromMap(e as Map<String, dynamic>))
						.toList(),
			created: data['created'] as int?,
			expires: data['expires'] as int?,
			livemode: data['livemode'] as bool?,
			secret: data['secret'] as String?,
		);
	}



	Map<String, dynamic> toJson() => {
				'id': id,
				'object': object,
				'associated_objects': associatedObjects?.map((e) => e.toMap()).toList(),
				'created': created,
				'expires': expires,
				'livemode': livemode,
				'secret': secret,
			};

   
}
