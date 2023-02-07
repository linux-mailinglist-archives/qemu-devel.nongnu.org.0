Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A123868D041
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 08:11:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPI7T-0006Tk-QP; Tue, 07 Feb 2023 02:10:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=395dd5341=alistair.francis@opensource.wdc.com>)
 id 1pPI7H-0006Pr-3q
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 02:10:14 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=395dd5341=alistair.francis@opensource.wdc.com>)
 id 1pPI7D-0008RS-5C
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 02:10:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1675753807; x=1707289807;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+v/zl+Eu3HGH4Gb95ZtesHY+Tt+n4VotvjzyDYk/yQA=;
 b=YIW+j/wuzc3MEnifCBGM6whiAi0/bAD3MW0RIOfenE8vAnf5FEDYILxY
 dZ7Zn/z/OWpwVk/tNPjW0znKoRFo0iXdTzxQco2ndTuhssiQanMxvKc2u
 ojX0Mo+Mx3uVJNkO+8575mYD6DLsPIebpiiNBpbdS/3CWEDIistJT5iTd
 GwMNz0mCZgiT+NcwCf/HYiiRR8cB/YeI3PbQIPe8vkOKR8xP3aWyAYpxO
 i30KPFbUi/TlaggzZzZ/MkpM8dAt32RNxmfMEMDYuFHCCj0IW87xRQJXZ
 dej23LJVT4oBNa+HoHlKS4poI1K4k3Z5PerMdgLylHSPn63gDsyhQM7AN g==;
X-IronPort-AV: E=Sophos;i="5.97,278,1669046400"; d="scan'208";a="227657480"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Feb 2023 15:10:04 +0800
IronPort-SDR: thrqDwTjM2vNez7vTzubwfW5LzF0GiwCFLdJD1k6X2g3OSS+TSQBAlwfx1f79ilQiyg/avGeGF
 3rCcQTqpChw24M1Z2MbQARFRG5rW8iKGxr3CMnM0DNpxlA9OB+iJvBsB77MDe77PmjdMe4JDwq
 4dGsjwhRP2ivPEl/NRIENysydku/DMhjD5x7b+1eTAphvoTzX7WLi1yZrFmPaBy8vn4EGJyKCK
 rZKNvo42aFnJJnAECH4yZVAvta5oUtuFjJpkFbng/tq3iqzc6+zf5NuYy7xdOd6wzQtzirw3Dx
 Ubk=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Feb 2023 22:27:21 -0800
IronPort-SDR: iBw/G79oy8YtmIMetgIdhRXTbHu8iCea2ajHiyGHJnUp5D9zVegnuXAQkF/XffsMpBhFW0Yvq+
 xMZXQxZ71SbBrrHreJKphn/cTyahVylG22uG/PxeNHPy11QTJdzFDkEgrc0m8bx00C1qD65eWc
 BSi4ES2AATP8CXYry1yblJYM1gthRUfcaO8+Ksmwr+8KTLsdpSIGLyoRU8DABNDtpd7QhcuVkq
 wGK7AQi6xe/6+786hldkviyahocpO7gt0CVybBabiBXX9WacLTm8YRyN4xkvuxSs1WHNL9wM79
 rUk=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Feb 2023 23:10:04 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4P9vQh02tMz1RwtC
 for <qemu-devel@nongnu.org>; Mon,  6 Feb 2023 23:10:03 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1675753803; x=1678345804; bh=+v/zl+E
 u3HGH4Gb95ZtesHY+Tt+n4VotvjzyDYk/yQA=; b=aJPWdks7hZpY2e87oC6lGLf
 sU9cOdNX0XUMc6P+U1IJmUypkff1lBICXKbp+uRjg8Rxz+zlLxW+HBKMFOvMHtLJ
 RXpEng1UnMKb7osy6yNrmR4sRsnKZpPEqUpW8hpPAc/yrRrQRl82CWbJpKg0Lg/5
 VIF0ZEaGE7aC3SloDu9WTjvRywBJDSsujc672efAfCh+NZOVzLxn6y+787k50UXL
 rXbWfTroG1PyBQ9LmObKvskWcttcgLUWO38JR0tdZ/iA14Q9CZzNHpxQhn2Ge7tA
 kDOUhp6w6r2f4o/cJZ4rIHXtx1oYa3ib8xAZwmxc2BQd2hnJRXWV8+0Hk4bQFfg=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id SyfICwHeU8Mt for <qemu-devel@nongnu.org>;
 Mon,  6 Feb 2023 23:10:03 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.38])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4P9vQd43Bqz1RvTp;
 Mon,  6 Feb 2023 23:10:01 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 08/32] hw/riscv/virt.c: calculate socket count once in
 create_fdt_imsic()
Date: Tue,  7 Feb 2023 17:09:19 +1000
Message-Id: <20230207070943.2558857-9-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207070943.2558857-1-alistair.francis@opensource.wdc.com>
References: <20230207070943.2558857-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=395dd5341=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

riscv_socket_count() returns either ms->numa_state->num_nodes or 1
depending on NUMA support. In any case the value can be retrieved only
once and used in the rest of the function.

This will also alleviate the rename we're going to do next by reducing
the instances of MachineState 'mc' inside hw/riscv/virt.c.

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-Id: <20230124212234.412630-2-dbarboza@ventanamicro.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/virt.c | 34 +++++++++++++++++++---------------
 1 file changed, 19 insertions(+), 15 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 4a11b4b010..61fdb52090 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -505,13 +505,14 @@ static void create_fdt_imsic(RISCVVirtState *s, con=
st MemMapEntry *memmap,
     int cpu, socket;
     char *imsic_name;
     MachineState *mc =3D MACHINE(s);
+    int socket_count =3D riscv_socket_count(mc);
     uint32_t imsic_max_hart_per_socket, imsic_guest_bits;
     uint32_t *imsic_cells, *imsic_regs, imsic_addr, imsic_size;
=20
     *msi_m_phandle =3D (*phandle)++;
     *msi_s_phandle =3D (*phandle)++;
     imsic_cells =3D g_new0(uint32_t, mc->smp.cpus * 2);
-    imsic_regs =3D g_new0(uint32_t, riscv_socket_count(mc) * 4);
+    imsic_regs =3D g_new0(uint32_t, socket_count * 4);
=20
     /* M-level IMSIC node */
     for (cpu =3D 0; cpu < mc->smp.cpus; cpu++) {
@@ -519,7 +520,7 @@ static void create_fdt_imsic(RISCVVirtState *s, const=
 MemMapEntry *memmap,
         imsic_cells[cpu * 2 + 1] =3D cpu_to_be32(IRQ_M_EXT);
     }
     imsic_max_hart_per_socket =3D 0;
-    for (socket =3D 0; socket < riscv_socket_count(mc); socket++) {
+    for (socket =3D 0; socket < socket_count; socket++) {
         imsic_addr =3D memmap[VIRT_IMSIC_M].base +
                      socket * VIRT_IMSIC_GROUP_MAX_SIZE;
         imsic_size =3D IMSIC_HART_SIZE(0) * s->soc[socket].num_harts;
@@ -545,14 +546,14 @@ static void create_fdt_imsic(RISCVVirtState *s, con=
st MemMapEntry *memmap,
     qemu_fdt_setprop(mc->fdt, imsic_name, "interrupts-extended",
         imsic_cells, mc->smp.cpus * sizeof(uint32_t) * 2);
     qemu_fdt_setprop(mc->fdt, imsic_name, "reg", imsic_regs,
-        riscv_socket_count(mc) * sizeof(uint32_t) * 4);
+        socket_count * sizeof(uint32_t) * 4);
     qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,num-ids",
         VIRT_IRQCHIP_NUM_MSIS);
-    if (riscv_socket_count(mc) > 1) {
+    if (socket_count > 1) {
         qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,hart-index-bit=
s",
             imsic_num_bits(imsic_max_hart_per_socket));
         qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,group-index-bi=
ts",
-            imsic_num_bits(riscv_socket_count(mc)));
+            imsic_num_bits(socket_count));
         qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,group-index-sh=
ift",
             IMSIC_MMIO_GROUP_MIN_SHIFT);
     }
@@ -567,7 +568,7 @@ static void create_fdt_imsic(RISCVVirtState *s, const=
 MemMapEntry *memmap,
     }
     imsic_guest_bits =3D imsic_num_bits(s->aia_guests + 1);
     imsic_max_hart_per_socket =3D 0;
-    for (socket =3D 0; socket < riscv_socket_count(mc); socket++) {
+    for (socket =3D 0; socket < socket_count; socket++) {
         imsic_addr =3D memmap[VIRT_IMSIC_S].base +
                      socket * VIRT_IMSIC_GROUP_MAX_SIZE;
         imsic_size =3D IMSIC_HART_SIZE(imsic_guest_bits) *
@@ -594,18 +595,18 @@ static void create_fdt_imsic(RISCVVirtState *s, con=
st MemMapEntry *memmap,
     qemu_fdt_setprop(mc->fdt, imsic_name, "interrupts-extended",
         imsic_cells, mc->smp.cpus * sizeof(uint32_t) * 2);
     qemu_fdt_setprop(mc->fdt, imsic_name, "reg", imsic_regs,
-        riscv_socket_count(mc) * sizeof(uint32_t) * 4);
+        socket_count * sizeof(uint32_t) * 4);
     qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,num-ids",
         VIRT_IRQCHIP_NUM_MSIS);
     if (imsic_guest_bits) {
         qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,guest-index-bi=
ts",
             imsic_guest_bits);
     }
-    if (riscv_socket_count(mc) > 1) {
+    if (socket_count > 1) {
         qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,hart-index-bit=
s",
             imsic_num_bits(imsic_max_hart_per_socket));
         qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,group-index-bi=
ts",
-            imsic_num_bits(riscv_socket_count(mc)));
+            imsic_num_bits(socket_count));
         qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,group-index-sh=
ift",
             IMSIC_MMIO_GROUP_MIN_SHIFT);
     }
@@ -733,6 +734,7 @@ static void create_fdt_sockets(RISCVVirtState *s, con=
st MemMapEntry *memmap,
     MachineState *mc =3D MACHINE(s);
     uint32_t msi_m_phandle =3D 0, msi_s_phandle =3D 0;
     uint32_t *intc_phandles, xplic_phandles[MAX_NODES];
+    int socket_count =3D riscv_socket_count(mc);
=20
     qemu_fdt_add_subnode(mc->fdt, "/cpus");
     qemu_fdt_setprop_cell(mc->fdt, "/cpus", "timebase-frequency",
@@ -744,7 +746,7 @@ static void create_fdt_sockets(RISCVVirtState *s, con=
st MemMapEntry *memmap,
     intc_phandles =3D g_new0(uint32_t, mc->smp.cpus);
=20
     phandle_pos =3D mc->smp.cpus;
-    for (socket =3D (riscv_socket_count(mc) - 1); socket >=3D 0; socket-=
-) {
+    for (socket =3D (socket_count - 1); socket >=3D 0; socket--) {
         phandle_pos -=3D s->soc[socket].num_harts;
=20
         clust_name =3D g_strdup_printf("/cpus/cpu-map/cluster%d", socket=
);
@@ -775,7 +777,7 @@ static void create_fdt_sockets(RISCVVirtState *s, con=
st MemMapEntry *memmap,
     }
=20
     phandle_pos =3D mc->smp.cpus;
-    for (socket =3D (riscv_socket_count(mc) - 1); socket >=3D 0; socket-=
-) {
+    for (socket =3D (socket_count - 1); socket >=3D 0; socket--) {
         phandle_pos -=3D s->soc[socket].num_harts;
=20
         if (s->aia_type =3D=3D VIRT_AIA_TYPE_NONE) {
@@ -790,7 +792,7 @@ static void create_fdt_sockets(RISCVVirtState *s, con=
st MemMapEntry *memmap,
=20
     g_free(intc_phandles);
=20
-    for (socket =3D 0; socket < riscv_socket_count(mc); socket++) {
+    for (socket =3D 0; socket < socket_count; socket++) {
         if (socket =3D=3D 0) {
             *irq_mmio_phandle =3D xplic_phandles[socket];
             *irq_virtio_phandle =3D xplic_phandles[socket];
@@ -1051,7 +1053,8 @@ static void create_fdt(RISCVVirtState *s, const Mem=
MapEntry *memmap)
=20
     /* Pass seed to RNG */
     qemu_guest_getrandom_nofail(rng_seed, sizeof(rng_seed));
-    qemu_fdt_setprop(mc->fdt, "/chosen", "rng-seed", rng_seed, sizeof(rn=
g_seed));
+    qemu_fdt_setprop(mc->fdt, "/chosen", "rng-seed",
+                     rng_seed, sizeof(rng_seed));
 }
=20
 static inline DeviceState *gpex_pcie_init(MemoryRegion *sys_mem,
@@ -1328,9 +1331,10 @@ static void virt_machine_init(MachineState *machin=
e)
     char *soc_name;
     DeviceState *mmio_irqchip, *virtio_irqchip, *pcie_irqchip;
     int i, base_hartid, hart_count;
+    int socket_count =3D riscv_socket_count(machine);
=20
     /* Check socket count limit */
-    if (VIRT_SOCKETS_MAX < riscv_socket_count(machine)) {
+    if (VIRT_SOCKETS_MAX < socket_count) {
         error_report("number of sockets/nodes should be less than %d",
             VIRT_SOCKETS_MAX);
         exit(1);
@@ -1338,7 +1342,7 @@ static void virt_machine_init(MachineState *machine=
)
=20
     /* Initialize sockets */
     mmio_irqchip =3D virtio_irqchip =3D pcie_irqchip =3D NULL;
-    for (i =3D 0; i < riscv_socket_count(machine); i++) {
+    for (i =3D 0; i < socket_count; i++) {
         if (!riscv_socket_check_hartids(machine, i)) {
             error_report("discontinuous hartids in socket%d", i);
             exit(1);
--=20
2.39.1


