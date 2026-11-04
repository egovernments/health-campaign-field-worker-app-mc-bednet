String? usableId(String? raw) {
  final value = raw?.trim();
  if (value == null || value.isEmpty) return null;

  final normalized = value.toLowerCase();
  if (normalized == 'unknown' || normalized == 'null') return null;

  return value;
}
