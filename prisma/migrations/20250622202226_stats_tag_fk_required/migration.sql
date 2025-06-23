/*
  Warnings:

  - You are about to drop the column `referTag` on the `StatsTag` table. All the data in the column will be lost.
  - Made the column `referTagId` on table `StatsTag` required. This step will fail if there are existing NULL values in that column.

*/
-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_StatsTag" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "referTagId" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "updateCycleValue" INTEGER NOT NULL,
    "updateCycleUnit" TEXT NOT NULL,
    "description" TEXT,
    CONSTRAINT "StatsTag_referTagId_fkey" FOREIGN KEY ("referTagId") REFERENCES "IOTag" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_StatsTag" ("description", "id", "name", "referTagId", "type", "updateCycleUnit", "updateCycleValue") SELECT "description", "id", "name", "referTagId", "type", "updateCycleUnit", "updateCycleValue" FROM "StatsTag";
DROP TABLE "StatsTag";
ALTER TABLE "new_StatsTag" RENAME TO "StatsTag";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
