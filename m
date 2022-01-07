Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26542487065
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 03:31:08 +0100 (CET)
Received: from localhost ([::1]:40960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5f23-0004RX-7T
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 21:31:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1n5dRu-0001gk-Hl
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 19:49:42 -0500
Received: from [2607:f8b0:4864:20::229] (port=36751
 helo=mail-oi1-x229.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1n5dRs-0003bx-MR
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 19:49:42 -0500
Received: by mail-oi1-x229.google.com with SMTP id t23so6164473oiw.3
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 16:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SrPx8stRbf0mRCGF+8v7KnYjjZhW/hptPZru7ByP4Qc=;
 b=cPICLvd4MYixQwPtNjKKWsa+AjUSdRqsLA0DYuO0xdkjhsYd3uPR8zRo7g5lMDpavo
 /zEv+Z0X2jgSrW+8FW1PVdSHW1rV3cDuyQdRMEzSXi2MG6m4JzbnEcdrFG/wllI+ppf+
 Lm/CivA5+jdi2k9v6t4NEmvSDAjbs0Ywxe44R/dw6YiEfJ/eiKEkfXtXzIKHR6O7BpIo
 Mk2dsctGm5elK+LReX5zs45NZOow4b4dQgRxlkHwXDvWcG5AyKLcNy0DdNFGEXaby3qB
 sL+YJTq4wd5vh5b5zdLtUHCbV2Hiu1wswy0F8uY0fQMSWEjCNAdngtzqCn85ya0+53DB
 hZdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SrPx8stRbf0mRCGF+8v7KnYjjZhW/hptPZru7ByP4Qc=;
 b=KAz1U5Aio5y5eZA+3f4zVBIwAJvWtXAAlgzGJ5xUC+ngWREOq+opA2YdqK1ccWiayn
 thLN/yUJh06tjN5cJxi5uBJnH82R5VBUCO1nQUyy0fADQz8bzq6+EvZFeINvOZg7tVKH
 hYN3aWMaWHCYzxSMARCA3hhvY6qDJe9iyNVAFrBTSHWksjtO1WwJ7V3pKM9U8JuWsSFG
 XrteYcNSP2qTc6YI+2j6XrtqbUZMDWGadem+gXC9ZtykaIS7qZheDnU8w6W1HveIoWh1
 NvGHBzL0aXtAp7MGeRzmGduV7hSZmhUwaq1rPlo2z9ZLnE/NmqhsNF3qA9nDKS/Nv6Yn
 3qOA==
X-Gm-Message-State: AOAM5310HvM88+0zrEUI8gbswEl/+xoZr8UA0KTjhhyAv044YcE6EVYW
 tlxCEOpHgtATj9B9cFoDFOCT6n1ai9zj9R/J
X-Google-Smtp-Source: ABdhPJzXsebZD7W5yIlRf4WvZ7MEJjXRyDmONX4TWhg13q62r1Tk79R/ElJLB7axI663jQkUEBc72Q==
X-Received: by 2002:a05:6808:1408:: with SMTP id
 w8mr8156043oiv.54.1641516579511; 
 Thu, 06 Jan 2022 16:49:39 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id e4sm678441oiy.12.2022.01.06.16.49.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 16:49:39 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 11/11] hw/riscv: virt: Add PMU DT node to the device tree
Date: Thu,  6 Jan 2022 16:48:46 -0800
Message-Id: <20220107004846.378859-12-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220107004846.378859-1-atishp@rivosinc.com>
References: <20220107004846.378859-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::229
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=atishp@rivosinc.com; helo=mail-oi1-x229.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 06 Jan 2022 21:14:01 -0500
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Atish Patra <atishp@rivosinc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Qemu virt machine can support few cache events and cycle/instret counters.
It also supports counter overflow for these events.

Add a DT node so that OpenSBI/Linux kernel is aware of the virt machine
capabilities. There are some dummy nodes added for testing as well.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 hw/riscv/virt.c    | 38 ++++++++++++++++++++++++++++++++++++++
 target/riscv/pmu.c | 45 +++++++++++++++++++++++++++++++++++++++++++++
 target/riscv/pmu.h |  1 +
 3 files changed, 84 insertions(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 3af074148ef4..99154199091c 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -28,6 +28,7 @@
 #include "hw/qdev-properties.h"
 #include "hw/char/serial.h"
 #include "target/riscv/cpu.h"
+#include "target/riscv/pmu.h"
 #include "hw/riscv/riscv_hart.h"
 #include "hw/riscv/virt.h"
 #include "hw/riscv/boot.h"
@@ -406,6 +407,33 @@ static void create_fdt_socket_plic(RISCVVirtState *s,
     g_free(plic_cells);
 }
 
+static void create_fdt_socket_pmu(RISCVVirtState *s,
+                                  int socket, uint32_t *phandle,
+                                  uint32_t *intc_phandles)
+{
+    int cpu;
+    char *pmu_name;
+    uint32_t *pmu_cells;
+    MachineState *mc = MACHINE(s);
+    RISCVCPU hart = s->soc[socket].harts[0];
+
+    pmu_cells = g_new0(uint32_t, s->soc[socket].num_harts * 2);
+
+    for (cpu = 0; cpu < s->soc[socket].num_harts; cpu++) {
+        pmu_cells[cpu * 2 + 0] = cpu_to_be32(intc_phandles[cpu]);
+        pmu_cells[cpu * 2 + 1] = cpu_to_be32(IRQ_PMU_OVF);
+    }
+
+    pmu_name = g_strdup_printf("/soc/pmu");
+    qemu_fdt_add_subnode(mc->fdt, pmu_name);
+    qemu_fdt_setprop_string(mc->fdt, pmu_name, "compatible", "riscv,pmu");
+    riscv_pmu_generate_fdt_node(mc->fdt, hart.cfg.pmu_num, pmu_name);
+
+    g_free(pmu_name);
+    g_free(pmu_cells);
+}
+
+
 static void create_fdt_sockets(RISCVVirtState *s, const MemMapEntry *memmap,
                                bool is_32_bit, uint32_t *phandle,
                                uint32_t *irq_mmio_phandle,
@@ -417,12 +445,20 @@ static void create_fdt_sockets(RISCVVirtState *s, const MemMapEntry *memmap,
     uint32_t *intc_phandles;
     MachineState *mc = MACHINE(s);
     uint32_t xplic_phandles[MAX_NODES];
+    RISCVCPU hart;
 
     qemu_fdt_add_subnode(mc->fdt, "/cpus");
     qemu_fdt_setprop_cell(mc->fdt, "/cpus", "timebase-frequency",
                           RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ);
     qemu_fdt_setprop_cell(mc->fdt, "/cpus", "#size-cells", 0x0);
     qemu_fdt_setprop_cell(mc->fdt, "/cpus", "#address-cells", 0x1);
+
+    /* Add the node for isa extensions discovery */
+    qemu_fdt_add_subnode(mc->fdt, "/cpus/riscv,isa-ext");
+    hart = s->soc[0].harts[0];
+    if (hart.cfg.ext_sscof) {
+        qemu_fdt_setprop(mc->fdt, "/cpus/riscv,isa-ext", "sscofpmf", NULL, 0);
+    }
     qemu_fdt_add_subnode(mc->fdt, "/cpus/cpu-map");
 
     for (socket = (riscv_socket_count(mc) - 1); socket >= 0; socket--) {
@@ -445,6 +481,8 @@ static void create_fdt_sockets(RISCVVirtState *s, const MemMapEntry *memmap,
         create_fdt_socket_plic(s, memmap, socket, phandle,
             intc_phandles, xplic_phandles);
 
+        create_fdt_socket_pmu(s, socket, phandle, intc_phandles);
+
         g_free(intc_phandles);
         g_free(clust_name);
     }
diff --git a/target/riscv/pmu.c b/target/riscv/pmu.c
index 15f161059fb7..b58a09c85616 100644
--- a/target/riscv/pmu.c
+++ b/target/riscv/pmu.c
@@ -19,11 +19,56 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "pmu.h"
+#include "sysemu/device_tree.h"
 
 #define RISCV_TIMEBASE_FREQ 1000000000 /* 1Ghz */
 #define MAKE_32BIT_MASK(shift, length) \
         (((uint32_t)(~0UL) >> (32 - (length))) << (shift))
 
+/**
+ * To keep it simple, any event can be mapped to any programmable counters in
+ * QEMU. The generic cycle & instruction count events can also be monitored
+ * using programmable counters. In that case, mcycle & minstret must continue
+ * to provide the correct value as well. Hetergenous PMU per hart is not
+ * supported yet. Thus, number of counters are same across all harts.
+ */
+void riscv_pmu_generate_fdt_node(void *fdt, int num_ctrs, char *pmu_name)
+{
+    uint32_t fdt_event_ctr_map[20] = {};
+    uint32_t cmask;
+
+    /* All the programmable counters can map to any event */
+    cmask = MAKE_32BIT_MASK(3, num_ctrs);
+
+   /* SBI_PMU_HW_CPU_CYCLES */
+   fdt_event_ctr_map[0] = cpu_to_be32(0x00000001);
+   fdt_event_ctr_map[1] = cpu_to_be32(0x00000001);
+   fdt_event_ctr_map[2] = cpu_to_be32(cmask | 1 << 0);
+
+   /* SBI_PMU_HW_INSTRUCTIONS */
+   fdt_event_ctr_map[3] = cpu_to_be32(0x00000002);
+   fdt_event_ctr_map[4] = cpu_to_be32(0x00000002);
+   fdt_event_ctr_map[5] = cpu_to_be32(cmask | 1 << 2);
+
+   /* SBI_PMU_HW_CACHE_DTLB : READ : MISS */
+   fdt_event_ctr_map[6] = cpu_to_be32(0x00010019);
+   fdt_event_ctr_map[7] = cpu_to_be32(0x00010019);
+   fdt_event_ctr_map[8] = cpu_to_be32(cmask);
+
+   /* SBI_PMU_HW_CACHE_DTLB : WRITE : MISS */
+   fdt_event_ctr_map[9] = cpu_to_be32(0x0001001B);
+   fdt_event_ctr_map[10] = cpu_to_be32(0x0001001B);
+   fdt_event_ctr_map[11] = cpu_to_be32(cmask);
+
+   /* SBI_PMU_HW_CACHE_ITLB : READ : MISS */
+   fdt_event_ctr_map[12] = cpu_to_be32(0x00010021);
+   fdt_event_ctr_map[13] = cpu_to_be32(0x00010021);
+   fdt_event_ctr_map[14] = cpu_to_be32(cmask);
+
+   qemu_fdt_setprop(fdt, pmu_name, "riscv,event-to-mhpmcounters",
+                    fdt_event_ctr_map, sizeof(fdt_event_ctr_map));
+}
+
 static bool riscv_pmu_counter_valid(RISCVCPU *cpu, uint32_t ctr_idx)
 {
     if (ctr_idx < 3 || ctr_idx >= RV_MAX_MHPMCOUNTERS ||
diff --git a/target/riscv/pmu.h b/target/riscv/pmu.h
index 9b400c3522f2..63c4b533b223 100644
--- a/target/riscv/pmu.h
+++ b/target/riscv/pmu.h
@@ -31,6 +31,7 @@ int riscv_pmu_init(RISCVCPU *cpu, int num_counters);
 int riscv_pmu_update_event_map(CPURISCVState *env, uint64_t value,
                                uint32_t ctr_idx);
 int riscv_pmu_incr_ctr(RISCVCPU *cpu, enum riscv_pmu_event_idx event_idx);
+void riscv_pmu_generate_fdt_node(void *fdt, int num_counters, char *pmu_name);
 target_ulong get_icount_ticks(bool brv32);
 int riscv_pmu_setup_timer(CPURISCVState *env, uint64_t value,
                           uint32_t ctr_idx);
-- 
2.30.2


