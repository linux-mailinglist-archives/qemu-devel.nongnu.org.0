Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C36B5AFEF9
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 10:29:13 +0200 (CEST)
Received: from localhost ([::1]:43148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVqQq-0007LQ-JM
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 04:29:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=242877ce7=alistair.francis@wdc.com>)
 id 1oVq4a-0004rb-DW
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 04:06:19 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:1923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=242877ce7=alistair.francis@wdc.com>)
 id 1oVq4Q-0004Ud-5T
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 04:06:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1662537960; x=1694073960;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FFI6Ye3j6adQyfsmXJv6bQPJhFJ6DEKM3aG8BFBc+JA=;
 b=CJepteOQ5FnRBy3h8CzJ4HgbQmiU1n6bb+7W4g7FOQh80CfdKoxLQWVy
 gKAlYn55MREzJuAlXoXiOoDNSOveEpcvDopTtrLcOeYTXgR2ELEQzd7gc
 Sk+ViuqfX2t9iBwS77XiaI4lqchc2QvTWu6xcEX5CcCwqF/FAgaj0RwNx
 DZV2RGJyQ/duviag7baU10dkynQxSrhdKAkqW6QyeibJsiT+KQD95stpT
 9N5SedIJgtuktm2f9awHPUYV8VpZHowyeEewivGGWY8RgLC5iNCsBftLx
 Hh2ywpDS/a5ECgMruBmG1gS98iOier8eyanUWFX+gDbJGJ5dk35h4SHoy g==;
X-IronPort-AV: E=Sophos;i="5.93,296,1654531200"; d="scan'208";a="210715056"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 07 Sep 2022 16:05:02 +0800
IronPort-SDR: vo1LYHL4MVchlERAkKLhLDvA/3s5rZ5kYW3va+IMOdX2uDuhk12WDdzNB+6hRzYshiUERIQTn2
 EjgYdUpSr2ZfTDyHcmQHSITx6e1GEFC2+Fawi5Rq+hiilKC1pBDsF+YOF0bDOUxNeaoTV03gnP
 jG+wExdXSt+c1nEKbKAGHWwgBQWwIIPowyfx6nz9/CJ7DFKQIuTw9eiFumoJOK9ObJaXQ/jkVk
 QjLQWzLz62j1LTl7rM0DhB7a1GAmxPuu2ylD+DnMINPmH9GDuiuF2RVcEZjCrNNSfkthKALZuB
 gCQBoWjJ1ZeV3pyg4yYLg829
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Sep 2022 00:20:00 -0700
IronPort-SDR: W8becf0jq7Ck47C5BGmR2oM1uSegldneGcXxxEKG682UVRc6Ku1wYJD+U99dJsUdEDoTCY95t5
 nZxEpS8q8RzwnJDPupQTOSDFSZZWwWY9qdf1T29M4+o71joPZ0jYpK+d58RXMtdHptgN5+Zghp
 aqk+t9mnDndeR1jfbid+HI9DunrAHg/BiOSCDimHqVmcjZiyzvo5rgHDx1LzxsVeTFKSgYsLBj
 4C6BZPNtCHia2tbe5L3Z2xHi1u290gQhWOCH1Y4q6YQ+ZnAf71oI5P+dE3fkbjErz+lTjfItfA
 EOE=
WDCIronportException: Internal
Received: from unknown (HELO toolbox.wdc.com) ([10.225.167.94])
 by uls-op-cesaip01.wdc.com with ESMTP; 07 Sep 2022 01:05:01 -0700
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Vijai Kumar K <vijai@behindbytes.com>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PULL 26/44] hw/riscv: remove 'fdt' param from
 riscv_setup_rom_reset_vec()
Date: Wed,  7 Sep 2022 10:03:35 +0200
Message-Id: <20220907080353.111926-27-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220907080353.111926-1-alistair.francis@wdc.com>
References: <20220907080353.111926-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=242877ce7=alistair.francis@wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Reply-to:  Alistair Francis <alistair.francis@wdc.com>
From:  Alistair Francis via <qemu-devel@nongnu.org>

From: Daniel Henrique Barboza <danielhb413@gmail.com>

The 'fdt' param is not being used in riscv_setup_rom_reset_vec().
Simplify the API by removing it. While we're at it, remove the redundant
'return' statement at the end of function.

Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Alistair Francis <alistair.francis@wdc.com>
Cc: Bin Meng <bin.meng@windriver.com>
Cc: Vijai Kumar K <vijai@behindbytes.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220728181926.2123771-1-danielhb413@gmail.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/riscv/boot.h    | 2 +-
 hw/riscv/boot.c            | 4 +---
 hw/riscv/microchip_pfsoc.c | 2 +-
 hw/riscv/shakti_c.c        | 3 +--
 hw/riscv/spike.c           | 2 +-
 hw/riscv/virt.c            | 2 +-
 6 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
index d2db29721a..a36f7618f5 100644
--- a/include/hw/riscv/boot.h
+++ b/include/hw/riscv/boot.h
@@ -51,7 +51,7 @@ void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayState *harts
                                hwaddr saddr,
                                hwaddr rom_base, hwaddr rom_size,
                                uint64_t kernel_entry,
-                               uint64_t fdt_load_addr, void *fdt);
+                               uint64_t fdt_load_addr);
 void riscv_rom_copy_firmware_info(MachineState *machine, hwaddr rom_base,
                                   hwaddr rom_size,
                                   uint32_t reset_vec_size,
diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 06b4fc5ac3..1ae7596873 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -286,7 +286,7 @@ void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayState *harts
                                hwaddr start_addr,
                                hwaddr rom_base, hwaddr rom_size,
                                uint64_t kernel_entry,
-                               uint64_t fdt_load_addr, void *fdt)
+                               uint64_t fdt_load_addr)
 {
     int i;
     uint32_t start_addr_hi32 = 0x00000000;
@@ -326,8 +326,6 @@ void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayState *harts
                           rom_base, &address_space_memory);
     riscv_rom_copy_firmware_info(machine, rom_base, rom_size, sizeof(reset_vec),
                                  kernel_entry);
-
-    return;
 }
 
 void riscv_setup_direct_kernel(hwaddr kernel_addr, hwaddr fdt_addr)
diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
index 10a5d0e501..7313153606 100644
--- a/hw/riscv/microchip_pfsoc.c
+++ b/hw/riscv/microchip_pfsoc.c
@@ -583,7 +583,7 @@ static void microchip_icicle_kit_machine_init(MachineState *machine)
         riscv_setup_rom_reset_vec(machine, &s->soc.u_cpus, firmware_load_addr,
                                   memmap[MICROCHIP_PFSOC_ENVM_DATA].base,
                                   memmap[MICROCHIP_PFSOC_ENVM_DATA].size,
-                                  kernel_entry, fdt_load_addr, machine->fdt);
+                                  kernel_entry, fdt_load_addr);
     }
 }
 
diff --git a/hw/riscv/shakti_c.c b/hw/riscv/shakti_c.c
index 90e2cf609f..e43cc9445c 100644
--- a/hw/riscv/shakti_c.c
+++ b/hw/riscv/shakti_c.c
@@ -66,8 +66,7 @@ static void shakti_c_machine_state_init(MachineState *mstate)
     riscv_setup_rom_reset_vec(mstate, &sms->soc.cpus,
                               shakti_c_memmap[SHAKTI_C_RAM].base,
                               shakti_c_memmap[SHAKTI_C_ROM].base,
-                              shakti_c_memmap[SHAKTI_C_ROM].size, 0, 0,
-                              NULL);
+                              shakti_c_memmap[SHAKTI_C_ROM].size, 0, 0);
     if (mstate->firmware) {
         riscv_load_firmware(mstate->firmware,
                             shakti_c_memmap[SHAKTI_C_RAM].base,
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index e41b6aa9f0..5ba34543c8 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -308,7 +308,7 @@ static void spike_board_init(MachineState *machine)
     riscv_setup_rom_reset_vec(machine, &s->soc[0], memmap[SPIKE_DRAM].base,
                               memmap[SPIKE_MROM].base,
                               memmap[SPIKE_MROM].size, kernel_entry,
-                              fdt_load_addr, s->fdt);
+                              fdt_load_addr);
 
     /* initialize HTIF using symbols found in load_kernel */
     htif_mm_init(system_memory, mask_rom,
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index f2ce5663a4..c1e8e0fcaf 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1305,7 +1305,7 @@ static void virt_machine_done(Notifier *notifier, void *data)
     riscv_setup_rom_reset_vec(machine, &s->soc[0], start_addr,
                               virt_memmap[VIRT_MROM].base,
                               virt_memmap[VIRT_MROM].size, kernel_entry,
-                              fdt_load_addr, machine->fdt);
+                              fdt_load_addr);
 
     /*
      * Only direct boot kernel is currently supported for KVM VM,
-- 
2.37.2


