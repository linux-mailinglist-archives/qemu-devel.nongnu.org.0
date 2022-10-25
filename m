Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E1660D1FE
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 18:53:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onN32-0007Et-NA; Tue, 25 Oct 2022 12:45:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1onN2w-00072n-JT; Tue, 25 Oct 2022 12:44:58 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1onN2o-0002G4-Mk; Tue, 25 Oct 2022 12:44:58 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 33F3875A157;
 Tue, 25 Oct 2022 18:44:49 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 12D8D75A154; Tue, 25 Oct 2022 18:44:49 +0200 (CEST)
Message-Id: <4bc0fe74f07321872b141ed66148c67300f4806f.1666715145.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1666715145.git.balaton@eik.bme.hu>
References: <cover.1666715145.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v4 14/19] mac_{old|new}world: Code style fix adding missing
 braces to if-s
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Date: Tue, 25 Oct 2022 18:44:49 +0200 (CEST)
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/ppc/mac_newworld.c | 6 ++++--
 hw/ppc/mac_oldworld.c | 9 ++++++---
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
index 5d2fd69f35..4f5876670f 100644
--- a/hw/ppc/mac_newworld.c
+++ b/hw/ppc/mac_newworld.c
@@ -202,14 +202,16 @@ static void ppc_core99_init(MachineState *machine)
         kernel_size = load_elf(machine->kernel_filename, NULL,
                                translate_kernel_address, NULL, NULL, NULL,
                                NULL, NULL, 1, PPC_ELF_MACHINE, 0, 0);
-        if (kernel_size < 0)
+        if (kernel_size < 0) {
             kernel_size = load_aout(machine->kernel_filename, kernel_base,
                                     machine->ram_size - kernel_base,
                                     bswap_needed, TARGET_PAGE_SIZE);
-        if (kernel_size < 0)
+        }
+        if (kernel_size < 0) {
             kernel_size = load_image_targphys(machine->kernel_filename,
                                               kernel_base,
                                               machine->ram_size - kernel_base);
+        }
         if (kernel_size < 0) {
             error_report("could not load kernel '%s'",
                          machine->kernel_filename);
diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
index e2b5dd0650..eecc54da59 100644
--- a/hw/ppc/mac_oldworld.c
+++ b/hw/ppc/mac_oldworld.c
@@ -160,14 +160,16 @@ static void ppc_heathrow_init(MachineState *machine)
         kernel_size = load_elf(machine->kernel_filename, NULL,
                                translate_kernel_address, NULL, NULL, NULL,
                                NULL, NULL, 1, PPC_ELF_MACHINE, 0, 0);
-        if (kernel_size < 0)
+        if (kernel_size < 0) {
             kernel_size = load_aout(machine->kernel_filename, kernel_base,
                                     machine->ram_size - kernel_base,
                                     bswap_needed, TARGET_PAGE_SIZE);
-        if (kernel_size < 0)
+        }
+        if (kernel_size < 0) {
             kernel_size = load_image_targphys(machine->kernel_filename,
                                               kernel_base,
                                               machine->ram_size - kernel_base);
+        }
         if (kernel_size < 0) {
             error_report("could not load kernel '%s'",
                          machine->kernel_filename);
@@ -290,8 +292,9 @@ static void ppc_heathrow_init(MachineState *machine)
         pci_create_simple(pci_bus, -1, "pci-ohci");
     }
 
-    if (graphic_depth != 15 && graphic_depth != 32 && graphic_depth != 8)
+    if (graphic_depth != 15 && graphic_depth != 32 && graphic_depth != 8) {
         graphic_depth = 15;
+    }
 
     /* No PCI init: the BIOS will do it */
 
-- 
2.30.4


