-- CreateTable
CREATE TABLE "Destination" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "description" TEXT,
    "configJson" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL
);

-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_BridgeBlock" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "bridgeId" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "subType" TEXT,
    "label" TEXT NOT NULL,
    "configJson" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "destinationId" TEXT,
    CONSTRAINT "BridgeBlock_bridgeId_fkey" FOREIGN KEY ("bridgeId") REFERENCES "CommunicationBridge" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "BridgeBlock_destinationId_fkey" FOREIGN KEY ("destinationId") REFERENCES "Destination" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "new_BridgeBlock" ("bridgeId", "configJson", "createdAt", "id", "label", "subType", "type") SELECT "bridgeId", "configJson", "createdAt", "id", "label", "subType", "type" FROM "BridgeBlock";
DROP TABLE "BridgeBlock";
ALTER TABLE "new_BridgeBlock" RENAME TO "BridgeBlock";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
