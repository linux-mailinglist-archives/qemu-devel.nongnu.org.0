Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 568C42CB696
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 09:17:40 +0100 (CET)
Received: from localhost ([::1]:58398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkNKV-0003Fe-CI
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 03:17:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCF-0002iA-V1
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47325)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCA-0003df-JH
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606896541;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fJNsc0uru4MYIxpz/WguOFYyNs1HGSX834CXTR2DuUU=;
 b=jTaWbO/nKwn2YjEPK4LaGbJ3vLwm3UNbQcGRxGK/xZC0dvpFYZ/RvxpLkhQMt4tKwQbqHY
 MDwNb4zfeci6nA1bhbm4uVROueTxk+6q3enJVUX/lORRUUuoOk0BkOpt3Cu1rH892Xtjr6
 U/AY4PAM7X0h6bVwKFIwGqxMRJVVAt8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-28-JVQBH1V1OPWtU_tGDZU_TQ-1; Wed, 02 Dec 2020 03:09:00 -0500
X-MC-Unique: JVQBH1V1OPWtU_tGDZU_TQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 758231006C81
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:08:59 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2F5AF5C1B4
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:08:59 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 024/113] i386: remove bios_name
Date: Wed,  2 Dec 2020 03:07:20 -0500
Message-Id: <20201202080849.4125477-25-pbonzini@redhat.com>
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
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20201026143028.3034018-6-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/i386/microvm.c     |  7 +++----
 hw/i386/pc_sysfw.c    |  4 ++--
 hw/i386/x86.c         | 10 ++++------
 include/hw/i386/x86.h |  3 ++-
 4 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index 5428448b70..6cda3014d6 100644
--- a/hw/i386/microvm.c
+++ b/hw/i386/microvm.c
@@ -154,6 +154,7 @@ static void create_gpex(MicrovmMachineState *mms)
 
 static void microvm_devices_init(MicrovmMachineState *mms)
 {
+    const char *default_firmware;
     X86MachineState *x86ms = X86_MACHINE(mms);
     ISABus *isa_bus;
     ISADevice *rtc_state;
@@ -259,12 +260,10 @@ static void microvm_devices_init(MicrovmMachineState *mms)
         serial_hds_isa_init(isa_bus, 0, 1);
     }
 
-    if (bios_name == NULL) {
-        bios_name = x86_machine_is_acpi_enabled(x86ms)
+    default_firmware = x86_machine_is_acpi_enabled(x86ms)
             ? MICROVM_BIOS_FILENAME
             : MICROVM_QBOOT_FILENAME;
-    }
-    x86_bios_rom_init(get_system_memory(), true);
+    x86_bios_rom_init(MACHINE(mms), default_firmware, get_system_memory(), true);
 }
 
 static void microvm_memory_init(MicrovmMachineState *mms)
diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
index b6c0822fe3..0187f0a934 100644
--- a/hw/i386/pc_sysfw.c
+++ b/hw/i386/pc_sysfw.c
@@ -222,7 +222,7 @@ void pc_system_firmware_init(PCMachineState *pcms,
     BlockBackend *pflash_blk[ARRAY_SIZE(pcms->flash)];
 
     if (!pcmc->pci_enabled) {
-        x86_bios_rom_init(rom_memory, true);
+        x86_bios_rom_init(MACHINE(pcms), "bios.bin", rom_memory, true);
         return;
     }
 
@@ -243,7 +243,7 @@ void pc_system_firmware_init(PCMachineState *pcms,
 
     if (!pflash_blk[0]) {
         /* Machine property pflash0 not set, use ROM mode */
-        x86_bios_rom_init(rom_memory, false);
+        x86_bios_rom_init(MACHINE(pcms), "bios.bin", rom_memory, false);
     } else {
         if (kvm_enabled() && !kvm_readonly_mem_enabled()) {
             /*
diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 6d5c1432f2..54c9d0c019 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -55,8 +55,6 @@
 #include CONFIG_DEVICES
 #include "kvm_i386.h"
 
-#define BIOS_FILENAME "bios.bin"
-
 /* Physical Address of PVH entry point read from kernel ELF NOTE */
 static size_t pvh_start_addr;
 
@@ -1053,17 +1051,17 @@ void x86_load_linux(X86MachineState *x86ms,
     nb_option_roms++;
 }
 
-void x86_bios_rom_init(MemoryRegion *rom_memory, bool isapc_ram_fw)
+void x86_bios_rom_init(MachineState *ms, const char *default_firmware,
+                       MemoryRegion *rom_memory, bool isapc_ram_fw)
 {
+    const char *bios_name;
     char *filename;
     MemoryRegion *bios, *isa_bios;
     int bios_size, isa_bios_size;
     int ret;
 
     /* BIOS load */
-    if (bios_name == NULL) {
-        bios_name = BIOS_FILENAME;
-    }
+    bios_name = ms->firmware ?: default_firmware;
     filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, bios_name);
     if (filename) {
         bios_size = get_image_size(filename);
diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
index 739fac5087..a8db6b1f24 100644
--- a/include/hw/i386/x86.h
+++ b/include/hw/i386/x86.h
@@ -101,7 +101,8 @@ void x86_cpu_unplug_request_cb(HotplugHandler *hotplug_dev,
 void x86_cpu_unplug_cb(HotplugHandler *hotplug_dev,
                        DeviceState *dev, Error **errp);
 
-void x86_bios_rom_init(MemoryRegion *rom_memory, bool isapc_ram_fw);
+void x86_bios_rom_init(MachineState *ms, const char *default_firmware,
+                       MemoryRegion *rom_memory, bool isapc_ram_fw);
 
 void x86_load_linux(X86MachineState *x86ms,
                     FWCfgState *fw_cfg,
-- 
2.26.2



