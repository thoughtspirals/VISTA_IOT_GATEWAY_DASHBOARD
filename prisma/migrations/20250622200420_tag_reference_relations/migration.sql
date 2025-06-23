-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_CalculationTag" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "defaultValue" INTEGER,
    "formula" TEXT,
    "a" TEXT,
    "b" TEXT,
    "c" TEXT,
    "d" TEXT,
    "e" TEXT,
    "f" TEXT,
    "g" TEXT,
    "h" TEXT,
    "aTagId" TEXT,
    "bTagId" TEXT,
    "cTagId" TEXT,
    "dTagId" TEXT,
    "eTagId" TEXT,
    "fTagId" TEXT,
    "gTagId" TEXT,
    "hTagId" TEXT,
    "period" INTEGER,
    "readWrite" TEXT,
    "spanHigh" INTEGER,
    "spanLow" INTEGER,
    "isParent" BOOLEAN,
    "description" TEXT,
    CONSTRAINT "CalculationTag_aTagId_fkey" FOREIGN KEY ("aTagId") REFERENCES "IOTag" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "CalculationTag_bTagId_fkey" FOREIGN KEY ("bTagId") REFERENCES "IOTag" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "CalculationTag_cTagId_fkey" FOREIGN KEY ("cTagId") REFERENCES "IOTag" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "CalculationTag_dTagId_fkey" FOREIGN KEY ("dTagId") REFERENCES "IOTag" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "CalculationTag_eTagId_fkey" FOREIGN KEY ("eTagId") REFERENCES "IOTag" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "CalculationTag_fTagId_fkey" FOREIGN KEY ("fTagId") REFERENCES "IOTag" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "CalculationTag_gTagId_fkey" FOREIGN KEY ("gTagId") REFERENCES "IOTag" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "CalculationTag_hTagId_fkey" FOREIGN KEY ("hTagId") REFERENCES "IOTag" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "new_CalculationTag" ("a", "b", "c", "d", "defaultValue", "description", "e", "f", "formula", "g", "h", "id", "isParent", "name", "period", "readWrite", "spanHigh", "spanLow") SELECT "a", "b", "c", "d", "defaultValue", "description", "e", "f", "formula", "g", "h", "id", "isParent", "name", "period", "readWrite", "spanHigh", "spanLow" FROM "CalculationTag";
DROP TABLE "CalculationTag";
ALTER TABLE "new_CalculationTag" RENAME TO "CalculationTag";
CREATE TABLE "new_StatsTag" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "referTag" TEXT,
    "referTagId" TEXT,
    "type" TEXT NOT NULL,
    "updateCycleValue" INTEGER NOT NULL,
    "updateCycleUnit" TEXT NOT NULL,
    "description" TEXT,
    CONSTRAINT "StatsTag_referTagId_fkey" FOREIGN KEY ("referTagId") REFERENCES "IOTag" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "new_StatsTag" ("description", "id", "name", "referTag", "type", "updateCycleUnit", "updateCycleValue") SELECT "description", "id", "name", "referTag", "type", "updateCycleUnit", "updateCycleValue" FROM "StatsTag";
DROP TABLE "StatsTag";
ALTER TABLE "new_StatsTag" RENAME TO "StatsTag";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
