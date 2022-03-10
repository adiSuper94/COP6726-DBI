#include <gtest/gtest.h>
#include "../BigQ.h"
#include "testHelper.h"


string fileName = "tmpBigQ.bin";
string nationBin = "/home/adisuper/Courses/DBI/Project/tpch-dbgen/uf/nation.bin";

TEST(HelloTest, BasicAssertions) {
  // Expect two strings not to be equal.
  EXPECT_STRNE("hello", "world");
  // Expect equality.
  EXPECT_EQ(7 * 6, 42);
}

TEST(BigQTestSuite, init)
{
    File* file = BigQ::initFile();
    EXPECT_EQ(isFileOnFS(fileName), true);
    delete file;
    remove(fileName.c_str());
}

TEST(BigQTestSuite, cleanup){
    tpmms_args args = get_tpmms_args();
    File* file = BigQ::initFile();
    vector<class Run> runs;
    class Run run(file, 0, 0);
    runs.push_back(run);
    BigQ::cleanUp(file, &args, runs);
    EXPECT_EQ(isFileOnFS(fileName), false);
    EXPECT_EQ(runs.size(), 0);
}


