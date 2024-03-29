#include "DBFile.h"

#include "Comparison.h"
#include "ComparisonEngine.h"
#include "Defs.h"
#include "File.h"
#include "Record.h"
#include "Schema.h"
#include "TwoWayList.h"

// stub file .. replace it with your own DBFile.cc

DBFile::DBFile() = default;

int DBFile::Create(const char *f_path, fType f_type, void *startup) {}

void DBFile::Load(Schema &f_schema, const char *loadpath) {}

int DBFile::Open(const char *f_path) {}

void DBFile::MoveFirst() {}

int DBFile::Close() {}

void DBFile::Add(Record &rec) {}

int DBFile::GetNext(Record &fetchme) {}

int DBFile::GetNext(Record &fetchme, CNF &cnf, Record &literal) {}
