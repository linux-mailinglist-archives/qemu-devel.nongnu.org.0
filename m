Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0154B3252
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Feb 2022 02:09:49 +0100 (CET)
Received: from localhost ([::1]:58546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIgv6-0005WW-AR
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 20:09:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=03511bb56=alistair.francis@opensource.wdc.com>)
 id 1nIftK-0000J3-N7
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 19:03:55 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:53181)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=03511bb56=alistair.francis@opensource.wdc.com>)
 id 1nIft2-0000So-JA
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 19:03:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1644624216; x=1676160216;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Y/B66XdBviYPbHLrWyTX9XxoMXl2ly5mkInDlqwCL7o=;
 b=j2cBZnfJoY+TUchE0LzqujUorUN1BbaAtw7VZp6qYTdfL1vi4hAZPGmY
 65jOjJey5AwQxPfaGDXUpFtTqKvpRT1YQepH/iIz5kxMda+3qfyvXHLX0
 y0tq2D3JDS//5sA4f7KI2bKqNGX45/WyZRIIsszPy/OM77XREgIDFxgKx
 h/YaofBBGS5v5j4eoI0IY2YNsINr8gJtVqR6t2iWksdkCA//thv2KMJv2
 q9QlXWHA0dGJMdb24wEhylNyXMMw9BuNPUzSpCUB57Rjge5gADhr5CDe3
 OoSBcy48F+VIP8aqwLf89O74OwgF8yHvvK1++iiUo+TOrd21ucaG2LF42 w==;
X-IronPort-AV: E=Sophos;i="5.88,361,1635177600"; d="scan'208";a="304636498"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 12 Feb 2022 08:03:34 +0800
IronPort-SDR: wcHs4NsCLNbaco9r9O1rwe/xurPQy93+3o47Isxb6BBwPQBrwrHF0g5y8eo9q4OJ59h+V5VHhR
 o/Lf9yqG1j3ZEAKS7ElvUvHBLJZcSN5aR5bZCRF/QvYCfL1o9Qi/I5vgHT5AgekKCIbIrIG5cn
 6DMlm46phH+D6xLnRLTIyc85dQXXTFiMVgmrrh6G/3ajlzZiaEkBf6j9mB4oUsuMRyieSXFOkq
 wLpF9hNDd2AqCnXk5Ns5o7VU0Sqxc+r7tFfAn6jagGDSaxsPdTm6OLdfSG2tMM4q444/tTCxNW
 fs6E4VMGOotlxoV7Mv9GDyEG
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 15:36:29 -0800
IronPort-SDR: 69/wOz3aFLeZatcko6xctfIg4P+xexnKe4um57CAusYlIHB96Sk//d6UK7EjG3sMUTFaTebwrn
 S56XaPL6/aXnVFSSq+nN2hVLaa9KyaiTTnasl2hCgoJYGAxPzpwsU8ON7cJvPzy6rwt22+aEPX
 gaor1kHyK0uKIxwMjH72IerdnwbSzKS9jcs/1hcvUphLyHDrYiH8vgvOqZbyG3kv3YAMZ1+CQ6
 vCK1ICmtnEIU1u7ChwjFKSuGVH3s3bpSC9EOxqrqVUnwSnPKZuT+A/Oi9vXXWjULWhbQsmbcYH
 +ZA=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 16:03:35 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JwW0k657Lz1SVp0
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 16:03:34 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1644624213; x=1647216214; bh=Y/B66XdBviYPbHLrWy
 TX9XxoMXl2ly5mkInDlqwCL7o=; b=bqtpY6aO8+lZiSWxTSmABYTUSKMK/z6/2F
 bGuClfba/9nRukLb4n4zn1sWI0+jtXgy499LUGJyWm3IJNsR13HWcMhPC39BamWi
 Ff9GJT7NajQnmCSVBQya/vFei7G7VpvLsUbpaFSMSlb4DqSQTHsWJ44vUkcfDYOC
 aB3zBI8pA6D53Dv/Xjons48HiJ57ZaRv/YiMMFg2kuFOYgYZboP78/yhqAhasCrJ
 YnUbO8EL+QUJdpUBta260kZFgWYUl+f/ClwY4Js8/j8eD6+RqBdaHkR8VxuT7fC/
 svf3pqZwjyCih02gghzWr9B+Fs4aOTaSVxyDq+VCCxbATPxYS3ag==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id tufr3EHhfZzc for <qemu-devel@nongnu.org>;
 Fri, 11 Feb 2022 16:03:33 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.96])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JwW0d50Hnz1Rwrw;
 Fri, 11 Feb 2022 16:03:28 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Anup Patel <anup.patel@wdc.com>,
 Anup Patel <anup@brainfault.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 32/40] hw/riscv: virt: Add optional AIA IMSIC support to virt
 machine
Date: Sat, 12 Feb 2022 10:00:23 +1000
Message-Id: <20220212000031.3946524-33-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220212000031.3946524-1-alistair.francis@opensource.wdc.com>
References: <20220212000031.3946524-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=03511bb56=alistair.francis@opensource.wdc.com;
 helo=esa1.hgst.iphmx.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

From: Anup Patel <anup.patel@wdc.com>

We extend virt machine to emulate both AIA IMSIC and AIA APLIC
devices only when "aia=3Daplic-imsic" parameter is passed along
with machine name in the QEMU command-line. The AIA IMSIC is
only a per-HART MSI controller so we use AIA APLIC in MSI-mode
to forward all wired interrupts as MSIs to the AIA IMSIC.

We also provide "aia-guests=3D<xyz>" parameter which can be used
to specify number of VS-level AIA IMSIC Guests MMIO pages for
each HART.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <anup@brainfault.org>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20220204174700.534953-22-anup@brainfault.org
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/riscv/virt.h |  17 +-
 hw/riscv/virt.c         | 440 ++++++++++++++++++++++++++++++++--------
 hw/riscv/Kconfig        |   1 +
 3 files changed, 374 insertions(+), 84 deletions(-)

diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index 47706b456d..d248d0dfa0 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -24,8 +24,10 @@
 #include "hw/block/flash.h"
 #include "qom/object.h"
=20
-#define VIRT_CPUS_MAX 32
-#define VIRT_SOCKETS_MAX 8
+#define VIRT_CPUS_MAX_BITS             3
+#define VIRT_CPUS_MAX                  (1 << VIRT_CPUS_MAX_BITS)
+#define VIRT_SOCKETS_MAX_BITS          2
+#define VIRT_SOCKETS_MAX               (1 << VIRT_SOCKETS_MAX_BITS)
=20
 #define TYPE_RISCV_VIRT_MACHINE MACHINE_TYPE_NAME("virt")
 typedef struct RISCVVirtState RISCVVirtState;
@@ -35,6 +37,7 @@ DECLARE_INSTANCE_CHECKER(RISCVVirtState, RISCV_VIRT_MAC=
HINE,
 typedef enum RISCVVirtAIAType {
     VIRT_AIA_TYPE_NONE =3D 0,
     VIRT_AIA_TYPE_APLIC,
+    VIRT_AIA_TYPE_APLIC_IMSIC,
 } RISCVVirtAIAType;
=20
 struct RISCVVirtState {
@@ -50,6 +53,7 @@ struct RISCVVirtState {
     int fdt_size;
     bool have_aclint;
     RISCVVirtAIAType aia_type;
+    int aia_guests;
 };
=20
 enum {
@@ -65,6 +69,8 @@ enum {
     VIRT_UART0,
     VIRT_VIRTIO,
     VIRT_FW_CFG,
+    VIRT_IMSIC_M,
+    VIRT_IMSIC_S,
     VIRT_FLASH,
     VIRT_DRAM,
     VIRT_PCIE_MMIO,
@@ -81,8 +87,12 @@ enum {
     VIRTIO_NDEV =3D 0x35 /* Arbitrary maximum number of interrupts */
 };
=20
-#define VIRT_IRQCHIP_NUM_SOURCES 127
+#define VIRT_IRQCHIP_IPI_MSI 1
+#define VIRT_IRQCHIP_NUM_MSIS 255
+#define VIRT_IRQCHIP_NUM_SOURCES VIRTIO_NDEV
 #define VIRT_IRQCHIP_NUM_PRIO_BITS 3
+#define VIRT_IRQCHIP_MAX_GUESTS_BITS 3
+#define VIRT_IRQCHIP_MAX_GUESTS ((1U << VIRT_IRQCHIP_MAX_GUESTS_BITS) - =
1U)
=20
 #define VIRT_PLIC_PRIORITY_BASE 0x04
 #define VIRT_PLIC_PENDING_BASE 0x1000
@@ -97,6 +107,7 @@ enum {
 #define FDT_PCI_INT_CELLS     1
 #define FDT_PLIC_INT_CELLS    1
 #define FDT_APLIC_INT_CELLS   2
+#define FDT_IMSIC_INT_CELLS   0
 #define FDT_MAX_INT_CELLS     2
 #define FDT_MAX_INT_MAP_WIDTH (FDT_PCI_ADDR_CELLS + FDT_PCI_INT_CELLS + =
\
                                  1 + FDT_MAX_INT_CELLS)
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 6b06f79b46..c02710f711 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -34,6 +34,7 @@
 #include "hw/riscv/numa.h"
 #include "hw/intc/riscv_aclint.h"
 #include "hw/intc/riscv_aplic.h"
+#include "hw/intc/riscv_imsic.h"
 #include "hw/intc/sifive_plic.h"
 #include "hw/misc/sifive_test.h"
 #include "chardev/char.h"
@@ -44,6 +45,18 @@
 #include "hw/pci-host/gpex.h"
 #include "hw/display/ramfb.h"
=20
+#define VIRT_IMSIC_GROUP_MAX_SIZE      (1U << IMSIC_MMIO_GROUP_MIN_SHIFT=
)
+#if VIRT_IMSIC_GROUP_MAX_SIZE < \
+    IMSIC_GROUP_SIZE(VIRT_CPUS_MAX_BITS, VIRT_IRQCHIP_MAX_GUESTS_BITS)
+#error "Can't accomodate single IMSIC group in address space"
+#endif
+
+#define VIRT_IMSIC_MAX_SIZE            (VIRT_SOCKETS_MAX * \
+                                        VIRT_IMSIC_GROUP_MAX_SIZE)
+#if 0x4000000 < VIRT_IMSIC_MAX_SIZE
+#error "Can't accomodate all IMSIC groups in address space"
+#endif
+
 static const MemMapEntry virt_memmap[] =3D {
     [VIRT_DEBUG] =3D       {        0x0,         0x100 },
     [VIRT_MROM] =3D        {     0x1000,        0xf000 },
@@ -59,6 +72,8 @@ static const MemMapEntry virt_memmap[] =3D {
     [VIRT_VIRTIO] =3D      { 0x10001000,        0x1000 },
     [VIRT_FW_CFG] =3D      { 0x10100000,          0x18 },
     [VIRT_FLASH] =3D       { 0x20000000,     0x4000000 },
+    [VIRT_IMSIC_M] =3D     { 0x24000000, VIRT_IMSIC_MAX_SIZE },
+    [VIRT_IMSIC_S] =3D     { 0x28000000, VIRT_IMSIC_MAX_SIZE },
     [VIRT_PCIE_ECAM] =3D   { 0x30000000,    0x10000000 },
     [VIRT_PCIE_MMIO] =3D   { 0x40000000,    0x40000000 },
     [VIRT_DRAM] =3D        { 0x80000000,           0x0 },
@@ -310,7 +325,7 @@ static void create_fdt_socket_aclint(RISCVVirtState *=
s,
 {
     int cpu;
     char *name;
-    unsigned long addr;
+    unsigned long addr, size;
     uint32_t aclint_cells_size;
     uint32_t *aclint_mswi_cells;
     uint32_t *aclint_sswi_cells;
@@ -331,29 +346,38 @@ static void create_fdt_socket_aclint(RISCVVirtState=
 *s,
     }
     aclint_cells_size =3D s->soc[socket].num_harts * sizeof(uint32_t) * =
2;
=20
-    addr =3D memmap[VIRT_CLINT].base + (memmap[VIRT_CLINT].size * socket=
);
-    name =3D g_strdup_printf("/soc/mswi@%lx", addr);
-    qemu_fdt_add_subnode(mc->fdt, name);
-    qemu_fdt_setprop_string(mc->fdt, name, "compatible", "riscv,aclint-m=
swi");
-    qemu_fdt_setprop_cells(mc->fdt, name, "reg",
-        0x0, addr, 0x0, RISCV_ACLINT_SWI_SIZE);
-    qemu_fdt_setprop(mc->fdt, name, "interrupts-extended",
-        aclint_mswi_cells, aclint_cells_size);
-    qemu_fdt_setprop(mc->fdt, name, "interrupt-controller", NULL, 0);
-    qemu_fdt_setprop_cell(mc->fdt, name, "#interrupt-cells", 0);
-    riscv_socket_fdt_write_id(mc, mc->fdt, name, socket);
-    g_free(name);
+    if (s->aia_type !=3D VIRT_AIA_TYPE_APLIC_IMSIC) {
+        addr =3D memmap[VIRT_CLINT].base + (memmap[VIRT_CLINT].size * so=
cket);
+        name =3D g_strdup_printf("/soc/mswi@%lx", addr);
+        qemu_fdt_add_subnode(mc->fdt, name);
+        qemu_fdt_setprop_string(mc->fdt, name, "compatible",
+            "riscv,aclint-mswi");
+        qemu_fdt_setprop_cells(mc->fdt, name, "reg",
+            0x0, addr, 0x0, RISCV_ACLINT_SWI_SIZE);
+        qemu_fdt_setprop(mc->fdt, name, "interrupts-extended",
+            aclint_mswi_cells, aclint_cells_size);
+        qemu_fdt_setprop(mc->fdt, name, "interrupt-controller", NULL, 0)=
;
+        qemu_fdt_setprop_cell(mc->fdt, name, "#interrupt-cells", 0);
+        riscv_socket_fdt_write_id(mc, mc->fdt, name, socket);
+        g_free(name);
+    }
=20
-    addr =3D memmap[VIRT_CLINT].base + RISCV_ACLINT_SWI_SIZE +
-        (memmap[VIRT_CLINT].size * socket);
+    if (s->aia_type =3D=3D VIRT_AIA_TYPE_APLIC_IMSIC) {
+        addr =3D memmap[VIRT_CLINT].base +
+               (RISCV_ACLINT_DEFAULT_MTIMER_SIZE * socket);
+        size =3D RISCV_ACLINT_DEFAULT_MTIMER_SIZE;
+    } else {
+        addr =3D memmap[VIRT_CLINT].base + RISCV_ACLINT_SWI_SIZE +
+            (memmap[VIRT_CLINT].size * socket);
+        size =3D memmap[VIRT_CLINT].size - RISCV_ACLINT_SWI_SIZE;
+    }
     name =3D g_strdup_printf("/soc/mtimer@%lx", addr);
     qemu_fdt_add_subnode(mc->fdt, name);
     qemu_fdt_setprop_string(mc->fdt, name, "compatible",
         "riscv,aclint-mtimer");
     qemu_fdt_setprop_cells(mc->fdt, name, "reg",
         0x0, addr + RISCV_ACLINT_DEFAULT_MTIME,
-        0x0, memmap[VIRT_CLINT].size - RISCV_ACLINT_SWI_SIZE -
-             RISCV_ACLINT_DEFAULT_MTIME,
+        0x0, size - RISCV_ACLINT_DEFAULT_MTIME,
         0x0, addr + RISCV_ACLINT_DEFAULT_MTIMECMP,
         0x0, RISCV_ACLINT_DEFAULT_MTIME);
     qemu_fdt_setprop(mc->fdt, name, "interrupts-extended",
@@ -361,19 +385,22 @@ static void create_fdt_socket_aclint(RISCVVirtState=
 *s,
     riscv_socket_fdt_write_id(mc, mc->fdt, name, socket);
     g_free(name);
=20
-    addr =3D memmap[VIRT_ACLINT_SSWI].base +
-        (memmap[VIRT_ACLINT_SSWI].size * socket);
-    name =3D g_strdup_printf("/soc/sswi@%lx", addr);
-    qemu_fdt_add_subnode(mc->fdt, name);
-    qemu_fdt_setprop_string(mc->fdt, name, "compatible", "riscv,aclint-s=
swi");
-    qemu_fdt_setprop_cells(mc->fdt, name, "reg",
-        0x0, addr, 0x0, memmap[VIRT_ACLINT_SSWI].size);
-    qemu_fdt_setprop(mc->fdt, name, "interrupts-extended",
-        aclint_sswi_cells, aclint_cells_size);
-    qemu_fdt_setprop(mc->fdt, name, "interrupt-controller", NULL, 0);
-    qemu_fdt_setprop_cell(mc->fdt, name, "#interrupt-cells", 0);
-    riscv_socket_fdt_write_id(mc, mc->fdt, name, socket);
-    g_free(name);
+    if (s->aia_type !=3D VIRT_AIA_TYPE_APLIC_IMSIC) {
+        addr =3D memmap[VIRT_ACLINT_SSWI].base +
+            (memmap[VIRT_ACLINT_SSWI].size * socket);
+        name =3D g_strdup_printf("/soc/sswi@%lx", addr);
+        qemu_fdt_add_subnode(mc->fdt, name);
+        qemu_fdt_setprop_string(mc->fdt, name, "compatible",
+            "riscv,aclint-sswi");
+        qemu_fdt_setprop_cells(mc->fdt, name, "reg",
+            0x0, addr, 0x0, memmap[VIRT_ACLINT_SSWI].size);
+        qemu_fdt_setprop(mc->fdt, name, "interrupts-extended",
+            aclint_sswi_cells, aclint_cells_size);
+        qemu_fdt_setprop(mc->fdt, name, "interrupt-controller", NULL, 0)=
;
+        qemu_fdt_setprop_cell(mc->fdt, name, "#interrupt-cells", 0);
+        riscv_socket_fdt_write_id(mc, mc->fdt, name, socket);
+        g_free(name);
+    }
=20
     g_free(aclint_mswi_cells);
     g_free(aclint_mtimer_cells);
@@ -435,10 +462,145 @@ static void create_fdt_socket_plic(RISCVVirtState =
*s,
     g_free(plic_cells);
 }
=20
-static void create_fdt_socket_aia(RISCVVirtState *s,
-                                  const MemMapEntry *memmap, int socket,
-                                  uint32_t *phandle, uint32_t *intc_phan=
dles,
-                                  uint32_t *aplic_phandles)
+static uint32_t imsic_num_bits(uint32_t count)
+{
+    uint32_t ret =3D 0;
+
+    while (BIT(ret) < count) {
+        ret++;
+    }
+
+    return ret;
+}
+
+static void create_fdt_imsic(RISCVVirtState *s, const MemMapEntry *memma=
p,
+                             uint32_t *phandle, uint32_t *intc_phandles,
+                             uint32_t *msi_m_phandle, uint32_t *msi_s_ph=
andle)
+{
+    int cpu, socket;
+    char *imsic_name;
+    MachineState *mc =3D MACHINE(s);
+    uint32_t imsic_max_hart_per_socket, imsic_guest_bits;
+    uint32_t *imsic_cells, *imsic_regs, imsic_addr, imsic_size;
+
+    *msi_m_phandle =3D (*phandle)++;
+    *msi_s_phandle =3D (*phandle)++;
+    imsic_cells =3D g_new0(uint32_t, mc->smp.cpus * 2);
+    imsic_regs =3D g_new0(uint32_t, riscv_socket_count(mc) * 4);
+
+    /* M-level IMSIC node */
+    for (cpu =3D 0; cpu < mc->smp.cpus; cpu++) {
+        imsic_cells[cpu * 2 + 0] =3D cpu_to_be32(intc_phandles[cpu]);
+        imsic_cells[cpu * 2 + 1] =3D cpu_to_be32(IRQ_M_EXT);
+    }
+    imsic_max_hart_per_socket =3D 0;
+    for (socket =3D 0; socket < riscv_socket_count(mc); socket++) {
+        imsic_addr =3D memmap[VIRT_IMSIC_M].base +
+                     socket * VIRT_IMSIC_GROUP_MAX_SIZE;
+        imsic_size =3D IMSIC_HART_SIZE(0) * s->soc[socket].num_harts;
+        imsic_regs[socket * 4 + 0] =3D 0;
+        imsic_regs[socket * 4 + 1] =3D cpu_to_be32(imsic_addr);
+        imsic_regs[socket * 4 + 2] =3D 0;
+        imsic_regs[socket * 4 + 3] =3D cpu_to_be32(imsic_size);
+        if (imsic_max_hart_per_socket < s->soc[socket].num_harts) {
+            imsic_max_hart_per_socket =3D s->soc[socket].num_harts;
+        }
+    }
+    imsic_name =3D g_strdup_printf("/soc/imsics@%lx",
+        memmap[VIRT_IMSIC_M].base);
+    qemu_fdt_add_subnode(mc->fdt, imsic_name);
+    qemu_fdt_setprop_string(mc->fdt, imsic_name, "compatible",
+        "riscv,imsics");
+    qemu_fdt_setprop_cell(mc->fdt, imsic_name, "#interrupt-cells",
+        FDT_IMSIC_INT_CELLS);
+    qemu_fdt_setprop(mc->fdt, imsic_name, "interrupt-controller",
+        NULL, 0);
+    qemu_fdt_setprop(mc->fdt, imsic_name, "msi-controller",
+        NULL, 0);
+    qemu_fdt_setprop(mc->fdt, imsic_name, "interrupts-extended",
+        imsic_cells, mc->smp.cpus * sizeof(uint32_t) * 2);
+    qemu_fdt_setprop(mc->fdt, imsic_name, "reg", imsic_regs,
+        riscv_socket_count(mc) * sizeof(uint32_t) * 4);
+    qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,num-ids",
+        VIRT_IRQCHIP_NUM_MSIS);
+    qemu_fdt_setprop_cells(mc->fdt, imsic_name, "riscv,ipi-id",
+        VIRT_IRQCHIP_IPI_MSI);
+    if (riscv_socket_count(mc) > 1) {
+        qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,hart-index-bit=
s",
+            imsic_num_bits(imsic_max_hart_per_socket));
+        qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,group-index-bi=
ts",
+            imsic_num_bits(riscv_socket_count(mc)));
+        qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,group-index-sh=
ift",
+            IMSIC_MMIO_GROUP_MIN_SHIFT);
+    }
+    qemu_fdt_setprop_cell(mc->fdt, imsic_name, "phandle", *msi_m_phandle=
);
+    g_free(imsic_name);
+
+    /* S-level IMSIC node */
+    for (cpu =3D 0; cpu < mc->smp.cpus; cpu++) {
+        imsic_cells[cpu * 2 + 0] =3D cpu_to_be32(intc_phandles[cpu]);
+        imsic_cells[cpu * 2 + 1] =3D cpu_to_be32(IRQ_S_EXT);
+    }
+    imsic_guest_bits =3D imsic_num_bits(s->aia_guests + 1);
+    imsic_max_hart_per_socket =3D 0;
+    for (socket =3D 0; socket < riscv_socket_count(mc); socket++) {
+        imsic_addr =3D memmap[VIRT_IMSIC_S].base +
+                     socket * VIRT_IMSIC_GROUP_MAX_SIZE;
+        imsic_size =3D IMSIC_HART_SIZE(imsic_guest_bits) *
+                     s->soc[socket].num_harts;
+        imsic_regs[socket * 4 + 0] =3D 0;
+        imsic_regs[socket * 4 + 1] =3D cpu_to_be32(imsic_addr);
+        imsic_regs[socket * 4 + 2] =3D 0;
+        imsic_regs[socket * 4 + 3] =3D cpu_to_be32(imsic_size);
+        if (imsic_max_hart_per_socket < s->soc[socket].num_harts) {
+            imsic_max_hart_per_socket =3D s->soc[socket].num_harts;
+        }
+    }
+    imsic_name =3D g_strdup_printf("/soc/imsics@%lx",
+        memmap[VIRT_IMSIC_S].base);
+    qemu_fdt_add_subnode(mc->fdt, imsic_name);
+    qemu_fdt_setprop_string(mc->fdt, imsic_name, "compatible",
+        "riscv,imsics");
+    qemu_fdt_setprop_cell(mc->fdt, imsic_name, "#interrupt-cells",
+        FDT_IMSIC_INT_CELLS);
+    qemu_fdt_setprop(mc->fdt, imsic_name, "interrupt-controller",
+        NULL, 0);
+    qemu_fdt_setprop(mc->fdt, imsic_name, "msi-controller",
+        NULL, 0);
+    qemu_fdt_setprop(mc->fdt, imsic_name, "interrupts-extended",
+        imsic_cells, mc->smp.cpus * sizeof(uint32_t) * 2);
+    qemu_fdt_setprop(mc->fdt, imsic_name, "reg", imsic_regs,
+        riscv_socket_count(mc) * sizeof(uint32_t) * 4);
+    qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,num-ids",
+        VIRT_IRQCHIP_NUM_MSIS);
+    qemu_fdt_setprop_cells(mc->fdt, imsic_name, "riscv,ipi-id",
+        VIRT_IRQCHIP_IPI_MSI);
+    if (imsic_guest_bits) {
+        qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,guest-index-bi=
ts",
+            imsic_guest_bits);
+    }
+    if (riscv_socket_count(mc) > 1) {
+        qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,hart-index-bit=
s",
+            imsic_num_bits(imsic_max_hart_per_socket));
+        qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,group-index-bi=
ts",
+            imsic_num_bits(riscv_socket_count(mc)));
+        qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,group-index-sh=
ift",
+            IMSIC_MMIO_GROUP_MIN_SHIFT);
+    }
+    qemu_fdt_setprop_cell(mc->fdt, imsic_name, "phandle", *msi_s_phandle=
);
+    g_free(imsic_name);
+
+    g_free(imsic_regs);
+    g_free(imsic_cells);
+}
+
+static void create_fdt_socket_aplic(RISCVVirtState *s,
+                                    const MemMapEntry *memmap, int socke=
t,
+                                    uint32_t msi_m_phandle,
+                                    uint32_t msi_s_phandle,
+                                    uint32_t *phandle,
+                                    uint32_t *intc_phandles,
+                                    uint32_t *aplic_phandles)
 {
     int cpu;
     char *aplic_name;
@@ -464,8 +626,13 @@ static void create_fdt_socket_aia(RISCVVirtState *s,
     qemu_fdt_setprop_cell(mc->fdt, aplic_name,
         "#interrupt-cells", FDT_APLIC_INT_CELLS);
     qemu_fdt_setprop(mc->fdt, aplic_name, "interrupt-controller", NULL, =
0);
-    qemu_fdt_setprop(mc->fdt, aplic_name, "interrupts-extended",
-        aplic_cells, s->soc[socket].num_harts * sizeof(uint32_t) * 2);
+    if (s->aia_type =3D=3D VIRT_AIA_TYPE_APLIC) {
+        qemu_fdt_setprop(mc->fdt, aplic_name, "interrupts-extended",
+            aplic_cells, s->soc[socket].num_harts * sizeof(uint32_t) * 2=
);
+    } else {
+        qemu_fdt_setprop_cell(mc->fdt, aplic_name, "msi-parent",
+            msi_m_phandle);
+    }
     qemu_fdt_setprop_cells(mc->fdt, aplic_name, "reg",
         0x0, aplic_addr, 0x0, memmap[VIRT_APLIC_M].size);
     qemu_fdt_setprop_cell(mc->fdt, aplic_name, "riscv,num-sources",
@@ -491,8 +658,13 @@ static void create_fdt_socket_aia(RISCVVirtState *s,
     qemu_fdt_setprop_cell(mc->fdt, aplic_name,
         "#interrupt-cells", FDT_APLIC_INT_CELLS);
     qemu_fdt_setprop(mc->fdt, aplic_name, "interrupt-controller", NULL, =
0);
-    qemu_fdt_setprop(mc->fdt, aplic_name, "interrupts-extended",
-        aplic_cells, s->soc[socket].num_harts * sizeof(uint32_t) * 2);
+    if (s->aia_type =3D=3D VIRT_AIA_TYPE_APLIC) {
+        qemu_fdt_setprop(mc->fdt, aplic_name, "interrupts-extended",
+            aplic_cells, s->soc[socket].num_harts * sizeof(uint32_t) * 2=
);
+    } else {
+        qemu_fdt_setprop_cell(mc->fdt, aplic_name, "msi-parent",
+            msi_s_phandle);
+    }
     qemu_fdt_setprop_cells(mc->fdt, aplic_name, "reg",
         0x0, aplic_addr, 0x0, memmap[VIRT_APLIC_S].size);
     qemu_fdt_setprop_cell(mc->fdt, aplic_name, "riscv,num-sources",
@@ -509,13 +681,14 @@ static void create_fdt_sockets(RISCVVirtState *s, c=
onst MemMapEntry *memmap,
                                bool is_32_bit, uint32_t *phandle,
                                uint32_t *irq_mmio_phandle,
                                uint32_t *irq_pcie_phandle,
-                               uint32_t *irq_virtio_phandle)
+                               uint32_t *irq_virtio_phandle,
+                               uint32_t *msi_pcie_phandle)
 {
-    int socket;
     char *clust_name;
-    uint32_t *intc_phandles;
+    int socket, phandle_pos;
     MachineState *mc =3D MACHINE(s);
-    uint32_t xplic_phandles[MAX_NODES];
+    uint32_t msi_m_phandle =3D 0, msi_s_phandle =3D 0;
+    uint32_t *intc_phandles, xplic_phandles[MAX_NODES];
=20
     qemu_fdt_add_subnode(mc->fdt, "/cpus");
     qemu_fdt_setprop_cell(mc->fdt, "/cpus", "timebase-frequency",
@@ -524,37 +697,55 @@ static void create_fdt_sockets(RISCVVirtState *s, c=
onst MemMapEntry *memmap,
     qemu_fdt_setprop_cell(mc->fdt, "/cpus", "#address-cells", 0x1);
     qemu_fdt_add_subnode(mc->fdt, "/cpus/cpu-map");
=20
+    intc_phandles =3D g_new0(uint32_t, mc->smp.cpus);
+
+    phandle_pos =3D mc->smp.cpus;
     for (socket =3D (riscv_socket_count(mc) - 1); socket >=3D 0; socket-=
-) {
+        phandle_pos -=3D s->soc[socket].num_harts;
+
         clust_name =3D g_strdup_printf("/cpus/cpu-map/cluster%d", socket=
);
         qemu_fdt_add_subnode(mc->fdt, clust_name);
=20
-        intc_phandles =3D g_new0(uint32_t, s->soc[socket].num_harts);
-
         create_fdt_socket_cpus(s, socket, clust_name, phandle,
-            is_32_bit, intc_phandles);
+            is_32_bit, &intc_phandles[phandle_pos]);
=20
         create_fdt_socket_memory(s, memmap, socket);
=20
+        g_free(clust_name);
+
         if (!kvm_enabled()) {
             if (s->have_aclint) {
-                create_fdt_socket_aclint(s, memmap, socket, intc_phandle=
s);
+                create_fdt_socket_aclint(s, memmap, socket,
+                    &intc_phandles[phandle_pos]);
             } else {
-                create_fdt_socket_clint(s, memmap, socket, intc_phandles=
);
+                create_fdt_socket_clint(s, memmap, socket,
+                    &intc_phandles[phandle_pos]);
             }
         }
+    }
+
+    if (s->aia_type =3D=3D VIRT_AIA_TYPE_APLIC_IMSIC) {
+        create_fdt_imsic(s, memmap, phandle, intc_phandles,
+            &msi_m_phandle, &msi_s_phandle);
+        *msi_pcie_phandle =3D msi_s_phandle;
+    }
+
+    phandle_pos =3D mc->smp.cpus;
+    for (socket =3D (riscv_socket_count(mc) - 1); socket >=3D 0; socket-=
-) {
+        phandle_pos -=3D s->soc[socket].num_harts;
=20
         if (s->aia_type =3D=3D VIRT_AIA_TYPE_NONE) {
             create_fdt_socket_plic(s, memmap, socket, phandle,
-                intc_phandles, xplic_phandles);
+                &intc_phandles[phandle_pos], xplic_phandles);
         } else {
-            create_fdt_socket_aia(s, memmap, socket, phandle,
-                intc_phandles, xplic_phandles);
+            create_fdt_socket_aplic(s, memmap, socket,
+                msi_m_phandle, msi_s_phandle, phandle,
+                &intc_phandles[phandle_pos], xplic_phandles);
         }
-
-        g_free(intc_phandles);
-        g_free(clust_name);
     }
=20
+    g_free(intc_phandles);
+
     for (socket =3D 0; socket < riscv_socket_count(mc); socket++) {
         if (socket =3D=3D 0) {
             *irq_mmio_phandle =3D xplic_phandles[socket];
@@ -602,7 +793,8 @@ static void create_fdt_virtio(RISCVVirtState *s, cons=
t MemMapEntry *memmap,
 }
=20
 static void create_fdt_pcie(RISCVVirtState *s, const MemMapEntry *memmap=
,
-                            uint32_t irq_pcie_phandle)
+                            uint32_t irq_pcie_phandle,
+                            uint32_t msi_pcie_phandle)
 {
     char *name;
     MachineState *mc =3D MACHINE(s);
@@ -622,6 +814,9 @@ static void create_fdt_pcie(RISCVVirtState *s, const =
MemMapEntry *memmap,
     qemu_fdt_setprop_cells(mc->fdt, name, "bus-range", 0,
         memmap[VIRT_PCIE_ECAM].size / PCIE_MMCFG_SIZE_MIN - 1);
     qemu_fdt_setprop(mc->fdt, name, "dma-coherent", NULL, 0);
+    if (s->aia_type =3D=3D VIRT_AIA_TYPE_APLIC_IMSIC) {
+        qemu_fdt_setprop_cell(mc->fdt, name, "msi-parent", msi_pcie_phan=
dle);
+    }
     qemu_fdt_setprop_cells(mc->fdt, name, "reg", 0,
         memmap[VIRT_PCIE_ECAM].base, 0, memmap[VIRT_PCIE_ECAM].size);
     qemu_fdt_setprop_sized_cells(mc->fdt, name, "ranges",
@@ -747,7 +942,7 @@ static void create_fdt(RISCVVirtState *s, const MemMa=
pEntry *memmap,
                        uint64_t mem_size, const char *cmdline, bool is_3=
2_bit)
 {
     MachineState *mc =3D MACHINE(s);
-    uint32_t phandle =3D 1, irq_mmio_phandle =3D 1;
+    uint32_t phandle =3D 1, irq_mmio_phandle =3D 1, msi_pcie_phandle =3D=
 1;
     uint32_t irq_pcie_phandle =3D 1, irq_virtio_phandle =3D 1;
=20
     if (mc->dtb) {
@@ -777,11 +972,12 @@ static void create_fdt(RISCVVirtState *s, const Mem=
MapEntry *memmap,
     qemu_fdt_setprop_cell(mc->fdt, "/soc", "#address-cells", 0x2);
=20
     create_fdt_sockets(s, memmap, is_32_bit, &phandle,
-        &irq_mmio_phandle, &irq_pcie_phandle, &irq_virtio_phandle);
+        &irq_mmio_phandle, &irq_pcie_phandle, &irq_virtio_phandle,
+        &msi_pcie_phandle);
=20
     create_fdt_virtio(s, memmap, irq_virtio_phandle);
=20
-    create_fdt_pcie(s, memmap, irq_pcie_phandle);
+    create_fdt_pcie(s, memmap, irq_pcie_phandle, msi_pcie_phandle);
=20
     create_fdt_reset(s, memmap, &phandle);
=20
@@ -896,30 +1092,55 @@ static DeviceState *virt_create_plic(const MemMapE=
ntry *memmap, int socket,
     return ret;
 }
=20
-static DeviceState *virt_create_aia(RISCVVirtAIAType aia_type,
+static DeviceState *virt_create_aia(RISCVVirtAIAType aia_type, int aia_g=
uests,
                                     const MemMapEntry *memmap, int socke=
t,
                                     int base_hartid, int hart_count)
 {
+    int i;
+    hwaddr addr;
+    uint32_t guest_bits;
     DeviceState *aplic_m;
+    bool msimode =3D (aia_type =3D=3D VIRT_AIA_TYPE_APLIC_IMSIC) ? true =
: false;
+
+    if (msimode) {
+        /* Per-socket M-level IMSICs */
+        addr =3D memmap[VIRT_IMSIC_M].base + socket * VIRT_IMSIC_GROUP_M=
AX_SIZE;
+        for (i =3D 0; i < hart_count; i++) {
+            riscv_imsic_create(addr + i * IMSIC_HART_SIZE(0),
+                               base_hartid + i, true, 1,
+                               VIRT_IRQCHIP_NUM_MSIS);
+        }
+
+        /* Per-socket S-level IMSICs */
+        guest_bits =3D imsic_num_bits(aia_guests + 1);
+        addr =3D memmap[VIRT_IMSIC_S].base + socket * VIRT_IMSIC_GROUP_M=
AX_SIZE;
+        for (i =3D 0; i < hart_count; i++) {
+            riscv_imsic_create(addr + i * IMSIC_HART_SIZE(guest_bits),
+                               base_hartid + i, false, 1 + aia_guests,
+                               VIRT_IRQCHIP_NUM_MSIS);
+        }
+    }
=20
     /* Per-socket M-level APLIC */
     aplic_m =3D riscv_aplic_create(
         memmap[VIRT_APLIC_M].base + socket * memmap[VIRT_APLIC_M].size,
         memmap[VIRT_APLIC_M].size,
-        base_hartid, hart_count,
+        (msimode) ? 0 : base_hartid,
+        (msimode) ? 0 : hart_count,
         VIRT_IRQCHIP_NUM_SOURCES,
         VIRT_IRQCHIP_NUM_PRIO_BITS,
-        false, true, NULL);
+        msimode, true, NULL);
=20
     if (aplic_m) {
         /* Per-socket S-level APLIC */
         riscv_aplic_create(
             memmap[VIRT_APLIC_S].base + socket * memmap[VIRT_APLIC_S].si=
ze,
             memmap[VIRT_APLIC_S].size,
-            base_hartid, hart_count,
+            (msimode) ? 0 : base_hartid,
+            (msimode) ? 0 : hart_count,
             VIRT_IRQCHIP_NUM_SOURCES,
             VIRT_IRQCHIP_NUM_PRIO_BITS,
-            false, false, aplic_m);
+            msimode, false, aplic_m);
     }
=20
     return aplic_m;
@@ -979,23 +1200,44 @@ static void virt_machine_init(MachineState *machin=
e)
         sysbus_realize(SYS_BUS_DEVICE(&s->soc[i]), &error_abort);
=20
         if (!kvm_enabled()) {
-            /* Per-socket CLINT */
-            riscv_aclint_swi_create(
-                memmap[VIRT_CLINT].base + i * memmap[VIRT_CLINT].size,
-                base_hartid, hart_count, false);
-            riscv_aclint_mtimer_create(
-                memmap[VIRT_CLINT].base + i * memmap[VIRT_CLINT].size +
-                    RISCV_ACLINT_SWI_SIZE,
-                RISCV_ACLINT_DEFAULT_MTIMER_SIZE, base_hartid, hart_coun=
t,
-                RISCV_ACLINT_DEFAULT_MTIMECMP, RISCV_ACLINT_DEFAULT_MTIM=
E,
-                RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ, true);
-
-            /* Per-socket ACLINT SSWI */
             if (s->have_aclint) {
+                if (s->aia_type =3D=3D VIRT_AIA_TYPE_APLIC_IMSIC) {
+                    /* Per-socket ACLINT MTIMER */
+                    riscv_aclint_mtimer_create(memmap[VIRT_CLINT].base +
+                            i * RISCV_ACLINT_DEFAULT_MTIMER_SIZE,
+                        RISCV_ACLINT_DEFAULT_MTIMER_SIZE,
+                        base_hartid, hart_count,
+                        RISCV_ACLINT_DEFAULT_MTIMECMP,
+                        RISCV_ACLINT_DEFAULT_MTIME,
+                        RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ, true);
+                } else {
+                    /* Per-socket ACLINT MSWI, MTIMER, and SSWI */
+                    riscv_aclint_swi_create(memmap[VIRT_CLINT].base +
+                            i * memmap[VIRT_CLINT].size,
+                        base_hartid, hart_count, false);
+                    riscv_aclint_mtimer_create(memmap[VIRT_CLINT].base +
+                            i * memmap[VIRT_CLINT].size + RISCV_ACLINT_S=
WI_SIZE,
+                        RISCV_ACLINT_DEFAULT_MTIMER_SIZE,
+                        base_hartid, hart_count,
+                        RISCV_ACLINT_DEFAULT_MTIMECMP,
+                        RISCV_ACLINT_DEFAULT_MTIME,
+                        RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ, true);
+                    riscv_aclint_swi_create(memmap[VIRT_ACLINT_SSWI].bas=
e +
+                            i * memmap[VIRT_ACLINT_SSWI].size,
+                        base_hartid, hart_count, true);
+                }
+            } else {
+                /* Per-socket SiFive CLINT */
                 riscv_aclint_swi_create(
-                    memmap[VIRT_ACLINT_SSWI].base +
-                        i * memmap[VIRT_ACLINT_SSWI].size,
-                    base_hartid, hart_count, true);
+                    memmap[VIRT_CLINT].base + i * memmap[VIRT_CLINT].siz=
e,
+                    base_hartid, hart_count, false);
+                riscv_aclint_mtimer_create(memmap[VIRT_CLINT].base +
+                        i * memmap[VIRT_CLINT].size + RISCV_ACLINT_SWI_S=
IZE,
+                    RISCV_ACLINT_DEFAULT_MTIMER_SIZE,
+                    base_hartid, hart_count,
+                    RISCV_ACLINT_DEFAULT_MTIMECMP,
+                    RISCV_ACLINT_DEFAULT_MTIME,
+                    RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ, true);
             }
         }
=20
@@ -1004,8 +1246,9 @@ static void virt_machine_init(MachineState *machine=
)
             s->irqchip[i] =3D virt_create_plic(memmap, i,
                                              base_hartid, hart_count);
         } else {
-            s->irqchip[i] =3D virt_create_aia(s->aia_type, memmap, i,
-                                            base_hartid, hart_count);
+            s->irqchip[i] =3D virt_create_aia(s->aia_type, s->aia_guests=
,
+                                            memmap, i, base_hartid,
+                                            hart_count);
         }
=20
         /* Try to use different IRQCHIP instance based device type */
@@ -1171,6 +1414,27 @@ static void virt_machine_instance_init(Object *obj=
)
 {
 }
=20
+static char *virt_get_aia_guests(Object *obj, Error **errp)
+{
+    RISCVVirtState *s =3D RISCV_VIRT_MACHINE(obj);
+    char val[32];
+
+    sprintf(val, "%d", s->aia_guests);
+    return g_strdup(val);
+}
+
+static void virt_set_aia_guests(Object *obj, const char *val, Error **er=
rp)
+{
+    RISCVVirtState *s =3D RISCV_VIRT_MACHINE(obj);
+
+    s->aia_guests =3D atoi(val);
+    if (s->aia_guests < 0 || s->aia_guests > VIRT_IRQCHIP_MAX_GUESTS) {
+        error_setg(errp, "Invalid number of AIA IMSIC guests");
+        error_append_hint(errp, "Valid values be between 0 and %d.\n",
+                          VIRT_IRQCHIP_MAX_GUESTS);
+    }
+}
+
 static char *virt_get_aia(Object *obj, Error **errp)
 {
     RISCVVirtState *s =3D RISCV_VIRT_MACHINE(obj);
@@ -1180,6 +1444,9 @@ static char *virt_get_aia(Object *obj, Error **errp=
)
     case VIRT_AIA_TYPE_APLIC:
         val =3D "aplic";
         break;
+    case VIRT_AIA_TYPE_APLIC_IMSIC:
+        val =3D "aplic-imsic";
+        break;
     default:
         val =3D "none";
         break;
@@ -1196,9 +1463,12 @@ static void virt_set_aia(Object *obj, const char *=
val, Error **errp)
         s->aia_type =3D VIRT_AIA_TYPE_NONE;
     } else if (!strcmp(val, "aplic")) {
         s->aia_type =3D VIRT_AIA_TYPE_APLIC;
+    } else if (!strcmp(val, "aplic-imsic")) {
+        s->aia_type =3D VIRT_AIA_TYPE_APLIC_IMSIC;
     } else {
         error_setg(errp, "Invalid AIA interrupt controller type");
-        error_append_hint(errp, "Valid values are none, and aplic.\n");
+        error_append_hint(errp, "Valid values are none, aplic, and "
+                          "aplic-imsic.\n");
     }
 }
=20
@@ -1220,6 +1490,7 @@ static void virt_set_aclint(Object *obj, bool value=
, Error **errp)
=20
 static void virt_machine_class_init(ObjectClass *oc, void *data)
 {
+    char str[128];
     MachineClass *mc =3D MACHINE_CLASS(oc);
=20
     mc->desc =3D "RISC-V VirtIO board";
@@ -1246,7 +1517,14 @@ static void virt_machine_class_init(ObjectClass *o=
c, void *data)
     object_class_property_set_description(oc, "aia",
                                           "Set type of AIA interrupt "
                                           "conttoller. Valid values are =
"
-                                          "none, and aplic.");
+                                          "none, aplic, and aplic-imsic.=
");
+
+    object_class_property_add_str(oc, "aia-guests",
+                                  virt_get_aia_guests,
+                                  virt_set_aia_guests);
+    sprintf(str, "Set number of guest MMIO pages for AIA IMSIC. Valid va=
lue "
+                 "should be between 0 and %d.", VIRT_IRQCHIP_MAX_GUESTS)=
;
+    object_class_property_set_description(oc, "aia-guests", str);
 }
=20
 static const TypeInfo virt_machine_typeinfo =3D {
diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index c30bb7cb6c..91bb9d21c4 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -43,6 +43,7 @@ config RISCV_VIRT
     select SERIAL
     select RISCV_ACLINT
     select RISCV_APLIC
+    select RISCV_IMSIC
     select SIFIVE_PLIC
     select SIFIVE_TEST
     select VIRTIO_MMIO
--=20
2.34.1


