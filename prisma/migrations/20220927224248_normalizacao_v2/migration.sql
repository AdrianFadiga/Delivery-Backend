/*
  Warnings:

  - You are about to drop the column `totalPrice` on the `order_products` table. All the data in the column will be lost.
  - You are about to drop the column `category_id` on the `products` table. All the data in the column will be lost.
  - You are about to drop the column `email` on the `restaurants` table. All the data in the column will be lost.
  - You are about to drop the column `address_id` on the `users` table. All the data in the column will be lost.
  - You are about to drop the `menus` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `product_categories` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `product_category` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[email]` on the table `users` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `unit_price` to the `order_products` table without a default value. This is not possible if the table is not empty.
  - Added the required column `total_price` to the `orders` table without a default value. This is not possible if the table is not empty.
  - Added the required column `restaurantId` to the `products` table without a default value. This is not possible if the table is not empty.
  - Added the required column `email` to the `users` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `menus` DROP FOREIGN KEY `menus_product_id_fkey`;

-- DropForeignKey
ALTER TABLE `menus` DROP FOREIGN KEY `menus_restaurant_id_fkey`;

-- DropForeignKey
ALTER TABLE `product_categories` DROP FOREIGN KEY `product_categories_category_id_fkey`;

-- DropForeignKey
ALTER TABLE `products` DROP FOREIGN KEY `products_category_id_fkey`;

-- DropForeignKey
ALTER TABLE `users` DROP FOREIGN KEY `users_address_id_fkey`;

-- AlterTable
ALTER TABLE `order_products` DROP COLUMN `totalPrice`,
    ADD COLUMN `unit_price` DOUBLE NOT NULL;

-- AlterTable
ALTER TABLE `orders` ADD COLUMN `total_price` DOUBLE NOT NULL;

-- AlterTable
ALTER TABLE `products` DROP COLUMN `category_id`,
    ADD COLUMN `restaurantId` VARCHAR(30) NOT NULL;

-- AlterTable
ALTER TABLE `restaurants` DROP COLUMN `email`;

-- AlterTable
ALTER TABLE `users` DROP COLUMN `address_id`,
    ADD COLUMN `email` VARCHAR(30) NOT NULL;

-- DropTable
DROP TABLE `menus`;

-- DropTable
DROP TABLE `product_categories`;

-- DropTable
DROP TABLE `product_category`;

-- CreateTable
CREATE TABLE `user_address` (
    `userId` VARCHAR(30) NOT NULL,
    `addressId` VARCHAR(30) NOT NULL,

    PRIMARY KEY (`userId`, `addressId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `BusinessAssociate` (
    `restaurantId` VARCHAR(30) NOT NULL,
    `email` VARCHAR(30) NOT NULL,
    `password` VARCHAR(30) NOT NULL,

    UNIQUE INDEX `BusinessAssociate_email_key`(`email`),
    PRIMARY KEY (`restaurantId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateIndex
CREATE UNIQUE INDEX `users_email_key` ON `users`(`email`);

-- AddForeignKey
ALTER TABLE `user_address` ADD CONSTRAINT `user_address_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `user_address` ADD CONSTRAINT `user_address_addressId_fkey` FOREIGN KEY (`addressId`) REFERENCES `addresses`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `BusinessAssociate` ADD CONSTRAINT `BusinessAssociate_restaurantId_fkey` FOREIGN KEY (`restaurantId`) REFERENCES `restaurants`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `products` ADD CONSTRAINT `products_restaurantId_fkey` FOREIGN KEY (`restaurantId`) REFERENCES `restaurants`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
