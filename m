Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3FAD412F0D
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 09:08:39 +0200 (CEST)
Received: from localhost ([::1]:42682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSZtO-00026O-SQ
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 03:08:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=891501f09=alistair.francis@opensource.wdc.com>)
 id 1mSZgs-0008MC-3A
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 02:55:42 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:39770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=891501f09=alistair.francis@opensource.wdc.com>)
 id 1mSZgq-0004WW-45
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 02:55:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1632207340; x=1663743340;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gTgrezxrY8pu1Le1R0UTY4bW15/1om0/bxby21zwLDA=;
 b=Qf9wKG+m46m0Hsm30/zo5Kcgj35mo0r1Wv7syszoMKE1Mkzb5mWa8vgy
 /1AIAvGW0lG285hGsb/BKJKKYqcgsV0IXTVF3rR92RsjIqqQzJScRUrQF
 hvsamL1tOVOz59xV23JKD5M3K2Cd/2xkDsQCkPxljG+U7WloyJs3K6uU9
 2q55FnwPtsWsy4uG/1WJsPRyA4k4iG0qwC0oXPrJtHBzC3NVCidaH41bz
 YGAC+LoiQOOxqMRi88WRIQDT6xKkGGH9BA8zYFEC6En7OMmyL6R+FkUUX
 QJtxdeqR3qH4/Syod5/1mh7nDDSHDsduYYHcvQaXOTskVEWeoe7SUc7Gm g==;
X-IronPort-AV: E=Sophos;i="5.85,310,1624291200"; d="scan'208";a="181039453"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Sep 2021 14:55:39 +0800
IronPort-SDR: h2c6JBrhwVrke0FIedypAj9V0UjIGNaU1wBj7x0+RgVvwkC7wt13mm0QVEMM+A9z5fDE5me/NP
 W5ckIoPyfPEUYokS7ILHr+ehea9FWIb/1qgz1hfnGP4jkMYy8d5OmfLbCXAJd9nFgxsrZKOLMe
 9spc0viUiKFiCe2yg/OEr098VqQCggnJYFt5NBB+fUHJHPS6Mw3HSZejxjkoyeQVkLnXAkHW4r
 /4jQmiiOU9FFlvbcVxVR1LS30pHNzhW6LpG92DiqUl0jdZswLjj1ChkPUa1JuSo4DmAZVawsgi
 amlspMSv7+vJoCVS4FVEXQi3
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2021 23:31:53 -0700
IronPort-SDR: JebFbmr1vZcUyPZgY/yH3awpUObXvKIHA6vBGt93h3XW9jdlSflvjd0A7d6jB5mR1K0150/MdN
 v0+6fEmGfl5uB/RgxBON1VKgHaSo2UiRsL1LPcryAgrthG1WYJVLKyZ8epKbBoqpbazFm7gYIq
 E0pItKXew+AA18a0K1LlpW7Tj8CBTnydUlta91Vs7iEeq0nBf+tta39K7gODT/aPFQHxpnvo/U
 fXcv4tbygRpDsTw2I3390xXeCKjgKtzDKPNIf+/uwCNXpWVaemFHYiC5jNK5lbvUlmpE3NiMxJ
 g/w=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2021 23:55:40 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HDByf5fKYz1Rws0
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 23:55:38 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1632207337; x=1634799338; bh=gTgrezxrY8pu1Le1R0
 UTY4bW15/1om0/bxby21zwLDA=; b=Kr1kYSHSJ53Wtd+KPal+JgP/h6jGVYz+qi
 x98yRG8a6SDxY6VffUCZcBjnEGLxPy2VQFCD1C3xg3CcnJ91GjsY03hy4KJxrEkp
 5qj6np8Ox3mJy/akDPbk076bT4Nv8KHO6vTeTZ+6QurIo/YOcuzyoQ0YYH67IYG1
 bQ0Bzpjbemhtc6z4KSitev0Yupish0Y+59WgwfqBrqJox9spvHj+jR8kXqZJhcCY
 zg5mhQZqg7/OGVaYnoBESZEmbcY7UI3dh+d8UcJBi+519eTpEhBOpEPzi5SCDWB4
 CzPg3Hm9DguLGIVPQ4sCL+rzCA/n+pFi7o2JBbV0snGYGS27dXXQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id L8cE1M4oC_q5 for <qemu-devel@nongnu.org>;
 Mon, 20 Sep 2021 23:55:37 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.26])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HDByY56l6z1RvlV;
 Mon, 20 Sep 2021 23:55:33 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Anup Patel <anup.patel@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [PULL v2 13/21] hw/riscv: virt: Add optional ACLINT support to virt
 machine
Date: Tue, 21 Sep 2021 16:54:04 +1000
Message-Id: <20210921065412.312381-14-alistair.francis@opensource.wdc.com>
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

We extend virt machine to emulate ACLINT devices only when "aclint=3Don"
parameter is passed along with machine name in QEMU command-line.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-id: 20210831110603.338681-5-anup.patel@wdc.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 docs/system/riscv/virt.rst |  10 ++++
 include/hw/riscv/virt.h    |   2 +
 hw/riscv/virt.c            | 113 ++++++++++++++++++++++++++++++++++++-
 3 files changed, 124 insertions(+), 1 deletion(-)

diff --git a/docs/system/riscv/virt.rst b/docs/system/riscv/virt.rst
index 321d77e07d..fa016584bf 100644
--- a/docs/system/riscv/virt.rst
+++ b/docs/system/riscv/virt.rst
@@ -53,6 +53,16 @@ with the default OpenSBI firmware image as the -bios. =
It also supports
 the recommended RISC-V bootflow: U-Boot SPL (M-mode) loads OpenSBI fw_dy=
namic
 firmware and U-Boot proper (S-mode), using the standard -bios functional=
ity.
=20
+Machine-specific options
+------------------------
+
+The following machine-specific options are supported:
+
+- aclint=3D[on|off]
+
+  When this option is "on", ACLINT devices will be emulated instead of
+  SiFive CLINT. When not specified, this option is assumed to be "off".
+
 Running Linux kernel
 --------------------
=20
diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index 349fee1f89..d9105c1886 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -43,6 +43,7 @@ struct RISCVVirtState {
     FWCfgState *fw_cfg;
=20
     int fdt_size;
+    bool have_aclint;
 };
=20
 enum {
@@ -51,6 +52,7 @@ enum {
     VIRT_TEST,
     VIRT_RTC,
     VIRT_CLINT,
+    VIRT_ACLINT_SSWI,
     VIRT_PLIC,
     VIRT_UART0,
     VIRT_VIRTIO,
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 7f716901ef..ec0cb69b8c 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -48,6 +48,7 @@ static const MemMapEntry virt_memmap[] =3D {
     [VIRT_TEST] =3D        {   0x100000,        0x1000 },
     [VIRT_RTC] =3D         {   0x101000,        0x1000 },
     [VIRT_CLINT] =3D       {  0x2000000,       0x10000 },
+    [VIRT_ACLINT_SSWI] =3D {  0x2F00000,        0x4000 },
     [VIRT_PCIE_PIO] =3D    {  0x3000000,       0x10000 },
     [VIRT_PLIC] =3D        {  0xc000000, VIRT_PLIC_SIZE(VIRT_CPUS_MAX * =
2) },
     [VIRT_UART0] =3D       { 0x10000000,         0x100 },
@@ -281,6 +282,82 @@ static void create_fdt_socket_clint(RISCVVirtState *=
s,
     g_free(clint_cells);
 }
=20
+static void create_fdt_socket_aclint(RISCVVirtState *s,
+                                     const MemMapEntry *memmap, int sock=
et,
+                                     uint32_t *intc_phandles)
+{
+    int cpu;
+    char *name;
+    unsigned long addr;
+    uint32_t aclint_cells_size;
+    uint32_t *aclint_mswi_cells;
+    uint32_t *aclint_sswi_cells;
+    uint32_t *aclint_mtimer_cells;
+    MachineState *mc =3D MACHINE(s);
+
+    aclint_mswi_cells =3D g_new0(uint32_t, s->soc[socket].num_harts * 2)=
;
+    aclint_mtimer_cells =3D g_new0(uint32_t, s->soc[socket].num_harts * =
2);
+    aclint_sswi_cells =3D g_new0(uint32_t, s->soc[socket].num_harts * 2)=
;
+
+    for (cpu =3D 0; cpu < s->soc[socket].num_harts; cpu++) {
+        aclint_mswi_cells[cpu * 2 + 0] =3D cpu_to_be32(intc_phandles[cpu=
]);
+        aclint_mswi_cells[cpu * 2 + 1] =3D cpu_to_be32(IRQ_M_SOFT);
+        aclint_mtimer_cells[cpu * 2 + 0] =3D cpu_to_be32(intc_phandles[c=
pu]);
+        aclint_mtimer_cells[cpu * 2 + 1] =3D cpu_to_be32(IRQ_M_TIMER);
+        aclint_sswi_cells[cpu * 2 + 0] =3D cpu_to_be32(intc_phandles[cpu=
]);
+        aclint_sswi_cells[cpu * 2 + 1] =3D cpu_to_be32(IRQ_S_SOFT);
+    }
+    aclint_cells_size =3D s->soc[socket].num_harts * sizeof(uint32_t) * =
2;
+
+    addr =3D memmap[VIRT_CLINT].base + (memmap[VIRT_CLINT].size * socket=
);
+    name =3D g_strdup_printf("/soc/mswi@%lx", addr);
+    qemu_fdt_add_subnode(mc->fdt, name);
+    qemu_fdt_setprop_string(mc->fdt, name, "compatible", "riscv,aclint-m=
swi");
+    qemu_fdt_setprop_cells(mc->fdt, name, "reg",
+        0x0, addr, 0x0, RISCV_ACLINT_SWI_SIZE);
+    qemu_fdt_setprop(mc->fdt, name, "interrupts-extended",
+        aclint_mswi_cells, aclint_cells_size);
+    qemu_fdt_setprop(mc->fdt, name, "interrupt-controller", NULL, 0);
+    qemu_fdt_setprop_cell(mc->fdt, name, "#interrupt-cells", 0);
+    riscv_socket_fdt_write_id(mc, mc->fdt, name, socket);
+    g_free(name);
+
+    addr =3D memmap[VIRT_CLINT].base + RISCV_ACLINT_SWI_SIZE +
+        (memmap[VIRT_CLINT].size * socket);
+    name =3D g_strdup_printf("/soc/mtimer@%lx", addr);
+    qemu_fdt_add_subnode(mc->fdt, name);
+    qemu_fdt_setprop_string(mc->fdt, name, "compatible",
+        "riscv,aclint-mtimer");
+    qemu_fdt_setprop_cells(mc->fdt, name, "reg",
+        0x0, addr + RISCV_ACLINT_DEFAULT_MTIME,
+        0x0, memmap[VIRT_CLINT].size - RISCV_ACLINT_SWI_SIZE -
+             RISCV_ACLINT_DEFAULT_MTIME,
+        0x0, addr + RISCV_ACLINT_DEFAULT_MTIMECMP,
+        0x0, RISCV_ACLINT_DEFAULT_MTIME);
+    qemu_fdt_setprop(mc->fdt, name, "interrupts-extended",
+        aclint_mtimer_cells, aclint_cells_size);
+    riscv_socket_fdt_write_id(mc, mc->fdt, name, socket);
+    g_free(name);
+
+    addr =3D memmap[VIRT_ACLINT_SSWI].base +
+        (memmap[VIRT_ACLINT_SSWI].size * socket);
+    name =3D g_strdup_printf("/soc/sswi@%lx", addr);
+    qemu_fdt_add_subnode(mc->fdt, name);
+    qemu_fdt_setprop_string(mc->fdt, name, "compatible", "riscv,aclint-s=
swi");
+    qemu_fdt_setprop_cells(mc->fdt, name, "reg",
+        0x0, addr, 0x0, memmap[VIRT_ACLINT_SSWI].size);
+    qemu_fdt_setprop(mc->fdt, name, "interrupts-extended",
+        aclint_sswi_cells, aclint_cells_size);
+    qemu_fdt_setprop(mc->fdt, name, "interrupt-controller", NULL, 0);
+    qemu_fdt_setprop_cell(mc->fdt, name, "#interrupt-cells", 0);
+    riscv_socket_fdt_write_id(mc, mc->fdt, name, socket);
+    g_free(name);
+
+    g_free(aclint_mswi_cells);
+    g_free(aclint_mtimer_cells);
+    g_free(aclint_sswi_cells);
+}
+
 static void create_fdt_socket_plic(RISCVVirtState *s,
                                    const MemMapEntry *memmap, int socket=
,
                                    uint32_t *phandle, uint32_t *intc_pha=
ndles,
@@ -359,7 +436,11 @@ static void create_fdt_sockets(RISCVVirtState *s, co=
nst MemMapEntry *memmap,
=20
         create_fdt_socket_memory(s, memmap, socket);
=20
-        create_fdt_socket_clint(s, memmap, socket, intc_phandles);
+        if (s->have_aclint) {
+            create_fdt_socket_aclint(s, memmap, socket, intc_phandles);
+        } else {
+            create_fdt_socket_clint(s, memmap, socket, intc_phandles);
+        }
=20
         create_fdt_socket_plic(s, memmap, socket, phandle,
             intc_phandles, xplic_phandles);
@@ -750,6 +831,14 @@ static void virt_machine_init(MachineState *machine)
             RISCV_ACLINT_DEFAULT_MTIMECMP, RISCV_ACLINT_DEFAULT_MTIME,
             RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ, true);
=20
+        /* Per-socket ACLINT SSWI */
+        if (s->have_aclint) {
+            riscv_aclint_swi_create(
+                memmap[VIRT_ACLINT_SSWI].base +
+                    i * memmap[VIRT_ACLINT_SSWI].size,
+                base_hartid, hart_count, true);
+        }
+
         /* Per-socket PLIC hart topology configuration string */
         plic_hart_config =3D plic_hart_config_string(hart_count);
=20
@@ -914,6 +1003,22 @@ static void virt_machine_instance_init(Object *obj)
 {
 }
=20
+static bool virt_get_aclint(Object *obj, Error **errp)
+{
+    MachineState *ms =3D MACHINE(obj);
+    RISCVVirtState *s =3D RISCV_VIRT_MACHINE(ms);
+
+    return s->have_aclint;
+}
+
+static void virt_set_aclint(Object *obj, bool value, Error **errp)
+{
+    MachineState *ms =3D MACHINE(obj);
+    RISCVVirtState *s =3D RISCV_VIRT_MACHINE(ms);
+
+    s->have_aclint =3D value;
+}
+
 static void virt_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc =3D MACHINE_CLASS(oc);
@@ -929,6 +1034,12 @@ static void virt_machine_class_init(ObjectClass *oc=
, void *data)
     mc->numa_mem_supported =3D true;
=20
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_RAMFB_DEVICE);
+
+    object_class_property_add_bool(oc, "aclint", virt_get_aclint,
+                                   virt_set_aclint);
+    object_class_property_set_description(oc, "aclint",
+                                          "Set on/off to enable/disable =
"
+                                          "emulating ACLINT devices");
 }
=20
 static const TypeInfo virt_machine_typeinfo =3D {
--=20
2.31.1


