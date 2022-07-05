Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FF45677BA
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 21:25:05 +0200 (CEST)
Received: from localhost ([::1]:45150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8oAS-0007WE-6X
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 15:25:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1o8o0G-0001uh-SB; Tue, 05 Jul 2022 15:14:32 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:58479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1o8o02-000174-LO; Tue, 05 Jul 2022 15:14:32 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id D5CDE580309;
 Tue,  5 Jul 2022 15:14:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 05 Jul 2022 15:14:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1657048456; x=
 1657052056; bh=hxF/vM8XoFEaZUayWsoZDgQCyBHDgo/Eu61B3q9nLNI=; b=W
 cJeUxOdADRMleO3mP2XKhdLKVSeKot3lRYAjnoht7Uz7ucfUjQ2PqyYPBSpztVF2
 49QZ5wU1FdxV22YIqByMFm75OEYscOoaQOQr3mb0Y1x1cKgI7EJsrShv8r/ohXfo
 GaAaspLihimuEUvoVgHYG3DGDZcaMwT8u/cfd/jvzrHwhgNG/rhDKhNy6yYiEAp6
 rKYRXAMybogsszRnqmgNxW6IPxBm/D97HBcIgeJBwWVMJqTB3XFL/D9zU2HdncWG
 EbKj/U001VTSU7qZZJ5OFBuMETroGsmOA3ShteJ7GLYD4OjnVpjP7vKPX7o+cjCF
 teFaLSaL6S/HFE3MmRO9g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=i9e814621.fm2; t=
 1657048456; x=1657052056; bh=hxF/vM8XoFEaZUayWsoZDgQCyBHDgo/Eu61
 B3q9nLNI=; b=OKYX9x934ktdh1Za4fMST4R8ZfpgIVtJnfkMM1oBci70WVqgx8W
 no2btuNnZwfWs/9AXwHkom9TOGryPDPRAdrSLny5CQvYsHSEEYud8Hgznf0u9wRT
 Vz3HPdEgho5mrc352EldPtyw+aYWAY/GWJrYgte9nnQX0ZTDK2Ui/41EBAe952SZ
 XK62A+HO4lGRSuRNQrRnFpEswpgqiXM5RlzQe4I409T3Cs58qYgi/vOkSVllivGo
 9zC3I8jojTFamnZkeWzlppsiCwvNDnJY+v0kCt5PCFAW5zoC8yTDgbMbqIpe3Vus
 af1bE0ZNLkXi/mBDpC4zqw/P4XiU9JdtfIA==
X-ME-Sender: <xms:iI3EYooZ9yeoK8khzVBlGfIJF5xY-UaIygqsZaZzQd68QtqWik1TmQ>
 <xme:iI3EYur3VYRIziYJsxHpOd8HViJefdtsAvq-A7BHCDM32of3YvI8mqvL6xFUMOGER
 FviDqGvgkXERQm7gkc>
X-ME-Received: <xmr:iI3EYtMibwQtlw744dwaMbEru0TvCdiSK8wOVLVwBgSbIukF0W7svYiyknPhBg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeiuddgudeflecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enmhhishhsihhnghcuvffquchfihgvlhguucdlfedtmdenucfjughrpefhvfevufffkffo
 jghfgggtgfesthekredtredtjeenucfhrhhomheprfgvthgvrhcuffgvlhgvvhhorhihrg
 hsuceophgvthgvrhesphhjugdruggvvheqnecuggftrfgrthhtvghrnhepvdfhveevhfdt
 vdeuveduleevtdeihedvjeejueevtddugeejieelteehkefggeegnecuvehluhhsthgvrh
 fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgvthgvrhesphhjugdruggv
 vh
X-ME-Proxy: <xmx:iI3EYv7RAhb_8usjlus7PUq5_v-vbiBGZEV3rDmVhgzKxJ25wrPyNg>
 <xmx:iI3EYn5hSf45ksL9zxl1SiNfhwUox99Ydb5lK6gCntzlMzcoQNn4mg>
 <xmx:iI3EYvhS5NesHsvML7j8YcUCVORBscc1m8VI7Ie-jkoBZLwOFQOUKg>
 <xmx:iI3EYtQCUPoqdsgIUihPnSxsorynuScyoW0JJylOqHml9ni_AQ2eyA>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 5 Jul 2022 15:14:16 -0400 (EDT)
From: Peter Delevoryas <peter@pjd.dev>
To: 
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Delevoryas <peter@pjd.dev>, Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v2 7/9] aspeed: fby35: Add a bootrom for the BMC
Date: Tue,  5 Jul 2022 12:13:58 -0700
Message-Id: <20220705191400.41632-8-peter@pjd.dev>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220705191400.41632-1-peter@pjd.dev>
References: <20220705191400.41632-1-peter@pjd.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.229; envelope-from=peter@pjd.dev;
 helo=new3-smtp.messagingengine.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cédric Le Goater <clg@kaod.org>

The BMC boots from the first flash device by fetching instructions
from the flash contents. Add an alias region on 0x0 for this
purpose. There are currently performance issues with this method (TBs
being flushed too often), so as a faster alternative, install the
flash contents as a ROM in the BMC memory space.

See commit 1a15311a12fa ("hw/arm/aspeed: add a 'execute-in-place'
property to boot directly from CE0")

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Peter Delevoryas <peter@pjd.dev>
---
 hw/arm/fby35.c | 83 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/hw/arm/fby35.c b/hw/arm/fby35.c
index 5c5224d374..d3edfa3b10 100644
--- a/hw/arm/fby35.c
+++ b/hw/arm/fby35.c
@@ -9,6 +9,7 @@
 #include "qemu/units.h"
 #include "qapi/error.h"
 #include "sysemu/sysemu.h"
+#include "sysemu/block-backend.h"
 #include "hw/boards.h"
 #include "hw/arm/aspeed_soc.h"
 
@@ -23,12 +24,49 @@ struct Fby35State {
     MemoryRegion bmc_boot_rom;
 
     AspeedSoCState bmc;
+
+    bool mmio_exec;
 };
 
 #define FBY35_BMC_RAM_SIZE (2 * GiB)
+#define FBY35_BMC_FIRMWARE_ADDR 0x0
+
+static void fby35_bmc_write_boot_rom(DriveInfo *dinfo, MemoryRegion *mr,
+                                     hwaddr offset, size_t rom_size,
+                                     Error **errp)
+{
+    BlockBackend *blk = blk_by_legacy_dinfo(dinfo);
+    g_autofree void *storage = NULL;
+    int64_t size;
+
+    /*
+     * The block backend size should have already been 'validated' by
+     * the creation of the m25p80 object.
+     */
+    size = blk_getlength(blk);
+    if (size <= 0) {
+        error_setg(errp, "failed to get flash size");
+        return;
+    }
+
+    if (rom_size > size) {
+        rom_size = size;
+    }
+
+    storage = g_malloc0(rom_size);
+    if (blk_pread(blk, 0, storage, rom_size) < 0) {
+        error_setg(errp, "failed to read the initial flash content");
+        return;
+    }
+
+    /* TODO: find a better way to install the ROM */
+    memcpy(memory_region_get_ram_ptr(mr) + offset, storage, rom_size);
+}
 
 static void fby35_bmc_init(Fby35State *s)
 {
+    DriveInfo *drive0 = drive_get(IF_MTD, 0, 0);
+
     memory_region_init(&s->bmc_memory, OBJECT(s), "bmc-memory", UINT64_MAX);
     memory_region_init_ram(&s->bmc_dram, OBJECT(s), "bmc-dram",
                            FBY35_BMC_RAM_SIZE, &error_abort);
@@ -48,6 +86,28 @@ static void fby35_bmc_init(Fby35State *s)
     qdev_realize(DEVICE(&s->bmc), NULL, &error_abort);
 
     aspeed_board_init_flashes(&s->bmc.fmc, "n25q00", 2, 0);
+
+    /* Install first FMC flash content as a boot rom. */
+    if (drive0) {
+        AspeedSMCFlash *fl = &s->bmc.fmc.flashes[0];
+        MemoryRegion *boot_rom = g_new(MemoryRegion, 1);
+        uint64_t size = memory_region_size(&fl->mmio);
+
+        if (s->mmio_exec) {
+            memory_region_init_alias(boot_rom, NULL, "aspeed.boot_rom",
+                                     &fl->mmio, 0, size);
+            memory_region_add_subregion(&s->bmc_memory, FBY35_BMC_FIRMWARE_ADDR,
+                                        boot_rom);
+        } else {
+
+            memory_region_init_rom(boot_rom, NULL, "aspeed.boot_rom",
+                                   size, &error_abort);
+            memory_region_add_subregion(&s->bmc_memory, FBY35_BMC_FIRMWARE_ADDR,
+                                        boot_rom);
+            fby35_bmc_write_boot_rom(drive0, boot_rom, FBY35_BMC_FIRMWARE_ADDR,
+                                     size, &error_abort);
+        }
+    }
 }
 
 static void fby35_init(MachineState *machine)
@@ -57,6 +117,22 @@ static void fby35_init(MachineState *machine)
     fby35_bmc_init(s);
 }
 
+
+static bool fby35_get_mmio_exec(Object *obj, Error **errp)
+{
+    return FBY35(obj)->mmio_exec;
+}
+
+static void fby35_set_mmio_exec(Object *obj, bool value, Error **errp)
+{
+    FBY35(obj)->mmio_exec = value;
+}
+
+static void fby35_instance_init(Object *obj)
+{
+    FBY35(obj)->mmio_exec = false;
+}
+
 static void fby35_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -66,6 +142,12 @@ static void fby35_class_init(ObjectClass *oc, void *data)
     mc->no_floppy = 1;
     mc->no_cdrom = 1;
     mc->min_cpus = mc->max_cpus = mc->default_cpus = 2;
+
+    object_class_property_add_bool(oc, "execute-in-place",
+                                   fby35_get_mmio_exec,
+                                   fby35_set_mmio_exec);
+    object_class_property_set_description(oc, "execute-in-place",
+                           "boot directly from CE0 flash device");
 }
 
 static const TypeInfo fby35_types[] = {
@@ -74,6 +156,7 @@ static const TypeInfo fby35_types[] = {
         .parent = TYPE_MACHINE,
         .class_init = fby35_class_init,
         .instance_size = sizeof(Fby35State),
+        .instance_init = fby35_instance_init,
     },
 };
 
-- 
2.37.0


