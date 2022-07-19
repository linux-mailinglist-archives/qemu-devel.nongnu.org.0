Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 533D357A677
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 20:26:32 +0200 (CEST)
Received: from localhost ([::1]:55220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDrvS-0007Oa-79
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 14:26:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oDrX8-0007Qo-0g
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 14:01:22 -0400
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c]:47070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oDrX4-0006HJ-Oh
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 14:01:21 -0400
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-1013ecaf7e0so32903000fac.13
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 11:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lcoMAJFCYYhmQFfIeGE7S78JEuxyw6Fp8UVyRfifIjg=;
 b=x+6cGZ29VG5xPD95VwjuCN/i/TMmTzduAigZRL5AQCuIn+2yqZlcqsQ1GKg2sMfdYm
 IhRMBwKr4+WL7+bRRTgo+tCY/PvNFSVPyM5QHJLTzddJyq3uwBOB1Lw8CABQI+8DP10i
 LfvD9OUJqzvCAom+Apjm+HE5mWcRaChb9z9Ab+5G0LcHucGuM4lkmbLOw65vsuz9j5wn
 I3j5ucAcymkLm48gUiNptv6d5UPd7MDQk2asP0/OEYIbIf0/ngTrMoBSQivGozrsvHCs
 fVGT5S8NAYSCZIcqxBJkpl8824lspIzmlbEgTAJ6wwIi0yhSt2mVOlI9C/O50aXYcnyt
 IYbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lcoMAJFCYYhmQFfIeGE7S78JEuxyw6Fp8UVyRfifIjg=;
 b=PMNVQtP5JWXx1iKXtlu2ZPEfCXlQZOypl1nc8UWYBc1wlZMILrqtf9jhlYLCkNLSTZ
 EDoO/vrzqx2glEm3Mp3BP/81ahL8kT+pMg8A1wHZ0pSLI+5SAEss+q/ul05bhZeq+UN4
 OkF21TPpS6IYkDWxpe/0es7Ud8VogrSAUxAogEvdOrlLzr8gOpA1xW/mRWd86KA/u2Sw
 8xGjughUCvgmkx0eOwkrFtNre8ecLPanBfmhUV+hR8Y2tsW7ysekHvKCvi2Dk8z0O7uH
 0+WWgGefL6VIJq9plEK1meDxo5rjAYfYAr41yfJw/exU3pVZ1os0qpgy+Q4/Zhv5UNf6
 KV8A==
X-Gm-Message-State: AJIora+cgbGy7lxt3JcKVvahb8rC653EdyNVZbAh4rCTtsqmQRGtX5HM
 VQyIh2cgCJ6XcGVCakMsDZ9sCmy6w9np9uUY
X-Google-Smtp-Source: AGRyM1tPUK9/LR9ewtPOJljH0NBXPvF8VK1mn7Yseosh4XGFUH/p/AY2T7J19TNLnRbVFOqUBT1g/g==
X-Received: by 2002:a05:6871:80a:b0:10b:e1fa:17a with SMTP id
 q10-20020a056871080a00b0010be1fa017amr365759oap.262.1658253677511; 
 Tue, 19 Jul 2022 11:01:17 -0700 (PDT)
Received: from stoup.. ([172.58.110.182]) by smtp.gmail.com with ESMTPSA id
 c25-20020a4ae259000000b0035eb4e5a6cesm6286747oot.36.2022.07.19.11.01.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 11:01:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Subject: [PULL 16/21] hw/loongarch: Add fw_cfg table support
Date: Tue, 19 Jul 2022 23:29:55 +0530
Message-Id: <20220719180000.378186-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220719180000.378186-1-richard.henderson@linaro.org>
References: <20220719180000.378186-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Xiaojuan Yang <yangxiaojuan@loongson.cn>

Add fw_cfg table for loongarch virt machine, including memmap table.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Message-Id: <20220712083206.4187715-2-yangxiaojuan@loongson.cn>
[rth: Replace fprintf with assert; drop unused return value;
      initialize reserved slot to zero.]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/loongarch/fw_cfg.h       | 15 ++++++++++++++
 include/hw/loongarch/virt.h |  3 +++
 hw/loongarch/fw_cfg.c       | 33 +++++++++++++++++++++++++++++
 hw/loongarch/loongson3.c    | 41 ++++++++++++++++++++++++++++++++++++-
 hw/loongarch/meson.build    |  3 +++
 5 files changed, 94 insertions(+), 1 deletion(-)
 create mode 100644 hw/loongarch/fw_cfg.h
 create mode 100644 hw/loongarch/fw_cfg.c

diff --git a/hw/loongarch/fw_cfg.h b/hw/loongarch/fw_cfg.h
new file mode 100644
index 0000000000..7c0de4db4a
--- /dev/null
+++ b/hw/loongarch/fw_cfg.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * QEMU fw_cfg helpers (LoongArch specific)
+ *
+ * Copyright (C) 2021 Loongson Technology Corporation Limited
+ */
+
+#ifndef HW_LOONGARCH_FW_CFG_H
+#define HW_LOONGARCH_FW_CFG_H
+
+#include "hw/boards.h"
+#include "hw/nvram/fw_cfg.h"
+
+FWCfgState *loongarch_fw_cfg_init(ram_addr_t ram_size, MachineState *ms);
+#endif
diff --git a/include/hw/loongarch/virt.h b/include/hw/loongarch/virt.h
index 09a816191c..9fec1f8a5c 100644
--- a/include/hw/loongarch/virt.h
+++ b/include/hw/loongarch/virt.h
@@ -17,6 +17,7 @@
 
 #define LOONGARCH_ISA_IO_BASE   0x18000000UL
 #define LOONGARCH_ISA_IO_SIZE   0x0004000
+#define VIRT_FWCFG_BASE         0x1e020000UL
 
 struct LoongArchMachineState {
     /*< private >*/
@@ -26,6 +27,8 @@ struct LoongArchMachineState {
     MemoryRegion lowmem;
     MemoryRegion highmem;
     MemoryRegion isa_io;
+    /* State for other subsystems/APIs: */
+    FWCfgState  *fw_cfg;
 };
 
 #define TYPE_LOONGARCH_MACHINE  MACHINE_TYPE_NAME("virt")
diff --git a/hw/loongarch/fw_cfg.c b/hw/loongarch/fw_cfg.c
new file mode 100644
index 0000000000..f6503d5607
--- /dev/null
+++ b/hw/loongarch/fw_cfg.c
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * QEMU fw_cfg helpers (LoongArch specific)
+ *
+ * Copyright (C) 2021 Loongson Technology Corporation Limited
+ */
+
+#include "qemu/osdep.h"
+#include "hw/loongarch/fw_cfg.h"
+#include "hw/loongarch/virt.h"
+#include "hw/nvram/fw_cfg.h"
+#include "sysemu/sysemu.h"
+
+static void fw_cfg_boot_set(void *opaque, const char *boot_device,
+                            Error **errp)
+{
+    fw_cfg_modify_i16(opaque, FW_CFG_BOOT_DEVICE, boot_device[0]);
+}
+
+FWCfgState *loongarch_fw_cfg_init(ram_addr_t ram_size, MachineState *ms)
+{
+    FWCfgState *fw_cfg;
+    int max_cpus = ms->smp.max_cpus;
+    int smp_cpus = ms->smp.cpus;
+
+    fw_cfg = fw_cfg_init_mem_wide(VIRT_FWCFG_BASE + 8, VIRT_FWCFG_BASE, 8, 0, NULL);
+    fw_cfg_add_i16(fw_cfg, FW_CFG_MAX_CPUS, (uint16_t)max_cpus);
+    fw_cfg_add_i64(fw_cfg, FW_CFG_RAM_SIZE, (uint64_t)ram_size);
+    fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, (uint16_t)smp_cpus);
+
+    qemu_register_boot_set(fw_cfg_boot_set, fw_cfg);
+    return fw_cfg;
+}
diff --git a/hw/loongarch/loongson3.c b/hw/loongarch/loongson3.c
index 15fddfc4f5..9ee7450252 100644
--- a/hw/loongarch/loongson3.c
+++ b/hw/loongarch/loongson3.c
@@ -28,13 +28,40 @@
 #include "hw/pci-host/ls7a.h"
 #include "hw/pci-host/gpex.h"
 #include "hw/misc/unimp.h"
-
+#include "hw/loongarch/fw_cfg.h"
 #include "target/loongarch/cpu.h"
 
 #define PM_BASE 0x10080000
 #define PM_SIZE 0x100
 #define PM_CTRL 0x10
 
+struct memmap_entry {
+    uint64_t address;
+    uint64_t length;
+    uint32_t type;
+    uint32_t reserved;
+};
+
+static struct memmap_entry *memmap_table;
+static unsigned memmap_entries;
+
+static void memmap_add_entry(uint64_t address, uint64_t length, uint32_t type)
+{
+    /* Ensure there are no duplicate entries. */
+    for (unsigned i = 0; i < memmap_entries; i++) {
+        assert(memmap_table[i].address != address);
+    }
+
+    memmap_table = g_renew(struct memmap_entry, memmap_table,
+                           memmap_entries + 1);
+    memmap_table[memmap_entries].address = cpu_to_le64(address);
+    memmap_table[memmap_entries].length = cpu_to_le64(length);
+    memmap_table[memmap_entries].type = cpu_to_le32(type);
+    memmap_table[memmap_entries].reserved = 0;
+    memmap_entries++;
+}
+
+
 /*
  * This is a placeholder for missing ACPI,
  * and will eventually be replaced.
@@ -331,15 +358,27 @@ static void loongarch_init(MachineState *machine)
                              machine->ram, 0, 256 * MiB);
     memory_region_add_subregion(address_space_mem, offset, &lams->lowmem);
     offset += 256 * MiB;
+    memmap_add_entry(0, 256 * MiB, 1);
     highram_size = ram_size - 256 * MiB;
     memory_region_init_alias(&lams->highmem, NULL, "loongarch.highmem",
                              machine->ram, offset, highram_size);
     memory_region_add_subregion(address_space_mem, 0x90000000, &lams->highmem);
+    memmap_add_entry(0x90000000, highram_size, 1);
     /* Add isa io region */
     memory_region_init_alias(&lams->isa_io, NULL, "isa-io",
                              get_system_io(), 0, LOONGARCH_ISA_IO_SIZE);
     memory_region_add_subregion(address_space_mem, LOONGARCH_ISA_IO_BASE,
                                 &lams->isa_io);
+    /* fw_cfg init */
+    lams->fw_cfg = loongarch_fw_cfg_init(ram_size, machine);
+    rom_set_fw(lams->fw_cfg);
+
+    if (lams->fw_cfg != NULL) {
+        fw_cfg_add_file(lams->fw_cfg, "etc/memmap",
+                        memmap_table,
+                        sizeof(struct memmap_entry) * (memmap_entries));
+    }
+
     if (kernel_filename) {
         loaderparams.ram_size = ram_size;
         loaderparams.kernel_filename = kernel_filename;
diff --git a/hw/loongarch/meson.build b/hw/loongarch/meson.build
index cecb1a5d65..81131c9237 100644
--- a/hw/loongarch/meson.build
+++ b/hw/loongarch/meson.build
@@ -1,4 +1,7 @@
 loongarch_ss = ss.source_set()
+loongarch_ss.add(files(
+    'fw_cfg.c',
+))
 loongarch_ss.add(when: 'CONFIG_LOONGARCH_VIRT', if_true: files('loongson3.c'))
 
 hw_arch += {'loongarch': loongarch_ss}
-- 
2.34.1


