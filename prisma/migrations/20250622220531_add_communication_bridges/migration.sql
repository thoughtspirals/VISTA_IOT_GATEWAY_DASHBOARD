-- CreateTable
CREATE TABLE "CommunicationBridge" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- CreateTable
CREATE TABLE "BridgeBlock" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "bridgeId" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "subType" TEXT,
    "label" TEXT NOT NULL,
    "configJson" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "BridgeBlock_bridgeId_fkey" FOREIGN KEY ("bridgeId") REFERENCES "CommunicationBridge" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
