Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1837C39EABB
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 02:32:48 +0200 (CEST)
Received: from localhost ([::1]:37846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqPfj-0003BQ-6O
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 20:32:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7863c9c60=alistair.francis@wdc.com>)
 id 1lqPdP-0000DR-3Q
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 20:30:24 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:19647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7863c9c60=alistair.francis@wdc.com>)
 id 1lqPdN-0004Fk-1e
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 20:30:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1623112219; x=1654648219;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hIXZyRAbqHZiqz3Fv0rwmNy57o72IkHsNsOh2caCcPQ=;
 b=HEkvlVOQaCiWv8xWi4aMgfRXLJpmgBaaa4Nu5DYDVERVRnV7XYq0JGRA
 VFGZ+HF5D8cvv8aWSDPdI9R1oTVCkcm/am9FDLl6ozslUma2PNXdyHkn/
 N+ViGYcgg3MfbajE9d9YzcJakHwf6uVWqy9YbbAvekKeOgIcR1XgKYt0J
 Hd1cZy+VsjAinuV8m7hOa2jhJS9vjPGPeIHLmPHxmySJAyr/vYP733QlX
 c2MoJ+3aT8WAHBh2D6zyi6xecMWntmu1mU51fCm0TpEHpLPAGq1Y30w2A
 VHWpmvq0IpcPm3Q5CcWjepq0gwEibOJZCC24XxbPfWHCZ81QSKu7qBWtW Q==;
IronPort-SDR: WtPqEHDoO6LNPVVYqwggRvQh1kZ6iog90ZOEz1b/mYbvy0bVeifP5r4t/txMNW76CCL+EbAl97
 iBrtgOtJYHiOXD9M4A99pkVvbfkWiAjd6vgGg7bqZl2KbbVTlvvVfawlzOLr5SUDbw6EMBmiNO
 9qz26jLsCT3CghEDtwQ3tGDS8VNDWKZeiw9sd5cJKEQ5NFI2lU2FYtdvoRGMEOoLcFuHCslx4J
 cc+kSniuAOIScZYxjI5QQnRINybOWLg5pvR4SDNqEcv1nytJy4fybVha62NwMW7qWRVUSahIUb
 0pU=
X-IronPort-AV: E=Sophos;i="5.83,256,1616428800"; d="scan'208";a="171087342"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 08 Jun 2021 08:30:18 +0800
IronPort-SDR: LZ2tff8RvpgpErlyzTJRPfxVlkTzGwOW8R7IqK1cMHy7V6NpYhTrb+J5vazMbFkxF97D5iTFV0
 Icp+MJ8fmvC4k3RQXn3EomOxAiD5GJP7gWNfcHq0V02Fg5DfmgZCv+JHTv29cI+21qXbliim1j
 e/lFMkHepnzKf2XwylnCSSseNHYJyesSrK6GX8L2kcbzafBX+5HeWw4zd1BWCXlTYPEWDx28sT
 LxhDukMI9RMUdF4CoX/uix/1HwotKvqZf30ZPluNf9bnfKzHxZeEuRxEYvcs1LlfzmTy0wD74K
 axs4oLo1QKnoNceDMM+VN4K5
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 17:09:26 -0700
IronPort-SDR: BlRTSMNbRaNtoEQZs1haS5vCe8a0cuxQkP1bGPld5n4yJISLKmzJ/g6qSKchKoPeykxyLF5TX6
 PqKAymCqUU+9VjCu+/861WqCUxbQ8FgHKeL78M6QmLVWcwHjBVgaHZ63u1ODr2XtGByyoWSPgl
 nCCcFhwBaqAYTdr60Cb09k4HKtldNM1Z2URJBMlLWIRV3dJjuH3uPOMUjz+5nOUJ3ctKZx1kio
 ddAnGKhnO9dF54HHqt6L6stKtySzWnKcXpYk2FljommMlsuxvuJJkhPPcgTqVt75oomrC68LlT
 L8s=
WDCIronportException: Internal
Received: from unknown (HELO localhost.localdomain) ([10.225.165.82])
 by uls-op-cesaip02.wdc.com with ESMTP; 07 Jun 2021 17:30:17 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 03/32] hw/riscv: Support the official CLINT DT bindings
Date: Tue,  8 Jun 2021 10:29:18 +1000
Message-Id: <20210608002947.1649775-4-alistair.francis@wdc.com>
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

Linux kernel commit a2770b57d083 ("dt-bindings: timer: Add CLINT bindings")
adds the official DT bindings for CLINT, which uses "sifive,clint0"
as the compatible string. "riscv,clint0" is now legacy and has to
be kept for backward compatibility of legacy systems.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210430071302.1489082-3-bmeng.cn@gmail.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/sifive_u.c | 6 +++++-
 hw/riscv/spike.c    | 6 +++++-
 hw/riscv/virt.c     | 6 +++++-
 3 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 89cccd7fd5..d3828dc880 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -98,6 +98,9 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
     uint32_t plic_phandle, prci_phandle, gpio_phandle, phandle = 1;
     uint32_t hfclk_phandle, rtcclk_phandle, phy_phandle;
     static const char * const ethclk_names[2] = { "pclk", "hclk" };
+    static const char * const clint_compat[2] = {
+        "sifive,clint0", "riscv,clint0"
+    };
 
     if (ms->dtb) {
         fdt = s->fdt = load_device_tree(ms->dtb, &s->fdt_size);
@@ -209,7 +212,8 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
     nodename = g_strdup_printf("/soc/clint@%lx",
         (long)memmap[SIFIVE_U_DEV_CLINT].base);
     qemu_fdt_add_subnode(fdt, nodename);
-    qemu_fdt_setprop_string(fdt, nodename, "compatible", "riscv,clint0");
+    qemu_fdt_setprop_string_array(fdt, nodename, "compatible",
+        (char **)&clint_compat, ARRAY_SIZE(clint_compat));
     qemu_fdt_setprop_cells(fdt, nodename, "reg",
         0x0, memmap[SIFIVE_U_DEV_CLINT].base,
         0x0, memmap[SIFIVE_U_DEV_CLINT].size);
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index fe0806a476..4b08816dfa 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -59,6 +59,9 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
     uint32_t cpu_phandle, intc_phandle, phandle = 1;
     char *name, *mem_name, *clint_name, *clust_name;
     char *core_name, *cpu_name, *intc_name;
+    static const char * const clint_compat[2] = {
+        "sifive,clint0", "riscv,clint0"
+    };
 
     fdt = s->fdt = create_device_tree(&s->fdt_size);
     if (!fdt) {
@@ -152,7 +155,8 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
             (memmap[SPIKE_CLINT].size * socket);
         clint_name = g_strdup_printf("/soc/clint@%lx", clint_addr);
         qemu_fdt_add_subnode(fdt, clint_name);
-        qemu_fdt_setprop_string(fdt, clint_name, "compatible", "riscv,clint0");
+        qemu_fdt_setprop_string_array(fdt, clint_name, "compatible",
+            (char **)&clint_compat, ARRAY_SIZE(clint_compat));
         qemu_fdt_setprop_cells(fdt, clint_name, "reg",
             0x0, clint_addr, 0x0, memmap[SPIKE_CLINT].size);
         qemu_fdt_setprop(fdt, clint_name, "interrupts-extended",
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 1e017d1c52..5159e7e020 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -194,6 +194,9 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
     char *name, *clint_name, *plic_name, *clust_name;
     hwaddr flashsize = virt_memmap[VIRT_FLASH].size / 2;
     hwaddr flashbase = virt_memmap[VIRT_FLASH].base;
+    static const char * const clint_compat[2] = {
+        "sifive,clint0", "riscv,clint0"
+    };
 
     if (mc->dtb) {
         fdt = mc->fdt = load_device_tree(mc->dtb, &s->fdt_size);
@@ -299,7 +302,8 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
             (memmap[VIRT_CLINT].size * socket);
         clint_name = g_strdup_printf("/soc/clint@%lx", clint_addr);
         qemu_fdt_add_subnode(fdt, clint_name);
-        qemu_fdt_setprop_string(fdt, clint_name, "compatible", "riscv,clint0");
+        qemu_fdt_setprop_string_array(fdt, clint_name, "compatible",
+            (char **)&clint_compat, ARRAY_SIZE(clint_compat));
         qemu_fdt_setprop_cells(fdt, clint_name, "reg",
             0x0, clint_addr, 0x0, memmap[VIRT_CLINT].size);
         qemu_fdt_setprop(fdt, clint_name, "interrupts-extended",
-- 
2.31.1


