import '../backend/backend.dart';
import '../components/delete_musica_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class EscMusicaIpanemaWidget extends StatefulWidget {
  const EscMusicaIpanemaWidget({Key key}) : super(key: key);

  @override
  _EscMusicaIpanemaWidgetState createState() => _EscMusicaIpanemaWidgetState();
}

class _EscMusicaIpanemaWidgetState extends State<EscMusicaIpanemaWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 70,
          icon: Icon(
            Icons.chevron_left,
            color: FlutterFlowTheme.of(context).secondaryColor,
            size: 40,
          ),
          onPressed: () async {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'ESC DA MUSICA',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Advent Sans',
                color: Colors.white,
                useGoogleFonts: false,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 2,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Ativos:',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Advent Sans',
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      useGoogleFonts: false,
                                    ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                      child: StreamBuilder<List<IpanemaMusicaRecord>>(
                        stream: queryIpanemaMusicaRecord(
                          queryBuilder: (ipanemaMusicaRecord) =>
                              ipanemaMusicaRecord.where('ativo',
                                  isEqualTo: true),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50,
                                height: 50,
                                child: SpinKitRing(
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  size: 50,
                                ),
                              ),
                            );
                          }
                          List<IpanemaMusicaRecord>
                              columnIpanemaMusicaRecordList = snapshot.data;
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children: List.generate(
                                columnIpanemaMusicaRecordList.length,
                                (columnIndex) {
                              final columnIpanemaMusicaRecord =
                                  columnIpanemaMusicaRecordList[columnIndex];
                              return Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Card(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          InkWell(
                                            onLongPress: () async {
                                              await showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Colors.transparent,
                                                context: context,
                                                builder: (context) {
                                                  return Padding(
                                                    padding:
                                                        MediaQuery.of(context)
                                                            .viewInsets,
                                                    child: Container(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.5,
                                                      child: DeleteMusicaWidget(
                                                        ipanemaMusica:
                                                            columnIpanemaMusicaRecord
                                                                .reference,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(5, 5, 5, 5),
                                                  child: Image.network(
                                                    valueOrDefault<String>(
                                                      columnIpanemaMusicaRecord
                                                          .img,
                                                      'https://i.ibb.co/cC6RmGZ/businessman.png',
                                                    ),
                                                    width: 100,
                                                    height: 100,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(5, 0, 0, 0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            'NOME: ',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Advent Sans',
                                                                  color: Colors
                                                                      .white,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                          Text(
                                                            valueOrDefault<
                                                                String>(
                                                              columnIpanemaMusicaRecord
                                                                  .nome,
                                                              'S/ Nome',
                                                            ).maybeHandleOverflow(
                                                              maxChars: 20,
                                                              replacement: '???',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Advent Sans',
                                                                  color: Color(
                                                                      0xFFDBDBDB),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                      Divider(
                                                        height: 10,
                                                        color:
                                                            Color(0xFFD4D4D4),
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            'DATA: ',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Advent Sans',
                                                                  color: Colors
                                                                      .white,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                          Text(
                                                            valueOrDefault<
                                                                String>(
                                                              dateTimeFormat(
                                                                  'd/M/y',
                                                                  columnIpanemaMusicaRecord
                                                                      .data),
                                                              'S/ Data',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Advent Sans',
                                                                  color: Color(
                                                                      0xFFDBDBDB),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10,
                                                                        0,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                dateTimeFormat(
                                                                    'EEEE',
                                                                    columnIpanemaMusicaRecord
                                                                        .data),
                                                                'S/ Dia',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Advent Sans',
                                                                    color: Color(
                                                                        0xFFF9F9F9),
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            'WhatsApp: ',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Advent Sans',
                                                                  color: Colors
                                                                      .white,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                          AutoSizeText(
                                                            valueOrDefault<
                                                                String>(
                                                              columnIpanemaMusicaRecord
                                                                  .whatsapp,
                                                              'S/ Whats',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Advent Sans',
                                                                  color: Color(
                                                                      0xFFD4D4D4),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            'Igreja: ',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Advent Sans',
                                                                  color: Colors
                                                                      .white,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                          Text(
                                                            valueOrDefault<
                                                                String>(
                                                              columnIpanemaMusicaRecord
                                                                  .igreja,
                                                              'S/ Igreja',
                                                            ).maybeHandleOverflow(
                                                              maxChars: 20,
                                                              replacement: '???',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Advent Sans',
                                                                  color: Color(
                                                                      0xFFDBDBDB),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Hist??rico:',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Advent Sans',
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      useGoogleFonts: false,
                                    ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                      child: StreamBuilder<List<IpanemaMusicaRecord>>(
                        stream: queryIpanemaMusicaRecord(
                          queryBuilder: (ipanemaMusicaRecord) =>
                              ipanemaMusicaRecord.where('ativo',
                                  isEqualTo: false),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50,
                                height: 50,
                                child: SpinKitRing(
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  size: 50,
                                ),
                              ),
                            );
                          }
                          List<IpanemaMusicaRecord>
                              columnIpanemaMusicaRecordList = snapshot.data;
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children: List.generate(
                                columnIpanemaMusicaRecordList.length,
                                (columnIndex) {
                              final columnIpanemaMusicaRecord =
                                  columnIpanemaMusicaRecordList[columnIndex];
                              return Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Card(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(5, 5, 5, 5),
                                                child: Image.network(
                                                  valueOrDefault<String>(
                                                    columnIpanemaMusicaRecord
                                                        .img,
                                                    'https://i.ibb.co/cC6RmGZ/businessman.png',
                                                  ),
                                                  width: 100,
                                                  height: 100,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(5, 0, 0, 0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          'NOME: ',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Advent Sans',
                                                                color: Colors
                                                                    .white,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                        ),
                                                        Text(
                                                          valueOrDefault<
                                                              String>(
                                                            columnIpanemaMusicaRecord
                                                                .nome,
                                                            'S/ Nome',
                                                          ).maybeHandleOverflow(
                                                            maxChars: 20,
                                                            replacement: '???',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Advent Sans',
                                                                color: Color(
                                                                    0xFFDBDBDB),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                    Divider(
                                                      height: 10,
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          'DATA: ',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Advent Sans',
                                                                color: Colors
                                                                    .white,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                        ),
                                                        Text(
                                                          valueOrDefault<
                                                              String>(
                                                            dateTimeFormat(
                                                                'd/M/y',
                                                                columnIpanemaMusicaRecord
                                                                    .data),
                                                            'S/ Data',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Advent Sans',
                                                                color: Color(
                                                                    0xFFDBDBDB),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(10,
                                                                      0, 0, 0),
                                                          child: Text(
                                                            valueOrDefault<
                                                                String>(
                                                              dateTimeFormat(
                                                                  'EEEE',
                                                                  columnIpanemaMusicaRecord
                                                                      .data),
                                                              'S/ Dia',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Advent Sans',
                                                                  color: Color(
                                                                      0xFFF9F9F9),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          'WhatsApp: ',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Advent Sans',
                                                                color: Colors
                                                                    .white,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                        ),
                                                        AutoSizeText(
                                                          valueOrDefault<
                                                              String>(
                                                            columnIpanemaMusicaRecord
                                                                .whatsapp,
                                                            'S/ Whats',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Advent Sans',
                                                                color: Color(
                                                                    0xFFD4D4D4),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          'Igreja: ',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Advent Sans',
                                                                color: Colors
                                                                    .white,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                        ),
                                                        Text(
                                                          valueOrDefault<
                                                              String>(
                                                            columnIpanemaMusicaRecord
                                                                .igreja,
                                                            'S/ Igreja',
                                                          ).maybeHandleOverflow(
                                                            maxChars: 20,
                                                            replacement: '???',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Advent Sans',
                                                                color: Color(
                                                                    0xFFDBDBDB),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
