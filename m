Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83AD24959DB
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 07:22:32 +0100 (CET)
Received: from localhost ([::1]:44060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAnJf-0001l1-6o
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 01:22:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAmxO-0006np-JV
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 00:59:39 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:8981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAmxI-00043z-Af
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 00:59:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1642744764; x=1674280764;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NlFV1/sewIf+VX0ZUdCuYSEhXNMpAL4yWWoqK3JLJ3g=;
 b=cPcpxNnc+c1hv/oLpzhgw/Bn4HF16nTeFewJlFB0VSf/evbyctYUCspa
 jMD1RQN7/J9zO1fx6yJviqlccsNVLmc+I8IFKI6D9TFmH6bHi8RlU70WP
 SVWcoXjiKEY7v8pEaXljQOfIioIvskReY1DHH7AoE3J34uPMUt7vRgQ2e
 VWA3MYKzWYy3D+nSN2gukgBavYJ3powLuxpL+AsLMgtGretYnsE8vSX6m
 DdOAaa8zQttjxTK71Ni1T+RegeaTk34MKFIvqjmvhohfOdqCcPiSO6m8y
 wi5eTUsAPnAYL1liharJ2WWeOQ3iXZPAFtfjf28V0UkmUXP9n886Iep6S w==;
X-IronPort-AV: E=Sophos;i="5.88,304,1635177600"; d="scan'208";a="189976516"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 21 Jan 2022 13:59:22 +0800
IronPort-SDR: RT9j5KlhSS5gfTkkZjhEgpKa6iwIXhdmCx5IdyP+eGKSM0g3THkpan+z0wtxzZbmZfgq0j7lbZ
 366JJHHATAWCAfp2DETeVBSxFiCNUitaiqRzRqrmp3CVmtCj6ME6f73MsV+0LsVBgYADaELnqP
 vIHYgGYp+kyiRxGwZ4pDgbZpS693wRMrpCjAZ72Oq3HLp7yUbQszQtz6vCdlrOqFP9OroHfmYW
 6PqjF3/vzsJkTyep+rXfGSKPcDcYejDI3LT4eHRS37am3915ssCpcY/b5ihxBSWMrnIInlBBLk
 HG6JSLSPgURHyPyOhVeXuGqS
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 21:31:33 -0800
IronPort-SDR: y8Urova611gN/xnfx+moZJas0mBgQEnu8PDvo1qL6K4cZYqlh0XQQNGcXBq7iAAFaJHv1qphc+
 NTbRkHOIgf/ACAgCxKUL2f687LXjWY/lioWxneXXXfzqeHyn6xJHXC4ITb+WfYh6L3h1ionYo/
 cRg9LC8oelrwwUMTdPBD2H7dBzIMwtnZbWPnYAvyDqsRw3eSjMZs5kAnnJeS23q0+ZUDFYaTND
 70J9LNFHmeO2EeozCYU8U772AXtbCilt9UCIyk8jFb3OGS8M7hteFFhJzMkFfdUxuxXAQN2raY
 408=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 21:59:22 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jg7xQ3m9lz1SHwl
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 21:59:22 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1642744761; x=1645336762; bh=NlFV1/sewIf+VX0ZUd
 CuYSEhXNMpAL4yWWoqK3JLJ3g=; b=MYlGFa6h5iri/Dy8bN7NZdkAGYe6QLP0xM
 qy+b8OVVbV6v/4RWKzL7gQW+YB0aNbt0qxgE17XtE68z2/DxnyxHxO0X2a0XTLt7
 sLJQGuR/mCLNhDhO3RAhJwnJhR8UV7CaZ1mSfgpTAfUr+jG0mLh1/RH4uvaQmuJn
 5Pa6OmwveLnJW0CGpZ3NXOJpBQLcuWUj9Q2hXSUiY7IMsU+ZMhiBLFfjm9Xv6EgE
 yi9Itw4zrfZ6CCrYjpc2VTHPhV3YJJcDRBINAuvq7lfhoRCxITrI6RlFstM9kr52
 MTrsfMQwQhIfpVvGGOaYS7QEavtAqW/Y1HEBtqSfIgDHC8c2zECQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id BlsRKMlxF9kO for <qemu-devel@nongnu.org>;
 Thu, 20 Jan 2022 21:59:21 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.80])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jg7xJ6FHfz1RvlN;
 Thu, 20 Jan 2022 21:59:16 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Yifei Jiang <jiangyifei@huawei.com>,
 Mingwang Li <limingwang@huawei.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Anup Patel <anup@brainfault.org>
Subject: [PULL 09/61] target/riscv: Support start kernel directly by KVM
Date: Fri, 21 Jan 2022 15:57:38 +1000
Message-Id: <20220121055830.3164408-10-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220121055830.3164408-1-alistair.francis@opensource.wdc.com>
References: <20220121055830.3164408-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=0135fdaf6=alistair.francis@opensource.wdc.com;
 helo=esa4.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Yifei Jiang <jiangyifei@huawei.com>

Get kernel and fdt start address in virt.c, and pass them to KVM
when cpu reset. Add kvm_riscv.h to place riscv specific interface.

In addition, PLIC is created without M-mode PLIC contexts when KVM
is enabled.

Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
Signed-off-by: Mingwang Li <limingwang@huawei.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Message-id: 20220112081329.1835-7-jiangyifei@huawei.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/riscv/boot.h  |  1 +
 target/riscv/cpu.h       |  3 ++
 target/riscv/kvm_riscv.h | 24 ++++++++++++
 hw/intc/sifive_plic.c    | 20 +++++++---
 hw/riscv/boot.c          | 16 +++++++-
 hw/riscv/virt.c          | 83 ++++++++++++++++++++++++++++------------
 target/riscv/cpu.c       |  8 ++++
 target/riscv/kvm-stub.c  | 25 ++++++++++++
 target/riscv/kvm.c       | 14 +++++++
 target/riscv/meson.build |  2 +-
 10 files changed, 164 insertions(+), 32 deletions(-)
 create mode 100644 target/riscv/kvm_riscv.h
 create mode 100644 target/riscv/kvm-stub.c

diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
index baff11dd8a..5834c234aa 100644
--- a/include/hw/riscv/boot.h
+++ b/include/hw/riscv/boot.h
@@ -58,5 +58,6 @@ void riscv_rom_copy_firmware_info(MachineState *machine=
, hwaddr rom_base,
                                   hwaddr rom_size,
                                   uint32_t reset_vec_size,
                                   uint64_t kernel_entry);
+void riscv_setup_direct_kernel(hwaddr kernel_addr, hwaddr fdt_addr);
=20
 #endif /* RISCV_BOOT_H */
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 4d63086765..8fa6fdcd77 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -269,6 +269,9 @@ struct CPURISCVState {
=20
     /* Fields from here on are preserved across CPU reset. */
     QEMUTimer *timer; /* Internal timer */
+
+    hwaddr kernel_addr;
+    hwaddr fdt_addr;
 };
=20
 OBJECT_DECLARE_TYPE(RISCVCPU, RISCVCPUClass,
diff --git a/target/riscv/kvm_riscv.h b/target/riscv/kvm_riscv.h
new file mode 100644
index 0000000000..f38c82bf59
--- /dev/null
+++ b/target/riscv/kvm_riscv.h
@@ -0,0 +1,24 @@
+/*
+ * QEMU KVM support -- RISC-V specific functions.
+ *
+ * Copyright (c) 2020 Huawei Technologies Co., Ltd
+ *
+ * This program is free software; you can redistribute it and/or modify =
it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOU=
T
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License=
 for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License alo=
ng with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef QEMU_KVM_RISCV_H
+#define QEMU_KVM_RISCV_H
+
+void kvm_riscv_reset_vcpu(RISCVCPU *cpu);
+
+#endif
diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
index 746c0f0343..eebbcf33d4 100644
--- a/hw/intc/sifive_plic.c
+++ b/hw/intc/sifive_plic.c
@@ -30,6 +30,7 @@
 #include "target/riscv/cpu.h"
 #include "migration/vmstate.h"
 #include "hw/irq.h"
+#include "sysemu/kvm.h"
=20
 static bool addr_between(uint32_t addr, uint32_t base, uint32_t num)
 {
@@ -430,7 +431,8 @@ DeviceState *sifive_plic_create(hwaddr addr, char *ha=
rt_config,
     uint32_t context_stride, uint32_t aperture_size)
 {
     DeviceState *dev =3D qdev_new(TYPE_SIFIVE_PLIC);
-    int i;
+    int i, j =3D 0;
+    SiFivePLICState *plic;
=20
     assert(enable_stride =3D=3D (enable_stride & -enable_stride));
     assert(context_stride =3D=3D (context_stride & -context_stride));
@@ -448,13 +450,21 @@ DeviceState *sifive_plic_create(hwaddr addr, char *=
hart_config,
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
=20
+    plic =3D SIFIVE_PLIC(dev);
     for (i =3D 0; i < num_harts; i++) {
         CPUState *cpu =3D qemu_get_cpu(hartid_base + i);
=20
-        qdev_connect_gpio_out(dev, i,
-                              qdev_get_gpio_in(DEVICE(cpu), IRQ_S_EXT));
-        qdev_connect_gpio_out(dev, num_harts + i,
-                              qdev_get_gpio_in(DEVICE(cpu), IRQ_M_EXT));
+        if (plic->addr_config[j].mode =3D=3D PLICMode_M) {
+            j++;
+            qdev_connect_gpio_out(dev, num_harts + i,
+                                  qdev_get_gpio_in(DEVICE(cpu), IRQ_M_EX=
T));
+        }
+
+        if (plic->addr_config[j].mode =3D=3D PLICMode_S) {
+            j++;
+            qdev_connect_gpio_out(dev, i,
+                                  qdev_get_gpio_in(DEVICE(cpu), IRQ_S_EX=
T));
+        }
     }
=20
     return dev;
diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index f67264374e..cae74fcbcd 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -30,6 +30,7 @@
 #include "elf.h"
 #include "sysemu/device_tree.h"
 #include "sysemu/qtest.h"
+#include "sysemu/kvm.h"
=20
 #include <libfdt.h>
=20
@@ -51,7 +52,9 @@ char *riscv_plic_hart_config_string(int hart_count)
         CPUState *cs =3D qemu_get_cpu(i);
         CPURISCVState *env =3D &RISCV_CPU(cs)->env;
=20
-        if (riscv_has_ext(env, RVS)) {
+        if (kvm_enabled()) {
+            vals[i] =3D "S";
+        } else if (riscv_has_ext(env, RVS)) {
             vals[i] =3D "MS";
         } else {
             vals[i] =3D "M";
@@ -324,3 +327,14 @@ void riscv_setup_rom_reset_vec(MachineState *machine=
, RISCVHartArrayState *harts
=20
     return;
 }
+
+void riscv_setup_direct_kernel(hwaddr kernel_addr, hwaddr fdt_addr)
+{
+    CPUState *cs;
+
+    for (cs =3D first_cpu; cs; cs =3D CPU_NEXT(cs)) {
+        RISCVCPU *riscv_cpu =3D RISCV_CPU(cs);
+        riscv_cpu->env.kernel_addr =3D kernel_addr;
+        riscv_cpu->env.fdt_addr =3D fdt_addr;
+    }
+}
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 3af074148e..2643c8bc37 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -38,6 +38,7 @@
 #include "chardev/char.h"
 #include "sysemu/device_tree.h"
 #include "sysemu/sysemu.h"
+#include "sysemu/kvm.h"
 #include "hw/pci/pci.h"
 #include "hw/pci-host/gpex.h"
 #include "hw/display/ramfb.h"
@@ -372,13 +373,22 @@ static void create_fdt_socket_plic(RISCVVirtState *=
s,
         "sifive,plic-1.0.0", "riscv,plic0"
     };
=20
-    plic_cells =3D g_new0(uint32_t, s->soc[socket].num_harts * 4);
+    if (kvm_enabled()) {
+        plic_cells =3D g_new0(uint32_t, s->soc[socket].num_harts * 2);
+    } else {
+        plic_cells =3D g_new0(uint32_t, s->soc[socket].num_harts * 4);
+    }
=20
     for (cpu =3D 0; cpu < s->soc[socket].num_harts; cpu++) {
-        plic_cells[cpu * 4 + 0] =3D cpu_to_be32(intc_phandles[cpu]);
-        plic_cells[cpu * 4 + 1] =3D cpu_to_be32(IRQ_M_EXT);
-        plic_cells[cpu * 4 + 2] =3D cpu_to_be32(intc_phandles[cpu]);
-        plic_cells[cpu * 4 + 3] =3D cpu_to_be32(IRQ_S_EXT);
+        if (kvm_enabled()) {
+            plic_cells[cpu * 2 + 0] =3D cpu_to_be32(intc_phandles[cpu]);
+            plic_cells[cpu * 2 + 1] =3D cpu_to_be32(IRQ_S_EXT);
+        } else {
+            plic_cells[cpu * 4 + 0] =3D cpu_to_be32(intc_phandles[cpu]);
+            plic_cells[cpu * 4 + 1] =3D cpu_to_be32(IRQ_M_EXT);
+            plic_cells[cpu * 4 + 2] =3D cpu_to_be32(intc_phandles[cpu]);
+            plic_cells[cpu * 4 + 3] =3D cpu_to_be32(IRQ_S_EXT);
+        }
     }
=20
     plic_phandles[socket] =3D (*phandle)++;
@@ -436,10 +446,12 @@ static void create_fdt_sockets(RISCVVirtState *s, c=
onst MemMapEntry *memmap,
=20
         create_fdt_socket_memory(s, memmap, socket);
=20
-        if (s->have_aclint) {
-            create_fdt_socket_aclint(s, memmap, socket, intc_phandles);
-        } else {
-            create_fdt_socket_clint(s, memmap, socket, intc_phandles);
+        if (!kvm_enabled()) {
+            if (s->have_aclint) {
+                create_fdt_socket_aclint(s, memmap, socket, intc_phandle=
s);
+            } else {
+                create_fdt_socket_clint(s, memmap, socket, intc_phandles=
);
+            }
         }
=20
         create_fdt_socket_plic(s, memmap, socket, phandle,
@@ -801,23 +813,25 @@ static void virt_machine_init(MachineState *machine=
)
                                 hart_count, &error_abort);
         sysbus_realize(SYS_BUS_DEVICE(&s->soc[i]), &error_abort);
=20
-        /* Per-socket CLINT */
-        riscv_aclint_swi_create(
-            memmap[VIRT_CLINT].base + i * memmap[VIRT_CLINT].size,
-            base_hartid, hart_count, false);
-        riscv_aclint_mtimer_create(
-            memmap[VIRT_CLINT].base + i * memmap[VIRT_CLINT].size +
-                RISCV_ACLINT_SWI_SIZE,
-            RISCV_ACLINT_DEFAULT_MTIMER_SIZE, base_hartid, hart_count,
-            RISCV_ACLINT_DEFAULT_MTIMECMP, RISCV_ACLINT_DEFAULT_MTIME,
-            RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ, true);
-
-        /* Per-socket ACLINT SSWI */
-        if (s->have_aclint) {
+        if (!kvm_enabled()) {
+            /* Per-socket CLINT */
             riscv_aclint_swi_create(
-                memmap[VIRT_ACLINT_SSWI].base +
-                    i * memmap[VIRT_ACLINT_SSWI].size,
-                base_hartid, hart_count, true);
+                memmap[VIRT_CLINT].base + i * memmap[VIRT_CLINT].size,
+                base_hartid, hart_count, false);
+            riscv_aclint_mtimer_create(
+                memmap[VIRT_CLINT].base + i * memmap[VIRT_CLINT].size +
+                    RISCV_ACLINT_SWI_SIZE,
+                RISCV_ACLINT_DEFAULT_MTIMER_SIZE, base_hartid, hart_coun=
t,
+                RISCV_ACLINT_DEFAULT_MTIMECMP, RISCV_ACLINT_DEFAULT_MTIM=
E,
+                RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ, true);
+
+            /* Per-socket ACLINT SSWI */
+            if (s->have_aclint) {
+                riscv_aclint_swi_create(
+                    memmap[VIRT_ACLINT_SSWI].base +
+                        i * memmap[VIRT_ACLINT_SSWI].size,
+                    base_hartid, hart_count, true);
+            }
         }
=20
         /* Per-socket PLIC hart topology configuration string */
@@ -884,6 +898,16 @@ static void virt_machine_init(MachineState *machine)
     memory_region_add_subregion(system_memory, memmap[VIRT_MROM].base,
                                 mask_rom);
=20
+    /*
+     * Only direct boot kernel is currently supported for KVM VM,
+     * so the "-bios" parameter is ignored and treated like "-bios none"
+     * when KVM is enabled.
+     */
+    if (kvm_enabled()) {
+        g_free(machine->firmware);
+        machine->firmware =3D g_strdup("none");
+    }
+
     if (riscv_is_32bit(&s->soc[0])) {
         firmware_end_addr =3D riscv_find_and_load_firmware(machine,
                                     RISCV32_BIOS_BIN, start_addr, NULL);
@@ -941,6 +965,15 @@ static void virt_machine_init(MachineState *machine)
                               virt_memmap[VIRT_MROM].size, kernel_entry,
                               fdt_load_addr, machine->fdt);
=20
+    /*
+     * Only direct boot kernel is currently supported for KVM VM,
+     * So here setup kernel start address and fdt address.
+     * TODO:Support firmware loading and integrate to TCG start
+     */
+    if (kvm_enabled()) {
+        riscv_setup_direct_kernel(kernel_entry, fdt_load_addr);
+    }
+
     /* SiFive Test MMIO device */
     sifive_test_create(memmap[VIRT_TEST].base);
=20
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 9bc25d3055..a6922dde05 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -29,6 +29,8 @@
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
 #include "fpu/softfloat-helpers.h"
+#include "sysemu/kvm.h"
+#include "kvm_riscv.h"
=20
 /* RISC-V CPU definitions */
=20
@@ -402,6 +404,12 @@ static void riscv_cpu_reset(DeviceState *dev)
     cs->exception_index =3D RISCV_EXCP_NONE;
     env->load_res =3D -1;
     set_default_nan_mode(1, &env->fp_status);
+
+#ifndef CONFIG_USER_ONLY
+    if (kvm_enabled()) {
+        kvm_riscv_reset_vcpu(cpu);
+    }
+#endif
 }
=20
 static void riscv_cpu_disas_set_info(CPUState *s, disassemble_info *info=
)
diff --git a/target/riscv/kvm-stub.c b/target/riscv/kvm-stub.c
new file mode 100644
index 0000000000..39b96fe3f4
--- /dev/null
+++ b/target/riscv/kvm-stub.c
@@ -0,0 +1,25 @@
+/*
+ * QEMU KVM RISC-V specific function stubs
+ *
+ * Copyright (c) 2020 Huawei Technologies Co., Ltd
+ *
+ * This program is free software; you can redistribute it and/or modify =
it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOU=
T
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License=
 for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License alo=
ng with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "kvm_riscv.h"
+
+void kvm_riscv_reset_vcpu(RISCVCPU *cpu)
+{
+    abort();
+}
diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
index dbaff53bf2..d5c6a9d41a 100644
--- a/target/riscv/kvm.c
+++ b/target/riscv/kvm.c
@@ -37,6 +37,7 @@
 #include "hw/irq.h"
 #include "qemu/log.h"
 #include "hw/loader.h"
+#include "kvm_riscv.h"
=20
 static uint64_t kvm_riscv_reg_id(CPURISCVState *env, uint64_t type,
                                  uint64_t idx)
@@ -371,6 +372,19 @@ int kvm_arch_handle_exit(CPUState *cs, struct kvm_ru=
n *run)
     return 0;
 }
=20
+void kvm_riscv_reset_vcpu(RISCVCPU *cpu)
+{
+    CPURISCVState *env =3D &cpu->env;
+
+    if (!kvm_enabled()) {
+        return;
+    }
+    env->pc =3D cpu->env.kernel_addr;
+    env->gpr[10] =3D kvm_arch_vcpu_id(CPU(cpu)); /* a0 */
+    env->gpr[11] =3D cpu->env.fdt_addr;          /* a1 */
+    env->satp =3D 0;
+}
+
 bool kvm_arch_cpu_check_are_resettable(void)
 {
     return true;
diff --git a/target/riscv/meson.build b/target/riscv/meson.build
index 95340b44aa..a3997ed580 100644
--- a/target/riscv/meson.build
+++ b/target/riscv/meson.build
@@ -20,7 +20,7 @@ riscv_ss.add(files(
   'translate.c',
   'm128_helper.c'
 ))
-riscv_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c'))
+riscv_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c'), if_false: file=
s('kvm-stub.c'))
=20
 riscv_softmmu_ss =3D ss.source_set()
 riscv_softmmu_ss.add(files(
--=20
2.31.1


