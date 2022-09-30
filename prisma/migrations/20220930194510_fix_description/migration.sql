/*
  Warnings:

  - You are about to drop the column `description` on the `addresses` table. All the data in the column will be lost.
  - Added the required column `complement` to the `addresses` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `addresses` DROP COLUMN `description`,
    ADD COLUMN `complement` VARCHAR(20) NOT NULL;
