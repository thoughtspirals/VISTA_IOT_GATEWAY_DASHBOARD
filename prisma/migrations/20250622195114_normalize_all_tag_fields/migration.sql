/*
  Warnings:

  - You are about to drop the column `address` on the `CalculationTag` table. All the data in the column will be lost.
  - You are about to drop the column `dataType` on the `CalculationTag` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "IOTag" ADD COLUMN "clampToHigh" BOOLEAN;
ALTER TABLE "IOTag" ADD COLUMN "clampToLow" BOOLEAN;
ALTER TABLE "IOTag" ADD COLUMN "clampToZero" BOOLEAN;
ALTER TABLE "IOTag" ADD COLUMN "conversionType" TEXT;
ALTER TABLE "IOTag" ADD COLUMN "defaultValue" INTEGER;
ALTER TABLE "IOTag" ADD COLUMN "formula" TEXT;
ALTER TABLE "IOTag" ADD COLUMN "lengthBit" INTEGER;
ALTER TABLE "IOTag" ADD COLUMN "offset" REAL;
ALTER TABLE "IOTag" ADD COLUMN "readWrite" TEXT;
ALTER TABLE "IOTag" ADD COLUMN "registerType" TEXT;
ALTER TABLE "IOTag" ADD COLUMN "scale" REAL;
ALTER TABLE "IOTag" ADD COLUMN "scaleType" TEXT;
ALTER TABLE "IOTag" ADD COLUMN "scanRate" INTEGER;
ALTER TABLE "IOTag" ADD COLUMN "spanHigh" INTEGER;
ALTER TABLE "IOTag" ADD COLUMN "spanLow" INTEGER;
ALTER TABLE "IOTag" ADD COLUMN "startBit" INTEGER;

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
    "period" INTEGER,
    "readWrite" TEXT,
    "spanHigh" INTEGER,
    "spanLow" INTEGER,
    "isParent" BOOLEAN,
    "description" TEXT
);
INSERT INTO "new_CalculationTag" ("description", "formula", "id", "name") SELECT "description", "formula", "id", "name" FROM "CalculationTag";
DROP TABLE "CalculationTag";
ALTER TABLE "new_CalculationTag" RENAME TO "CalculationTag";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
