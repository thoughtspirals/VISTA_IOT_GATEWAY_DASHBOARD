-- CreateTable
CREATE TABLE "IOPort" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "type" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "scanTime" INTEGER,
    "timeOut" INTEGER,
    "retryCount" INTEGER,
    "autoRecoverTime" INTEGER,
    "scanMode" TEXT,
    "enabled" BOOLEAN NOT NULL DEFAULT true,
    "serialSettings" TEXT
);

-- CreateTable
CREATE TABLE "Device" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "ioPortId" TEXT NOT NULL,
    "enabled" BOOLEAN NOT NULL DEFAULT true,
    "name" TEXT NOT NULL,
    "deviceType" TEXT NOT NULL,
    "unitNumber" INTEGER NOT NULL,
    "tagWriteType" TEXT NOT NULL,
    "description" TEXT,
    "addDeviceNameAsPrefix" BOOLEAN NOT NULL DEFAULT true,
    "useAsciiProtocol" INTEGER NOT NULL DEFAULT 0,
    "packetDelay" INTEGER NOT NULL DEFAULT 20,
    "digitalBlockSize" INTEGER NOT NULL DEFAULT 512,
    "analogBlockSize" INTEGER NOT NULL DEFAULT 64,
    CONSTRAINT "Device_ioPortId_fkey" FOREIGN KEY ("ioPortId") REFERENCES "IOPort" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "IOTag" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "deviceId" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "dataType" TEXT NOT NULL,
    "address" TEXT NOT NULL,
    "description" TEXT,
    CONSTRAINT "IOTag_deviceId_fkey" FOREIGN KEY ("deviceId") REFERENCES "Device" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "UserTag" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "dataType" TEXT NOT NULL,
    "defaultValue" INTEGER NOT NULL,
    "spanHigh" INTEGER NOT NULL,
    "spanLow" INTEGER NOT NULL,
    "readWrite" TEXT NOT NULL,
    "description" TEXT
);

-- CreateTable
CREATE TABLE "CalculationTag" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "dataType" TEXT NOT NULL,
    "address" TEXT NOT NULL,
    "description" TEXT,
    "formula" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "StatsTag" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "referTag" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "updateCycleValue" INTEGER NOT NULL,
    "updateCycleUnit" TEXT NOT NULL,
    "description" TEXT
);

-- CreateTable
CREATE TABLE "SystemTag" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "dataType" TEXT NOT NULL,
    "unit" TEXT NOT NULL,
    "spanHigh" INTEGER NOT NULL,
    "spanLow" INTEGER NOT NULL,
    "description" TEXT
);

-- CreateTable
CREATE TABLE "ConfigSnapshot" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "raw" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
