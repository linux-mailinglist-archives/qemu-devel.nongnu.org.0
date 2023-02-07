Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FAFE68D060
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 08:16:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPI7c-0006d8-P1; Tue, 07 Feb 2023 02:10:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=395dd5341=alistair.francis@opensource.wdc.com>)
 id 1pPI7Z-0006bW-Po
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 02:10:29 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=395dd5341=alistair.francis@opensource.wdc.com>)
 id 1pPI7I-0008RS-Fm
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 02:10:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1675753812; x=1707289812;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4R8h0FWTKQEXhcdkzJ+enMcpwRP8f2lE+7OAZN0vETk=;
 b=azKP111mghaD+pD+MzfonTzqxyplETdKFp4DvgmL9inV/4Sdm7/PEiER
 +mE83eC0sWhhkWNS59HlpJ8PayA5blq5Bu4+95FYJJNlsq6t0LNDRx+OW
 kEOPOOt5dfS0DnEzCZoCmoLmMD1lF5xH8ry/PjxNEg4I0nclc9x+76c+c
 yxXLJ9/xbNVra7zgGmmLWYcuxf/QRCuUviPg27ytix4OMqRx5Wir1B3es
 GHylH9lzPNVS0j9Oudtspf86h2eaJX4k76wtTCv0x+I0E5T3Q1lieL8Q/
 melgqXkF96P2LZPk4Cm5mwu79rzyj1IzB65mC0kc+h3rwjeippnbvw8rM w==;
X-IronPort-AV: E=Sophos;i="5.97,278,1669046400"; d="scan'208";a="227657485"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Feb 2023 15:10:08 +0800
IronPort-SDR: kT0WXg6f7mBT1QFjHmRywyGs9fDl0THBlrlIUBJKa959t6+66m3wWKtcmG6v4Utc4N0T9Ebxhw
 NRaoN8x/jpHevuIc7JcEHPZKwFlOh64Nn44hPYHvWJkePE2W2eXgzhs1TIzg8OKUFr+RN9s5BF
 iaEWEDPqb/l93jb7yUBlqCqFh89ZaVJbAIYek37+3oD5epDjmQhm3V6PfvOzAtkjkXQevR1p33
 HQ7PS42MiNmDBfNcX5Yc5QFV7G4BkY/XnmlkWp1BeoMwcg4BNTtoXHbk1h+YRZxbX0/Gq/t7dc
 YJM=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Feb 2023 22:27:25 -0800
IronPort-SDR: BxyRpsV8v9905ofG35ces4CWlUgBaMxch0Zw46K6A+uV+MPSIgE7heA5VUq2Om5OdHcPmur24A
 28o4mMSew4eHXpI+BRaM1ncdVXEjIUHoqk2ZGhya8WDTMbchT60/M2BAA31aT3t6bDoB7Bkmqq
 4rqUuti5YaWBBg3dqyp7QuZtIRV16VXHUXKK+WjtLQW1ZIT3QCUqD4bLCbB614ZWGc4G1Iv/DG
 GvYoRusEA2btRSC9rguNDx41NbaMJpy+7XwRFz9oVirQglUy9an00qelLJHrQHr0cKCAFu6ki+
 VCc=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Feb 2023 23:10:08 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4P9vQm2skwz1RwqL
 for <qemu-devel@nongnu.org>; Mon,  6 Feb 2023 23:10:08 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1675753805; x=1678345806; bh=4R8h0FW
 TKQEXhcdkzJ+enMcpwRP8f2lE+7OAZN0vETk=; b=K3hDqZK0KHkgLoKAmlUwgkG
 IA4LkO8L6S5q2o8eecuoqltGVuuQUmaQZPREf4Rz/28yYFVt9CM3S2z1rak5OnGP
 HkomlMtTV7pfJUO191OdYl0BNo+FkJbV7Fse8aURPy50uN0RoKxY4sdtnj1pRYTE
 gg+lVvAKIFg7wIlzqm47PAATzY2KXjqBOCcrWtUDD/GzwLSVBtxiInEq/RVlRAzY
 1vWFXvVknRvPyD44/sBc69C9VZKNsb/rbwOpXGD+SLdXn2lJDaRSx2Bsi1Ek/4v/
 M8kMx7zE5/IdlyA1W4PbvYEG+PFbtB+/L/pm9qMBCdOy79th6Um5/XSGCxOqCog=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id RqwMeM7A3n6G for <qemu-devel@nongnu.org>;
 Mon,  6 Feb 2023 23:10:05 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.38])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4P9vQg5tVPz1RvLy;
 Mon,  6 Feb 2023 23:10:03 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 09/32] hw/riscv/virt.c: rename MachineState 'mc' pointers to
 'ms'
Date: Tue,  7 Feb 2023 17:09:20 +1000
Message-Id: <20230207070943.2558857-10-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207070943.2558857-1-alistair.francis@opensource.wdc.com>
References: <20230207070943.2558857-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=395dd5341=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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

We have a convention in other QEMU boards/archs to name MachineState
pointers as either 'machine' or 'ms'. MachineClass pointers are usually
called 'mc'.

The 'virt' RISC-V machine has a lot of instances where MachineState
pointers are named 'mc'. There is nothing wrong with that, but we gain
more compatibility with the rest of the QEMU code base, and easier
reviews, if we follow QEMU conventions.

Rename all 'mc' MachineState pointers to 'ms'. This is a very tedious
and mechanical patch that was produced by doing the following:

- find/replace all 'MachineState *mc' to 'MachineState *ms';
- find/replace all 'mc->fdt' to 'ms->fdt';
- find/replace all 'mc->smp.cpus' to 'ms->smp.cpus';
- replace any remaining occurrences of 'mc' that the compiler complained
about.

Suggested-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-Id: <20230124212234.412630-3-dbarboza@ventanamicro.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/virt.c | 434 ++++++++++++++++++++++++------------------------
 1 file changed, 217 insertions(+), 217 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 61fdb52090..e420254de2 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -227,7 +227,7 @@ static void create_fdt_socket_cpus(RISCVVirtState *s,=
 int socket,
 {
     int cpu;
     uint32_t cpu_phandle;
-    MachineState *mc =3D MACHINE(s);
+    MachineState *ms =3D MACHINE(s);
     char *name, *cpu_name, *core_name, *intc_name;
     bool is_32_bit =3D riscv_is_32bit(&s->soc[0]);
=20
@@ -236,40 +236,40 @@ static void create_fdt_socket_cpus(RISCVVirtState *=
s, int socket,
=20
         cpu_name =3D g_strdup_printf("/cpus/cpu@%d",
             s->soc[socket].hartid_base + cpu);
-        qemu_fdt_add_subnode(mc->fdt, cpu_name);
+        qemu_fdt_add_subnode(ms->fdt, cpu_name);
         if (riscv_feature(&s->soc[socket].harts[cpu].env,
                           RISCV_FEATURE_MMU)) {
-            qemu_fdt_setprop_string(mc->fdt, cpu_name, "mmu-type",
+            qemu_fdt_setprop_string(ms->fdt, cpu_name, "mmu-type",
                                     (is_32_bit) ? "riscv,sv32" : "riscv,=
sv48");
         } else {
-            qemu_fdt_setprop_string(mc->fdt, cpu_name, "mmu-type",
+            qemu_fdt_setprop_string(ms->fdt, cpu_name, "mmu-type",
                                     "riscv,none");
         }
         name =3D riscv_isa_string(&s->soc[socket].harts[cpu]);
-        qemu_fdt_setprop_string(mc->fdt, cpu_name, "riscv,isa", name);
+        qemu_fdt_setprop_string(ms->fdt, cpu_name, "riscv,isa", name);
         g_free(name);
-        qemu_fdt_setprop_string(mc->fdt, cpu_name, "compatible", "riscv"=
);
-        qemu_fdt_setprop_string(mc->fdt, cpu_name, "status", "okay");
-        qemu_fdt_setprop_cell(mc->fdt, cpu_name, "reg",
+        qemu_fdt_setprop_string(ms->fdt, cpu_name, "compatible", "riscv"=
);
+        qemu_fdt_setprop_string(ms->fdt, cpu_name, "status", "okay");
+        qemu_fdt_setprop_cell(ms->fdt, cpu_name, "reg",
             s->soc[socket].hartid_base + cpu);
-        qemu_fdt_setprop_string(mc->fdt, cpu_name, "device_type", "cpu")=
;
-        riscv_socket_fdt_write_id(mc, cpu_name, socket);
-        qemu_fdt_setprop_cell(mc->fdt, cpu_name, "phandle", cpu_phandle)=
;
+        qemu_fdt_setprop_string(ms->fdt, cpu_name, "device_type", "cpu")=
;
+        riscv_socket_fdt_write_id(ms, cpu_name, socket);
+        qemu_fdt_setprop_cell(ms->fdt, cpu_name, "phandle", cpu_phandle)=
;
=20
         intc_phandles[cpu] =3D (*phandle)++;
=20
         intc_name =3D g_strdup_printf("%s/interrupt-controller", cpu_nam=
e);
-        qemu_fdt_add_subnode(mc->fdt, intc_name);
-        qemu_fdt_setprop_cell(mc->fdt, intc_name, "phandle",
+        qemu_fdt_add_subnode(ms->fdt, intc_name);
+        qemu_fdt_setprop_cell(ms->fdt, intc_name, "phandle",
             intc_phandles[cpu]);
-        qemu_fdt_setprop_string(mc->fdt, intc_name, "compatible",
+        qemu_fdt_setprop_string(ms->fdt, intc_name, "compatible",
             "riscv,cpu-intc");
-        qemu_fdt_setprop(mc->fdt, intc_name, "interrupt-controller", NUL=
L, 0);
-        qemu_fdt_setprop_cell(mc->fdt, intc_name, "#interrupt-cells", 1)=
;
+        qemu_fdt_setprop(ms->fdt, intc_name, "interrupt-controller", NUL=
L, 0);
+        qemu_fdt_setprop_cell(ms->fdt, intc_name, "#interrupt-cells", 1)=
;
=20
         core_name =3D g_strdup_printf("%s/core%d", clust_name, cpu);
-        qemu_fdt_add_subnode(mc->fdt, core_name);
-        qemu_fdt_setprop_cell(mc->fdt, core_name, "cpu", cpu_phandle);
+        qemu_fdt_add_subnode(ms->fdt, core_name);
+        qemu_fdt_setprop_cell(ms->fdt, core_name, "cpu", cpu_phandle);
=20
         g_free(core_name);
         g_free(intc_name);
@@ -282,16 +282,16 @@ static void create_fdt_socket_memory(RISCVVirtState=
 *s,
 {
     char *mem_name;
     uint64_t addr, size;
-    MachineState *mc =3D MACHINE(s);
+    MachineState *ms =3D MACHINE(s);
=20
-    addr =3D memmap[VIRT_DRAM].base + riscv_socket_mem_offset(mc, socket=
);
-    size =3D riscv_socket_mem_size(mc, socket);
+    addr =3D memmap[VIRT_DRAM].base + riscv_socket_mem_offset(ms, socket=
);
+    size =3D riscv_socket_mem_size(ms, socket);
     mem_name =3D g_strdup_printf("/memory@%lx", (long)addr);
-    qemu_fdt_add_subnode(mc->fdt, mem_name);
-    qemu_fdt_setprop_cells(mc->fdt, mem_name, "reg",
+    qemu_fdt_add_subnode(ms->fdt, mem_name);
+    qemu_fdt_setprop_cells(ms->fdt, mem_name, "reg",
         addr >> 32, addr, size >> 32, size);
-    qemu_fdt_setprop_string(mc->fdt, mem_name, "device_type", "memory");
-    riscv_socket_fdt_write_id(mc, mem_name, socket);
+    qemu_fdt_setprop_string(ms->fdt, mem_name, "device_type", "memory");
+    riscv_socket_fdt_write_id(ms, mem_name, socket);
     g_free(mem_name);
 }
=20
@@ -303,7 +303,7 @@ static void create_fdt_socket_clint(RISCVVirtState *s=
,
     char *clint_name;
     uint32_t *clint_cells;
     unsigned long clint_addr;
-    MachineState *mc =3D MACHINE(s);
+    MachineState *ms =3D MACHINE(s);
     static const char * const clint_compat[2] =3D {
         "sifive,clint0", "riscv,clint0"
     };
@@ -319,15 +319,15 @@ static void create_fdt_socket_clint(RISCVVirtState =
*s,
=20
     clint_addr =3D memmap[VIRT_CLINT].base + (memmap[VIRT_CLINT].size * =
socket);
     clint_name =3D g_strdup_printf("/soc/clint@%lx", clint_addr);
-    qemu_fdt_add_subnode(mc->fdt, clint_name);
-    qemu_fdt_setprop_string_array(mc->fdt, clint_name, "compatible",
+    qemu_fdt_add_subnode(ms->fdt, clint_name);
+    qemu_fdt_setprop_string_array(ms->fdt, clint_name, "compatible",
                                   (char **)&clint_compat,
                                   ARRAY_SIZE(clint_compat));
-    qemu_fdt_setprop_cells(mc->fdt, clint_name, "reg",
+    qemu_fdt_setprop_cells(ms->fdt, clint_name, "reg",
         0x0, clint_addr, 0x0, memmap[VIRT_CLINT].size);
-    qemu_fdt_setprop(mc->fdt, clint_name, "interrupts-extended",
+    qemu_fdt_setprop(ms->fdt, clint_name, "interrupts-extended",
         clint_cells, s->soc[socket].num_harts * sizeof(uint32_t) * 4);
-    riscv_socket_fdt_write_id(mc, clint_name, socket);
+    riscv_socket_fdt_write_id(ms, clint_name, socket);
     g_free(clint_name);
=20
     g_free(clint_cells);
@@ -344,7 +344,7 @@ static void create_fdt_socket_aclint(RISCVVirtState *=
s,
     uint32_t *aclint_mswi_cells;
     uint32_t *aclint_sswi_cells;
     uint32_t *aclint_mtimer_cells;
-    MachineState *mc =3D MACHINE(s);
+    MachineState *ms =3D MACHINE(s);
=20
     aclint_mswi_cells =3D g_new0(uint32_t, s->soc[socket].num_harts * 2)=
;
     aclint_mtimer_cells =3D g_new0(uint32_t, s->soc[socket].num_harts * =
2);
@@ -363,16 +363,16 @@ static void create_fdt_socket_aclint(RISCVVirtState=
 *s,
     if (s->aia_type !=3D VIRT_AIA_TYPE_APLIC_IMSIC) {
         addr =3D memmap[VIRT_CLINT].base + (memmap[VIRT_CLINT].size * so=
cket);
         name =3D g_strdup_printf("/soc/mswi@%lx", addr);
-        qemu_fdt_add_subnode(mc->fdt, name);
-        qemu_fdt_setprop_string(mc->fdt, name, "compatible",
+        qemu_fdt_add_subnode(ms->fdt, name);
+        qemu_fdt_setprop_string(ms->fdt, name, "compatible",
             "riscv,aclint-mswi");
-        qemu_fdt_setprop_cells(mc->fdt, name, "reg",
+        qemu_fdt_setprop_cells(ms->fdt, name, "reg",
             0x0, addr, 0x0, RISCV_ACLINT_SWI_SIZE);
-        qemu_fdt_setprop(mc->fdt, name, "interrupts-extended",
+        qemu_fdt_setprop(ms->fdt, name, "interrupts-extended",
             aclint_mswi_cells, aclint_cells_size);
-        qemu_fdt_setprop(mc->fdt, name, "interrupt-controller", NULL, 0)=
;
-        qemu_fdt_setprop_cell(mc->fdt, name, "#interrupt-cells", 0);
-        riscv_socket_fdt_write_id(mc, name, socket);
+        qemu_fdt_setprop(ms->fdt, name, "interrupt-controller", NULL, 0)=
;
+        qemu_fdt_setprop_cell(ms->fdt, name, "#interrupt-cells", 0);
+        riscv_socket_fdt_write_id(ms, name, socket);
         g_free(name);
     }
=20
@@ -386,33 +386,33 @@ static void create_fdt_socket_aclint(RISCVVirtState=
 *s,
         size =3D memmap[VIRT_CLINT].size - RISCV_ACLINT_SWI_SIZE;
     }
     name =3D g_strdup_printf("/soc/mtimer@%lx", addr);
-    qemu_fdt_add_subnode(mc->fdt, name);
-    qemu_fdt_setprop_string(mc->fdt, name, "compatible",
+    qemu_fdt_add_subnode(ms->fdt, name);
+    qemu_fdt_setprop_string(ms->fdt, name, "compatible",
         "riscv,aclint-mtimer");
-    qemu_fdt_setprop_cells(mc->fdt, name, "reg",
+    qemu_fdt_setprop_cells(ms->fdt, name, "reg",
         0x0, addr + RISCV_ACLINT_DEFAULT_MTIME,
         0x0, size - RISCV_ACLINT_DEFAULT_MTIME,
         0x0, addr + RISCV_ACLINT_DEFAULT_MTIMECMP,
         0x0, RISCV_ACLINT_DEFAULT_MTIME);
-    qemu_fdt_setprop(mc->fdt, name, "interrupts-extended",
+    qemu_fdt_setprop(ms->fdt, name, "interrupts-extended",
         aclint_mtimer_cells, aclint_cells_size);
-    riscv_socket_fdt_write_id(mc, name, socket);
+    riscv_socket_fdt_write_id(ms, name, socket);
     g_free(name);
=20
     if (s->aia_type !=3D VIRT_AIA_TYPE_APLIC_IMSIC) {
         addr =3D memmap[VIRT_ACLINT_SSWI].base +
             (memmap[VIRT_ACLINT_SSWI].size * socket);
         name =3D g_strdup_printf("/soc/sswi@%lx", addr);
-        qemu_fdt_add_subnode(mc->fdt, name);
-        qemu_fdt_setprop_string(mc->fdt, name, "compatible",
+        qemu_fdt_add_subnode(ms->fdt, name);
+        qemu_fdt_setprop_string(ms->fdt, name, "compatible",
             "riscv,aclint-sswi");
-        qemu_fdt_setprop_cells(mc->fdt, name, "reg",
+        qemu_fdt_setprop_cells(ms->fdt, name, "reg",
             0x0, addr, 0x0, memmap[VIRT_ACLINT_SSWI].size);
-        qemu_fdt_setprop(mc->fdt, name, "interrupts-extended",
+        qemu_fdt_setprop(ms->fdt, name, "interrupts-extended",
             aclint_sswi_cells, aclint_cells_size);
-        qemu_fdt_setprop(mc->fdt, name, "interrupt-controller", NULL, 0)=
;
-        qemu_fdt_setprop_cell(mc->fdt, name, "#interrupt-cells", 0);
-        riscv_socket_fdt_write_id(mc, name, socket);
+        qemu_fdt_setprop(ms->fdt, name, "interrupt-controller", NULL, 0)=
;
+        qemu_fdt_setprop_cell(ms->fdt, name, "#interrupt-cells", 0);
+        riscv_socket_fdt_write_id(ms, name, socket);
         g_free(name);
     }
=20
@@ -430,7 +430,7 @@ static void create_fdt_socket_plic(RISCVVirtState *s,
     char *plic_name;
     uint32_t *plic_cells;
     unsigned long plic_addr;
-    MachineState *mc =3D MACHINE(s);
+    MachineState *ms =3D MACHINE(s);
     static const char * const plic_compat[2] =3D {
         "sifive,plic-1.0.0", "riscv,plic0"
     };
@@ -456,27 +456,27 @@ static void create_fdt_socket_plic(RISCVVirtState *=
s,
     plic_phandles[socket] =3D (*phandle)++;
     plic_addr =3D memmap[VIRT_PLIC].base + (memmap[VIRT_PLIC].size * soc=
ket);
     plic_name =3D g_strdup_printf("/soc/plic@%lx", plic_addr);
-    qemu_fdt_add_subnode(mc->fdt, plic_name);
-    qemu_fdt_setprop_cell(mc->fdt, plic_name,
+    qemu_fdt_add_subnode(ms->fdt, plic_name);
+    qemu_fdt_setprop_cell(ms->fdt, plic_name,
         "#interrupt-cells", FDT_PLIC_INT_CELLS);
-    qemu_fdt_setprop_cell(mc->fdt, plic_name,
+    qemu_fdt_setprop_cell(ms->fdt, plic_name,
         "#address-cells", FDT_PLIC_ADDR_CELLS);
-    qemu_fdt_setprop_string_array(mc->fdt, plic_name, "compatible",
+    qemu_fdt_setprop_string_array(ms->fdt, plic_name, "compatible",
                                   (char **)&plic_compat,
                                   ARRAY_SIZE(plic_compat));
-    qemu_fdt_setprop(mc->fdt, plic_name, "interrupt-controller", NULL, 0=
);
-    qemu_fdt_setprop(mc->fdt, plic_name, "interrupts-extended",
+    qemu_fdt_setprop(ms->fdt, plic_name, "interrupt-controller", NULL, 0=
);
+    qemu_fdt_setprop(ms->fdt, plic_name, "interrupts-extended",
         plic_cells, s->soc[socket].num_harts * sizeof(uint32_t) * 4);
-    qemu_fdt_setprop_cells(mc->fdt, plic_name, "reg",
+    qemu_fdt_setprop_cells(ms->fdt, plic_name, "reg",
         0x0, plic_addr, 0x0, memmap[VIRT_PLIC].size);
-    qemu_fdt_setprop_cell(mc->fdt, plic_name, "riscv,ndev",
+    qemu_fdt_setprop_cell(ms->fdt, plic_name, "riscv,ndev",
                           VIRT_IRQCHIP_NUM_SOURCES - 1);
-    riscv_socket_fdt_write_id(mc, plic_name, socket);
-    qemu_fdt_setprop_cell(mc->fdt, plic_name, "phandle",
+    riscv_socket_fdt_write_id(ms, plic_name, socket);
+    qemu_fdt_setprop_cell(ms->fdt, plic_name, "phandle",
         plic_phandles[socket]);
=20
     if (!socket) {
-        platform_bus_add_all_fdt_nodes(mc->fdt, plic_name,
+        platform_bus_add_all_fdt_nodes(ms->fdt, plic_name,
                                        memmap[VIRT_PLATFORM_BUS].base,
                                        memmap[VIRT_PLATFORM_BUS].size,
                                        VIRT_PLATFORM_BUS_IRQ);
@@ -504,18 +504,18 @@ static void create_fdt_imsic(RISCVVirtState *s, con=
st MemMapEntry *memmap,
 {
     int cpu, socket;
     char *imsic_name;
-    MachineState *mc =3D MACHINE(s);
-    int socket_count =3D riscv_socket_count(mc);
+    MachineState *ms =3D MACHINE(s);
+    int socket_count =3D riscv_socket_count(ms);
     uint32_t imsic_max_hart_per_socket, imsic_guest_bits;
     uint32_t *imsic_cells, *imsic_regs, imsic_addr, imsic_size;
=20
     *msi_m_phandle =3D (*phandle)++;
     *msi_s_phandle =3D (*phandle)++;
-    imsic_cells =3D g_new0(uint32_t, mc->smp.cpus * 2);
+    imsic_cells =3D g_new0(uint32_t, ms->smp.cpus * 2);
     imsic_regs =3D g_new0(uint32_t, socket_count * 4);
=20
     /* M-level IMSIC node */
-    for (cpu =3D 0; cpu < mc->smp.cpus; cpu++) {
+    for (cpu =3D 0; cpu < ms->smp.cpus; cpu++) {
         imsic_cells[cpu * 2 + 0] =3D cpu_to_be32(intc_phandles[cpu]);
         imsic_cells[cpu * 2 + 1] =3D cpu_to_be32(IRQ_M_EXT);
     }
@@ -534,35 +534,35 @@ static void create_fdt_imsic(RISCVVirtState *s, con=
st MemMapEntry *memmap,
     }
     imsic_name =3D g_strdup_printf("/soc/imsics@%lx",
         (unsigned long)memmap[VIRT_IMSIC_M].base);
-    qemu_fdt_add_subnode(mc->fdt, imsic_name);
-    qemu_fdt_setprop_string(mc->fdt, imsic_name, "compatible",
+    qemu_fdt_add_subnode(ms->fdt, imsic_name);
+    qemu_fdt_setprop_string(ms->fdt, imsic_name, "compatible",
         "riscv,imsics");
-    qemu_fdt_setprop_cell(mc->fdt, imsic_name, "#interrupt-cells",
+    qemu_fdt_setprop_cell(ms->fdt, imsic_name, "#interrupt-cells",
         FDT_IMSIC_INT_CELLS);
-    qemu_fdt_setprop(mc->fdt, imsic_name, "interrupt-controller",
+    qemu_fdt_setprop(ms->fdt, imsic_name, "interrupt-controller",
         NULL, 0);
-    qemu_fdt_setprop(mc->fdt, imsic_name, "msi-controller",
+    qemu_fdt_setprop(ms->fdt, imsic_name, "msi-controller",
         NULL, 0);
-    qemu_fdt_setprop(mc->fdt, imsic_name, "interrupts-extended",
-        imsic_cells, mc->smp.cpus * sizeof(uint32_t) * 2);
-    qemu_fdt_setprop(mc->fdt, imsic_name, "reg", imsic_regs,
+    qemu_fdt_setprop(ms->fdt, imsic_name, "interrupts-extended",
+        imsic_cells, ms->smp.cpus * sizeof(uint32_t) * 2);
+    qemu_fdt_setprop(ms->fdt, imsic_name, "reg", imsic_regs,
         socket_count * sizeof(uint32_t) * 4);
-    qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,num-ids",
+    qemu_fdt_setprop_cell(ms->fdt, imsic_name, "riscv,num-ids",
         VIRT_IRQCHIP_NUM_MSIS);
     if (socket_count > 1) {
-        qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,hart-index-bit=
s",
+        qemu_fdt_setprop_cell(ms->fdt, imsic_name, "riscv,hart-index-bit=
s",
             imsic_num_bits(imsic_max_hart_per_socket));
-        qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,group-index-bi=
ts",
+        qemu_fdt_setprop_cell(ms->fdt, imsic_name, "riscv,group-index-bi=
ts",
             imsic_num_bits(socket_count));
-        qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,group-index-sh=
ift",
+        qemu_fdt_setprop_cell(ms->fdt, imsic_name, "riscv,group-index-sh=
ift",
             IMSIC_MMIO_GROUP_MIN_SHIFT);
     }
-    qemu_fdt_setprop_cell(mc->fdt, imsic_name, "phandle", *msi_m_phandle=
);
+    qemu_fdt_setprop_cell(ms->fdt, imsic_name, "phandle", *msi_m_phandle=
);
=20
     g_free(imsic_name);
=20
     /* S-level IMSIC node */
-    for (cpu =3D 0; cpu < mc->smp.cpus; cpu++) {
+    for (cpu =3D 0; cpu < ms->smp.cpus; cpu++) {
         imsic_cells[cpu * 2 + 0] =3D cpu_to_be32(intc_phandles[cpu]);
         imsic_cells[cpu * 2 + 1] =3D cpu_to_be32(IRQ_S_EXT);
     }
@@ -583,34 +583,34 @@ static void create_fdt_imsic(RISCVVirtState *s, con=
st MemMapEntry *memmap,
     }
     imsic_name =3D g_strdup_printf("/soc/imsics@%lx",
         (unsigned long)memmap[VIRT_IMSIC_S].base);
-    qemu_fdt_add_subnode(mc->fdt, imsic_name);
-    qemu_fdt_setprop_string(mc->fdt, imsic_name, "compatible",
+    qemu_fdt_add_subnode(ms->fdt, imsic_name);
+    qemu_fdt_setprop_string(ms->fdt, imsic_name, "compatible",
         "riscv,imsics");
-    qemu_fdt_setprop_cell(mc->fdt, imsic_name, "#interrupt-cells",
+    qemu_fdt_setprop_cell(ms->fdt, imsic_name, "#interrupt-cells",
         FDT_IMSIC_INT_CELLS);
-    qemu_fdt_setprop(mc->fdt, imsic_name, "interrupt-controller",
+    qemu_fdt_setprop(ms->fdt, imsic_name, "interrupt-controller",
         NULL, 0);
-    qemu_fdt_setprop(mc->fdt, imsic_name, "msi-controller",
+    qemu_fdt_setprop(ms->fdt, imsic_name, "msi-controller",
         NULL, 0);
-    qemu_fdt_setprop(mc->fdt, imsic_name, "interrupts-extended",
-        imsic_cells, mc->smp.cpus * sizeof(uint32_t) * 2);
-    qemu_fdt_setprop(mc->fdt, imsic_name, "reg", imsic_regs,
+    qemu_fdt_setprop(ms->fdt, imsic_name, "interrupts-extended",
+        imsic_cells, ms->smp.cpus * sizeof(uint32_t) * 2);
+    qemu_fdt_setprop(ms->fdt, imsic_name, "reg", imsic_regs,
         socket_count * sizeof(uint32_t) * 4);
-    qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,num-ids",
+    qemu_fdt_setprop_cell(ms->fdt, imsic_name, "riscv,num-ids",
         VIRT_IRQCHIP_NUM_MSIS);
     if (imsic_guest_bits) {
-        qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,guest-index-bi=
ts",
+        qemu_fdt_setprop_cell(ms->fdt, imsic_name, "riscv,guest-index-bi=
ts",
             imsic_guest_bits);
     }
     if (socket_count > 1) {
-        qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,hart-index-bit=
s",
+        qemu_fdt_setprop_cell(ms->fdt, imsic_name, "riscv,hart-index-bit=
s",
             imsic_num_bits(imsic_max_hart_per_socket));
-        qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,group-index-bi=
ts",
+        qemu_fdt_setprop_cell(ms->fdt, imsic_name, "riscv,group-index-bi=
ts",
             imsic_num_bits(socket_count));
-        qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,group-index-sh=
ift",
+        qemu_fdt_setprop_cell(ms->fdt, imsic_name, "riscv,group-index-sh=
ift",
             IMSIC_MMIO_GROUP_MIN_SHIFT);
     }
-    qemu_fdt_setprop_cell(mc->fdt, imsic_name, "phandle", *msi_s_phandle=
);
+    qemu_fdt_setprop_cell(ms->fdt, imsic_name, "phandle", *msi_s_phandle=
);
     g_free(imsic_name);
=20
     g_free(imsic_regs);
@@ -629,7 +629,7 @@ static void create_fdt_socket_aplic(RISCVVirtState *s=
,
     char *aplic_name;
     uint32_t *aplic_cells;
     unsigned long aplic_addr;
-    MachineState *mc =3D MACHINE(s);
+    MachineState *ms =3D MACHINE(s);
     uint32_t aplic_m_phandle, aplic_s_phandle;
=20
     aplic_m_phandle =3D (*phandle)++;
@@ -644,28 +644,28 @@ static void create_fdt_socket_aplic(RISCVVirtState =
*s,
     aplic_addr =3D memmap[VIRT_APLIC_M].base +
                  (memmap[VIRT_APLIC_M].size * socket);
     aplic_name =3D g_strdup_printf("/soc/aplic@%lx", aplic_addr);
-    qemu_fdt_add_subnode(mc->fdt, aplic_name);
-    qemu_fdt_setprop_string(mc->fdt, aplic_name, "compatible", "riscv,ap=
lic");
-    qemu_fdt_setprop_cell(mc->fdt, aplic_name,
+    qemu_fdt_add_subnode(ms->fdt, aplic_name);
+    qemu_fdt_setprop_string(ms->fdt, aplic_name, "compatible", "riscv,ap=
lic");
+    qemu_fdt_setprop_cell(ms->fdt, aplic_name,
         "#interrupt-cells", FDT_APLIC_INT_CELLS);
-    qemu_fdt_setprop(mc->fdt, aplic_name, "interrupt-controller", NULL, =
0);
+    qemu_fdt_setprop(ms->fdt, aplic_name, "interrupt-controller", NULL, =
0);
     if (s->aia_type =3D=3D VIRT_AIA_TYPE_APLIC) {
-        qemu_fdt_setprop(mc->fdt, aplic_name, "interrupts-extended",
+        qemu_fdt_setprop(ms->fdt, aplic_name, "interrupts-extended",
             aplic_cells, s->soc[socket].num_harts * sizeof(uint32_t) * 2=
);
     } else {
-        qemu_fdt_setprop_cell(mc->fdt, aplic_name, "msi-parent",
+        qemu_fdt_setprop_cell(ms->fdt, aplic_name, "msi-parent",
             msi_m_phandle);
     }
-    qemu_fdt_setprop_cells(mc->fdt, aplic_name, "reg",
+    qemu_fdt_setprop_cells(ms->fdt, aplic_name, "reg",
         0x0, aplic_addr, 0x0, memmap[VIRT_APLIC_M].size);
-    qemu_fdt_setprop_cell(mc->fdt, aplic_name, "riscv,num-sources",
+    qemu_fdt_setprop_cell(ms->fdt, aplic_name, "riscv,num-sources",
         VIRT_IRQCHIP_NUM_SOURCES);
-    qemu_fdt_setprop_cell(mc->fdt, aplic_name, "riscv,children",
+    qemu_fdt_setprop_cell(ms->fdt, aplic_name, "riscv,children",
         aplic_s_phandle);
-    qemu_fdt_setprop_cells(mc->fdt, aplic_name, "riscv,delegate",
+    qemu_fdt_setprop_cells(ms->fdt, aplic_name, "riscv,delegate",
         aplic_s_phandle, 0x1, VIRT_IRQCHIP_NUM_SOURCES);
-    riscv_socket_fdt_write_id(mc, aplic_name, socket);
-    qemu_fdt_setprop_cell(mc->fdt, aplic_name, "phandle", aplic_m_phandl=
e);
+    riscv_socket_fdt_write_id(ms, aplic_name, socket);
+    qemu_fdt_setprop_cell(ms->fdt, aplic_name, "phandle", aplic_m_phandl=
e);
     g_free(aplic_name);
=20
     /* S-level APLIC node */
@@ -676,27 +676,27 @@ static void create_fdt_socket_aplic(RISCVVirtState =
*s,
     aplic_addr =3D memmap[VIRT_APLIC_S].base +
                  (memmap[VIRT_APLIC_S].size * socket);
     aplic_name =3D g_strdup_printf("/soc/aplic@%lx", aplic_addr);
-    qemu_fdt_add_subnode(mc->fdt, aplic_name);
-    qemu_fdt_setprop_string(mc->fdt, aplic_name, "compatible", "riscv,ap=
lic");
-    qemu_fdt_setprop_cell(mc->fdt, aplic_name,
+    qemu_fdt_add_subnode(ms->fdt, aplic_name);
+    qemu_fdt_setprop_string(ms->fdt, aplic_name, "compatible", "riscv,ap=
lic");
+    qemu_fdt_setprop_cell(ms->fdt, aplic_name,
         "#interrupt-cells", FDT_APLIC_INT_CELLS);
-    qemu_fdt_setprop(mc->fdt, aplic_name, "interrupt-controller", NULL, =
0);
+    qemu_fdt_setprop(ms->fdt, aplic_name, "interrupt-controller", NULL, =
0);
     if (s->aia_type =3D=3D VIRT_AIA_TYPE_APLIC) {
-        qemu_fdt_setprop(mc->fdt, aplic_name, "interrupts-extended",
+        qemu_fdt_setprop(ms->fdt, aplic_name, "interrupts-extended",
             aplic_cells, s->soc[socket].num_harts * sizeof(uint32_t) * 2=
);
     } else {
-        qemu_fdt_setprop_cell(mc->fdt, aplic_name, "msi-parent",
+        qemu_fdt_setprop_cell(ms->fdt, aplic_name, "msi-parent",
             msi_s_phandle);
     }
-    qemu_fdt_setprop_cells(mc->fdt, aplic_name, "reg",
+    qemu_fdt_setprop_cells(ms->fdt, aplic_name, "reg",
         0x0, aplic_addr, 0x0, memmap[VIRT_APLIC_S].size);
-    qemu_fdt_setprop_cell(mc->fdt, aplic_name, "riscv,num-sources",
+    qemu_fdt_setprop_cell(ms->fdt, aplic_name, "riscv,num-sources",
         VIRT_IRQCHIP_NUM_SOURCES);
-    riscv_socket_fdt_write_id(mc, aplic_name, socket);
-    qemu_fdt_setprop_cell(mc->fdt, aplic_name, "phandle", aplic_s_phandl=
e);
+    riscv_socket_fdt_write_id(ms, aplic_name, socket);
+    qemu_fdt_setprop_cell(ms->fdt, aplic_name, "phandle", aplic_s_phandl=
e);
=20
     if (!socket) {
-        platform_bus_add_all_fdt_nodes(mc->fdt, aplic_name,
+        platform_bus_add_all_fdt_nodes(ms->fdt, aplic_name,
                                        memmap[VIRT_PLATFORM_BUS].base,
                                        memmap[VIRT_PLATFORM_BUS].size,
                                        VIRT_PLATFORM_BUS_IRQ);
@@ -711,13 +711,13 @@ static void create_fdt_socket_aplic(RISCVVirtState =
*s,
 static void create_fdt_pmu(RISCVVirtState *s)
 {
     char *pmu_name;
-    MachineState *mc =3D MACHINE(s);
+    MachineState *ms =3D MACHINE(s);
     RISCVCPU hart =3D s->soc[0].harts[0];
=20
     pmu_name =3D g_strdup_printf("/soc/pmu");
-    qemu_fdt_add_subnode(mc->fdt, pmu_name);
-    qemu_fdt_setprop_string(mc->fdt, pmu_name, "compatible", "riscv,pmu"=
);
-    riscv_pmu_generate_fdt_node(mc->fdt, hart.cfg.pmu_num, pmu_name);
+    qemu_fdt_add_subnode(ms->fdt, pmu_name);
+    qemu_fdt_setprop_string(ms->fdt, pmu_name, "compatible", "riscv,pmu"=
);
+    riscv_pmu_generate_fdt_node(ms->fdt, hart.cfg.pmu_num, pmu_name);
=20
     g_free(pmu_name);
 }
@@ -731,26 +731,26 @@ static void create_fdt_sockets(RISCVVirtState *s, c=
onst MemMapEntry *memmap,
 {
     char *clust_name;
     int socket, phandle_pos;
-    MachineState *mc =3D MACHINE(s);
+    MachineState *ms =3D MACHINE(s);
     uint32_t msi_m_phandle =3D 0, msi_s_phandle =3D 0;
     uint32_t *intc_phandles, xplic_phandles[MAX_NODES];
-    int socket_count =3D riscv_socket_count(mc);
+    int socket_count =3D riscv_socket_count(ms);
=20
-    qemu_fdt_add_subnode(mc->fdt, "/cpus");
-    qemu_fdt_setprop_cell(mc->fdt, "/cpus", "timebase-frequency",
+    qemu_fdt_add_subnode(ms->fdt, "/cpus");
+    qemu_fdt_setprop_cell(ms->fdt, "/cpus", "timebase-frequency",
                           RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ);
-    qemu_fdt_setprop_cell(mc->fdt, "/cpus", "#size-cells", 0x0);
-    qemu_fdt_setprop_cell(mc->fdt, "/cpus", "#address-cells", 0x1);
-    qemu_fdt_add_subnode(mc->fdt, "/cpus/cpu-map");
+    qemu_fdt_setprop_cell(ms->fdt, "/cpus", "#size-cells", 0x0);
+    qemu_fdt_setprop_cell(ms->fdt, "/cpus", "#address-cells", 0x1);
+    qemu_fdt_add_subnode(ms->fdt, "/cpus/cpu-map");
=20
-    intc_phandles =3D g_new0(uint32_t, mc->smp.cpus);
+    intc_phandles =3D g_new0(uint32_t, ms->smp.cpus);
=20
-    phandle_pos =3D mc->smp.cpus;
+    phandle_pos =3D ms->smp.cpus;
     for (socket =3D (socket_count - 1); socket >=3D 0; socket--) {
         phandle_pos -=3D s->soc[socket].num_harts;
=20
         clust_name =3D g_strdup_printf("/cpus/cpu-map/cluster%d", socket=
);
-        qemu_fdt_add_subnode(mc->fdt, clust_name);
+        qemu_fdt_add_subnode(ms->fdt, clust_name);
=20
         create_fdt_socket_cpus(s, socket, clust_name, phandle,
                                &intc_phandles[phandle_pos]);
@@ -776,7 +776,7 @@ static void create_fdt_sockets(RISCVVirtState *s, con=
st MemMapEntry *memmap,
         *msi_pcie_phandle =3D msi_s_phandle;
     }
=20
-    phandle_pos =3D mc->smp.cpus;
+    phandle_pos =3D ms->smp.cpus;
     for (socket =3D (socket_count - 1); socket >=3D 0; socket--) {
         phandle_pos -=3D s->soc[socket].num_harts;
=20
@@ -807,7 +807,7 @@ static void create_fdt_sockets(RISCVVirtState *s, con=
st MemMapEntry *memmap,
         }
     }
=20
-    riscv_socket_fdt_write_distance_matrix(mc);
+    riscv_socket_fdt_write_distance_matrix(ms);
 }
=20
 static void create_fdt_virtio(RISCVVirtState *s, const MemMapEntry *memm=
ap,
@@ -815,23 +815,23 @@ static void create_fdt_virtio(RISCVVirtState *s, co=
nst MemMapEntry *memmap,
 {
     int i;
     char *name;
-    MachineState *mc =3D MACHINE(s);
+    MachineState *ms =3D MACHINE(s);
=20
     for (i =3D 0; i < VIRTIO_COUNT; i++) {
         name =3D g_strdup_printf("/soc/virtio_mmio@%lx",
             (long)(memmap[VIRT_VIRTIO].base + i * memmap[VIRT_VIRTIO].si=
ze));
-        qemu_fdt_add_subnode(mc->fdt, name);
-        qemu_fdt_setprop_string(mc->fdt, name, "compatible", "virtio,mmi=
o");
-        qemu_fdt_setprop_cells(mc->fdt, name, "reg",
+        qemu_fdt_add_subnode(ms->fdt, name);
+        qemu_fdt_setprop_string(ms->fdt, name, "compatible", "virtio,mmi=
o");
+        qemu_fdt_setprop_cells(ms->fdt, name, "reg",
             0x0, memmap[VIRT_VIRTIO].base + i * memmap[VIRT_VIRTIO].size=
,
             0x0, memmap[VIRT_VIRTIO].size);
-        qemu_fdt_setprop_cell(mc->fdt, name, "interrupt-parent",
+        qemu_fdt_setprop_cell(ms->fdt, name, "interrupt-parent",
             irq_virtio_phandle);
         if (s->aia_type =3D=3D VIRT_AIA_TYPE_NONE) {
-            qemu_fdt_setprop_cell(mc->fdt, name, "interrupts",
+            qemu_fdt_setprop_cell(ms->fdt, name, "interrupts",
                                   VIRTIO_IRQ + i);
         } else {
-            qemu_fdt_setprop_cells(mc->fdt, name, "interrupts",
+            qemu_fdt_setprop_cells(ms->fdt, name, "interrupts",
                                    VIRTIO_IRQ + i, 0x4);
         }
         g_free(name);
@@ -843,29 +843,29 @@ static void create_fdt_pcie(RISCVVirtState *s, cons=
t MemMapEntry *memmap,
                             uint32_t msi_pcie_phandle)
 {
     char *name;
-    MachineState *mc =3D MACHINE(s);
+    MachineState *ms =3D MACHINE(s);
=20
     name =3D g_strdup_printf("/soc/pci@%lx",
         (long) memmap[VIRT_PCIE_ECAM].base);
-    qemu_fdt_add_subnode(mc->fdt, name);
-    qemu_fdt_setprop_cell(mc->fdt, name, "#address-cells",
+    qemu_fdt_add_subnode(ms->fdt, name);
+    qemu_fdt_setprop_cell(ms->fdt, name, "#address-cells",
         FDT_PCI_ADDR_CELLS);
-    qemu_fdt_setprop_cell(mc->fdt, name, "#interrupt-cells",
+    qemu_fdt_setprop_cell(ms->fdt, name, "#interrupt-cells",
         FDT_PCI_INT_CELLS);
-    qemu_fdt_setprop_cell(mc->fdt, name, "#size-cells", 0x2);
-    qemu_fdt_setprop_string(mc->fdt, name, "compatible",
+    qemu_fdt_setprop_cell(ms->fdt, name, "#size-cells", 0x2);
+    qemu_fdt_setprop_string(ms->fdt, name, "compatible",
         "pci-host-ecam-generic");
-    qemu_fdt_setprop_string(mc->fdt, name, "device_type", "pci");
-    qemu_fdt_setprop_cell(mc->fdt, name, "linux,pci-domain", 0);
-    qemu_fdt_setprop_cells(mc->fdt, name, "bus-range", 0,
+    qemu_fdt_setprop_string(ms->fdt, name, "device_type", "pci");
+    qemu_fdt_setprop_cell(ms->fdt, name, "linux,pci-domain", 0);
+    qemu_fdt_setprop_cells(ms->fdt, name, "bus-range", 0,
         memmap[VIRT_PCIE_ECAM].size / PCIE_MMCFG_SIZE_MIN - 1);
-    qemu_fdt_setprop(mc->fdt, name, "dma-coherent", NULL, 0);
+    qemu_fdt_setprop(ms->fdt, name, "dma-coherent", NULL, 0);
     if (s->aia_type =3D=3D VIRT_AIA_TYPE_APLIC_IMSIC) {
-        qemu_fdt_setprop_cell(mc->fdt, name, "msi-parent", msi_pcie_phan=
dle);
+        qemu_fdt_setprop_cell(ms->fdt, name, "msi-parent", msi_pcie_phan=
dle);
     }
-    qemu_fdt_setprop_cells(mc->fdt, name, "reg", 0,
+    qemu_fdt_setprop_cells(ms->fdt, name, "reg", 0,
         memmap[VIRT_PCIE_ECAM].base, 0, memmap[VIRT_PCIE_ECAM].size);
-    qemu_fdt_setprop_sized_cells(mc->fdt, name, "ranges",
+    qemu_fdt_setprop_sized_cells(ms->fdt, name, "ranges",
         1, FDT_PCI_RANGE_IOPORT, 2, 0,
         2, memmap[VIRT_PCIE_PIO].base, 2, memmap[VIRT_PCIE_PIO].size,
         1, FDT_PCI_RANGE_MMIO,
@@ -875,7 +875,7 @@ static void create_fdt_pcie(RISCVVirtState *s, const =
MemMapEntry *memmap,
         2, virt_high_pcie_memmap.base,
         2, virt_high_pcie_memmap.base, 2, virt_high_pcie_memmap.size);
=20
-    create_pcie_irq_map(s, mc->fdt, name, irq_pcie_phandle);
+    create_pcie_irq_map(s, ms->fdt, name, irq_pcie_phandle);
     g_free(name);
 }
=20
@@ -884,39 +884,39 @@ static void create_fdt_reset(RISCVVirtState *s, con=
st MemMapEntry *memmap,
 {
     char *name;
     uint32_t test_phandle;
-    MachineState *mc =3D MACHINE(s);
+    MachineState *ms =3D MACHINE(s);
=20
     test_phandle =3D (*phandle)++;
     name =3D g_strdup_printf("/soc/test@%lx",
         (long)memmap[VIRT_TEST].base);
-    qemu_fdt_add_subnode(mc->fdt, name);
+    qemu_fdt_add_subnode(ms->fdt, name);
     {
         static const char * const compat[3] =3D {
             "sifive,test1", "sifive,test0", "syscon"
         };
-        qemu_fdt_setprop_string_array(mc->fdt, name, "compatible",
+        qemu_fdt_setprop_string_array(ms->fdt, name, "compatible",
                                       (char **)&compat, ARRAY_SIZE(compa=
t));
     }
-    qemu_fdt_setprop_cells(mc->fdt, name, "reg",
+    qemu_fdt_setprop_cells(ms->fdt, name, "reg",
         0x0, memmap[VIRT_TEST].base, 0x0, memmap[VIRT_TEST].size);
-    qemu_fdt_setprop_cell(mc->fdt, name, "phandle", test_phandle);
-    test_phandle =3D qemu_fdt_get_phandle(mc->fdt, name);
+    qemu_fdt_setprop_cell(ms->fdt, name, "phandle", test_phandle);
+    test_phandle =3D qemu_fdt_get_phandle(ms->fdt, name);
     g_free(name);
=20
     name =3D g_strdup_printf("/reboot");
-    qemu_fdt_add_subnode(mc->fdt, name);
-    qemu_fdt_setprop_string(mc->fdt, name, "compatible", "syscon-reboot"=
);
-    qemu_fdt_setprop_cell(mc->fdt, name, "regmap", test_phandle);
-    qemu_fdt_setprop_cell(mc->fdt, name, "offset", 0x0);
-    qemu_fdt_setprop_cell(mc->fdt, name, "value", FINISHER_RESET);
+    qemu_fdt_add_subnode(ms->fdt, name);
+    qemu_fdt_setprop_string(ms->fdt, name, "compatible", "syscon-reboot"=
);
+    qemu_fdt_setprop_cell(ms->fdt, name, "regmap", test_phandle);
+    qemu_fdt_setprop_cell(ms->fdt, name, "offset", 0x0);
+    qemu_fdt_setprop_cell(ms->fdt, name, "value", FINISHER_RESET);
     g_free(name);
=20
     name =3D g_strdup_printf("/poweroff");
-    qemu_fdt_add_subnode(mc->fdt, name);
-    qemu_fdt_setprop_string(mc->fdt, name, "compatible", "syscon-powerof=
f");
-    qemu_fdt_setprop_cell(mc->fdt, name, "regmap", test_phandle);
-    qemu_fdt_setprop_cell(mc->fdt, name, "offset", 0x0);
-    qemu_fdt_setprop_cell(mc->fdt, name, "value", FINISHER_PASS);
+    qemu_fdt_add_subnode(ms->fdt, name);
+    qemu_fdt_setprop_string(ms->fdt, name, "compatible", "syscon-powerof=
f");
+    qemu_fdt_setprop_cell(ms->fdt, name, "regmap", test_phandle);
+    qemu_fdt_setprop_cell(ms->fdt, name, "offset", 0x0);
+    qemu_fdt_setprop_cell(ms->fdt, name, "value", FINISHER_PASS);
     g_free(name);
 }
=20
@@ -924,24 +924,24 @@ static void create_fdt_uart(RISCVVirtState *s, cons=
t MemMapEntry *memmap,
                             uint32_t irq_mmio_phandle)
 {
     char *name;
-    MachineState *mc =3D MACHINE(s);
+    MachineState *ms =3D MACHINE(s);
=20
     name =3D g_strdup_printf("/soc/serial@%lx", (long)memmap[VIRT_UART0]=
.base);
-    qemu_fdt_add_subnode(mc->fdt, name);
-    qemu_fdt_setprop_string(mc->fdt, name, "compatible", "ns16550a");
-    qemu_fdt_setprop_cells(mc->fdt, name, "reg",
+    qemu_fdt_add_subnode(ms->fdt, name);
+    qemu_fdt_setprop_string(ms->fdt, name, "compatible", "ns16550a");
+    qemu_fdt_setprop_cells(ms->fdt, name, "reg",
         0x0, memmap[VIRT_UART0].base,
         0x0, memmap[VIRT_UART0].size);
-    qemu_fdt_setprop_cell(mc->fdt, name, "clock-frequency", 3686400);
-    qemu_fdt_setprop_cell(mc->fdt, name, "interrupt-parent", irq_mmio_ph=
andle);
+    qemu_fdt_setprop_cell(ms->fdt, name, "clock-frequency", 3686400);
+    qemu_fdt_setprop_cell(ms->fdt, name, "interrupt-parent", irq_mmio_ph=
andle);
     if (s->aia_type =3D=3D VIRT_AIA_TYPE_NONE) {
-        qemu_fdt_setprop_cell(mc->fdt, name, "interrupts", UART0_IRQ);
+        qemu_fdt_setprop_cell(ms->fdt, name, "interrupts", UART0_IRQ);
     } else {
-        qemu_fdt_setprop_cells(mc->fdt, name, "interrupts", UART0_IRQ, 0=
x4);
+        qemu_fdt_setprop_cells(ms->fdt, name, "interrupts", UART0_IRQ, 0=
x4);
     }
=20
-    qemu_fdt_add_subnode(mc->fdt, "/chosen");
-    qemu_fdt_setprop_string(mc->fdt, "/chosen", "stdout-path", name);
+    qemu_fdt_add_subnode(ms->fdt, "/chosen");
+    qemu_fdt_setprop_string(ms->fdt, "/chosen", "stdout-path", name);
     g_free(name);
 }
=20
@@ -949,20 +949,20 @@ static void create_fdt_rtc(RISCVVirtState *s, const=
 MemMapEntry *memmap,
                            uint32_t irq_mmio_phandle)
 {
     char *name;
-    MachineState *mc =3D MACHINE(s);
+    MachineState *ms =3D MACHINE(s);
=20
     name =3D g_strdup_printf("/soc/rtc@%lx", (long)memmap[VIRT_RTC].base=
);
-    qemu_fdt_add_subnode(mc->fdt, name);
-    qemu_fdt_setprop_string(mc->fdt, name, "compatible",
+    qemu_fdt_add_subnode(ms->fdt, name);
+    qemu_fdt_setprop_string(ms->fdt, name, "compatible",
         "google,goldfish-rtc");
-    qemu_fdt_setprop_cells(mc->fdt, name, "reg",
+    qemu_fdt_setprop_cells(ms->fdt, name, "reg",
         0x0, memmap[VIRT_RTC].base, 0x0, memmap[VIRT_RTC].size);
-    qemu_fdt_setprop_cell(mc->fdt, name, "interrupt-parent",
+    qemu_fdt_setprop_cell(ms->fdt, name, "interrupt-parent",
         irq_mmio_phandle);
     if (s->aia_type =3D=3D VIRT_AIA_TYPE_NONE) {
-        qemu_fdt_setprop_cell(mc->fdt, name, "interrupts", RTC_IRQ);
+        qemu_fdt_setprop_cell(ms->fdt, name, "interrupts", RTC_IRQ);
     } else {
-        qemu_fdt_setprop_cells(mc->fdt, name, "interrupts", RTC_IRQ, 0x4=
);
+        qemu_fdt_setprop_cells(ms->fdt, name, "interrupts", RTC_IRQ, 0x4=
);
     }
     g_free(name);
 }
@@ -970,68 +970,68 @@ static void create_fdt_rtc(RISCVVirtState *s, const=
 MemMapEntry *memmap,
 static void create_fdt_flash(RISCVVirtState *s, const MemMapEntry *memma=
p)
 {
     char *name;
-    MachineState *mc =3D MACHINE(s);
+    MachineState *ms =3D MACHINE(s);
     hwaddr flashsize =3D virt_memmap[VIRT_FLASH].size / 2;
     hwaddr flashbase =3D virt_memmap[VIRT_FLASH].base;
=20
     name =3D g_strdup_printf("/flash@%" PRIx64, flashbase);
-    qemu_fdt_add_subnode(mc->fdt, name);
-    qemu_fdt_setprop_string(mc->fdt, name, "compatible", "cfi-flash");
-    qemu_fdt_setprop_sized_cells(mc->fdt, name, "reg",
+    qemu_fdt_add_subnode(ms->fdt, name);
+    qemu_fdt_setprop_string(ms->fdt, name, "compatible", "cfi-flash");
+    qemu_fdt_setprop_sized_cells(ms->fdt, name, "reg",
                                  2, flashbase, 2, flashsize,
                                  2, flashbase + flashsize, 2, flashsize)=
;
-    qemu_fdt_setprop_cell(mc->fdt, name, "bank-width", 4);
+    qemu_fdt_setprop_cell(ms->fdt, name, "bank-width", 4);
     g_free(name);
 }
=20
 static void create_fdt_fw_cfg(RISCVVirtState *s, const MemMapEntry *memm=
ap)
 {
     char *nodename;
-    MachineState *mc =3D MACHINE(s);
+    MachineState *ms =3D MACHINE(s);
     hwaddr base =3D memmap[VIRT_FW_CFG].base;
     hwaddr size =3D memmap[VIRT_FW_CFG].size;
=20
     nodename =3D g_strdup_printf("/fw-cfg@%" PRIx64, base);
-    qemu_fdt_add_subnode(mc->fdt, nodename);
-    qemu_fdt_setprop_string(mc->fdt, nodename,
+    qemu_fdt_add_subnode(ms->fdt, nodename);
+    qemu_fdt_setprop_string(ms->fdt, nodename,
                             "compatible", "qemu,fw-cfg-mmio");
-    qemu_fdt_setprop_sized_cells(mc->fdt, nodename, "reg",
+    qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "reg",
                                  2, base, 2, size);
-    qemu_fdt_setprop(mc->fdt, nodename, "dma-coherent", NULL, 0);
+    qemu_fdt_setprop(ms->fdt, nodename, "dma-coherent", NULL, 0);
     g_free(nodename);
 }
=20
 static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap)
 {
-    MachineState *mc =3D MACHINE(s);
+    MachineState *ms =3D MACHINE(s);
     uint32_t phandle =3D 1, irq_mmio_phandle =3D 1, msi_pcie_phandle =3D=
 1;
     uint32_t irq_pcie_phandle =3D 1, irq_virtio_phandle =3D 1;
     uint8_t rng_seed[32];
=20
-    if (mc->dtb) {
-        mc->fdt =3D load_device_tree(mc->dtb, &s->fdt_size);
-        if (!mc->fdt) {
+    if (ms->dtb) {
+        ms->fdt =3D load_device_tree(ms->dtb, &s->fdt_size);
+        if (!ms->fdt) {
             error_report("load_device_tree() failed");
             exit(1);
         }
     } else {
-        mc->fdt =3D create_device_tree(&s->fdt_size);
-        if (!mc->fdt) {
+        ms->fdt =3D create_device_tree(&s->fdt_size);
+        if (!ms->fdt) {
             error_report("create_device_tree() failed");
             exit(1);
         }
     }
=20
-    qemu_fdt_setprop_string(mc->fdt, "/", "model", "riscv-virtio,qemu");
-    qemu_fdt_setprop_string(mc->fdt, "/", "compatible", "riscv-virtio");
-    qemu_fdt_setprop_cell(mc->fdt, "/", "#size-cells", 0x2);
-    qemu_fdt_setprop_cell(mc->fdt, "/", "#address-cells", 0x2);
+    qemu_fdt_setprop_string(ms->fdt, "/", "model", "riscv-virtio,qemu");
+    qemu_fdt_setprop_string(ms->fdt, "/", "compatible", "riscv-virtio");
+    qemu_fdt_setprop_cell(ms->fdt, "/", "#size-cells", 0x2);
+    qemu_fdt_setprop_cell(ms->fdt, "/", "#address-cells", 0x2);
=20
-    qemu_fdt_add_subnode(mc->fdt, "/soc");
-    qemu_fdt_setprop(mc->fdt, "/soc", "ranges", NULL, 0);
-    qemu_fdt_setprop_string(mc->fdt, "/soc", "compatible", "simple-bus")=
;
-    qemu_fdt_setprop_cell(mc->fdt, "/soc", "#size-cells", 0x2);
-    qemu_fdt_setprop_cell(mc->fdt, "/soc", "#address-cells", 0x2);
+    qemu_fdt_add_subnode(ms->fdt, "/soc");
+    qemu_fdt_setprop(ms->fdt, "/soc", "ranges", NULL, 0);
+    qemu_fdt_setprop_string(ms->fdt, "/soc", "compatible", "simple-bus")=
;
+    qemu_fdt_setprop_cell(ms->fdt, "/soc", "#size-cells", 0x2);
+    qemu_fdt_setprop_cell(ms->fdt, "/soc", "#address-cells", 0x2);
=20
     create_fdt_sockets(s, memmap, &phandle, &irq_mmio_phandle,
                        &irq_pcie_phandle, &irq_virtio_phandle,
@@ -1053,7 +1053,7 @@ static void create_fdt(RISCVVirtState *s, const Mem=
MapEntry *memmap)
=20
     /* Pass seed to RNG */
     qemu_guest_getrandom_nofail(rng_seed, sizeof(rng_seed));
-    qemu_fdt_setprop(mc->fdt, "/chosen", "rng-seed",
+    qemu_fdt_setprop(ms->fdt, "/chosen", "rng-seed",
                      rng_seed, sizeof(rng_seed));
 }
=20
@@ -1106,14 +1106,14 @@ static inline DeviceState *gpex_pcie_init(MemoryR=
egion *sys_mem,
     return dev;
 }
=20
-static FWCfgState *create_fw_cfg(const MachineState *mc)
+static FWCfgState *create_fw_cfg(const MachineState *ms)
 {
     hwaddr base =3D virt_memmap[VIRT_FW_CFG].base;
     FWCfgState *fw_cfg;
=20
     fw_cfg =3D fw_cfg_init_mem_wide(base + 8, base, 8, base + 16,
                                   &address_space_memory);
-    fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, (uint16_t)mc->smp.cpus);
+    fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, (uint16_t)ms->smp.cpus);
=20
     return fw_cfg;
 }
--=20
2.39.1



