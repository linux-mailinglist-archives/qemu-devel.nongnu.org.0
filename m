Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F245F2CB732
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 09:30:59 +0100 (CET)
Received: from localhost ([::1]:38772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkNXO-0001xH-Kk
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 03:30:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCG-0002k8-Mk
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCA-0003dD-0v
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606896541;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7v1c1Y/CO/FVC9XD/b7GDAnIOXuSob78kEqFGJQZL7c=;
 b=T6+COZKEL130kjcaHyJlB3QCXemkCTCgKLgVTQCjaoam2hVn6CJ1ro9geBjrv4+HM8zfOg
 MjFRZ+mrOqVxl4N30l142ohaZorN7WIy5vareJVBeF1DWIBhBIoJkpZKAEbPXEMQbwT+I9
 sMrF+AkbzogDCRwvbKN96/muQbOMpOA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-213-UkPxoZ5FPWG6y6Hwb_74TA-1; Wed, 02 Dec 2020 03:08:59 -0500
X-MC-Unique: UkPxoZ5FPWG6y6Hwb_74TA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BE8018558E7
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:08:58 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8C5145C1B4
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:08:58 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 022/113] arm: remove bios_name
Date: Wed,  2 Dec 2020 03:07:18 -0500
Message-Id: <20201202080849.4125477-23-pbonzini@redhat.com>
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

Get the firmware name from the MachineState object.

Cc: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20201026143028.3034018-4-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/arm/cubieboard.c     | 2 +-
 hw/arm/highbank.c       | 8 ++++----
 hw/arm/npcm7xx_boards.c | 5 +----
 hw/arm/orangepi.c       | 2 +-
 hw/arm/sbsa-ref.c       | 2 ++
 hw/arm/vexpress.c       | 8 ++++----
 hw/arm/virt.c           | 2 ++
 7 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/hw/arm/cubieboard.c b/hw/arm/cubieboard.c
index 1c6c792eb6..9d0d728180 100644
--- a/hw/arm/cubieboard.c
+++ b/hw/arm/cubieboard.c
@@ -40,7 +40,7 @@ static void cubieboard_init(MachineState *machine)
     DeviceState *carddev;
 
     /* BIOS is not supported by this board */
-    if (bios_name) {
+    if (machine->firmware) {
         error_report("BIOS not supported for this machine");
         exit(1);
     }
diff --git a/hw/arm/highbank.c b/hw/arm/highbank.c
index f71087860d..fd3429720e 100644
--- a/hw/arm/highbank.c
+++ b/hw/arm/highbank.c
@@ -297,16 +297,16 @@ static void calxeda_init(MachineState *machine, enum cxmachines machine_id)
     memory_region_init_ram(sysram, NULL, "highbank.sysram", 0x8000,
                            &error_fatal);
     memory_region_add_subregion(sysmem, 0xfff88000, sysram);
-    if (bios_name != NULL) {
-        sysboot_filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, bios_name);
+    if (machine->firmware != NULL) {
+        sysboot_filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, machine->firmware);
         if (sysboot_filename != NULL) {
             if (load_image_targphys(sysboot_filename, 0xfff88000, 0x8000) < 0) {
-                error_report("Unable to load %s", bios_name);
+                error_report("Unable to load %s", machine->firmware);
                 exit(1);
             }
             g_free(sysboot_filename);
         } else {
-            error_report("Unable to find %s", bios_name);
+            error_report("Unable to find %s", machine->firmware);
             exit(1);
         }
     }
diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index 79e2e2744c..9821013bc6 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -33,13 +33,10 @@ static const char npcm7xx_default_bootrom[] = "npcm7xx_bootrom.bin";
 
 static void npcm7xx_load_bootrom(MachineState *machine, NPCM7xxState *soc)
 {
+    const char *bios_name = machine->firmware ?: npcm7xx_default_bootrom;
     g_autofree char *filename = NULL;
     int ret;
 
-    if (!bios_name) {
-        bios_name = npcm7xx_default_bootrom;
-    }
-
     filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, bios_name);
     if (!filename) {
         error_report("Could not find ROM image '%s'", bios_name);
diff --git a/hw/arm/orangepi.c b/hw/arm/orangepi.c
index 17a568a2b4..d6306dfdda 100644
--- a/hw/arm/orangepi.c
+++ b/hw/arm/orangepi.c
@@ -41,7 +41,7 @@ static void orangepi_init(MachineState *machine)
     DeviceState *carddev;
 
     /* BIOS is not supported by this board */
-    if (bios_name) {
+    if (machine->firmware) {
         error_report("BIOS not supported for this machine");
         exit(1);
     }
diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 7d9e180c0d..c3a31f5b8b 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -301,6 +301,7 @@ static bool sbsa_firmware_init(SBSAMachineState *sms,
                                MemoryRegion *sysmem,
                                MemoryRegion *secure_sysmem)
 {
+    const char *bios_name;
     int i;
     BlockBackend *pflash_blk0;
 
@@ -314,6 +315,7 @@ static bool sbsa_firmware_init(SBSAMachineState *sms,
 
     pflash_blk0 = pflash_cfi01_get_blk(sms->flash[0]);
 
+    bios_name = MACHINE(sms)->firmware;
     if (bios_name) {
         char *fname;
         MemoryRegion *mr;
diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
index 531f3a122a..1adb663d77 100644
--- a/hw/arm/vexpress.c
+++ b/hw/arm/vexpress.c
@@ -560,7 +560,7 @@ static void vexpress_common_init(MachineState *machine)
     /*
      * If a bios file was provided, attempt to map it into memory
      */
-    if (bios_name) {
+    if (machine->firmware) {
         char *fn;
         int image_size;
 
@@ -570,16 +570,16 @@ static void vexpress_common_init(MachineState *machine)
                          "but you cannot use both options at once");
             exit(1);
         }
-        fn = qemu_find_file(QEMU_FILE_TYPE_BIOS, bios_name);
+        fn = qemu_find_file(QEMU_FILE_TYPE_BIOS, machine->firmware);
         if (!fn) {
-            error_report("Could not find ROM image '%s'", bios_name);
+            error_report("Could not find ROM image '%s'", machine->firmware);
             exit(1);
         }
         image_size = load_image_targphys(fn, map[VE_NORFLASH0],
                                          VEXPRESS_FLASH_SIZE);
         g_free(fn);
         if (image_size < 0) {
-            error_report("Could not load ROM image '%s'", bios_name);
+            error_report("Could not load ROM image '%s'", machine->firmware);
             exit(1);
         }
     }
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 27dbeb549e..9c54eea585 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1047,6 +1047,7 @@ static bool virt_firmware_init(VirtMachineState *vms,
                                MemoryRegion *secure_sysmem)
 {
     int i;
+    const char *bios_name;
     BlockBackend *pflash_blk0;
 
     /* Map legacy -drive if=pflash to machine properties */
@@ -1059,6 +1060,7 @@ static bool virt_firmware_init(VirtMachineState *vms,
 
     pflash_blk0 = pflash_cfi01_get_blk(vms->flash[0]);
 
+    bios_name = MACHINE(vms)->firmware;
     if (bios_name) {
         char *fname;
         MemoryRegion *mr;
-- 
2.26.2



