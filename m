Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC012DDE77
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 07:14:10 +0100 (CET)
Received: from localhost ([::1]:44706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kq91l-0000YS-Fv
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 01:14:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=614e9c0eb=alistair.francis@wdc.com>)
 id 1kq8q1-0005Z9-II
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 01:02:01 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:9928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=614e9c0eb=alistair.francis@wdc.com>)
 id 1kq8pz-0002GJ-Br
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 01:02:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1608271645; x=1639807645;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aMxvCMJADPI6otFNQIx+fwzLZbNlj+QD2cuJyzAVj94=;
 b=j7NE8qn5JiiB7UoNRt72nuYckZo92/F9AnkOjsg8mZbZ21F3K0CLBPf+
 1MLeaRQ4T7eWgXpBoRKuqejQ69b4xme/Tiq1dD4FrMHvQbnZ0dXuD7l7G
 x7UGwlZOhzK8E/rC5q6EzV4iMoT8uX0kgBzsewvulRYHWpnzAZi/JqyQt
 n6qgwiiNEXRBfTwzC+YW/yC7sMhnPAWKD5YQNJMUiuwqoBmgy8ISMVFas
 nJDlhVAM59jg6ZH/tWOlC+HbRX/oS3SPONgfEV6wVpLKwHsk8dO3s8YRF
 aoYO93/CnXxskPoW8tXroB2yxjOPPo0JKBjrLz1ocTm/aGwJj78VZuou6 g==;
IronPort-SDR: zH+5Ees2VminCZ7dVa3ljvy6IYiTXwusBWHYuH+deh6TjqvNkNs1m+n5lfYIo7JmZFGqPxAscl
 dUXi+pVlv7Nn4UMnHl8Nakg3X4+N5DOzcjY8t3jV3zryYiXpmalfOEKeOi+adZBPn5dXliag3Q
 9OJ2Efql8BxN29ZtqHuhl+ZBtz0Od2bzTyFDx90txQZ0nrO4yqLRr23pyBhBh7mJfHrS4F8ewL
 7saOwZXA9aIOMp0JPz65sSCAgTLlZlSP+sdnZPgOMAiarUlbWckSthjlt+e84c5WAuDb0lZku3
 664=
X-IronPort-AV: E=Sophos;i="5.78,429,1599494400"; d="scan'208";a="259237062"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 18 Dec 2020 14:06:31 +0800
IronPort-SDR: DrvaF6Dhudho7N1jk4lS41nuPsIMH7GrNogc6BPQl0GgaiWT6sYYNDKGNDQb7BtCEx6b0/LE2i
 a1fO7UP4eJduTldEh0WL/chlHb3sEN5QbJRlUN9X0LrP9yIV8xaY1rHo2rFYUGXcbG9pX7WP6V
 F+D3dSIaBvzhz/38higpua6n/jHaF+MVL8L0akeOabDrVwTG0Ng1cFQy6sqyXw8czOqqA+6TkY
 P6DY/Wk/KqwVDBe3BgsoR3CP6JgmBWklp5a9O2ZipU6zT75TWsekccl25zieJeDYSyVOHmsaO8
 qkhz+6KhgcfcSLyrYvaHmxaV
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2020 21:46:39 -0800
IronPort-SDR: rZTterxt+llcj0CJS5dD1OmsMbEp4ASZotcFixUrhqkk0rQvcVlU7YILzYBd82t5lu8NSDta8O
 L5MxJOvBqbw0WN5qfsMO3Z9nfsu/qwwOLDP4xrrasDm5blHmPs4M1ZKAVVFHebu2UKbsOtH8lr
 1RPTZAt8b4kqDys0hpSPPlnKMfhhs2s3VzDor7xNIYkHfjO6ULKIz4IDyhnd3ybZENBGfh1C0J
 YXy7aCphDVjmFJ74m2o7eLvblSwkv3HWQlC/6TqEXKWsDSdcOjbGR9j2QAhgZUeZVhWovaEwEo
 BK4=
WDCIronportException: Internal
Received: from 6hj08h2.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.62.68])
 by uls-op-cesaip01.wdc.com with ESMTP; 17 Dec 2020 22:01:23 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 14/23] hw/riscv: sifive_u: Remove compile time XLEN checks
Date: Thu, 17 Dec 2020 22:01:05 -0800
Message-Id: <20201218060114.3591217-15-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201218060114.3591217-1-alistair.francis@wdc.com>
References: <20201218060114.3591217-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=614e9c0eb=alistair.francis@wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Bin Meng <bin.meng@windriver.com>, alistair23@gmail.com,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
Reviewed-by: Bin Meng <bin.meng@windriver.com>
Tested-by: Bin Meng <bin.meng@windriver.com>
Message-id: 40d6df4dd05302c566e419be3a1fef7799e57c2e.1608142916.git.alistair.francis@wdc.com
---
 hw/riscv/sifive_u.c | 55 ++++++++++++++++++++++++---------------------
 1 file changed, 30 insertions(+), 25 deletions(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 34e6d9c355..170e49315f 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -60,12 +60,6 @@
 
 #include <libfdt.h>
 
-#if defined(TARGET_RISCV32)
-# define BIOS_FILENAME "opensbi-riscv32-generic-fw_dynamic.bin"
-#else
-# define BIOS_FILENAME "opensbi-riscv64-generic-fw_dynamic.bin"
-#endif
-
 static const struct MemmapEntry {
     hwaddr base;
     hwaddr size;
@@ -93,7 +87,7 @@ static const struct MemmapEntry {
 #define GEM_REVISION        0x10070109
 
 static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
-    uint64_t mem_size, const char *cmdline)
+                       uint64_t mem_size, const char *cmdline, bool is_32_bit)
 {
     MachineState *ms = MACHINE(qdev_get_machine());
     void *fdt;
@@ -176,11 +170,11 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
         qemu_fdt_add_subnode(fdt, nodename);
         /* cpu 0 is the management hart that does not have mmu */
         if (cpu != 0) {
-#if defined(TARGET_RISCV32)
-            qemu_fdt_setprop_string(fdt, nodename, "mmu-type", "riscv,sv32");
-#else
-            qemu_fdt_setprop_string(fdt, nodename, "mmu-type", "riscv,sv48");
-#endif
+            if (is_32_bit) {
+                qemu_fdt_setprop_string(fdt, nodename, "mmu-type", "riscv,sv32");
+            } else {
+                qemu_fdt_setprop_string(fdt, nodename, "mmu-type", "riscv,sv48");
+            }
             isa = riscv_isa_string(&s->soc.u_cpus.harts[cpu - 1]);
         } else {
             isa = riscv_isa_string(&s->soc.e_cpus.harts[0]);
@@ -471,7 +465,8 @@ static void sifive_u_machine_init(MachineState *machine)
                           qemu_allocate_irq(sifive_u_machine_reset, NULL, 0));
 
     /* create device tree */
-    create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline);
+    create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline,
+               riscv_is_32_bit(machine));
 
     if (s->start_in_flash) {
         /*
@@ -500,8 +495,15 @@ static void sifive_u_machine_init(MachineState *machine)
         break;
     }
 
-    firmware_end_addr = riscv_find_and_load_firmware(machine, BIOS_FILENAME,
-                                                     start_addr, NULL);
+    if (riscv_is_32_bit(machine)) {
+        firmware_end_addr = riscv_find_and_load_firmware(machine,
+                                    "opensbi-riscv32-generic-fw_dynamic.bin",
+                                    start_addr, NULL);
+    } else {
+        firmware_end_addr = riscv_find_and_load_firmware(machine,
+                                    "opensbi-riscv64-generic-fw_dynamic.bin",
+                                    start_addr, NULL);
+    }
 
     if (machine->kernel_filename) {
         kernel_start_addr = riscv_calc_kernel_start_addr(machine,
@@ -531,9 +533,9 @@ static void sifive_u_machine_init(MachineState *machine)
     /* Compute the fdt load address in dram */
     fdt_load_addr = riscv_load_fdt(memmap[SIFIVE_U_DEV_DRAM].base,
                                    machine->ram_size, s->fdt);
-    #if defined(TARGET_RISCV64)
-    start_addr_hi32 = start_addr >> 32;
-    #endif
+    if (!riscv_is_32_bit(machine)) {
+        start_addr_hi32 = (uint64_t)start_addr >> 32;
+    }
 
     /* reset vector */
     uint32_t reset_vec[11] = {
@@ -541,13 +543,8 @@ static void sifive_u_machine_init(MachineState *machine)
         0x00000297,                    /* 1:  auipc  t0, %pcrel_hi(fw_dyn) */
         0x02828613,                    /*     addi   a2, t0, %pcrel_lo(1b) */
         0xf1402573,                    /*     csrr   a0, mhartid  */
-#if defined(TARGET_RISCV32)
-        0x0202a583,                    /*     lw     a1, 32(t0) */
-        0x0182a283,                    /*     lw     t0, 24(t0) */
-#elif defined(TARGET_RISCV64)
-        0x0202b583,                    /*     ld     a1, 32(t0) */
-        0x0182b283,                    /*     ld     t0, 24(t0) */
-#endif
+        0,
+        0,
         0x00028067,                    /*     jr     t0 */
         start_addr,                    /* start: .dword */
         start_addr_hi32,
@@ -555,6 +552,14 @@ static void sifive_u_machine_init(MachineState *machine)
         0x00000000,
                                        /* fw_dyn: */
     };
+    if (riscv_is_32_bit(machine)) {
+        reset_vec[4] = 0x0202a583;     /*     lw     a1, 32(t0) */
+        reset_vec[5] = 0x0182a283;     /*     lw     t0, 24(t0) */
+    } else {
+        reset_vec[4] = 0x0202b583;     /*     ld     a1, 32(t0) */
+        reset_vec[5] = 0x0182b283;     /*     ld     t0, 24(t0) */
+    }
+
 
     /* copy in the reset vector in little_endian byte order */
     for (i = 0; i < ARRAY_SIZE(reset_vec); i++) {
-- 
2.29.2


