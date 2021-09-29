Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F35A41C1FE
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 11:49:59 +0200 (CEST)
Received: from localhost ([::1]:51484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVWDu-0005fp-NR
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 05:49:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mVVtX-0001qs-DL
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 05:28:55 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:37493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mVVtS-0005lZ-Um
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 05:28:55 -0400
Received: from quad ([82.142.21.142]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MTiDV-1mO8Qm1QOz-00U3Kg; Wed, 29
 Sep 2021 11:28:49 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 10/20] nubus-device: remove nubus_register_rom() and
 nubus_register_format_block()
Date: Wed, 29 Sep 2021 11:28:33 +0200
Message-Id: <20210929092843.2686234-11-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210929092843.2686234-1-laurent@vivier.eu>
References: <20210929092843.2686234-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:1qjO7kYPFavm1y5qjijn/PFMSLM6lICoAObLuNoVbTt9OEDz2cx
 gJPkhiUoofiBnqIvLn5bwEdl3tj38D0A0ypszYAthwGrGrgBMphJQIz7FZxlq7HKqGxFWCL
 IbtIabecu5ggvdQbZjZgdcDkIi69tPHcfOkp0VhNA11Jv5wosR4ZW26QcBpvE0hIdRDv2OM
 52R0bIGM2Xum1K9Ptas/Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:UkybBEZF+FE=:kx2EFP+LFk7HAi92+wPcCc
 doCQ15hdP0H+tFgBWgJ7UWvEu1ecl7oaFeIzssufE0sXMV8CxMunm5YsSz/OClPGFF55jE6hh
 d6GZW7GocGs70Z/VY3bUyEJxhn6GbZ3rwMN6u/HlyVZM6JQEIyN+42L5G5nELOZv7uSCSkmEz
 7sBMlqPDq+9W+OjQas+6ggBvZlNCe8s0pBaC8zYCCbKuml5zLBoCJVJHmKo1xl3NW74OlgcnJ
 erlMIOFkV+LAIehtTonzX6VKWxM8ZOaj+8k0jUjaCc6ZI+bjIT2RHS+kWy/CfgKsAvsFte53Q
 M9XjWCshgSvx8CI+fGK0l/KOVBhRFYdEaEU0iif/NUumjZPgSbBdf1vici89Y5e2sGXiI71s2
 lPBI3UIiXKA4xaJfIJO3RZfHfYTt7xWkKiZo6Vq3Vuc+xHDG6OAV0Kp/tkIazuSxh9TPI+eEs
 zR89BPGEZ/awvEXmRTVuezsgLX6/cY4uGmlKc4kySZqsiVe46FQLLgz2NKXealWEgYZSNmplo
 4UQlSBHVUzZ4JZWwkTwhKfXMYNSG+ay9nHgwwpbjxhoYrGIVAbuVfMfoaHlRRRdeLGNYjmIuo
 H/grCXdolvyCecfmJUie4QluasMWhbYQ6R6IsNRWx1um3BoFTbyBH9YEw7P4roYdRYNiq2FBc
 p2cXbOdJjfcoArs6Nh9A4pM4Q+1Dfz+TSDxDAw0lh8nqj9p/pNRz3v8H1Q4h47YsfJQdeccvQ
 QqGzwYn6gAOuZI6JZ0LGUS8HqcniAc2T2GzIyQ==
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Since there is no need to generate a dummy declaration ROM, remove both
nubus_register_rom() and nubus_register_format_block(). These will shortly be
replaced with a mechanism to optionally load a declaration ROM from disk to
allow real images to be used within QEMU.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20210924073808.1041-11-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 include/hw/nubus/nubus.h |  19 ------
 hw/nubus/nubus-device.c  | 143 ---------------------------------------
 2 files changed, 162 deletions(-)

diff --git a/include/hw/nubus/nubus.h b/include/hw/nubus/nubus.h
index 3eea2952d553..187ecc00a576 100644
--- a/include/hw/nubus/nubus.h
+++ b/include/hw/nubus/nubus.h
@@ -44,25 +44,6 @@ struct NubusDevice {
     int32_t slot;
     MemoryRegion super_slot_mem;
     MemoryRegion slot_mem;
-
-    /* Format Block */
-
-    MemoryRegion fblock_io;
-
-    uint32_t rom_length;
-    uint32_t rom_crc;
-    uint8_t rom_rev;
-    uint8_t rom_format;
-    uint8_t byte_lanes;
-    int32_t directory_offset;
-
-    /* ROM */
-
-    MemoryRegion rom_io;
-    const uint8_t *rom;
 };
 
-void nubus_register_rom(NubusDevice *dev, const uint8_t *rom, uint32_t size,
-                        int revision, int format, uint8_t byte_lanes);
-
 #endif
diff --git a/hw/nubus/nubus-device.c b/hw/nubus/nubus-device.c
index 516b13d2d53d..d4932d64a278 100644
--- a/hw/nubus/nubus-device.c
+++ b/hw/nubus/nubus-device.c
@@ -13,147 +13,6 @@
 #include "qapi/error.h"
 
 
-/* The Format Block Structure */
-
-#define FBLOCK_DIRECTORY_OFFSET 0
-#define FBLOCK_LENGTH           4
-#define FBLOCK_CRC              8
-#define FBLOCK_REVISION_LEVEL   12
-#define FBLOCK_FORMAT           13
-#define FBLOCK_TEST_PATTERN     14
-#define FBLOCK_RESERVED         18
-#define FBLOCK_BYTE_LANES       19
-
-#define FBLOCK_SIZE             20
-#define FBLOCK_PATTERN_VAL      0x5a932bc7
-
-static uint64_t nubus_fblock_read(void *opaque, hwaddr addr, unsigned int size)
-{
-    NubusDevice *dev = opaque;
-    uint64_t val;
-
-#define BYTE(v, b) (((v) >> (24 - 8 * (b))) & 0xff)
-    switch (addr) {
-    case FBLOCK_BYTE_LANES:
-        val = dev->byte_lanes;
-        val |= (val ^ 0xf) << 4;
-        break;
-    case FBLOCK_RESERVED:
-        val = 0x00;
-        break;
-    case FBLOCK_TEST_PATTERN...FBLOCK_TEST_PATTERN + 3:
-        val = BYTE(FBLOCK_PATTERN_VAL, addr - FBLOCK_TEST_PATTERN);
-        break;
-    case FBLOCK_FORMAT:
-        val = dev->rom_format;
-        break;
-    case FBLOCK_REVISION_LEVEL:
-        val = dev->rom_rev;
-        break;
-    case FBLOCK_CRC...FBLOCK_CRC + 3:
-        val = BYTE(dev->rom_crc, addr - FBLOCK_CRC);
-        break;
-    case FBLOCK_LENGTH...FBLOCK_LENGTH + 3:
-        val = BYTE(dev->rom_length, addr - FBLOCK_LENGTH);
-        break;
-    case FBLOCK_DIRECTORY_OFFSET...FBLOCK_DIRECTORY_OFFSET + 3:
-        val = BYTE(dev->directory_offset, addr - FBLOCK_DIRECTORY_OFFSET);
-        break;
-    default:
-        val = 0;
-        break;
-    }
-    return val;
-}
-
-static void nubus_fblock_write(void *opaque, hwaddr addr, uint64_t val,
-                               unsigned int size)
-{
-    /* read only */
-}
-
-static const MemoryRegionOps nubus_format_block_ops = {
-    .read = nubus_fblock_read,
-    .write = nubus_fblock_write,
-    .endianness = DEVICE_BIG_ENDIAN,
-    .valid = {
-        .min_access_size = 1,
-        .max_access_size = 1,
-    }
-};
-
-static void nubus_register_format_block(NubusDevice *dev)
-{
-    char *fblock_name;
-
-    fblock_name = g_strdup_printf("nubus-slot-%d-format-block",
-                                  dev->slot);
-
-    hwaddr fblock_offset = memory_region_size(&dev->slot_mem) - FBLOCK_SIZE;
-    memory_region_init_io(&dev->fblock_io, NULL, &nubus_format_block_ops,
-                          dev, fblock_name, FBLOCK_SIZE);
-    memory_region_add_subregion(&dev->slot_mem, fblock_offset,
-                                &dev->fblock_io);
-
-    g_free(fblock_name);
-}
-
-static void mac_nubus_rom_write(void *opaque, hwaddr addr, uint64_t val,
-                                       unsigned int size)
-{
-    /* read only */
-}
-
-static uint64_t mac_nubus_rom_read(void *opaque, hwaddr addr,
-                                    unsigned int size)
-{
-    NubusDevice *dev = opaque;
-
-    return dev->rom[addr];
-}
-
-static const MemoryRegionOps mac_nubus_rom_ops = {
-    .read  = mac_nubus_rom_read,
-    .write = mac_nubus_rom_write,
-    .endianness = DEVICE_BIG_ENDIAN,
-    .valid = {
-        .min_access_size = 1,
-        .max_access_size = 1,
-    },
-};
-
-
-void nubus_register_rom(NubusDevice *dev, const uint8_t *rom, uint32_t size,
-                        int revision, int format, uint8_t byte_lanes)
-{
-    hwaddr rom_offset;
-    char *rom_name;
-
-    /* FIXME : really compute CRC */
-    dev->rom_length = 0;
-    dev->rom_crc = 0;
-
-    dev->rom_rev = revision;
-    dev->rom_format = format;
-
-    dev->byte_lanes = byte_lanes;
-    dev->directory_offset = -size;
-
-    /* ROM */
-
-    dev->rom = rom;
-    rom_name = g_strdup_printf("nubus-slot-%d-rom", dev->slot);
-    memory_region_init_io(&dev->rom_io, NULL, &mac_nubus_rom_ops,
-                          dev, rom_name, size);
-    memory_region_set_readonly(&dev->rom_io, true);
-
-    rom_offset = memory_region_size(&dev->slot_mem) - FBLOCK_SIZE +
-                 dev->directory_offset;
-    memory_region_add_subregion(&dev->slot_mem, rom_offset, &dev->rom_io);
-
-    g_free(rom_name);
-}
-
 static void nubus_device_realize(DeviceState *dev, Error **errp)
 {
     NubusBus *nubus = NUBUS_BUS(qdev_get_parent_bus(dev));
@@ -179,8 +38,6 @@ static void nubus_device_realize(DeviceState *dev, Error **errp)
     memory_region_add_subregion(&nubus->slot_io, slot_offset,
                                 &nd->slot_mem);
     g_free(name);
-
-    nubus_register_format_block(nd);
 }
 
 static Property nubus_device_properties[] = {
-- 
2.31.1


