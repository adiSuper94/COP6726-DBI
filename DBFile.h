#ifndef DBFILE_H
#define DBFILE_H

#include "Comparison.h"
#include "ComparisonEngine.h"
#include "File.h"
#include "Record.h"
#include "Schema.h"
#include "TwoWayList.h"

typedef enum { heap, sorted, tree } fType;

// stub DBFile header..replace it with your own DBFile.h

class DBFile {
 public:
  DBFile();

  int Create(const char *fpath, fType file_type, void *startup);
  int Open(const char *fpath);
  int Close();

  void Load(Schema &myschema, const char *loadpath);

  void MoveFirst();
  void Add(Record &addme);
  int GetNext(Record &fetchme);
  int GetNext(Record &fetchme, CNF &cnf, Record &literal);
};
#endif
