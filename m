Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCE72CB746
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 09:34:28 +0100 (CET)
Received: from localhost ([::1]:47452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkNal-0005nz-A9
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 03:34:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCI-0002pd-Mj
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCB-0003eK-KH
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606896542;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9m2aTFzJ2ivBro39qwIClGgVjFJ3N9HXB+CInwnTWYE=;
 b=cn4fl6bOnDUMGmfWyg8G8+vEC7dCdwyePjCsagmtBZYI6UJ3po+NVkxMS09/UCi+HZThG4
 1a6vAz3jSPrPt4RP24OKDqsJDA+7r4mOzZ26I9cGtyC+WKWTtrFPLiKguEbLQ3ft5lFeTg
 E6WNXRY0HxpALWUKih5GAzHCo/na7NY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-217-s_DSBUkTNOG6t6FSsCDtEA-1; Wed, 02 Dec 2020 03:09:00 -0500
X-MC-Unique: s_DSBUkTNOG6t6FSsCDtEA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 03B7980364D
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:00 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C67FB5C1B4
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:08:59 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 026/113] m68k: remove bios_name
Date: Wed,  2 Dec 2020 03:07:22 -0500
Message-Id: <20201202080849.4125477-27-pbonzini@redhat.com>
In-Reply-To: <20201202080849.4125477-1-pbonzini@redhat.com>
References: <20201202080849.4125477-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc: Laurent Vivier <lvivier@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Acked-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20201026143028.3034018-8-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/m68k/mcf5208.c   | 10 +++++-----
 hw/m68k/next-cube.c |  4 +---
 hw/m68k/q800.c      |  4 +---
 3 files changed, 7 insertions(+), 11 deletions(-)

diff --git a/hw/m68k/mcf5208.c b/hw/m68k/mcf5208.c
index d310a98e7b..7c8ca5ddf6 100644
--- a/hw/m68k/mcf5208.c
+++ b/hw/m68k/mcf5208.c
@@ -301,17 +301,17 @@ static void mcf5208evb_init(MachineState *machine)
     /* 0xfc0a8000 SDRAM controller.  */
 
     /* Load firmware */
-    if (bios_name) {
+    if (machine->firmware) {
         char *fn;
         uint8_t *ptr;
 
-        fn = qemu_find_file(QEMU_FILE_TYPE_BIOS, bios_name);
+        fn = qemu_find_file(QEMU_FILE_TYPE_BIOS, machine->firmware);
         if (!fn) {
-            error_report("Could not find ROM image '%s'", bios_name);
+            error_report("Could not find ROM image '%s'", machine->firmware);
             exit(1);
         }
         if (load_image_targphys(fn, 0x0, ROM_SIZE) < 8) {
-            error_report("Could not load ROM image '%s'", bios_name);
+            error_report("Could not load ROM image '%s'", machine->firmware);
             exit(1);
         }
         g_free(fn);
@@ -323,7 +323,7 @@ static void mcf5208evb_init(MachineState *machine)
 
     /* Load kernel.  */
     if (!kernel_filename) {
-        if (qtest_enabled() || bios_name) {
+        if (qtest_enabled() || machine->firmware) {
             return;
         }
         error_report("Kernel image must be specified");
diff --git a/hw/m68k/next-cube.c b/hw/m68k/next-cube.c
index e7045980b7..37bc35dfa4 100644
--- a/hw/m68k/next-cube.c
+++ b/hw/m68k/next-cube.c
@@ -868,6 +868,7 @@ static void next_cube_init(MachineState *machine)
     MemoryRegion *bmapm1 = g_new(MemoryRegion, 1);
     MemoryRegion *bmapm2 = g_new(MemoryRegion, 1);
     MemoryRegion *sysmem = get_system_memory();
+    const char *bios_name = machine->firmware ?: ROM_FILE;
     NeXTState *ns = NEXT_MACHINE(machine);
     DeviceState *dev;
 
@@ -924,9 +925,6 @@ static void next_cube_init(MachineState *machine)
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, 0x0200e000);
 
     /* Load ROM here */
-    if (bios_name == NULL) {
-        bios_name = ROM_FILE;
-    }
     /* still not sure if the rom should also be mapped at 0x0*/
     memory_region_init_rom(rom, NULL, "next.rom", 0x20000, &error_fatal);
     memory_region_add_subregion(sysmem, 0x01000000, rom);
diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index ce4b47c3e3..6ebcddcfb2 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -167,6 +167,7 @@ static void q800_init(MachineState *machine)
     const char *kernel_filename = machine->kernel_filename;
     const char *initrd_filename = machine->initrd_filename;
     const char *kernel_cmdline = machine->kernel_cmdline;
+    const char *bios_name = machine->firmware ?: MACROM_FILENAME;
     hwaddr parameters_base;
     CPUState *cs;
     DeviceState *dev;
@@ -400,9 +401,6 @@ static void q800_init(MachineState *machine)
         rom = g_malloc(sizeof(*rom));
         memory_region_init_rom(rom, NULL, "m68k_mac.rom", MACROM_SIZE,
                                &error_abort);
-        if (bios_name == NULL) {
-            bios_name = MACROM_FILENAME;
-        }
         filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, bios_name);
         memory_region_add_subregion(get_system_memory(), MACROM_ADDR, rom);
 
-- 
2.26.2



