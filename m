Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A49B2DDE8C
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 07:24:04 +0100 (CET)
Received: from localhost ([::1]:34522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kq9BL-0000Cy-3y
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 01:24:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=614e9c0eb=alistair.francis@wdc.com>)
 id 1kq8po-00059U-Lm
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 01:01:48 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:9924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=614e9c0eb=alistair.francis@wdc.com>)
 id 1kq8pj-0002G4-HK
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 01:01:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1608271621; x=1639807621;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PwvKcxqKr0kMwu+jPtBD0orc2CD12uNT9q6ngoFKgBc=;
 b=gv/d0Yg3ganoYPwH9q0KwbXxynim/lViUjFG4J7yatHV/OMSS6C6Vtvs
 1ywbdLNe6l9/m0xhqIvScEuljexOiDHYUrOfY5ZJD89cjfTaWMoYh8eIF
 XmvYKzRLVAuAOEgvCFRwaplZoqwO8joBoCuOT0184dijJp6+pPUvm/RNu
 bhATkW+Zvj93Qpqjjs88+AJLJqiQ+sOvKwPhN6vpQdMuM+LhQtxHnZu2X
 osC/qHXU8eAWneRCz7r42sL+gAhlepdAXW7u8gd7oPemb8qMcFIeg2hI7
 SOMnMHoO6j9XqC8jnDckcjjjhNsfFam6DaWBYls2Oe2hRtXT3F3Ho1brb g==;
IronPort-SDR: 3qkKRb1O/njkPBhEDDy3NvXzSVku9OfW105fFRzvAe1spQooDTqQpxJfTxxVy1mgFYwbG/li/6
 eQjfk0s26DjK15M8JyH4u33v2/TCvbKOH2rSsd0V8KFhPbaGzfkbXuwIM+85+dFDn9AMw3jvlH
 qKeHgxCsjej57kaXkl1m3m9SsaNPEAKbSVWIEpgUS9idD8/VHb+la+1D+trIx98IvToIsQa7fk
 fYsgkb3Ej3awnQMGBFBrvo2jVlEsAuoApI/ODWuFAtggDR/qOY1ArIMII9DJAnb+jh7RYTJs+j
 hiI=
X-IronPort-AV: E=Sophos;i="5.78,429,1599494400"; d="scan'208";a="259237057"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 18 Dec 2020 14:06:29 +0800
IronPort-SDR: YB9rRn+moNb3Uqb4Jz8XSvqgXFYlO2Ta3kGWxOS+y9nqBiSZjcbyBpBHpy5TKMARixe6/yjs1I
 ihLWA1XRB5+ML0lFXt1s2kLIHnNN1S56CSqfl6I6NB7s6N8/yMotJkcpJC9NaEZocIqhAhwh/x
 7qxFpVpwl3by/iIdjBFvh01YhnUjMOIL0cDPle2nX5ZwrTrUWcbeIAGada0M3uwVxV2LRR9JeI
 zdjwWJ9jZaFXhtdmWmKepugV5a6xkk7Fr/c6XgiyoLudsgQTc8R+C4I1dizuvXZNkqA9pqKXlb
 Sq3kOb8PvOeLYMh1kZiGbMH3
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2020 21:46:38 -0800
IronPort-SDR: 37rHkKzRxzZUGCe0mjL4c3d40dvBm8LBjj2KVkhwR4RPBqGlENl0nKsIIoB87ljpaEILCiXWeJ
 5KXUd9yV0gq73pmGoSxIjWYM/MDX/t/928ZmXVbUbKYvMQPNy3WuZB6Xb0tTEptKn6jhsQX8Qg
 Fz0b+H0JzaqTeDd+FwDZ2SYUGvOfY6KfR39gd6NQdq0We4MZshNyf+fXNAAS0Mk97Un5vG6l7g
 yDOxfYk2pJTl7nBhrjsdl2J+BcpAwPiq+8hBzmaOLj3HJtiDSvq8yfDnHKWLvkp3Mxg+vkTLCL
 72M=
WDCIronportException: Internal
Received: from 6hj08h2.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.62.68])
 by uls-op-cesaip01.wdc.com with ESMTP; 17 Dec 2020 22:01:22 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 11/23] hw/riscv: boot: Remove compile time XLEN checks
Date: Thu, 17 Dec 2020 22:01:02 -0800
Message-Id: <20201218060114.3591217-12-alistair.francis@wdc.com>
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
Cc: Palmer Dabbelt <palmerdabbelt@google.com>, alistair23@gmail.com,
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bin.meng@windriver.com>
Tested-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
Message-id: 51e9842dbed1acceebad7f97bd3aae69aa1ac19e.1608142916.git.alistair.francis@wdc.com
---
 include/hw/riscv/boot.h |  8 +++---
 hw/riscv/boot.c         | 55 ++++++++++++++++++++++-------------------
 hw/riscv/sifive_u.c     |  2 +-
 hw/riscv/spike.c        |  3 ++-
 hw/riscv/virt.c         |  2 +-
 5 files changed, 39 insertions(+), 31 deletions(-)

diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
index 0b01988727..b6d37a91d6 100644
--- a/include/hw/riscv/boot.h
+++ b/include/hw/riscv/boot.h
@@ -41,10 +41,12 @@ target_ulong riscv_load_kernel(const char *kernel_filename,
 hwaddr riscv_load_initrd(const char *filename, uint64_t mem_size,
                          uint64_t kernel_entry, hwaddr *start);
 uint32_t riscv_load_fdt(hwaddr dram_start, uint64_t dram_size, void *fdt);
-void riscv_setup_rom_reset_vec(hwaddr saddr, hwaddr rom_base,
-                               hwaddr rom_size, uint64_t kernel_entry,
+void riscv_setup_rom_reset_vec(MachineState *machine, hwaddr saddr,
+                               hwaddr rom_base, hwaddr rom_size,
+                               uint64_t kernel_entry,
                                uint32_t fdt_load_addr, void *fdt);
-void riscv_rom_copy_firmware_info(hwaddr rom_base, hwaddr rom_size,
+void riscv_rom_copy_firmware_info(MachineState *machine, hwaddr rom_base,
+                                  hwaddr rom_size,
                                   uint32_t reset_vec_size,
                                   uint64_t kernel_entry);
 
diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 3c70ac75d7..6bce6fb485 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -33,12 +33,6 @@
 
 #include <libfdt.h>
 
-#if defined(TARGET_RISCV32)
-#define fw_dynamic_info_data(__val)     cpu_to_le32(__val)
-#else
-#define fw_dynamic_info_data(__val)     cpu_to_le64(__val)
-#endif
-
 bool riscv_is_32_bit(MachineState *machine)
 {
     /*
@@ -228,16 +222,24 @@ uint32_t riscv_load_fdt(hwaddr dram_base, uint64_t mem_size, void *fdt)
     return fdt_addr;
 }
 
-void riscv_rom_copy_firmware_info(hwaddr rom_base, hwaddr rom_size,
-                              uint32_t reset_vec_size, uint64_t kernel_entry)
+void riscv_rom_copy_firmware_info(MachineState *machine, hwaddr rom_base,
+                                  hwaddr rom_size, uint32_t reset_vec_size,
+                                  uint64_t kernel_entry)
 {
     struct fw_dynamic_info dinfo;
     size_t dinfo_len;
 
-    dinfo.magic = fw_dynamic_info_data(FW_DYNAMIC_INFO_MAGIC_VALUE);
-    dinfo.version = fw_dynamic_info_data(FW_DYNAMIC_INFO_VERSION);
-    dinfo.next_mode = fw_dynamic_info_data(FW_DYNAMIC_INFO_NEXT_MODE_S);
-    dinfo.next_addr = fw_dynamic_info_data(kernel_entry);
+    if (sizeof(dinfo.magic) == 4) {
+        dinfo.magic = cpu_to_le32(FW_DYNAMIC_INFO_MAGIC_VALUE);
+        dinfo.version = cpu_to_le32(FW_DYNAMIC_INFO_VERSION);
+        dinfo.next_mode = cpu_to_le32(FW_DYNAMIC_INFO_NEXT_MODE_S);
+        dinfo.next_addr = cpu_to_le32(kernel_entry);
+    } else {
+        dinfo.magic = cpu_to_le64(FW_DYNAMIC_INFO_MAGIC_VALUE);
+        dinfo.version = cpu_to_le64(FW_DYNAMIC_INFO_VERSION);
+        dinfo.next_mode = cpu_to_le64(FW_DYNAMIC_INFO_NEXT_MODE_S);
+        dinfo.next_addr = cpu_to_le64(kernel_entry);
+    }
     dinfo.options = 0;
     dinfo.boot_hart = 0;
     dinfo_len = sizeof(dinfo);
@@ -257,28 +259,24 @@ void riscv_rom_copy_firmware_info(hwaddr rom_base, hwaddr rom_size,
                            &address_space_memory);
 }
 
-void riscv_setup_rom_reset_vec(hwaddr start_addr, hwaddr rom_base,
-                               hwaddr rom_size, uint64_t kernel_entry,
+void riscv_setup_rom_reset_vec(MachineState *machine, hwaddr start_addr,
+                               hwaddr rom_base, hwaddr rom_size,
+                               uint64_t kernel_entry,
                                uint32_t fdt_load_addr, void *fdt)
 {
     int i;
     uint32_t start_addr_hi32 = 0x00000000;
 
-    #if defined(TARGET_RISCV64)
-    start_addr_hi32 = start_addr >> 32;
-    #endif
+    if (!riscv_is_32_bit(machine)) {
+        start_addr_hi32 = start_addr >> 32;
+    }
     /* reset vector */
     uint32_t reset_vec[10] = {
         0x00000297,                  /* 1:  auipc  t0, %pcrel_hi(fw_dyn) */
         0x02828613,                  /*     addi   a2, t0, %pcrel_lo(1b) */
         0xf1402573,                  /*     csrr   a0, mhartid  */
-#if defined(TARGET_RISCV32)
-        0x0202a583,                  /*     lw     a1, 32(t0) */
-        0x0182a283,                  /*     lw     t0, 24(t0) */
-#elif defined(TARGET_RISCV64)
-        0x0202b583,                  /*     ld     a1, 32(t0) */
-        0x0182b283,                  /*     ld     t0, 24(t0) */
-#endif
+        0,
+        0,
         0x00028067,                  /*     jr     t0 */
         start_addr,                  /* start: .dword */
         start_addr_hi32,
@@ -286,6 +284,13 @@ void riscv_setup_rom_reset_vec(hwaddr start_addr, hwaddr rom_base,
         0x00000000,
                                      /* fw_dyn: */
     };
+    if (riscv_is_32_bit(machine)) {
+        reset_vec[3] = 0x0202a583;   /*     lw     a1, 32(t0) */
+        reset_vec[4] = 0x0182a283;   /*     lw     t0, 24(t0) */
+    } else {
+        reset_vec[3] = 0x0202b583;   /*     ld     a1, 32(t0) */
+        reset_vec[4] = 0x0182b283;   /*     ld     t0, 24(t0) */
+    }
 
     /* copy in the reset vector in little_endian byte order */
     for (i = 0; i < ARRAY_SIZE(reset_vec); i++) {
@@ -293,7 +298,7 @@ void riscv_setup_rom_reset_vec(hwaddr start_addr, hwaddr rom_base,
     }
     rom_add_blob_fixed_as("mrom.reset", reset_vec, sizeof(reset_vec),
                           rom_base, &address_space_memory);
-    riscv_rom_copy_firmware_info(rom_base, rom_size, sizeof(reset_vec),
+    riscv_rom_copy_firmware_info(machine, rom_base, rom_size, sizeof(reset_vec),
                                  kernel_entry);
 
     return;
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index a629416785..34e6d9c355 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -563,7 +563,7 @@ static void sifive_u_machine_init(MachineState *machine)
     rom_add_blob_fixed_as("mrom.reset", reset_vec, sizeof(reset_vec),
                           memmap[SIFIVE_U_DEV_MROM].base, &address_space_memory);
 
-    riscv_rom_copy_firmware_info(memmap[SIFIVE_U_DEV_MROM].base,
+    riscv_rom_copy_firmware_info(machine, memmap[SIFIVE_U_DEV_MROM].base,
                                  memmap[SIFIVE_U_DEV_MROM].size,
                                  sizeof(reset_vec), kernel_entry);
 }
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 29f07f47b1..875f371f0f 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -296,7 +296,8 @@ static void spike_board_init(MachineState *machine)
     fdt_load_addr = riscv_load_fdt(memmap[SPIKE_DRAM].base,
                                    machine->ram_size, s->fdt);
     /* load the reset vector */
-    riscv_setup_rom_reset_vec(memmap[SPIKE_DRAM].base, memmap[SPIKE_MROM].base,
+    riscv_setup_rom_reset_vec(machine, memmap[SPIKE_DRAM].base,
+                              memmap[SPIKE_MROM].base,
                               memmap[SPIKE_MROM].size, kernel_entry,
                               fdt_load_addr, s->fdt);
 
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 3e41dbfd3c..5377075869 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -654,7 +654,7 @@ static void virt_machine_init(MachineState *machine)
     fdt_load_addr = riscv_load_fdt(memmap[VIRT_DRAM].base,
                                    machine->ram_size, s->fdt);
     /* load the reset vector */
-    riscv_setup_rom_reset_vec(start_addr, virt_memmap[VIRT_MROM].base,
+    riscv_setup_rom_reset_vec(machine, start_addr, virt_memmap[VIRT_MROM].base,
                               virt_memmap[VIRT_MROM].size, kernel_entry,
                               fdt_load_addr, s->fdt);
 
-- 
2.29.2


