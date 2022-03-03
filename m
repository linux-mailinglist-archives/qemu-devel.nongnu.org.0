Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB2D4CB66B
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 06:31:35 +0100 (CET)
Received: from localhost ([::1]:43920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPe3q-0004bQ-B9
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 00:31:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=05403f1d5=alistair.francis@opensource.wdc.com>)
 id 1nPe0y-0001Wv-5V
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 00:28:37 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:61782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=05403f1d5=alistair.francis@opensource.wdc.com>)
 id 1nPe0v-0000Gc-AT
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 00:28:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1646285312; x=1677821312;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vwfffb7uOAbcbFms73B4qrF+Q5n2X60H9OXvkn4LzGs=;
 b=PPHYhaOT3uh7e0OS1Apg6wfWcLUL1Ue9H9G70aFdBYYTeXK69HpUSWw9
 KuQuRKsWaWPQuVzp8PpmlLczljqUicRWuODi8cqWXSi2SN/T2O942QI8P
 pVMxD928buRPP6K/JfxFYF74puX5xv582OL7qD79hvzUkx9nbDX6RI/eR
 0lmQqEVNJZgA82YVJ2OgvbgXNhu5vEl/ZK1LMBdZOltxkVJ4tazmMnDTG
 pozMRPTm/a2jfiZGPxciogDhHNlib6AHmIrMBFNvTvlvsx1AqB1dAL5M6
 FBLPSGohkEa2tkiiakSmhSyFG76BjNfwJhwXZ1jMYFblmvVJmhWg/Ioyo g==;
X-IronPort-AV: E=Sophos;i="5.90,151,1643644800"; d="scan'208";a="194355334"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 03 Mar 2022 13:28:30 +0800
IronPort-SDR: 5LJeT3+NOD5ufl6JFiR1AVvct09o0G6TbdJ72W8lF1IdnEQbgJO8PUlQMJMJx2Y2nggf3ffa7c
 fvSR2aNVAfpgpUdd44Yrgzt4X3unClsHKbkOV+HZEj3qEIkZGSO/DxH3JawY/YAcT18I0qOJLp
 wtImnp4Pso1yHl24I+YkzR46JD+SnGcBp28gx27AOLu8na9GxOL0FbXjEq5UiWlGSycgpwuytA
 JSJz7MLOrLOiqRhuNeuwUBlFiiIrbBBSGx5LHzgmkd3TDxGcvy/PrY5mLQoyXToOjRnO517CQ0
 eNyyyqaLtfLRyJ6YSyAWZJ57
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 20:59:53 -0800
IronPort-SDR: ex70LNwvDr3qkCtOlBkvj7Zh1z5Mr93w1zIf41SBs8dTBecGOpxo6S9WPivVIlXCYYPUEBAn0l
 TWyLx5wIkfPWqCn4Og9+DDpXEmN11QQsEC35y9d+BQBcKYvveA/GOmGbc2W7oeFjYweNy3D43d
 kb/9QfCmsS85jxxcNunfRrs8vQKQ/PquX0SleWsguz7YedDZCO2U1TsRkoRHsnvfYeW+mpW3Pw
 H5BKCYevuuLXbx9nwBxF23bot8gDmXQkd30i/cZNHMj/4gr0Dpoj5KoqfwvkC+FmRWfu01fPBW
 oYo=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 21:28:31 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4K8KJt61Y0z1SHwl
 for <qemu-devel@nongnu.org>; Wed,  2 Mar 2022 21:28:30 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1646285309; x=1648877310; bh=vwfffb7uOAbcbFms73
 B4qrF+Q5n2X60H9OXvkn4LzGs=; b=jz1d7eQGqrlKiwwxpkHrOXm7WG+8yHUGM3
 VojMxNYgt1k6z/b5H0Nml4SIrmbAapouX/Zf29ajtmT4Gf+0zxyxzG/peUOvqhci
 9kAUXYqjQdMi6um0VZnCD4knYyA2Fq/xXSzaPh9TxHF83XM3A2Rq4fbcAIaTQCdI
 rKn0SZfAjBg0CPHvnrE5B5k0PWwcHD8L92TcwMKmGHUjTx7HDYlk6TeMBhki0VF4
 Ofp7pw/HRVo6r9V82QlVQ49KwDmZbDbRp1iN1qbdxNeE8tzGQbRqRcgK0rtVQEHg
 OioC0TtXqcZG0Jz3q/B5ZCkpE5y7WhD9nw4Qx3V08IwrVEIzu2nQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id pl42hupgW6OI for <qemu-devel@nongnu.org>;
 Wed,  2 Mar 2022 21:28:29 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.101])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4K8KJn3yypz1Rvlx;
 Wed,  2 Mar 2022 21:28:25 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Anup Patel <anup.patel@wdc.com>,
 Anup Patel <anup@brainfault.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 02/13] hw/riscv: virt: Add optional AIA APLIC support to virt
 machine
Date: Thu,  3 Mar 2022 15:27:53 +1000
Message-Id: <20220303052804.529967-3-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220303052804.529967-1-alistair.francis@opensource.wdc.com>
References: <20220303052804.529967-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=05403f1d5=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Anup Patel <anup.patel@wdc.com>

We extend virt machine to emulate AIA APLIC devices only when
"aia=3Daplic" parameter is passed along with machine name in QEMU
command-line. When "aia=3Dnone" or not specified then we fallback
to original PLIC device emulation.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220220085526.808674-2-anup@brainfault.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/riscv/virt.h |  26 +++-
 hw/riscv/virt.c         | 291 ++++++++++++++++++++++++++++++++--------
 hw/riscv/Kconfig        |   1 +
 3 files changed, 259 insertions(+), 59 deletions(-)

diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index 6e9f61ccd9..47706b456d 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -32,18 +32,24 @@ typedef struct RISCVVirtState RISCVVirtState;
 DECLARE_INSTANCE_CHECKER(RISCVVirtState, RISCV_VIRT_MACHINE,
                          TYPE_RISCV_VIRT_MACHINE)
=20
+typedef enum RISCVVirtAIAType {
+    VIRT_AIA_TYPE_NONE =3D 0,
+    VIRT_AIA_TYPE_APLIC,
+} RISCVVirtAIAType;
+
 struct RISCVVirtState {
     /*< private >*/
     MachineState parent;
=20
     /*< public >*/
     RISCVHartArrayState soc[VIRT_SOCKETS_MAX];
-    DeviceState *plic[VIRT_SOCKETS_MAX];
+    DeviceState *irqchip[VIRT_SOCKETS_MAX];
     PFlashCFI01 *flash[2];
     FWCfgState *fw_cfg;
=20
     int fdt_size;
     bool have_aclint;
+    RISCVVirtAIAType aia_type;
 };
=20
 enum {
@@ -54,6 +60,8 @@ enum {
     VIRT_CLINT,
     VIRT_ACLINT_SSWI,
     VIRT_PLIC,
+    VIRT_APLIC_M,
+    VIRT_APLIC_S,
     VIRT_UART0,
     VIRT_VIRTIO,
     VIRT_FW_CFG,
@@ -73,8 +81,9 @@ enum {
     VIRTIO_NDEV =3D 0x35 /* Arbitrary maximum number of interrupts */
 };
=20
-#define VIRT_PLIC_NUM_SOURCES 127
-#define VIRT_PLIC_NUM_PRIORITIES 7
+#define VIRT_IRQCHIP_NUM_SOURCES 127
+#define VIRT_IRQCHIP_NUM_PRIO_BITS 3
+
 #define VIRT_PLIC_PRIORITY_BASE 0x04
 #define VIRT_PLIC_PENDING_BASE 0x1000
 #define VIRT_PLIC_ENABLE_BASE 0x2000
@@ -86,9 +95,14 @@ enum {
=20
 #define FDT_PCI_ADDR_CELLS    3
 #define FDT_PCI_INT_CELLS     1
-#define FDT_PLIC_ADDR_CELLS   0
 #define FDT_PLIC_INT_CELLS    1
-#define FDT_INT_MAP_WIDTH     (FDT_PCI_ADDR_CELLS + FDT_PCI_INT_CELLS + =
1 + \
-                               FDT_PLIC_ADDR_CELLS + FDT_PLIC_INT_CELLS)
+#define FDT_APLIC_INT_CELLS   2
+#define FDT_MAX_INT_CELLS     2
+#define FDT_MAX_INT_MAP_WIDTH (FDT_PCI_ADDR_CELLS + FDT_PCI_INT_CELLS + =
\
+                                 1 + FDT_MAX_INT_CELLS)
+#define FDT_PLIC_INT_MAP_WIDTH  (FDT_PCI_ADDR_CELLS + FDT_PCI_INT_CELLS =
+ \
+                                 1 + FDT_PLIC_INT_CELLS)
+#define FDT_APLIC_INT_MAP_WIDTH (FDT_PCI_ADDR_CELLS + FDT_PCI_INT_CELLS =
+ \
+                                 1 + FDT_APLIC_INT_CELLS)
=20
 #endif
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index e3068d6126..6b06f79b46 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -33,6 +33,7 @@
 #include "hw/riscv/boot.h"
 #include "hw/riscv/numa.h"
 #include "hw/intc/riscv_aclint.h"
+#include "hw/intc/riscv_aplic.h"
 #include "hw/intc/sifive_plic.h"
 #include "hw/misc/sifive_test.h"
 #include "chardev/char.h"
@@ -52,6 +53,8 @@ static const MemMapEntry virt_memmap[] =3D {
     [VIRT_ACLINT_SSWI] =3D {  0x2F00000,        0x4000 },
     [VIRT_PCIE_PIO] =3D    {  0x3000000,       0x10000 },
     [VIRT_PLIC] =3D        {  0xc000000, VIRT_PLIC_SIZE(VIRT_CPUS_MAX * =
2) },
+    [VIRT_APLIC_M] =3D     {  0xc000000, APLIC_SIZE(VIRT_CPUS_MAX) },
+    [VIRT_APLIC_S] =3D     {  0xd000000, APLIC_SIZE(VIRT_CPUS_MAX) },
     [VIRT_UART0] =3D       { 0x10000000,         0x100 },
     [VIRT_VIRTIO] =3D      { 0x10001000,        0x1000 },
     [VIRT_FW_CFG] =3D      { 0x10100000,          0x18 },
@@ -133,12 +136,13 @@ static void virt_flash_map(RISCVVirtState *s,
                     sysmem);
 }
=20
-static void create_pcie_irq_map(void *fdt, char *nodename,
-                                uint32_t plic_phandle)
+static void create_pcie_irq_map(RISCVVirtState *s, void *fdt, char *node=
name,
+                                uint32_t irqchip_phandle)
 {
     int pin, dev;
-    uint32_t
-        full_irq_map[GPEX_NUM_IRQS * GPEX_NUM_IRQS * FDT_INT_MAP_WIDTH] =
=3D {};
+    uint32_t irq_map_stride =3D 0;
+    uint32_t full_irq_map[GPEX_NUM_IRQS * GPEX_NUM_IRQS *
+                          FDT_MAX_INT_MAP_WIDTH] =3D {};
     uint32_t *irq_map =3D full_irq_map;
=20
     /* This code creates a standard swizzle of interrupts such that
@@ -156,23 +160,31 @@ static void create_pcie_irq_map(void *fdt, char *no=
dename,
             int irq_nr =3D PCIE_IRQ + ((pin + PCI_SLOT(devfn)) % GPEX_NU=
M_IRQS);
             int i =3D 0;
=20
+            /* Fill PCI address cells */
             irq_map[i] =3D cpu_to_be32(devfn << 8);
-
             i +=3D FDT_PCI_ADDR_CELLS;
-            irq_map[i] =3D cpu_to_be32(pin + 1);
=20
+            /* Fill PCI Interrupt cells */
+            irq_map[i] =3D cpu_to_be32(pin + 1);
             i +=3D FDT_PCI_INT_CELLS;
-            irq_map[i++] =3D cpu_to_be32(plic_phandle);
=20
-            i +=3D FDT_PLIC_ADDR_CELLS;
-            irq_map[i] =3D cpu_to_be32(irq_nr);
+            /* Fill interrupt controller phandle and cells */
+            irq_map[i++] =3D cpu_to_be32(irqchip_phandle);
+            irq_map[i++] =3D cpu_to_be32(irq_nr);
+            if (s->aia_type !=3D VIRT_AIA_TYPE_NONE) {
+                irq_map[i++] =3D cpu_to_be32(0x4);
+            }
=20
-            irq_map +=3D FDT_INT_MAP_WIDTH;
+            if (!irq_map_stride) {
+                irq_map_stride =3D i;
+            }
+            irq_map +=3D irq_map_stride;
         }
     }
=20
-    qemu_fdt_setprop(fdt, nodename, "interrupt-map",
-                     full_irq_map, sizeof(full_irq_map));
+    qemu_fdt_setprop(fdt, nodename, "interrupt-map", full_irq_map,
+                     GPEX_NUM_IRQS * GPEX_NUM_IRQS *
+                     irq_map_stride * sizeof(uint32_t));
=20
     qemu_fdt_setprop_cells(fdt, nodename, "interrupt-map-mask",
                            0x1800, 0, 0, 0x7);
@@ -404,8 +416,6 @@ static void create_fdt_socket_plic(RISCVVirtState *s,
     plic_addr =3D memmap[VIRT_PLIC].base + (memmap[VIRT_PLIC].size * soc=
ket);
     plic_name =3D g_strdup_printf("/soc/plic@%lx", plic_addr);
     qemu_fdt_add_subnode(mc->fdt, plic_name);
-    qemu_fdt_setprop_cell(mc->fdt, plic_name,
-        "#address-cells", FDT_PLIC_ADDR_CELLS);
     qemu_fdt_setprop_cell(mc->fdt, plic_name,
         "#interrupt-cells", FDT_PLIC_INT_CELLS);
     qemu_fdt_setprop_string_array(mc->fdt, plic_name, "compatible",
@@ -425,6 +435,76 @@ static void create_fdt_socket_plic(RISCVVirtState *s=
,
     g_free(plic_cells);
 }
=20
+static void create_fdt_socket_aia(RISCVVirtState *s,
+                                  const MemMapEntry *memmap, int socket,
+                                  uint32_t *phandle, uint32_t *intc_phan=
dles,
+                                  uint32_t *aplic_phandles)
+{
+    int cpu;
+    char *aplic_name;
+    uint32_t *aplic_cells;
+    unsigned long aplic_addr;
+    MachineState *mc =3D MACHINE(s);
+    uint32_t aplic_m_phandle, aplic_s_phandle;
+
+    aplic_m_phandle =3D (*phandle)++;
+    aplic_s_phandle =3D (*phandle)++;
+    aplic_cells =3D g_new0(uint32_t, s->soc[socket].num_harts * 2);
+
+    /* M-level APLIC node */
+    for (cpu =3D 0; cpu < s->soc[socket].num_harts; cpu++) {
+        aplic_cells[cpu * 2 + 0] =3D cpu_to_be32(intc_phandles[cpu]);
+        aplic_cells[cpu * 2 + 1] =3D cpu_to_be32(IRQ_M_EXT);
+    }
+    aplic_addr =3D memmap[VIRT_APLIC_M].base +
+                 (memmap[VIRT_APLIC_M].size * socket);
+    aplic_name =3D g_strdup_printf("/soc/aplic@%lx", aplic_addr);
+    qemu_fdt_add_subnode(mc->fdt, aplic_name);
+    qemu_fdt_setprop_string(mc->fdt, aplic_name, "compatible", "riscv,ap=
lic");
+    qemu_fdt_setprop_cell(mc->fdt, aplic_name,
+        "#interrupt-cells", FDT_APLIC_INT_CELLS);
+    qemu_fdt_setprop(mc->fdt, aplic_name, "interrupt-controller", NULL, =
0);
+    qemu_fdt_setprop(mc->fdt, aplic_name, "interrupts-extended",
+        aplic_cells, s->soc[socket].num_harts * sizeof(uint32_t) * 2);
+    qemu_fdt_setprop_cells(mc->fdt, aplic_name, "reg",
+        0x0, aplic_addr, 0x0, memmap[VIRT_APLIC_M].size);
+    qemu_fdt_setprop_cell(mc->fdt, aplic_name, "riscv,num-sources",
+        VIRT_IRQCHIP_NUM_SOURCES);
+    qemu_fdt_setprop_cell(mc->fdt, aplic_name, "riscv,children",
+        aplic_s_phandle);
+    qemu_fdt_setprop_cells(mc->fdt, aplic_name, "riscv,delegate",
+        aplic_s_phandle, 0x1, VIRT_IRQCHIP_NUM_SOURCES);
+    riscv_socket_fdt_write_id(mc, mc->fdt, aplic_name, socket);
+    qemu_fdt_setprop_cell(mc->fdt, aplic_name, "phandle", aplic_m_phandl=
e);
+    g_free(aplic_name);
+
+    /* S-level APLIC node */
+    for (cpu =3D 0; cpu < s->soc[socket].num_harts; cpu++) {
+        aplic_cells[cpu * 2 + 0] =3D cpu_to_be32(intc_phandles[cpu]);
+        aplic_cells[cpu * 2 + 1] =3D cpu_to_be32(IRQ_S_EXT);
+    }
+    aplic_addr =3D memmap[VIRT_APLIC_S].base +
+                 (memmap[VIRT_APLIC_S].size * socket);
+    aplic_name =3D g_strdup_printf("/soc/aplic@%lx", aplic_addr);
+    qemu_fdt_add_subnode(mc->fdt, aplic_name);
+    qemu_fdt_setprop_string(mc->fdt, aplic_name, "compatible", "riscv,ap=
lic");
+    qemu_fdt_setprop_cell(mc->fdt, aplic_name,
+        "#interrupt-cells", FDT_APLIC_INT_CELLS);
+    qemu_fdt_setprop(mc->fdt, aplic_name, "interrupt-controller", NULL, =
0);
+    qemu_fdt_setprop(mc->fdt, aplic_name, "interrupts-extended",
+        aplic_cells, s->soc[socket].num_harts * sizeof(uint32_t) * 2);
+    qemu_fdt_setprop_cells(mc->fdt, aplic_name, "reg",
+        0x0, aplic_addr, 0x0, memmap[VIRT_APLIC_S].size);
+    qemu_fdt_setprop_cell(mc->fdt, aplic_name, "riscv,num-sources",
+        VIRT_IRQCHIP_NUM_SOURCES);
+    riscv_socket_fdt_write_id(mc, mc->fdt, aplic_name, socket);
+    qemu_fdt_setprop_cell(mc->fdt, aplic_name, "phandle", aplic_s_phandl=
e);
+    g_free(aplic_name);
+
+    g_free(aplic_cells);
+    aplic_phandles[socket] =3D aplic_s_phandle;
+}
+
 static void create_fdt_sockets(RISCVVirtState *s, const MemMapEntry *mem=
map,
                                bool is_32_bit, uint32_t *phandle,
                                uint32_t *irq_mmio_phandle,
@@ -463,8 +543,13 @@ static void create_fdt_sockets(RISCVVirtState *s, co=
nst MemMapEntry *memmap,
             }
         }
=20
-        create_fdt_socket_plic(s, memmap, socket, phandle,
-            intc_phandles, xplic_phandles);
+        if (s->aia_type =3D=3D VIRT_AIA_TYPE_NONE) {
+            create_fdt_socket_plic(s, memmap, socket, phandle,
+                intc_phandles, xplic_phandles);
+        } else {
+            create_fdt_socket_aia(s, memmap, socket, phandle,
+                intc_phandles, xplic_phandles);
+        }
=20
         g_free(intc_phandles);
         g_free(clust_name);
@@ -505,7 +590,13 @@ static void create_fdt_virtio(RISCVVirtState *s, con=
st MemMapEntry *memmap,
             0x0, memmap[VIRT_VIRTIO].size);
         qemu_fdt_setprop_cell(mc->fdt, name, "interrupt-parent",
             irq_virtio_phandle);
-        qemu_fdt_setprop_cell(mc->fdt, name, "interrupts", VIRTIO_IRQ + =
i);
+        if (s->aia_type =3D=3D VIRT_AIA_TYPE_NONE) {
+            qemu_fdt_setprop_cell(mc->fdt, name, "interrupts",
+                                  VIRTIO_IRQ + i);
+        } else {
+            qemu_fdt_setprop_cells(mc->fdt, name, "interrupts",
+                                   VIRTIO_IRQ + i, 0x4);
+        }
         g_free(name);
     }
 }
@@ -543,7 +634,7 @@ static void create_fdt_pcie(RISCVVirtState *s, const =
MemMapEntry *memmap,
         2, virt_high_pcie_memmap.base,
         2, virt_high_pcie_memmap.base, 2, virt_high_pcie_memmap.size);
=20
-    create_pcie_irq_map(mc->fdt, name, irq_pcie_phandle);
+    create_pcie_irq_map(s, mc->fdt, name, irq_pcie_phandle);
     g_free(name);
 }
=20
@@ -602,7 +693,11 @@ static void create_fdt_uart(RISCVVirtState *s, const=
 MemMapEntry *memmap,
         0x0, memmap[VIRT_UART0].size);
     qemu_fdt_setprop_cell(mc->fdt, name, "clock-frequency", 3686400);
     qemu_fdt_setprop_cell(mc->fdt, name, "interrupt-parent", irq_mmio_ph=
andle);
-    qemu_fdt_setprop_cell(mc->fdt, name, "interrupts", UART0_IRQ);
+    if (s->aia_type =3D=3D VIRT_AIA_TYPE_NONE) {
+        qemu_fdt_setprop_cell(mc->fdt, name, "interrupts", UART0_IRQ);
+    } else {
+        qemu_fdt_setprop_cells(mc->fdt, name, "interrupts", UART0_IRQ, 0=
x4);
+    }
=20
     qemu_fdt_add_subnode(mc->fdt, "/chosen");
     qemu_fdt_setprop_string(mc->fdt, "/chosen", "stdout-path", name);
@@ -623,7 +718,11 @@ static void create_fdt_rtc(RISCVVirtState *s, const =
MemMapEntry *memmap,
         0x0, memmap[VIRT_RTC].base, 0x0, memmap[VIRT_RTC].size);
     qemu_fdt_setprop_cell(mc->fdt, name, "interrupt-parent",
         irq_mmio_phandle);
-    qemu_fdt_setprop_cell(mc->fdt, name, "interrupts", RTC_IRQ);
+    if (s->aia_type =3D=3D VIRT_AIA_TYPE_NONE) {
+        qemu_fdt_setprop_cell(mc->fdt, name, "interrupts", RTC_IRQ);
+    } else {
+        qemu_fdt_setprop_cells(mc->fdt, name, "interrupts", RTC_IRQ, 0x4=
);
+    }
     g_free(name);
 }
=20
@@ -704,7 +803,7 @@ static inline DeviceState *gpex_pcie_init(MemoryRegio=
n *sys_mem,
                                           hwaddr high_mmio_base,
                                           hwaddr high_mmio_size,
                                           hwaddr pio_base,
-                                          DeviceState *plic)
+                                          DeviceState *irqchip)
 {
     DeviceState *dev;
     MemoryRegion *ecam_alias, *ecam_reg;
@@ -738,7 +837,7 @@ static inline DeviceState *gpex_pcie_init(MemoryRegio=
n *sys_mem,
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 2, pio_base);
=20
     for (i =3D 0; i < GPEX_NUM_IRQS; i++) {
-        irq =3D qdev_get_gpio_in(plic, PCIE_IRQ + i);
+        irq =3D qdev_get_gpio_in(irqchip, PCIE_IRQ + i);
=20
         sysbus_connect_irq(SYS_BUS_DEVICE(dev), i, irq);
         gpex_set_irq_num(GPEX_HOST(dev), i, PCIE_IRQ + i);
@@ -769,18 +868,75 @@ static FWCfgState *create_fw_cfg(const MachineState=
 *mc)
     return fw_cfg;
 }
=20
+static DeviceState *virt_create_plic(const MemMapEntry *memmap, int sock=
et,
+                                     int base_hartid, int hart_count)
+{
+    DeviceState *ret;
+    char *plic_hart_config;
+
+    /* Per-socket PLIC hart topology configuration string */
+    plic_hart_config =3D riscv_plic_hart_config_string(hart_count);
+
+    /* Per-socket PLIC */
+    ret =3D sifive_plic_create(
+            memmap[VIRT_PLIC].base + socket * memmap[VIRT_PLIC].size,
+            plic_hart_config, hart_count, base_hartid,
+            VIRT_IRQCHIP_NUM_SOURCES,
+            ((1U << VIRT_IRQCHIP_NUM_PRIO_BITS) - 1),
+            VIRT_PLIC_PRIORITY_BASE,
+            VIRT_PLIC_PENDING_BASE,
+            VIRT_PLIC_ENABLE_BASE,
+            VIRT_PLIC_ENABLE_STRIDE,
+            VIRT_PLIC_CONTEXT_BASE,
+            VIRT_PLIC_CONTEXT_STRIDE,
+            memmap[VIRT_PLIC].size);
+
+    g_free(plic_hart_config);
+
+    return ret;
+}
+
+static DeviceState *virt_create_aia(RISCVVirtAIAType aia_type,
+                                    const MemMapEntry *memmap, int socke=
t,
+                                    int base_hartid, int hart_count)
+{
+    DeviceState *aplic_m;
+
+    /* Per-socket M-level APLIC */
+    aplic_m =3D riscv_aplic_create(
+        memmap[VIRT_APLIC_M].base + socket * memmap[VIRT_APLIC_M].size,
+        memmap[VIRT_APLIC_M].size,
+        base_hartid, hart_count,
+        VIRT_IRQCHIP_NUM_SOURCES,
+        VIRT_IRQCHIP_NUM_PRIO_BITS,
+        false, true, NULL);
+
+    if (aplic_m) {
+        /* Per-socket S-level APLIC */
+        riscv_aplic_create(
+            memmap[VIRT_APLIC_S].base + socket * memmap[VIRT_APLIC_S].si=
ze,
+            memmap[VIRT_APLIC_S].size,
+            base_hartid, hart_count,
+            VIRT_IRQCHIP_NUM_SOURCES,
+            VIRT_IRQCHIP_NUM_PRIO_BITS,
+            false, false, aplic_m);
+    }
+
+    return aplic_m;
+}
+
 static void virt_machine_init(MachineState *machine)
 {
     const MemMapEntry *memmap =3D virt_memmap;
     RISCVVirtState *s =3D RISCV_VIRT_MACHINE(machine);
     MemoryRegion *system_memory =3D get_system_memory();
     MemoryRegion *mask_rom =3D g_new(MemoryRegion, 1);
-    char *plic_hart_config, *soc_name;
+    char *soc_name;
     target_ulong start_addr =3D memmap[VIRT_DRAM].base;
     target_ulong firmware_end_addr, kernel_start_addr;
     uint32_t fdt_load_addr;
     uint64_t kernel_entry;
-    DeviceState *mmio_plic, *virtio_plic, *pcie_plic;
+    DeviceState *mmio_irqchip, *virtio_irqchip, *pcie_irqchip;
     int i, base_hartid, hart_count;
=20
     /* Check socket count limit */
@@ -791,7 +947,7 @@ static void virt_machine_init(MachineState *machine)
     }
=20
     /* Initialize sockets */
-    mmio_plic =3D virtio_plic =3D pcie_plic =3D NULL;
+    mmio_irqchip =3D virtio_irqchip =3D pcie_irqchip =3D NULL;
     for (i =3D 0; i < riscv_socket_count(machine); i++) {
         if (!riscv_socket_check_hartids(machine, i)) {
             error_report("discontinuous hartids in socket%d", i);
@@ -843,36 +999,27 @@ static void virt_machine_init(MachineState *machine=
)
             }
         }
=20
-        /* Per-socket PLIC hart topology configuration string */
-        plic_hart_config =3D riscv_plic_hart_config_string(hart_count);
-
-        /* Per-socket PLIC */
-        s->plic[i] =3D sifive_plic_create(
-            memmap[VIRT_PLIC].base + i * memmap[VIRT_PLIC].size,
-            plic_hart_config, hart_count, base_hartid,
-            VIRT_PLIC_NUM_SOURCES,
-            VIRT_PLIC_NUM_PRIORITIES,
-            VIRT_PLIC_PRIORITY_BASE,
-            VIRT_PLIC_PENDING_BASE,
-            VIRT_PLIC_ENABLE_BASE,
-            VIRT_PLIC_ENABLE_STRIDE,
-            VIRT_PLIC_CONTEXT_BASE,
-            VIRT_PLIC_CONTEXT_STRIDE,
-            memmap[VIRT_PLIC].size);
-        g_free(plic_hart_config);
+        /* Per-socket interrupt controller */
+        if (s->aia_type =3D=3D VIRT_AIA_TYPE_NONE) {
+            s->irqchip[i] =3D virt_create_plic(memmap, i,
+                                             base_hartid, hart_count);
+        } else {
+            s->irqchip[i] =3D virt_create_aia(s->aia_type, memmap, i,
+                                            base_hartid, hart_count);
+        }
=20
-        /* Try to use different PLIC instance based device type */
+        /* Try to use different IRQCHIP instance based device type */
         if (i =3D=3D 0) {
-            mmio_plic =3D s->plic[i];
-            virtio_plic =3D s->plic[i];
-            pcie_plic =3D s->plic[i];
+            mmio_irqchip =3D s->irqchip[i];
+            virtio_irqchip =3D s->irqchip[i];
+            pcie_irqchip =3D s->irqchip[i];
         }
         if (i =3D=3D 1) {
-            virtio_plic =3D s->plic[i];
-            pcie_plic =3D s->plic[i];
+            virtio_irqchip =3D s->irqchip[i];
+            pcie_irqchip =3D s->irqchip[i];
         }
         if (i =3D=3D 2) {
-            pcie_plic =3D s->plic[i];
+            pcie_irqchip =3D s->irqchip[i];
         }
     }
=20
@@ -990,7 +1137,7 @@ static void virt_machine_init(MachineState *machine)
     for (i =3D 0; i < VIRTIO_COUNT; i++) {
         sysbus_create_simple("virtio-mmio",
             memmap[VIRT_VIRTIO].base + i * memmap[VIRT_VIRTIO].size,
-            qdev_get_gpio_in(DEVICE(virtio_plic), VIRTIO_IRQ + i));
+            qdev_get_gpio_in(DEVICE(virtio_irqchip), VIRTIO_IRQ + i));
     }
=20
     gpex_pcie_init(system_memory,
@@ -1001,14 +1148,14 @@ static void virt_machine_init(MachineState *machi=
ne)
                    virt_high_pcie_memmap.base,
                    virt_high_pcie_memmap.size,
                    memmap[VIRT_PCIE_PIO].base,
-                   DEVICE(pcie_plic));
+                   DEVICE(pcie_irqchip));
=20
     serial_mm_init(system_memory, memmap[VIRT_UART0].base,
-        0, qdev_get_gpio_in(DEVICE(mmio_plic), UART0_IRQ), 399193,
+        0, qdev_get_gpio_in(DEVICE(mmio_irqchip), UART0_IRQ), 399193,
         serial_hd(0), DEVICE_LITTLE_ENDIAN);
=20
     sysbus_create_simple("goldfish_rtc", memmap[VIRT_RTC].base,
-        qdev_get_gpio_in(DEVICE(mmio_plic), RTC_IRQ));
+        qdev_get_gpio_in(DEVICE(mmio_irqchip), RTC_IRQ));
=20
     virt_flash_create(s);
=20
@@ -1024,6 +1171,37 @@ static void virt_machine_instance_init(Object *obj=
)
 {
 }
=20
+static char *virt_get_aia(Object *obj, Error **errp)
+{
+    RISCVVirtState *s =3D RISCV_VIRT_MACHINE(obj);
+    const char *val;
+
+    switch (s->aia_type) {
+    case VIRT_AIA_TYPE_APLIC:
+        val =3D "aplic";
+        break;
+    default:
+        val =3D "none";
+        break;
+    };
+
+    return g_strdup(val);
+}
+
+static void virt_set_aia(Object *obj, const char *val, Error **errp)
+{
+    RISCVVirtState *s =3D RISCV_VIRT_MACHINE(obj);
+
+    if (!strcmp(val, "none")) {
+        s->aia_type =3D VIRT_AIA_TYPE_NONE;
+    } else if (!strcmp(val, "aplic")) {
+        s->aia_type =3D VIRT_AIA_TYPE_APLIC;
+    } else {
+        error_setg(errp, "Invalid AIA interrupt controller type");
+        error_append_hint(errp, "Valid values are none, and aplic.\n");
+    }
+}
+
 static bool virt_get_aclint(Object *obj, Error **errp)
 {
     MachineState *ms =3D MACHINE(obj);
@@ -1062,6 +1240,13 @@ static void virt_machine_class_init(ObjectClass *o=
c, void *data)
     object_class_property_set_description(oc, "aclint",
                                           "Set on/off to enable/disable =
"
                                           "emulating ACLINT devices");
+
+    object_class_property_add_str(oc, "aia", virt_get_aia,
+                                  virt_set_aia);
+    object_class_property_set_description(oc, "aia",
+                                          "Set type of AIA interrupt "
+                                          "conttoller. Valid values are =
"
+                                          "none, and aplic.");
 }
=20
 static const TypeInfo virt_machine_typeinfo =3D {
diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index d2d869aaad..c30bb7cb6c 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -42,6 +42,7 @@ config RISCV_VIRT
     select PFLASH_CFI01
     select SERIAL
     select RISCV_ACLINT
+    select RISCV_APLIC
     select SIFIVE_PLIC
     select SIFIVE_TEST
     select VIRTIO_MMIO
--=20
2.35.1


