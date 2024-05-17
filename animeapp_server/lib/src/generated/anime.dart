/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class Anime extends _i1.TableRow {
  Anime._({
    int? id,
    required this.title,
    required this.year,
    required this.imageUrl,
    required this.logline,
    required this.directorName,
  }) : super(id);

  factory Anime({
    int? id,
    required String title,
    required int year,
    required String imageUrl,
    required String logline,
    required String directorName,
  }) = _AnimeImpl;

  factory Anime.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Anime(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      title:
          serializationManager.deserialize<String>(jsonSerialization['title']),
      year: serializationManager.deserialize<int>(jsonSerialization['year']),
      imageUrl: serializationManager
          .deserialize<String>(jsonSerialization['imageUrl']),
      logline: serializationManager
          .deserialize<String>(jsonSerialization['logline']),
      directorName: serializationManager
          .deserialize<String>(jsonSerialization['directorName']),
    );
  }

  static final t = AnimeTable();

  static const db = AnimeRepository._();

  String title;

  int year;

  String imageUrl;

  String logline;

  String directorName;

  @override
  _i1.Table get table => t;

  Anime copyWith({
    int? id,
    String? title,
    int? year,
    String? imageUrl,
    String? logline,
    String? directorName,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'title': title,
      'year': year,
      'imageUrl': imageUrl,
      'logline': logline,
      'directorName': directorName,
    };
  }

  @override
  @Deprecated('Will be removed in 2.0.0')
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'title': title,
      'year': year,
      'imageUrl': imageUrl,
      'logline': logline,
      'directorName': directorName,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      if (id != null) 'id': id,
      'title': title,
      'year': year,
      'imageUrl': imageUrl,
      'logline': logline,
      'directorName': directorName,
    };
  }

  @override
  @Deprecated('Will be removed in 2.0.0')
  void setColumn(
    String columnName,
    value,
  ) {
    switch (columnName) {
      case 'id':
        id = value;
        return;
      case 'title':
        title = value;
        return;
      case 'year':
        year = value;
        return;
      case 'imageUrl':
        imageUrl = value;
        return;
      case 'logline':
        logline = value;
        return;
      case 'directorName':
        directorName = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.find instead.')
  static Future<List<Anime>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AnimeTable>? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Anime>(
      where: where != null ? where(Anime.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.findRow instead.')
  static Future<Anime?> findSingleRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AnimeTable>? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<Anime>(
      where: where != null ? where(Anime.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.findById instead.')
  static Future<Anime?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<Anime>(id);
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteWhere instead.')
  static Future<int> delete(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<AnimeTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Anime>(
      where: where(Anime.t),
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteRow instead.')
  static Future<bool> deleteRow(
    _i1.Session session,
    Anime row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.update instead.')
  static Future<bool> update(
    _i1.Session session,
    Anime row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  @Deprecated(
      'Will be removed in 2.0.0. Use: db.insert instead. Important note: In db.insert, the object you pass in is no longer modified, instead a new copy with the added row is returned which contains the inserted id.')
  static Future<void> insert(
    _i1.Session session,
    Anime row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.count instead.')
  static Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AnimeTable>? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Anime>(
      where: where != null ? where(Anime.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static AnimeInclude include() {
    return AnimeInclude._();
  }

  static AnimeIncludeList includeList({
    _i1.WhereExpressionBuilder<AnimeTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AnimeTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AnimeTable>? orderByList,
    AnimeInclude? include,
  }) {
    return AnimeIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Anime.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Anime.t),
      include: include,
    );
  }
}

class _Undefined {}

class _AnimeImpl extends Anime {
  _AnimeImpl({
    int? id,
    required String title,
    required int year,
    required String imageUrl,
    required String logline,
    required String directorName,
  }) : super._(
          id: id,
          title: title,
          year: year,
          imageUrl: imageUrl,
          logline: logline,
          directorName: directorName,
        );

  @override
  Anime copyWith({
    Object? id = _Undefined,
    String? title,
    int? year,
    String? imageUrl,
    String? logline,
    String? directorName,
  }) {
    return Anime(
      id: id is int? ? id : this.id,
      title: title ?? this.title,
      year: year ?? this.year,
      imageUrl: imageUrl ?? this.imageUrl,
      logline: logline ?? this.logline,
      directorName: directorName ?? this.directorName,
    );
  }
}

class AnimeTable extends _i1.Table {
  AnimeTable({super.tableRelation}) : super(tableName: 'anime') {
    title = _i1.ColumnString(
      'title',
      this,
    );
    year = _i1.ColumnInt(
      'year',
      this,
    );
    imageUrl = _i1.ColumnString(
      'imageUrl',
      this,
    );
    logline = _i1.ColumnString(
      'logline',
      this,
    );
    directorName = _i1.ColumnString(
      'directorName',
      this,
    );
  }

  late final _i1.ColumnString title;

  late final _i1.ColumnInt year;

  late final _i1.ColumnString imageUrl;

  late final _i1.ColumnString logline;

  late final _i1.ColumnString directorName;

  @override
  List<_i1.Column> get columns => [
        id,
        title,
        year,
        imageUrl,
        logline,
        directorName,
      ];
}

@Deprecated('Use AnimeTable.t instead.')
AnimeTable tAnime = AnimeTable();

class AnimeInclude extends _i1.IncludeObject {
  AnimeInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => Anime.t;
}

class AnimeIncludeList extends _i1.IncludeList {
  AnimeIncludeList._({
    _i1.WhereExpressionBuilder<AnimeTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Anime.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Anime.t;
}

class AnimeRepository {
  const AnimeRepository._();

  Future<List<Anime>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AnimeTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AnimeTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AnimeTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.find<Anime>(
      where: where?.call(Anime.t),
      orderBy: orderBy?.call(Anime.t),
      orderByList: orderByList?.call(Anime.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Anime?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AnimeTable>? where,
    int? offset,
    _i1.OrderByBuilder<AnimeTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AnimeTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.findFirstRow<Anime>(
      where: where?.call(Anime.t),
      orderBy: orderBy?.call(Anime.t),
      orderByList: orderByList?.call(Anime.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Anime?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.findById<Anime>(
      id,
      transaction: transaction,
    );
  }

  Future<List<Anime>> insert(
    _i1.Session session,
    List<Anime> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insert<Anime>(
      rows,
      transaction: transaction,
    );
  }

  Future<Anime> insertRow(
    _i1.Session session,
    Anime row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insertRow<Anime>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Anime>> update(
    _i1.Session session,
    List<Anime> rows, {
    _i1.ColumnSelections<AnimeTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.update<Anime>(
      rows,
      columns: columns?.call(Anime.t),
      transaction: transaction,
    );
  }

  Future<Anime> updateRow(
    _i1.Session session,
    Anime row, {
    _i1.ColumnSelections<AnimeTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.updateRow<Anime>(
      row,
      columns: columns?.call(Anime.t),
      transaction: transaction,
    );
  }

  Future<List<int>> delete(
    _i1.Session session,
    List<Anime> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.delete<Anime>(
      rows,
      transaction: transaction,
    );
  }

  Future<int> deleteRow(
    _i1.Session session,
    Anime row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteRow<Anime>(
      row,
      transaction: transaction,
    );
  }

  Future<List<int>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<AnimeTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteWhere<Anime>(
      where: where(Anime.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AnimeTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.count<Anime>(
      where: where?.call(Anime.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
