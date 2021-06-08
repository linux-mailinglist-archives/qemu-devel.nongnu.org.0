Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6799639EAD8
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 02:37:45 +0200 (CEST)
Received: from localhost ([::1]:54742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqPkW-00061q-AD
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 20:37:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7863c9c60=alistair.francis@wdc.com>)
 id 1lqPda-0000WR-TN
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 20:30:35 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:19647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7863c9c60=alistair.francis@wdc.com>)
 id 1lqPdY-0004Fk-Si
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 20:30:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1623112232; x=1654648232;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F6wk4QwEu8K8q28w1K2XoH1p3HYyOCNiObHtsH940AU=;
 b=JcqwDY1ms5/Un4FTxm/R4lKDk5rnJtIk65NLMhLjHjhwcRUEky4qk4oh
 /3dgDQ6/B2CUBzNdTINjJ1uvmxyIwvhh2aVDr94oLMv9tmn7Fptn92+pA
 clGp/AphLn+UwN9Gr/wvcIP3ra2sdEIQp7e00u1KPQCsfIJ7nz7QsGSB8
 J7jkxGqfPxjJnpdjgj0MJRr4E4SjX0DHfsEDEivin8sk9x0A/UsS1Iewa
 ekRSEEUUWUmFNNyYaQ7OY9kj/6X+cxfyu6nMrH6ivq5oC6vGeq2co1Z53
 nPcV/bGHZOf3Q6S/gGXqCmmTmA08PTeG1idocMkEHmN4tO0RXmwrHlK8O g==;
IronPort-SDR: rcJ6Y3EHnCglrH+v6CDMKb7B9nBCwSwmaOJjyMaUpa+tFM1LS+BRSiUNGBTUmL70dPU1GxguWL
 2IFtv42Qw0+/0KOaMvLFmoIlFG2XcOlFvWkdAux+wK+QdGy4JbWzW/72pGOUAXhOvMpdPjWkCa
 Xo1sbJqnd2OVn2YyYkXfpmQq89x4gQGSzpjWQ+veEnxiUxhNegOKvi4IaYBHjdA5CH8qVeOBx2
 ad6tYP9YCXYQv0fLhqq+aLBOv+u5DnHDTn34UaruJnmMx0H7kljXJk+ve+ehjueDU4b5a5MRNi
 gy4=
X-IronPort-AV: E=Sophos;i="5.83,256,1616428800"; d="scan'208";a="171087355"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 08 Jun 2021 08:30:31 +0800
IronPort-SDR: 05nmbZWS2FgIfj3W/UIbK+VNH8TaKx2Kr9fY0z0f1CvEvYZDjXa9C2S7QW+q/ITDL/NjAASacF
 RPUNb8v16uyuTh6cw5DkVaCOdB51Kw+Rqu1VazSDYocQHnHvNljDJ0Dl0cD+pEZSRXRRJcq2EI
 hom7X6BPnUb7WF3ylEm6S6CtRFZ3Pl1L/kBsk71ZN1xdgdYZZ/86zjR1sUM+X8Xuaaa7ycz9EF
 uVykyNfZ1FivTsAfxBysN2ZnXKNsIvLFBp3gD8d6FuhYXZwHR0ho+/nYaLSilR8HKRtlP5sHTX
 sI0vkShGOa7BTZ2zZ7341R4V
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 17:09:38 -0700
IronPort-SDR: F3SXequd4K4sAb/OYMlPZ7TMOVy9++Ko4Mlw+NkphqxIqyE0CUW137qbbzxlI5G3hKgYg9dTx7
 P2f9JOJSxn2Z2k+crwAjxUcrieNSHkgig/U80yzuR5Vggbvn+Wo3OSXQHLLguiIF86LQ+pDqxN
 of0vd5J3FV4tr5JVJeB6pV6kw/6JjLdXXbkDByp+2lZitNM/tuZHPUMz+gZ4xOleSC3/tzqmtB
 M5ZRx6ZGHcfZM9A2p1YA2vjO/FScC0H3U7lrbWz8OVy/ga52I4bVYQZdk92Yws3h4NQfBqUbQU
 8iI=
WDCIronportException: Internal
Received: from unknown (HELO localhost.localdomain) ([10.225.165.82])
 by uls-op-cesaip02.wdc.com with ESMTP; 07 Jun 2021 17:30:29 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 07/32] hw/riscv: Use macros for BIOS image names
Date: Tue,  8 Jun 2021 10:29:22 +1000
Message-Id: <20210608002947.1649775-8-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210608002947.1649775-1-alistair.francis@wdc.com>
References: <20210608002947.1649775-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=7863c9c60=alistair.francis@wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Cc: alistair23@gmail.com, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

The OpenSBI BIOS image names are used by many RISC-V machines.
Let's define macros for them.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210430071302.1489082-7-bmeng.cn@gmail.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/riscv/boot.h | 5 +++++
 hw/riscv/sifive_u.c     | 6 ++----
 hw/riscv/spike.c        | 6 ++----
 hw/riscv/virt.c         | 6 ++----
 4 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
index 11a21dd584..0e89400b09 100644
--- a/include/hw/riscv/boot.h
+++ b/include/hw/riscv/boot.h
@@ -24,6 +24,11 @@
 #include "hw/loader.h"
 #include "hw/riscv/riscv_hart.h"
 
+#define RISCV32_BIOS_BIN    "opensbi-riscv32-generic-fw_dynamic.bin"
+#define RISCV32_BIOS_ELF    "opensbi-riscv32-generic-fw_dynamic.elf"
+#define RISCV64_BIOS_BIN    "opensbi-riscv64-generic-fw_dynamic.bin"
+#define RISCV64_BIOS_ELF    "opensbi-riscv64-generic-fw_dynamic.elf"
+
 bool riscv_is_32bit(RISCVHartArrayState *harts);
 
 target_ulong riscv_calc_kernel_start_addr(RISCVHartArrayState *harts,
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index a32a95d58f..273c86418c 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -560,12 +560,10 @@ static void sifive_u_machine_init(MachineState *machine)
 
     if (riscv_is_32bit(&s->soc.u_cpus)) {
         firmware_end_addr = riscv_find_and_load_firmware(machine,
-                                    "opensbi-riscv32-generic-fw_dynamic.bin",
-                                    start_addr, NULL);
+                                    RISCV32_BIOS_BIN, start_addr, NULL);
     } else {
         firmware_end_addr = riscv_find_and_load_firmware(machine,
-                                    "opensbi-riscv64-generic-fw_dynamic.bin",
-                                    start_addr, NULL);
+                                    RISCV64_BIOS_BIN, start_addr, NULL);
     }
 
     if (machine->kernel_filename) {
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 4b08816dfa..fead77f0c4 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -258,13 +258,11 @@ static void spike_board_init(MachineState *machine)
      */
     if (riscv_is_32bit(&s->soc[0])) {
         firmware_end_addr = riscv_find_and_load_firmware(machine,
-                                    "opensbi-riscv32-generic-fw_dynamic.elf",
-                                    memmap[SPIKE_DRAM].base,
+                                    RISCV32_BIOS_ELF, memmap[SPIKE_DRAM].base,
                                     htif_symbol_callback);
     } else {
         firmware_end_addr = riscv_find_and_load_firmware(machine,
-                                    "opensbi-riscv64-generic-fw_dynamic.elf",
-                                    memmap[SPIKE_DRAM].base,
+                                    RISCV64_BIOS_ELF, memmap[SPIKE_DRAM].base,
                                     htif_symbol_callback);
     }
 
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 560216d217..4a3cd2599a 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -681,12 +681,10 @@ static void virt_machine_init(MachineState *machine)
 
     if (riscv_is_32bit(&s->soc[0])) {
         firmware_end_addr = riscv_find_and_load_firmware(machine,
-                                    "opensbi-riscv32-generic-fw_dynamic.bin",
-                                    start_addr, NULL);
+                                    RISCV32_BIOS_BIN, start_addr, NULL);
     } else {
         firmware_end_addr = riscv_find_and_load_firmware(machine,
-                                    "opensbi-riscv64-generic-fw_dynamic.bin",
-                                    start_addr, NULL);
+                                    RISCV64_BIOS_BIN, start_addr, NULL);
     }
 
     if (machine->kernel_filename) {
-- 
2.31.1


