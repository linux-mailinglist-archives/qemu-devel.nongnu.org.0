Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB07A50803D
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 06:41:02 +0200 (CEST)
Received: from localhost ([::1]:56170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nh29F-0006mh-Ae
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 00:41:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nh27d-00066h-4f
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 00:39:21 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:54159)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nh27b-0002PU-5m
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 00:39:20 -0400
Received: by mail-pj1-x1036.google.com with SMTP id bx5so808419pjb.3
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 21:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pgP71pYBztRqit0i6RL2WmB5E/Aq2jO12ieki3/XDQ4=;
 b=34zi/g3MeF6t4zt9kQ9nUjvVjJ+8PRJshfQnPepSrS3c2LgNaB+Mrwvw0mPIw/KtPz
 XUnaB0cVtWJPXUXJRWpMVRFxvyPwH7XbSmwSJQKogPtEgMLW73FvBbYB09p+LS9qxHy7
 rkp/6GU2EMnVHlW70Zh6hQZ80cAMaX0VQ4kOIJTV4RwXULoahAJTfutqBtdRD+2XXiDu
 mvmutEEXMD8benrOh4wII7JT08LExzJDDCl4OpYCJlX/MWu1R16bteN4BmGq4DAM92RD
 gLkh4aGU+gfKDPa1C9Bw3gHs31T2IRs06sy5meVVdwq4NjlxFMZjPQ3yV6S4vGPB8gfQ
 b0CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pgP71pYBztRqit0i6RL2WmB5E/Aq2jO12ieki3/XDQ4=;
 b=oMKbp69vyDL5mmu8hkgwzWlPHa0ZDZH40byEdq1aOT7SGAAbYUWuAO/Gadfc6L60Vl
 iB3Ombbc2QiI6LsShCreffkkYNhMoixNNJBfyveRcD+2eK5nHaIYnzSDrKUEIQ8tSkLR
 lssWBPjNm3xQZFmyMlhfyZWC6Z9TWfTSfRsKQnHZ0z9yTSmHAA4xgQSax3XqUbxyvkY2
 VdLykPtCEO2aeMMmwq+PH3QNX7q6tw1E6uGyVbXkUzoPXFbqOb8Lhkfx9bNBidm3zQQh
 H4U+PIimUaOALOsvt4KB3Ib51oP0z5OKLqhFr7y7WzXXA01CfFZTWGUV4uPq2Z8HNEFA
 h0QQ==
X-Gm-Message-State: AOAM531vqlQSqeteSmZm441sLn5lfOknp8QmjBE30XqxJqKr9YqExTsV
 lVRn2cyUv5lyXoX80buzojVajQ==
X-Google-Smtp-Source: ABdhPJw6hsQ4BeEw2Yi2eUCUyIE2Hs+YEsh7gweAc2Z4eOZp4p7g0/zAMur95lA2lE/YlXLOfZsTog==
X-Received: by 2002:a17:90b:4b4e:b0:1d2:fe21:4ce5 with SMTP id
 mi14-20020a17090b4b4e00b001d2fe214ce5mr2219513pjb.241.1650429555814; 
 Tue, 19 Apr 2022 21:39:15 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([203.163.244.2])
 by smtp.googlemail.com with ESMTPSA id
 h13-20020a056a00230d00b004f427ffd485sm19955754pfh.143.2022.04.19.21.39.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 21:39:15 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sergio Lopez <slp@redhat.com>
Subject: [PATCH] hw/i386/e820: remove legacy reserved entries for e820
Date: Wed, 20 Apr 2022 10:09:04 +0530
Message-Id: <20220420043904.1225153-1-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1036;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Ani Sinha <ani@anisinha.ca>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

e820 reserved entries were used before the dynamic entries with fw config files
were intoduced. Please see the following change:
7d67110f2d9a6("pc: add etc/e820 fw_cfg file")

Identical support was introduced into seabios as well with the following commit:
ce39bd4031820 ("Add support for etc/e820 fw_cfg file")

Both the above commits are now quite old. QEMU machines 1.7 and newer no longer
use the reserved entries. Seabios uses fw config files and
dynamic e820 entries by default and only falls back to using reserved entries
when it has to work with old qemu (versions earlier than 1.7). Please see
functions qemu_cfg_e820() and qemu_early_e820(). It is safe to remove legacy
FW_CFG_E820_TABLE and associated code now as QEMU 7.0 has deprecated i440fx
machines 1.7 and older. It would be incredibly rare to run the latest qemu
version with a very old version of seabios that did not support fw config files
for e820.

As far as I could see, edk2/ovfm never supported reserved entries and uses fw
config files from the beginning. So there should be no incompatibilities with
ovfm as well.

CC: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 hw/i386/e820_memory_layout.c | 20 +-------------------
 hw/i386/e820_memory_layout.h |  8 --------
 hw/i386/fw_cfg.c             |  3 ---
 hw/i386/fw_cfg.h             |  1 -
 hw/i386/microvm.c            |  2 --
 5 files changed, 1 insertion(+), 33 deletions(-)

diff --git a/hw/i386/e820_memory_layout.c b/hw/i386/e820_memory_layout.c
index bcf9eaf837..06970ac44a 100644
--- a/hw/i386/e820_memory_layout.c
+++ b/hw/i386/e820_memory_layout.c
@@ -11,29 +11,11 @@
 #include "e820_memory_layout.h"
 
 static size_t e820_entries;
-struct e820_table e820_reserve;
 struct e820_entry *e820_table;
 
 int e820_add_entry(uint64_t address, uint64_t length, uint32_t type)
 {
-    int index = le32_to_cpu(e820_reserve.count);
-    struct e820_entry *entry;
-
-    if (type != E820_RAM) {
-        /* old FW_CFG_E820_TABLE entry -- reservations only */
-        if (index >= E820_NR_ENTRIES) {
-            return -EBUSY;
-        }
-        entry = &e820_reserve.entry[index++];
-
-        entry->address = cpu_to_le64(address);
-        entry->length = cpu_to_le64(length);
-        entry->type = cpu_to_le32(type);
-
-        e820_reserve.count = cpu_to_le32(index);
-    }
-
-    /* new "etc/e820" file -- include ram too */
+    /* new "etc/e820" file -- include ram and reserved entries */
     e820_table = g_renew(struct e820_entry, e820_table, e820_entries + 1);
     e820_table[e820_entries].address = cpu_to_le64(address);
     e820_table[e820_entries].length = cpu_to_le64(length);
diff --git a/hw/i386/e820_memory_layout.h b/hw/i386/e820_memory_layout.h
index 2a0ceb8b9c..daf41cc4b4 100644
--- a/hw/i386/e820_memory_layout.h
+++ b/hw/i386/e820_memory_layout.h
@@ -16,20 +16,12 @@
 #define E820_NVS        4
 #define E820_UNUSABLE   5
 
-#define E820_NR_ENTRIES 16
-
 struct e820_entry {
     uint64_t address;
     uint64_t length;
     uint32_t type;
 } QEMU_PACKED __attribute((__aligned__(4)));
 
-struct e820_table {
-    uint32_t count;
-    struct e820_entry entry[E820_NR_ENTRIES];
-} QEMU_PACKED __attribute((__aligned__(4)));
-
-extern struct e820_table e820_reserve;
 extern struct e820_entry *e820_table;
 
 int e820_add_entry(uint64_t address, uint64_t length, uint32_t type);
diff --git a/hw/i386/fw_cfg.c b/hw/i386/fw_cfg.c
index a283785a8d..72a42f3c66 100644
--- a/hw/i386/fw_cfg.c
+++ b/hw/i386/fw_cfg.c
@@ -36,7 +36,6 @@ const char *fw_cfg_arch_key_name(uint16_t key)
         {FW_CFG_ACPI_TABLES, "acpi_tables"},
         {FW_CFG_SMBIOS_ENTRIES, "smbios_entries"},
         {FW_CFG_IRQ0_OVERRIDE, "irq0_override"},
-        {FW_CFG_E820_TABLE, "e820_table"},
         {FW_CFG_HPET, "hpet"},
     };
 
@@ -127,8 +126,6 @@ FWCfgState *fw_cfg_arch_create(MachineState *ms,
 #endif
     fw_cfg_add_i32(fw_cfg, FW_CFG_IRQ0_OVERRIDE, 1);
 
-    fw_cfg_add_bytes(fw_cfg, FW_CFG_E820_TABLE,
-                     &e820_reserve, sizeof(e820_reserve));
     fw_cfg_add_file(fw_cfg, "etc/e820", e820_table,
                     sizeof(struct e820_entry) * e820_get_num_entries());
 
diff --git a/hw/i386/fw_cfg.h b/hw/i386/fw_cfg.h
index 275f15c1c5..86ca7c1c0c 100644
--- a/hw/i386/fw_cfg.h
+++ b/hw/i386/fw_cfg.h
@@ -17,7 +17,6 @@
 #define FW_CFG_ACPI_TABLES      (FW_CFG_ARCH_LOCAL + 0)
 #define FW_CFG_SMBIOS_ENTRIES   (FW_CFG_ARCH_LOCAL + 1)
 #define FW_CFG_IRQ0_OVERRIDE    (FW_CFG_ARCH_LOCAL + 2)
-#define FW_CFG_E820_TABLE       (FW_CFG_ARCH_LOCAL + 3)
 #define FW_CFG_HPET             (FW_CFG_ARCH_LOCAL + 4)
 
 FWCfgState *fw_cfg_arch_create(MachineState *ms,
diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index 4b3b1dd262..f2101e7293 100644
--- a/hw/i386/microvm.c
+++ b/hw/i386/microvm.c
@@ -324,8 +324,6 @@ static void microvm_memory_init(MicrovmMachineState *mms)
     fw_cfg_add_i16(fw_cfg, FW_CFG_MAX_CPUS, machine->smp.max_cpus);
     fw_cfg_add_i64(fw_cfg, FW_CFG_RAM_SIZE, (uint64_t)machine->ram_size);
     fw_cfg_add_i32(fw_cfg, FW_CFG_IRQ0_OVERRIDE, 1);
-    fw_cfg_add_bytes(fw_cfg, FW_CFG_E820_TABLE,
-                     &e820_reserve, sizeof(e820_reserve));
     fw_cfg_add_file(fw_cfg, "etc/e820", e820_table,
                     sizeof(struct e820_entry) * e820_get_num_entries());
 
-- 
2.25.1


