/*
  Warnings:

  - A unique constraint covering the columns `[phone_number]` on the table `users` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateTable
CREATE TABLE `restaurant_phones` (
    `restaurantId` VARCHAR(30) NOT NULL,
    `phoneId` VARCHAR(30) NOT NULL,

    PRIMARY KEY (`restaurantId`, `phoneId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `phone` (
    `id` VARCHAR(191) NOT NULL,
    `phoneNumber` VARCHAR(15) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateIndex
CREATE UNIQUE INDEX `users_phone_number_key` ON `users`(`phone_number`);

-- AddForeignKey
ALTER TABLE `users` ADD CONSTRAINT `users_phone_number_fkey` FOREIGN KEY (`phone_number`) REFERENCES `phone`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `restaurant_phones` ADD CONSTRAINT `restaurant_phones_restaurantId_fkey` FOREIGN KEY (`restaurantId`) REFERENCES `restaurants`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `restaurant_phones` ADD CONSTRAINT `restaurant_phones_phoneId_fkey` FOREIGN KEY (`phoneId`) REFERENCES `phone`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
