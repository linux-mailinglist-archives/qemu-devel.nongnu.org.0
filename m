Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B35412F09
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 09:07:19 +0200 (CEST)
Received: from localhost ([::1]:38132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSZs6-0007Ow-Sd
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 03:07:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=891501f09=alistair.francis@opensource.wdc.com>)
 id 1mSZgq-0008Jj-0b
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 02:55:40 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:57010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=891501f09=alistair.francis@opensource.wdc.com>)
 id 1mSZgm-0004T6-G3
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 02:55:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1632207336; x=1663743336;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Gw54fqljt6URIK+eQ+rQphoeb+CfJ0ZYzbeIDIzsvRI=;
 b=eM2OweHA9pxHz2kQcIft//FS3RyjAcwkQtBsG6/Hg9ftFGiyNuewMlgT
 05ap64Ses2V6ySzJQH9DQCzJrkfSzsaltHWHJzByRr6I+cWUFZklcSliZ
 I1T84Z2Jkp6Wmq9cibsCFdQVASq+SrvFf8RDPx+XTP4I0Vuf+Ujv4ifRg
 14B93aMvioQv5Xwm3Xsw/DYAGGS3T3x9v6Gt26GCqg3SXWKx8GUFmTqbv
 yll0gDJ6rJJkpU09QDxHVxybz53WSUTPuMBKb8CFxjfMHm3Xl/oh44/si
 ezDlEKy5dvNDGQk21D85WvNuxSXhCuvJd6KUr6vCbJfGSGWkX70aur7Nv w==;
X-IronPort-AV: E=Sophos;i="5.85,310,1624291200"; d="scan'208";a="181039435"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Sep 2021 14:55:35 +0800
IronPort-SDR: a0QF3l4iOnJMTDNClpjuZObXLlVsp1Q9pgVsWLffSWi/zrfQoaOKwmecWRTrlT0xDtb+PXAoER
 DmJ6X9AECEOJuabXzH+7GkW+ZqaRTnG4UKEzXFMRlkbJa3bajvhmIvXLLYfVtyjyLsCLszZiDL
 9nxZRaj8LNVQt/Y66lUkBgoulC35ZOTGX9Olc97iRTkr0ct3GCQ3uYGX4V/1nqeK3vxMVyPTIL
 ZKJ6gVuA/Y9KAwL12MyELIQMwPYmRDnrpQpW/n0QFfe6AsSD+pTQZsP8wxFRY+t6k5GkXKcswe
 nDARMir9J/o0TCrSPvt5mZ3i
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2021 23:31:49 -0700
IronPort-SDR: Bv22P4YBcTZqaceSmnRCdHdEY9zcN6dTFOzkkRrurYGxRl29SYy8CpCPNK/DFP3n3o3HKbtXMv
 sRo3LrX8Abe/dpetWSEpffq26Oord3zGR/DEdrGHb/XbXDhGPo9W05Vy4EJ1TA0fTzJCBgUSfj
 s7OAVrWchRrXDXNu79589zCqU+JMnr2S8lcosFPpiaztOIincygm90icXVr3wNSohvOGMjeBjO
 sKlVhJRO9LFs22fsdD6qDge7jllb+BWBLynv2dTxkzVJzMsfLhOM6WFbPLquk2lnwN3oqJgV9N
 AnA=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2021 23:55:36 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HDByZ3XKHz1Rws8
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 23:55:34 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1632207332; x=1634799333; bh=Gw54fqljt6URIK+eQ+
 rQphoeb+CfJ0ZYzbeIDIzsvRI=; b=d8LMYtAMTMLpQ/KQ89CMGR11fq3sEdxrKq
 7tUxj/Wvv2BYtntYQYzrMHFi1kVyUE/yoLgTqWfQFwdHZj3teX1Jl0GEC7kt2ICZ
 8BNKyWfawij2XJfY4LVgoLkONRvJ88ONAGjFpNdVNJMWdTaZg94lZiOBexy2ELeQ
 W7hAn+4JS3HCcVv3yFc2Qc1yw43FYfTzeZiYTrZvz0Us1Pq3LVysCG2FvoAgi7AN
 bXUqifXPKyuB186Ftcm5/VMA7qcCeDNNJ8H0q/fHXtHtQHTFIQoIFKJ9ZR5aubC0
 pHy1EnR60Dr7GVWv0XSXX29OiqNeopcEjzfObtRYk6U9nW/+vNNA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id WriGCmupLHBH for <qemu-devel@nongnu.org>;
 Mon, 20 Sep 2021 23:55:32 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.26])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HDByR4HgVz1RvlH;
 Mon, 20 Sep 2021 23:55:26 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Anup Patel <anup.patel@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [PULL v2 12/21] hw/riscv: virt: Re-factor FDT generation
Date: Tue, 21 Sep 2021 16:54:03 +1000
Message-Id: <20210921065412.312381-13-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210921065412.312381-1-alistair.francis@opensource.wdc.com>
References: <20210921065412.312381-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=891501f09=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Anup Patel <anup.patel@wdc.com>

We re-factor and break the FDT generation into smaller functions
so that it is easier to modify FDT generation for different
configurations of virt machine.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-id: 20210831110603.338681-4-anup.patel@wdc.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/virt.c | 527 ++++++++++++++++++++++++++++++------------------
 1 file changed, 327 insertions(+), 200 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 1cd7ac1546..7f716901ef 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -176,214 +176,262 @@ static void create_pcie_irq_map(void *fdt, char *=
nodename,
                            0x1800, 0, 0, 0x7);
 }
=20
-static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
-                       uint64_t mem_size, const char *cmdline, bool is_3=
2_bit)
+static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
+                                   char *clust_name, uint32_t *phandle,
+                                   bool is_32_bit, uint32_t *intc_phandl=
es)
 {
-    void *fdt;
-    int i, cpu, socket;
+    int cpu;
+    uint32_t cpu_phandle;
     MachineState *mc =3D MACHINE(s);
+    char *name, *cpu_name, *core_name, *intc_name;
+
+    for (cpu =3D s->soc[socket].num_harts - 1; cpu >=3D 0; cpu--) {
+        cpu_phandle =3D (*phandle)++;
+
+        cpu_name =3D g_strdup_printf("/cpus/cpu@%d",
+            s->soc[socket].hartid_base + cpu);
+        qemu_fdt_add_subnode(mc->fdt, cpu_name);
+        qemu_fdt_setprop_string(mc->fdt, cpu_name, "mmu-type",
+            (is_32_bit) ? "riscv,sv32" : "riscv,sv48");
+        name =3D riscv_isa_string(&s->soc[socket].harts[cpu]);
+        qemu_fdt_setprop_string(mc->fdt, cpu_name, "riscv,isa", name);
+        g_free(name);
+        qemu_fdt_setprop_string(mc->fdt, cpu_name, "compatible", "riscv"=
);
+        qemu_fdt_setprop_string(mc->fdt, cpu_name, "status", "okay");
+        qemu_fdt_setprop_cell(mc->fdt, cpu_name, "reg",
+            s->soc[socket].hartid_base + cpu);
+        qemu_fdt_setprop_string(mc->fdt, cpu_name, "device_type", "cpu")=
;
+        riscv_socket_fdt_write_id(mc, mc->fdt, cpu_name, socket);
+        qemu_fdt_setprop_cell(mc->fdt, cpu_name, "phandle", cpu_phandle)=
;
+
+        intc_phandles[cpu] =3D (*phandle)++;
+
+        intc_name =3D g_strdup_printf("%s/interrupt-controller", cpu_nam=
e);
+        qemu_fdt_add_subnode(mc->fdt, intc_name);
+        qemu_fdt_setprop_cell(mc->fdt, intc_name, "phandle",
+            intc_phandles[cpu]);
+        qemu_fdt_setprop_string(mc->fdt, intc_name, "compatible",
+            "riscv,cpu-intc");
+        qemu_fdt_setprop(mc->fdt, intc_name, "interrupt-controller", NUL=
L, 0);
+        qemu_fdt_setprop_cell(mc->fdt, intc_name, "#interrupt-cells", 1)=
;
+
+        core_name =3D g_strdup_printf("%s/core%d", clust_name, cpu);
+        qemu_fdt_add_subnode(mc->fdt, core_name);
+        qemu_fdt_setprop_cell(mc->fdt, core_name, "cpu", cpu_phandle);
+
+        g_free(core_name);
+        g_free(intc_name);
+        g_free(cpu_name);
+    }
+}
+
+static void create_fdt_socket_memory(RISCVVirtState *s,
+                                     const MemMapEntry *memmap, int sock=
et)
+{
+    char *mem_name;
     uint64_t addr, size;
-    uint32_t *clint_cells, *plic_cells;
-    unsigned long clint_addr, plic_addr;
-    uint32_t plic_phandle[MAX_NODES];
-    uint32_t cpu_phandle, intc_phandle, test_phandle;
-    uint32_t phandle =3D 1, plic_mmio_phandle =3D 1;
-    uint32_t plic_pcie_phandle =3D 1, plic_virtio_phandle =3D 1;
-    char *mem_name, *cpu_name, *core_name, *intc_name;
-    char *name, *clint_name, *plic_name, *clust_name;
-    hwaddr flashsize =3D virt_memmap[VIRT_FLASH].size / 2;
-    hwaddr flashbase =3D virt_memmap[VIRT_FLASH].base;
+    MachineState *mc =3D MACHINE(s);
+
+    addr =3D memmap[VIRT_DRAM].base + riscv_socket_mem_offset(mc, socket=
);
+    size =3D riscv_socket_mem_size(mc, socket);
+    mem_name =3D g_strdup_printf("/memory@%lx", (long)addr);
+    qemu_fdt_add_subnode(mc->fdt, mem_name);
+    qemu_fdt_setprop_cells(mc->fdt, mem_name, "reg",
+        addr >> 32, addr, size >> 32, size);
+    qemu_fdt_setprop_string(mc->fdt, mem_name, "device_type", "memory");
+    riscv_socket_fdt_write_id(mc, mc->fdt, mem_name, socket);
+    g_free(mem_name);
+}
+
+static void create_fdt_socket_clint(RISCVVirtState *s,
+                                    const MemMapEntry *memmap, int socke=
t,
+                                    uint32_t *intc_phandles)
+{
+    int cpu;
+    char *clint_name;
+    uint32_t *clint_cells;
+    unsigned long clint_addr;
+    MachineState *mc =3D MACHINE(s);
     static const char * const clint_compat[2] =3D {
         "sifive,clint0", "riscv,clint0"
     };
+
+    clint_cells =3D g_new0(uint32_t, s->soc[socket].num_harts * 4);
+
+    for (cpu =3D 0; cpu < s->soc[socket].num_harts; cpu++) {
+        clint_cells[cpu * 4 + 0] =3D cpu_to_be32(intc_phandles[cpu]);
+        clint_cells[cpu * 4 + 1] =3D cpu_to_be32(IRQ_M_SOFT);
+        clint_cells[cpu * 4 + 2] =3D cpu_to_be32(intc_phandles[cpu]);
+        clint_cells[cpu * 4 + 3] =3D cpu_to_be32(IRQ_M_TIMER);
+    }
+
+    clint_addr =3D memmap[VIRT_CLINT].base + (memmap[VIRT_CLINT].size * =
socket);
+    clint_name =3D g_strdup_printf("/soc/clint@%lx", clint_addr);
+    qemu_fdt_add_subnode(mc->fdt, clint_name);
+    qemu_fdt_setprop_string_array(mc->fdt, clint_name, "compatible",
+                                  (char **)&clint_compat,
+                                  ARRAY_SIZE(clint_compat));
+    qemu_fdt_setprop_cells(mc->fdt, clint_name, "reg",
+        0x0, clint_addr, 0x0, memmap[VIRT_CLINT].size);
+    qemu_fdt_setprop(mc->fdt, clint_name, "interrupts-extended",
+        clint_cells, s->soc[socket].num_harts * sizeof(uint32_t) * 4);
+    riscv_socket_fdt_write_id(mc, mc->fdt, clint_name, socket);
+    g_free(clint_name);
+
+    g_free(clint_cells);
+}
+
+static void create_fdt_socket_plic(RISCVVirtState *s,
+                                   const MemMapEntry *memmap, int socket=
,
+                                   uint32_t *phandle, uint32_t *intc_pha=
ndles,
+                                   uint32_t *plic_phandles)
+{
+    int cpu;
+    char *plic_name;
+    uint32_t *plic_cells;
+    unsigned long plic_addr;
+    MachineState *mc =3D MACHINE(s);
     static const char * const plic_compat[2] =3D {
         "sifive,plic-1.0.0", "riscv,plic0"
     };
=20
-    if (mc->dtb) {
-        fdt =3D mc->fdt =3D load_device_tree(mc->dtb, &s->fdt_size);
-        if (!fdt) {
-            error_report("load_device_tree() failed");
-            exit(1);
-        }
-        goto update_bootargs;
-    } else {
-        fdt =3D mc->fdt =3D create_device_tree(&s->fdt_size);
-        if (!fdt) {
-            error_report("create_device_tree() failed");
-            exit(1);
-        }
+    plic_cells =3D g_new0(uint32_t, s->soc[socket].num_harts * 4);
+
+    for (cpu =3D 0; cpu < s->soc[socket].num_harts; cpu++) {
+        plic_cells[cpu * 4 + 0] =3D cpu_to_be32(intc_phandles[cpu]);
+        plic_cells[cpu * 4 + 1] =3D cpu_to_be32(IRQ_M_EXT);
+        plic_cells[cpu * 4 + 2] =3D cpu_to_be32(intc_phandles[cpu]);
+        plic_cells[cpu * 4 + 3] =3D cpu_to_be32(IRQ_S_EXT);
     }
=20
-    qemu_fdt_setprop_string(fdt, "/", "model", "riscv-virtio,qemu");
-    qemu_fdt_setprop_string(fdt, "/", "compatible", "riscv-virtio");
-    qemu_fdt_setprop_cell(fdt, "/", "#size-cells", 0x2);
-    qemu_fdt_setprop_cell(fdt, "/", "#address-cells", 0x2);
+    plic_phandles[socket] =3D (*phandle)++;
+    plic_addr =3D memmap[VIRT_PLIC].base + (memmap[VIRT_PLIC].size * soc=
ket);
+    plic_name =3D g_strdup_printf("/soc/plic@%lx", plic_addr);
+    qemu_fdt_add_subnode(mc->fdt, plic_name);
+    qemu_fdt_setprop_cell(mc->fdt, plic_name,
+        "#address-cells", FDT_PLIC_ADDR_CELLS);
+    qemu_fdt_setprop_cell(mc->fdt, plic_name,
+        "#interrupt-cells", FDT_PLIC_INT_CELLS);
+    qemu_fdt_setprop_string_array(mc->fdt, plic_name, "compatible",
+                                  (char **)&plic_compat,
+                                  ARRAY_SIZE(plic_compat));
+    qemu_fdt_setprop(mc->fdt, plic_name, "interrupt-controller", NULL, 0=
);
+    qemu_fdt_setprop(mc->fdt, plic_name, "interrupts-extended",
+        plic_cells, s->soc[socket].num_harts * sizeof(uint32_t) * 4);
+    qemu_fdt_setprop_cells(mc->fdt, plic_name, "reg",
+        0x0, plic_addr, 0x0, memmap[VIRT_PLIC].size);
+    qemu_fdt_setprop_cell(mc->fdt, plic_name, "riscv,ndev", VIRTIO_NDEV)=
;
+    riscv_socket_fdt_write_id(mc, mc->fdt, plic_name, socket);
+    qemu_fdt_setprop_cell(mc->fdt, plic_name, "phandle",
+        plic_phandles[socket]);
+    g_free(plic_name);
+
+    g_free(plic_cells);
+}
=20
-    qemu_fdt_add_subnode(fdt, "/soc");
-    qemu_fdt_setprop(fdt, "/soc", "ranges", NULL, 0);
-    qemu_fdt_setprop_string(fdt, "/soc", "compatible", "simple-bus");
-    qemu_fdt_setprop_cell(fdt, "/soc", "#size-cells", 0x2);
-    qemu_fdt_setprop_cell(fdt, "/soc", "#address-cells", 0x2);
+static void create_fdt_sockets(RISCVVirtState *s, const MemMapEntry *mem=
map,
+                               bool is_32_bit, uint32_t *phandle,
+                               uint32_t *irq_mmio_phandle,
+                               uint32_t *irq_pcie_phandle,
+                               uint32_t *irq_virtio_phandle)
+{
+    int socket;
+    char *clust_name;
+    uint32_t *intc_phandles;
+    MachineState *mc =3D MACHINE(s);
+    uint32_t xplic_phandles[MAX_NODES];
=20
-    qemu_fdt_add_subnode(fdt, "/cpus");
-    qemu_fdt_setprop_cell(fdt, "/cpus", "timebase-frequency",
+    qemu_fdt_add_subnode(mc->fdt, "/cpus");
+    qemu_fdt_setprop_cell(mc->fdt, "/cpus", "timebase-frequency",
                           RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ);
-    qemu_fdt_setprop_cell(fdt, "/cpus", "#size-cells", 0x0);
-    qemu_fdt_setprop_cell(fdt, "/cpus", "#address-cells", 0x1);
-    qemu_fdt_add_subnode(fdt, "/cpus/cpu-map");
+    qemu_fdt_setprop_cell(mc->fdt, "/cpus", "#size-cells", 0x0);
+    qemu_fdt_setprop_cell(mc->fdt, "/cpus", "#address-cells", 0x1);
+    qemu_fdt_add_subnode(mc->fdt, "/cpus/cpu-map");
=20
     for (socket =3D (riscv_socket_count(mc) - 1); socket >=3D 0; socket-=
-) {
         clust_name =3D g_strdup_printf("/cpus/cpu-map/cluster%d", socket=
);
-        qemu_fdt_add_subnode(fdt, clust_name);
-
-        plic_cells =3D g_new0(uint32_t, s->soc[socket].num_harts * 4);
-        clint_cells =3D g_new0(uint32_t, s->soc[socket].num_harts * 4);
-
-        for (cpu =3D s->soc[socket].num_harts - 1; cpu >=3D 0; cpu--) {
-            cpu_phandle =3D phandle++;
-
-            cpu_name =3D g_strdup_printf("/cpus/cpu@%d",
-                s->soc[socket].hartid_base + cpu);
-            qemu_fdt_add_subnode(fdt, cpu_name);
-            if (is_32_bit) {
-                qemu_fdt_setprop_string(fdt, cpu_name, "mmu-type", "risc=
v,sv32");
-            } else {
-                qemu_fdt_setprop_string(fdt, cpu_name, "mmu-type", "risc=
v,sv48");
-            }
-            name =3D riscv_isa_string(&s->soc[socket].harts[cpu]);
-            qemu_fdt_setprop_string(fdt, cpu_name, "riscv,isa", name);
-            g_free(name);
-            qemu_fdt_setprop_string(fdt, cpu_name, "compatible", "riscv"=
);
-            qemu_fdt_setprop_string(fdt, cpu_name, "status", "okay");
-            qemu_fdt_setprop_cell(fdt, cpu_name, "reg",
-                s->soc[socket].hartid_base + cpu);
-            qemu_fdt_setprop_string(fdt, cpu_name, "device_type", "cpu")=
;
-            riscv_socket_fdt_write_id(mc, fdt, cpu_name, socket);
-            qemu_fdt_setprop_cell(fdt, cpu_name, "phandle", cpu_phandle)=
;
-
-            intc_name =3D g_strdup_printf("%s/interrupt-controller", cpu=
_name);
-            qemu_fdt_add_subnode(fdt, intc_name);
-            intc_phandle =3D phandle++;
-            qemu_fdt_setprop_cell(fdt, intc_name, "phandle", intc_phandl=
e);
-            qemu_fdt_setprop_string(fdt, intc_name, "compatible",
-                "riscv,cpu-intc");
-            qemu_fdt_setprop(fdt, intc_name, "interrupt-controller", NUL=
L, 0);
-            qemu_fdt_setprop_cell(fdt, intc_name, "#interrupt-cells", 1)=
;
-
-            clint_cells[cpu * 4 + 0] =3D cpu_to_be32(intc_phandle);
-            clint_cells[cpu * 4 + 1] =3D cpu_to_be32(IRQ_M_SOFT);
-            clint_cells[cpu * 4 + 2] =3D cpu_to_be32(intc_phandle);
-            clint_cells[cpu * 4 + 3] =3D cpu_to_be32(IRQ_M_TIMER);
-
-            plic_cells[cpu * 4 + 0] =3D cpu_to_be32(intc_phandle);
-            plic_cells[cpu * 4 + 1] =3D cpu_to_be32(IRQ_M_EXT);
-            plic_cells[cpu * 4 + 2] =3D cpu_to_be32(intc_phandle);
-            plic_cells[cpu * 4 + 3] =3D cpu_to_be32(IRQ_S_EXT);
-
-            core_name =3D g_strdup_printf("%s/core%d", clust_name, cpu);
-            qemu_fdt_add_subnode(fdt, core_name);
-            qemu_fdt_setprop_cell(fdt, core_name, "cpu", cpu_phandle);
-
-            g_free(core_name);
-            g_free(intc_name);
-            g_free(cpu_name);
-        }
+        qemu_fdt_add_subnode(mc->fdt, clust_name);
+
+        intc_phandles =3D g_new0(uint32_t, s->soc[socket].num_harts);
+
+        create_fdt_socket_cpus(s, socket, clust_name, phandle,
+            is_32_bit, intc_phandles);
=20
-        addr =3D memmap[VIRT_DRAM].base + riscv_socket_mem_offset(mc, so=
cket);
-        size =3D riscv_socket_mem_size(mc, socket);
-        mem_name =3D g_strdup_printf("/memory@%lx", (long)addr);
-        qemu_fdt_add_subnode(fdt, mem_name);
-        qemu_fdt_setprop_cells(fdt, mem_name, "reg",
-            addr >> 32, addr, size >> 32, size);
-        qemu_fdt_setprop_string(fdt, mem_name, "device_type", "memory");
-        riscv_socket_fdt_write_id(mc, fdt, mem_name, socket);
-        g_free(mem_name);
-
-        clint_addr =3D memmap[VIRT_CLINT].base +
-            (memmap[VIRT_CLINT].size * socket);
-        clint_name =3D g_strdup_printf("/soc/clint@%lx", clint_addr);
-        qemu_fdt_add_subnode(fdt, clint_name);
-        qemu_fdt_setprop_string_array(fdt, clint_name, "compatible",
-            (char **)&clint_compat, ARRAY_SIZE(clint_compat));
-        qemu_fdt_setprop_cells(fdt, clint_name, "reg",
-            0x0, clint_addr, 0x0, memmap[VIRT_CLINT].size);
-        qemu_fdt_setprop(fdt, clint_name, "interrupts-extended",
-            clint_cells, s->soc[socket].num_harts * sizeof(uint32_t) * 4=
);
-        riscv_socket_fdt_write_id(mc, fdt, clint_name, socket);
-        g_free(clint_name);
-
-        plic_phandle[socket] =3D phandle++;
-        plic_addr =3D memmap[VIRT_PLIC].base + (memmap[VIRT_PLIC].size *=
 socket);
-        plic_name =3D g_strdup_printf("/soc/plic@%lx", plic_addr);
-        qemu_fdt_add_subnode(fdt, plic_name);
-        qemu_fdt_setprop_cell(fdt, plic_name,
-            "#address-cells", FDT_PLIC_ADDR_CELLS);
-        qemu_fdt_setprop_cell(fdt, plic_name,
-            "#interrupt-cells", FDT_PLIC_INT_CELLS);
-        qemu_fdt_setprop_string_array(fdt, plic_name, "compatible",
-            (char **)&plic_compat, ARRAY_SIZE(plic_compat));
-        qemu_fdt_setprop(fdt, plic_name, "interrupt-controller", NULL, 0=
);
-        qemu_fdt_setprop(fdt, plic_name, "interrupts-extended",
-            plic_cells, s->soc[socket].num_harts * sizeof(uint32_t) * 4)=
;
-        qemu_fdt_setprop_cells(fdt, plic_name, "reg",
-            0x0, plic_addr, 0x0, memmap[VIRT_PLIC].size);
-        qemu_fdt_setprop_cell(fdt, plic_name, "riscv,ndev", VIRTIO_NDEV)=
;
-        riscv_socket_fdt_write_id(mc, fdt, plic_name, socket);
-        qemu_fdt_setprop_cell(fdt, plic_name, "phandle", plic_phandle[so=
cket]);
-        g_free(plic_name);
-
-        g_free(clint_cells);
-        g_free(plic_cells);
+        create_fdt_socket_memory(s, memmap, socket);
+
+        create_fdt_socket_clint(s, memmap, socket, intc_phandles);
+
+        create_fdt_socket_plic(s, memmap, socket, phandle,
+            intc_phandles, xplic_phandles);
+
+        g_free(intc_phandles);
         g_free(clust_name);
     }
=20
     for (socket =3D 0; socket < riscv_socket_count(mc); socket++) {
         if (socket =3D=3D 0) {
-            plic_mmio_phandle =3D plic_phandle[socket];
-            plic_virtio_phandle =3D plic_phandle[socket];
-            plic_pcie_phandle =3D plic_phandle[socket];
+            *irq_mmio_phandle =3D xplic_phandles[socket];
+            *irq_virtio_phandle =3D xplic_phandles[socket];
+            *irq_pcie_phandle =3D xplic_phandles[socket];
         }
         if (socket =3D=3D 1) {
-            plic_virtio_phandle =3D plic_phandle[socket];
-            plic_pcie_phandle =3D plic_phandle[socket];
+            *irq_virtio_phandle =3D xplic_phandles[socket];
+            *irq_pcie_phandle =3D xplic_phandles[socket];
         }
         if (socket =3D=3D 2) {
-            plic_pcie_phandle =3D plic_phandle[socket];
+            *irq_pcie_phandle =3D xplic_phandles[socket];
         }
     }
=20
-    riscv_socket_fdt_write_distance_matrix(mc, fdt);
+    riscv_socket_fdt_write_distance_matrix(mc, mc->fdt);
+}
+
+static void create_fdt_virtio(RISCVVirtState *s, const MemMapEntry *memm=
ap,
+                              uint32_t irq_virtio_phandle)
+{
+    int i;
+    char *name;
+    MachineState *mc =3D MACHINE(s);
=20
     for (i =3D 0; i < VIRTIO_COUNT; i++) {
         name =3D g_strdup_printf("/soc/virtio_mmio@%lx",
             (long)(memmap[VIRT_VIRTIO].base + i * memmap[VIRT_VIRTIO].si=
ze));
-        qemu_fdt_add_subnode(fdt, name);
-        qemu_fdt_setprop_string(fdt, name, "compatible", "virtio,mmio");
-        qemu_fdt_setprop_cells(fdt, name, "reg",
+        qemu_fdt_add_subnode(mc->fdt, name);
+        qemu_fdt_setprop_string(mc->fdt, name, "compatible", "virtio,mmi=
o");
+        qemu_fdt_setprop_cells(mc->fdt, name, "reg",
             0x0, memmap[VIRT_VIRTIO].base + i * memmap[VIRT_VIRTIO].size=
,
             0x0, memmap[VIRT_VIRTIO].size);
-        qemu_fdt_setprop_cell(fdt, name, "interrupt-parent",
-            plic_virtio_phandle);
-        qemu_fdt_setprop_cell(fdt, name, "interrupts", VIRTIO_IRQ + i);
+        qemu_fdt_setprop_cell(mc->fdt, name, "interrupt-parent",
+            irq_virtio_phandle);
+        qemu_fdt_setprop_cell(mc->fdt, name, "interrupts", VIRTIO_IRQ + =
i);
         g_free(name);
     }
+}
+
+static void create_fdt_pcie(RISCVVirtState *s, const MemMapEntry *memmap=
,
+                            uint32_t irq_pcie_phandle)
+{
+    char *name;
+    MachineState *mc =3D MACHINE(s);
=20
     name =3D g_strdup_printf("/soc/pci@%lx",
         (long) memmap[VIRT_PCIE_ECAM].base);
-    qemu_fdt_add_subnode(fdt, name);
-    qemu_fdt_setprop_cell(fdt, name, "#address-cells", FDT_PCI_ADDR_CELL=
S);
-    qemu_fdt_setprop_cell(fdt, name, "#interrupt-cells", FDT_PCI_INT_CEL=
LS);
-    qemu_fdt_setprop_cell(fdt, name, "#size-cells", 0x2);
-    qemu_fdt_setprop_string(fdt, name, "compatible", "pci-host-ecam-gene=
ric");
-    qemu_fdt_setprop_string(fdt, name, "device_type", "pci");
-    qemu_fdt_setprop_cell(fdt, name, "linux,pci-domain", 0);
-    qemu_fdt_setprop_cells(fdt, name, "bus-range", 0,
+    qemu_fdt_add_subnode(mc->fdt, name);
+    qemu_fdt_setprop_cell(mc->fdt, name, "#address-cells",
+        FDT_PCI_ADDR_CELLS);
+    qemu_fdt_setprop_cell(mc->fdt, name, "#interrupt-cells",
+        FDT_PCI_INT_CELLS);
+    qemu_fdt_setprop_cell(mc->fdt, name, "#size-cells", 0x2);
+    qemu_fdt_setprop_string(mc->fdt, name, "compatible",
+        "pci-host-ecam-generic");
+    qemu_fdt_setprop_string(mc->fdt, name, "device_type", "pci");
+    qemu_fdt_setprop_cell(mc->fdt, name, "linux,pci-domain", 0);
+    qemu_fdt_setprop_cells(mc->fdt, name, "bus-range", 0,
         memmap[VIRT_PCIE_ECAM].size / PCIE_MMCFG_SIZE_MIN - 1);
-    qemu_fdt_setprop(fdt, name, "dma-coherent", NULL, 0);
-    qemu_fdt_setprop_cells(fdt, name, "reg", 0,
+    qemu_fdt_setprop(mc->fdt, name, "dma-coherent", NULL, 0);
+    qemu_fdt_setprop_cells(mc->fdt, name, "reg", 0,
         memmap[VIRT_PCIE_ECAM].base, 0, memmap[VIRT_PCIE_ECAM].size);
-    qemu_fdt_setprop_sized_cells(fdt, name, "ranges",
+    qemu_fdt_setprop_sized_cells(mc->fdt, name, "ranges",
         1, FDT_PCI_RANGE_IOPORT, 2, 0,
         2, memmap[VIRT_PCIE_PIO].base, 2, memmap[VIRT_PCIE_PIO].size,
         1, FDT_PCI_RANGE_MMIO,
@@ -393,66 +441,96 @@ static void create_fdt(RISCVVirtState *s, const Mem=
MapEntry *memmap,
         2, virt_high_pcie_memmap.base,
         2, virt_high_pcie_memmap.base, 2, virt_high_pcie_memmap.size);
=20
-    create_pcie_irq_map(fdt, name, plic_pcie_phandle);
+    create_pcie_irq_map(mc->fdt, name, irq_pcie_phandle);
     g_free(name);
+}
=20
-    test_phandle =3D phandle++;
+static void create_fdt_reset(RISCVVirtState *s, const MemMapEntry *memma=
p,
+                             uint32_t *phandle)
+{
+    char *name;
+    uint32_t test_phandle;
+    MachineState *mc =3D MACHINE(s);
+
+    test_phandle =3D (*phandle)++;
     name =3D g_strdup_printf("/soc/test@%lx",
         (long)memmap[VIRT_TEST].base);
-    qemu_fdt_add_subnode(fdt, name);
+    qemu_fdt_add_subnode(mc->fdt, name);
     {
         static const char * const compat[3] =3D {
             "sifive,test1", "sifive,test0", "syscon"
         };
-        qemu_fdt_setprop_string_array(fdt, name, "compatible", (char **)=
&compat,
-                                      ARRAY_SIZE(compat));
+        qemu_fdt_setprop_string_array(mc->fdt, name, "compatible",
+                                      (char **)&compat, ARRAY_SIZE(compa=
t));
     }
-    qemu_fdt_setprop_cells(fdt, name, "reg",
-        0x0, memmap[VIRT_TEST].base,
-        0x0, memmap[VIRT_TEST].size);
-    qemu_fdt_setprop_cell(fdt, name, "phandle", test_phandle);
-    test_phandle =3D qemu_fdt_get_phandle(fdt, name);
+    qemu_fdt_setprop_cells(mc->fdt, name, "reg",
+        0x0, memmap[VIRT_TEST].base, 0x0, memmap[VIRT_TEST].size);
+    qemu_fdt_setprop_cell(mc->fdt, name, "phandle", test_phandle);
+    test_phandle =3D qemu_fdt_get_phandle(mc->fdt, name);
     g_free(name);
=20
     name =3D g_strdup_printf("/soc/reboot");
-    qemu_fdt_add_subnode(fdt, name);
-    qemu_fdt_setprop_string(fdt, name, "compatible", "syscon-reboot");
-    qemu_fdt_setprop_cell(fdt, name, "regmap", test_phandle);
-    qemu_fdt_setprop_cell(fdt, name, "offset", 0x0);
-    qemu_fdt_setprop_cell(fdt, name, "value", FINISHER_RESET);
+    qemu_fdt_add_subnode(mc->fdt, name);
+    qemu_fdt_setprop_string(mc->fdt, name, "compatible", "syscon-reboot"=
);
+    qemu_fdt_setprop_cell(mc->fdt, name, "regmap", test_phandle);
+    qemu_fdt_setprop_cell(mc->fdt, name, "offset", 0x0);
+    qemu_fdt_setprop_cell(mc->fdt, name, "value", FINISHER_RESET);
     g_free(name);
=20
     name =3D g_strdup_printf("/soc/poweroff");
-    qemu_fdt_add_subnode(fdt, name);
-    qemu_fdt_setprop_string(fdt, name, "compatible", "syscon-poweroff");
-    qemu_fdt_setprop_cell(fdt, name, "regmap", test_phandle);
-    qemu_fdt_setprop_cell(fdt, name, "offset", 0x0);
-    qemu_fdt_setprop_cell(fdt, name, "value", FINISHER_PASS);
+    qemu_fdt_add_subnode(mc->fdt, name);
+    qemu_fdt_setprop_string(mc->fdt, name, "compatible", "syscon-powerof=
f");
+    qemu_fdt_setprop_cell(mc->fdt, name, "regmap", test_phandle);
+    qemu_fdt_setprop_cell(mc->fdt, name, "offset", 0x0);
+    qemu_fdt_setprop_cell(mc->fdt, name, "value", FINISHER_PASS);
     g_free(name);
+}
+
+static void create_fdt_uart(RISCVVirtState *s, const MemMapEntry *memmap=
,
+                            uint32_t irq_mmio_phandle)
+{
+    char *name;
+    MachineState *mc =3D MACHINE(s);
=20
     name =3D g_strdup_printf("/soc/uart@%lx", (long)memmap[VIRT_UART0].b=
ase);
-    qemu_fdt_add_subnode(fdt, name);
-    qemu_fdt_setprop_string(fdt, name, "compatible", "ns16550a");
-    qemu_fdt_setprop_cells(fdt, name, "reg",
+    qemu_fdt_add_subnode(mc->fdt, name);
+    qemu_fdt_setprop_string(mc->fdt, name, "compatible", "ns16550a");
+    qemu_fdt_setprop_cells(mc->fdt, name, "reg",
         0x0, memmap[VIRT_UART0].base,
         0x0, memmap[VIRT_UART0].size);
-    qemu_fdt_setprop_cell(fdt, name, "clock-frequency", 3686400);
-    qemu_fdt_setprop_cell(fdt, name, "interrupt-parent", plic_mmio_phand=
le);
-    qemu_fdt_setprop_cell(fdt, name, "interrupts", UART0_IRQ);
+    qemu_fdt_setprop_cell(mc->fdt, name, "clock-frequency", 3686400);
+    qemu_fdt_setprop_cell(mc->fdt, name, "interrupt-parent", irq_mmio_ph=
andle);
+    qemu_fdt_setprop_cell(mc->fdt, name, "interrupts", UART0_IRQ);
=20
-    qemu_fdt_add_subnode(fdt, "/chosen");
-    qemu_fdt_setprop_string(fdt, "/chosen", "stdout-path", name);
+    qemu_fdt_add_subnode(mc->fdt, "/chosen");
+    qemu_fdt_setprop_string(mc->fdt, "/chosen", "stdout-path", name);
     g_free(name);
+}
+
+static void create_fdt_rtc(RISCVVirtState *s, const MemMapEntry *memmap,
+                           uint32_t irq_mmio_phandle)
+{
+    char *name;
+    MachineState *mc =3D MACHINE(s);
=20
     name =3D g_strdup_printf("/soc/rtc@%lx", (long)memmap[VIRT_RTC].base=
);
-    qemu_fdt_add_subnode(fdt, name);
-    qemu_fdt_setprop_string(fdt, name, "compatible", "google,goldfish-rt=
c");
-    qemu_fdt_setprop_cells(fdt, name, "reg",
-        0x0, memmap[VIRT_RTC].base,
-        0x0, memmap[VIRT_RTC].size);
-    qemu_fdt_setprop_cell(fdt, name, "interrupt-parent", plic_mmio_phand=
le);
-    qemu_fdt_setprop_cell(fdt, name, "interrupts", RTC_IRQ);
+    qemu_fdt_add_subnode(mc->fdt, name);
+    qemu_fdt_setprop_string(mc->fdt, name, "compatible",
+        "google,goldfish-rtc");
+    qemu_fdt_setprop_cells(mc->fdt, name, "reg",
+        0x0, memmap[VIRT_RTC].base, 0x0, memmap[VIRT_RTC].size);
+    qemu_fdt_setprop_cell(mc->fdt, name, "interrupt-parent",
+        irq_mmio_phandle);
+    qemu_fdt_setprop_cell(mc->fdt, name, "interrupts", RTC_IRQ);
     g_free(name);
+}
+
+static void create_fdt_flash(RISCVVirtState *s, const MemMapEntry *memma=
p)
+{
+    char *name;
+    MachineState *mc =3D MACHINE(s);
+    hwaddr flashsize =3D virt_memmap[VIRT_FLASH].size / 2;
+    hwaddr flashbase =3D virt_memmap[VIRT_FLASH].base;
=20
     name =3D g_strdup_printf("/flash@%" PRIx64, flashbase);
     qemu_fdt_add_subnode(mc->fdt, name);
@@ -462,10 +540,59 @@ static void create_fdt(RISCVVirtState *s, const Mem=
MapEntry *memmap,
                                  2, flashbase + flashsize, 2, flashsize)=
;
     qemu_fdt_setprop_cell(mc->fdt, name, "bank-width", 4);
     g_free(name);
+}
+
+static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
+                       uint64_t mem_size, const char *cmdline, bool is_3=
2_bit)
+{
+    MachineState *mc =3D MACHINE(s);
+    uint32_t phandle =3D 1, irq_mmio_phandle =3D 1;
+    uint32_t irq_pcie_phandle =3D 1, irq_virtio_phandle =3D 1;
+
+    if (mc->dtb) {
+        mc->fdt =3D load_device_tree(mc->dtb, &s->fdt_size);
+        if (!mc->fdt) {
+            error_report("load_device_tree() failed");
+            exit(1);
+        }
+        goto update_bootargs;
+    } else {
+        mc->fdt =3D create_device_tree(&s->fdt_size);
+        if (!mc->fdt) {
+            error_report("create_device_tree() failed");
+            exit(1);
+        }
+    }
+
+    qemu_fdt_setprop_string(mc->fdt, "/", "model", "riscv-virtio,qemu");
+    qemu_fdt_setprop_string(mc->fdt, "/", "compatible", "riscv-virtio");
+    qemu_fdt_setprop_cell(mc->fdt, "/", "#size-cells", 0x2);
+    qemu_fdt_setprop_cell(mc->fdt, "/", "#address-cells", 0x2);
+
+    qemu_fdt_add_subnode(mc->fdt, "/soc");
+    qemu_fdt_setprop(mc->fdt, "/soc", "ranges", NULL, 0);
+    qemu_fdt_setprop_string(mc->fdt, "/soc", "compatible", "simple-bus")=
;
+    qemu_fdt_setprop_cell(mc->fdt, "/soc", "#size-cells", 0x2);
+    qemu_fdt_setprop_cell(mc->fdt, "/soc", "#address-cells", 0x2);
+
+    create_fdt_sockets(s, memmap, is_32_bit, &phandle,
+        &irq_mmio_phandle, &irq_pcie_phandle, &irq_virtio_phandle);
+
+    create_fdt_virtio(s, memmap, irq_virtio_phandle);
+
+    create_fdt_pcie(s, memmap, irq_pcie_phandle);
+
+    create_fdt_reset(s, memmap, &phandle);
+
+    create_fdt_uart(s, memmap, irq_mmio_phandle);
+
+    create_fdt_rtc(s, memmap, irq_mmio_phandle);
+
+    create_fdt_flash(s, memmap);
=20
 update_bootargs:
     if (cmdline) {
-        qemu_fdt_setprop_string(fdt, "/chosen", "bootargs", cmdline);
+        qemu_fdt_setprop_string(mc->fdt, "/chosen", "bootargs", cmdline)=
;
     }
 }
=20
--=20
2.31.1


