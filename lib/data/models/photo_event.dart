enum PhotoEventType { created, deleted }

class PhotoEvent {
  const PhotoEvent({
    required this.id,
    required this.type,
    required this.timestamp,
  });

  final String id;
  final PhotoEventType type;
  final DateTime timestamp;
}
