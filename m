Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C6C41C1A3
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 11:31:39 +0200 (CEST)
Received: from localhost ([::1]:40898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVVw9-0004H4-P5
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 05:31:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mVVtZ-0001vj-9k
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 05:28:57 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:59073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mVVtX-0005nM-Ka
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 05:28:57 -0400
Received: from quad ([82.142.21.142]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MQ67s-1m9ZAD21Ds-00M7mN; Wed, 29
 Sep 2021 11:28:45 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 02/20] nubus-device: rename slot_nb variable to slot
Date: Wed, 29 Sep 2021 11:28:25 +0200
Message-Id: <20210929092843.2686234-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210929092843.2686234-1-laurent@vivier.eu>
References: <20210929092843.2686234-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:a/wXUPlb9wghCkcWXuczqgnSGPvDffI1Fx07SBqctcSBisffYMP
 pI9cTYiH5qWHKaqS7vTSwe8wASOv6Vgtgd/0vIz34BQt/thiSLL1XrVaNSpId47rx+h9Xa0
 JpJEE0oKQDHOu8H3KO58c00WSCRSkykY8xuSJ2AsnvrWI6Tm7dHt9U8UTEJW8S5G5LHhMwt
 PcgPzRgMm1v/hhPTnHEGQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:idcxgy8Hh8w=:Jz1Hw72JUWBADmS0UlKDMn
 asKIqaJr9/StkwTJlEwSHI261cwO1zB6Qm1R3NCS2nR6fQpI86aCj7lR3D+AqFd+GI7SAOKby
 kq5gc+MWCuRWqV6L/j95WO/cmNrCDxY6BNU1HlmZo5/eUcBxbGs1EdLfeZ0MbI3UFDaN4IvcV
 U/v0lKwnnozjgeBLt4348+m+nBb+4l5IL7ZYLxK5gs8CG356cvzV9KpW7V6iQuHq+ANp+2fPX
 2YL4fktUwV/GdORo+cmZjpArj1BLWW8fZPSpaMELjRqncPbMRQpEgi7WAvH/Gk129tI0160Ct
 deFKbxgBdOKxEUWPvVni1CUFTabX+b49YBfaP75vQ49BqCoRSbHT9Xw1kZQCqA3/hFpEn82zo
 J5Z2Amh/eNLXDLQBcOQkR+O7OBgYAa/QK/En8HckbSEdcxVYbMx3rgamug150raRUVmeMLhvw
 liZOtLmvxFd5ts5zyIeuf6TNoYLsD7bww2xSbSWqHC98llXKt3qZ3ab/jS3O4bhzk9dp4S5V4
 qP5mTkpgTVdMg26wkwntqKIokPk4lvb13QmLyamhznBfOW7/EJimC+3VsMyi2OblfjU9HtSAO
 sKcRkn6IT9mplaE4o3hDkxRA0AsQ9btN861o6QtOQYL9GZuokuOJd4lq9HJmRrrTqnKO8pFuu
 JymdMvqKeQnMLCQ1MQ4XodYUye+3ISw2NR1L+ofw/xWrkJ59cr58ggIpi+WYTke4Myr9npQIQ
 hGoaXo3CLb+jRZdiT3TMSZNofw0dmRSSUaGUFA==
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

This is in preparation for creating a qdev property of the same name.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20210924073808.1041-3-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 include/hw/nubus/nubus.h |  2 +-
 hw/nubus/nubus-device.c  | 14 +++++++-------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/include/hw/nubus/nubus.h b/include/hw/nubus/nubus.h
index e2b5cf260ba9..424309dd730d 100644
--- a/include/hw/nubus/nubus.h
+++ b/include/hw/nubus/nubus.h
@@ -42,7 +42,7 @@ struct NubusBus {
 struct NubusDevice {
     DeviceState qdev;
 
-    int slot_nb;
+    int slot;
     MemoryRegion slot_mem;
 
     /* Format Block */
diff --git a/hw/nubus/nubus-device.c b/hw/nubus/nubus-device.c
index ffe78a882314..be0126956391 100644
--- a/hw/nubus/nubus-device.c
+++ b/hw/nubus/nubus-device.c
@@ -87,7 +87,7 @@ static void nubus_register_format_block(NubusDevice *dev)
     char *fblock_name;
 
     fblock_name = g_strdup_printf("nubus-slot-%d-format-block",
-                                  dev->slot_nb);
+                                  dev->slot);
 
     hwaddr fblock_offset = memory_region_size(&dev->slot_mem) - FBLOCK_SIZE;
     memory_region_init_io(&dev->fblock_io, NULL, &nubus_format_block_ops,
@@ -142,7 +142,7 @@ void nubus_register_rom(NubusDevice *dev, const uint8_t *rom, uint32_t size,
     /* ROM */
 
     dev->rom = rom;
-    rom_name = g_strdup_printf("nubus-slot-%d-rom", dev->slot_nb);
+    rom_name = g_strdup_printf("nubus-slot-%d-rom", dev->slot);
     memory_region_init_io(&dev->rom_io, NULL, &mac_nubus_rom_ops,
                           dev, rom_name, size);
     memory_region_set_readonly(&dev->rom_io, true);
@@ -167,12 +167,12 @@ static void nubus_device_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    nd->slot_nb = nubus->current_slot++;
-    name = g_strdup_printf("nubus-slot-%d", nd->slot_nb);
+    nd->slot = nubus->current_slot++;
+    name = g_strdup_printf("nubus-slot-%d", nd->slot);
 
-    if (nd->slot_nb < NUBUS_FIRST_SLOT) {
+    if (nd->slot < NUBUS_FIRST_SLOT) {
         /* Super */
-        slot_offset = (nd->slot_nb - 6) * NUBUS_SUPER_SLOT_SIZE;
+        slot_offset = (nd->slot - 6) * NUBUS_SUPER_SLOT_SIZE;
 
         memory_region_init(&nd->slot_mem, OBJECT(dev), name,
                            NUBUS_SUPER_SLOT_SIZE);
@@ -180,7 +180,7 @@ static void nubus_device_realize(DeviceState *dev, Error **errp)
                                     &nd->slot_mem);
     } else {
         /* Normal */
-        slot_offset = nd->slot_nb * NUBUS_SLOT_SIZE;
+        slot_offset = nd->slot * NUBUS_SLOT_SIZE;
 
         memory_region_init(&nd->slot_mem, OBJECT(dev), name, NUBUS_SLOT_SIZE);
         memory_region_add_subregion(&nubus->slot_io, slot_offset,
-- 
2.31.1


