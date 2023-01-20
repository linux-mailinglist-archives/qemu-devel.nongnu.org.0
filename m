Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9240674E95
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 08:46:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIm1l-000254-VX; Fri, 20 Jan 2023 02:41:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=37747d9ec=alistair.francis@opensource.wdc.com>)
 id 1pIm1T-0001Zw-FU
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:41:16 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=37747d9ec=alistair.francis@opensource.wdc.com>)
 id 1pIm1Q-0004pk-Be
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:41:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1674200472; x=1705736472;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zZvEpv4rPGsN2APAPO4ea4PwHMq9ix+ravFcIefjXNU=;
 b=dN//Wrt2rM2494zLPCS5a0uZ83+vyOYhueHYq7Hv8sg8Phs4D0O/3vI5
 CPt6//WVzV4pdRNV5H61BXWWANm2+3McfFuKBGAffGPCQ8/FUR1Q8Y/9a
 /hebT2c1wgByiq7A7KZISqytAFdgaWWiH+Zxu9N+643l1jOwHWsuJaOlr
 hXpctUQpN9ZIBJCDxHgI/EnU+1clF1KG86RSsPuj06thCJM0ojGT4ra+E
 VxvbcKD3Dd3WI0OYysyvVzfAx0MxzZ8/KRdJj5S88VXh6afoM31ZHJJy2
 n0Nf3LcYfAL3dxrAWyi3Q86Oa0UiqbQ5PiFKOyUR0dHQqlUalbEjEEmyb g==;
X-IronPort-AV: E=Sophos;i="5.97,231,1669046400"; d="scan'208";a="221176761"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 20 Jan 2023 15:40:25 +0800
IronPort-SDR: zni3EvPS31wNWDitHsr2a+Wj5eXoG06jk58h7Ecaem56gq0cRl23T1uYySptNXY/Ga6npxUNUE
 +sSnJwa5CJd8XAaVmrOtDhO8qfTP4d1wbLrq4m6zSdTB2GWadWtUFTN+qk0A+5M3myGr/pmFMK
 RafkBauIT/58gzhF02sVxV5FOJavsMEjFV1pKW+JJFkIu21e4nhCtV/MlOJpJ6DgKQuMnXRLGs
 ddM6SdygL9fjcCLnrnBL7B9GN8/cLauJjFWqjATkhvQBby7RVR3xC5Ln9zcsF5u/H3Dl2VDtbk
 Vi0=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jan 2023 22:58:03 -0800
IronPort-SDR: RIo70eNHzKJYzX0hvo98GGAc93cRd33PLcpmqwkeDZx8S5hdLuoy7lLCbruWsNWrw+2bJKMsAI
 iWe1xRViXvmpKzGuOrTND2utf75nFFoo9BDrlp/ObstXOJ+9VWBJUgXlaf9mnWuTVZCfSMOI+C
 xH/wX1uJ42Gtl8jIxphX7zNXixkMX/Ipl7xKpaHKwGyC0QiX951iMe5AZCnSswKH+2hQbxDR3J
 MN/X+RadfPSKxt/7jnAGIIDrwsTFOxrCSUmmQNPfAtVeCz0AqOH0bJB2AEbGkzbE7FxxMmFYQA
 eWE=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jan 2023 23:40:25 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Nyry05C8Fz1Rwrq
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 23:40:24 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1674200423; x=1676792424; bh=zZvEpv4
 rPGsN2APAPO4ea4PwHMq9ix+ravFcIefjXNU=; b=nw6yXdDG2U6OhJe2tpDmGM+
 6swLl7kfVbbU+tky6+0FIel+1TAH6xn4lzqNHXFLkEdupOwpxhpgSP57toXCMIAY
 6Jd/c03Lvvk4DO5yAQ2DkQlFxDssLA/9zD+rEoxzoKkNh6lEzzMHd+2FL0T/3JSI
 dKIJxUk+gvq2D5xVzd3iAquzz3ZxNfxFy+aqGwyc/NzJo41n93R0SmM2iOvvFCsp
 1qQJVFKbcEUvnbgRe9jkdCIt12lMNQNTVKhNwXFqxaxTRIysZUKqP7/U+PkaeQPr
 rrZA3Ygd9NoibJeJ/tKr6UlarSFEMpd+Q8h3mXKu46YWGbEiTwnnVEQCV1XtclQ=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 0LjPpTZS-ZIc for <qemu-devel@nongnu.org>;
 Thu, 19 Jan 2023 23:40:23 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.167.38])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Nyrxy3Gzzz1RvTp;
 Thu, 19 Jan 2023 23:40:22 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 30/37] hw/riscv: use MachineState::fdt in
 riscv_socket_fdt_write_id()
Date: Fri, 20 Jan 2023 17:39:06 +1000
Message-Id: <20230120073913.1028407-31-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230120073913.1028407-1-alistair.francis@opensource.wdc.com>
References: <20230120073913.1028407-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=37747d9ec=alistair.francis@opensource.wdc.com;
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

There's no need to use a MachineState pointer and a fdt pointer now that
all RISC-V machines are using the FDT from the MachineState.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20230111170948.316276-6-dbarboza@ventanamicro.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/riscv/numa.h |  6 +++---
 hw/riscv/numa.c         |  6 +++---
 hw/riscv/spike.c        |  6 +++---
 hw/riscv/virt.c         | 18 +++++++++---------
 4 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/include/hw/riscv/numa.h b/include/hw/riscv/numa.h
index 1a9cce3344..634df6673f 100644
--- a/include/hw/riscv/numa.h
+++ b/include/hw/riscv/numa.h
@@ -90,10 +90,10 @@ bool riscv_socket_check_hartids(const MachineState *m=
s, int socket_id);
  * @ms: pointer to machine state
  * @socket_id: socket index
  *
- * Write NUMA node-id FDT property for given FDT node
+ * Write NUMA node-id FDT property in MachineState->fdt
  */
-void riscv_socket_fdt_write_id(const MachineState *ms, void *fdt,
-                               const char *node_name, int socket_id);
+void riscv_socket_fdt_write_id(const MachineState *ms, const char *node_=
name,
+                               int socket_id);
=20
 /**
  * riscv_socket_fdt_write_distance_matrix:
diff --git a/hw/riscv/numa.c b/hw/riscv/numa.c
index 7fe92d402f..f4343f5cde 100644
--- a/hw/riscv/numa.c
+++ b/hw/riscv/numa.c
@@ -156,11 +156,11 @@ uint64_t riscv_socket_mem_size(const MachineState *=
ms, int socket_id)
             ms->numa_state->nodes[socket_id].node_mem : 0;
 }
=20
-void riscv_socket_fdt_write_id(const MachineState *ms, void *fdt,
-                               const char *node_name, int socket_id)
+void riscv_socket_fdt_write_id(const MachineState *ms, const char *node_=
name,
+                               int socket_id)
 {
     if (numa_enabled(ms)) {
-        qemu_fdt_setprop_cell(fdt, node_name, "numa-node-id", socket_id)=
;
+        qemu_fdt_setprop_cell(ms->fdt, node_name, "numa-node-id", socket=
_id);
     }
 }
=20
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index c7550abfc7..5f12d80317 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -121,7 +121,7 @@ static void create_fdt(SpikeState *s, const MemMapEnt=
ry *memmap,
             qemu_fdt_setprop_cell(fdt, cpu_name, "reg",
                 s->soc[socket].hartid_base + cpu);
             qemu_fdt_setprop_string(fdt, cpu_name, "device_type", "cpu")=
;
-            riscv_socket_fdt_write_id(mc, fdt, cpu_name, socket);
+            riscv_socket_fdt_write_id(mc, cpu_name, socket);
             qemu_fdt_setprop_cell(fdt, cpu_name, "phandle", cpu_phandle)=
;
=20
             intc_name =3D g_strdup_printf("%s/interrupt-controller", cpu=
_name);
@@ -154,7 +154,7 @@ static void create_fdt(SpikeState *s, const MemMapEnt=
ry *memmap,
         qemu_fdt_setprop_cells(fdt, mem_name, "reg",
             addr >> 32, addr, size >> 32, size);
         qemu_fdt_setprop_string(fdt, mem_name, "device_type", "memory");
-        riscv_socket_fdt_write_id(mc, fdt, mem_name, socket);
+        riscv_socket_fdt_write_id(mc, mem_name, socket);
         g_free(mem_name);
=20
         clint_addr =3D memmap[SPIKE_CLINT].base +
@@ -167,7 +167,7 @@ static void create_fdt(SpikeState *s, const MemMapEnt=
ry *memmap,
             0x0, clint_addr, 0x0, memmap[SPIKE_CLINT].size);
         qemu_fdt_setprop(fdt, clint_name, "interrupts-extended",
             clint_cells, s->soc[socket].num_harts * sizeof(uint32_t) * 4=
);
-        riscv_socket_fdt_write_id(mc, fdt, clint_name, socket);
+        riscv_socket_fdt_write_id(mc, clint_name, socket);
=20
         g_free(clint_name);
         g_free(clint_cells);
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 99cb571024..6a2422a8cf 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -253,7 +253,7 @@ static void create_fdt_socket_cpus(RISCVVirtState *s,=
 int socket,
         qemu_fdt_setprop_cell(mc->fdt, cpu_name, "reg",
             s->soc[socket].hartid_base + cpu);
         qemu_fdt_setprop_string(mc->fdt, cpu_name, "device_type", "cpu")=
;
-        riscv_socket_fdt_write_id(mc, mc->fdt, cpu_name, socket);
+        riscv_socket_fdt_write_id(mc, cpu_name, socket);
         qemu_fdt_setprop_cell(mc->fdt, cpu_name, "phandle", cpu_phandle)=
;
=20
         intc_phandles[cpu] =3D (*phandle)++;
@@ -291,7 +291,7 @@ static void create_fdt_socket_memory(RISCVVirtState *=
s,
     qemu_fdt_setprop_cells(mc->fdt, mem_name, "reg",
         addr >> 32, addr, size >> 32, size);
     qemu_fdt_setprop_string(mc->fdt, mem_name, "device_type", "memory");
-    riscv_socket_fdt_write_id(mc, mc->fdt, mem_name, socket);
+    riscv_socket_fdt_write_id(mc, mem_name, socket);
     g_free(mem_name);
 }
=20
@@ -327,7 +327,7 @@ static void create_fdt_socket_clint(RISCVVirtState *s=
,
         0x0, clint_addr, 0x0, memmap[VIRT_CLINT].size);
     qemu_fdt_setprop(mc->fdt, clint_name, "interrupts-extended",
         clint_cells, s->soc[socket].num_harts * sizeof(uint32_t) * 4);
-    riscv_socket_fdt_write_id(mc, mc->fdt, clint_name, socket);
+    riscv_socket_fdt_write_id(mc, clint_name, socket);
     g_free(clint_name);
=20
     g_free(clint_cells);
@@ -372,7 +372,7 @@ static void create_fdt_socket_aclint(RISCVVirtState *=
s,
             aclint_mswi_cells, aclint_cells_size);
         qemu_fdt_setprop(mc->fdt, name, "interrupt-controller", NULL, 0)=
;
         qemu_fdt_setprop_cell(mc->fdt, name, "#interrupt-cells", 0);
-        riscv_socket_fdt_write_id(mc, mc->fdt, name, socket);
+        riscv_socket_fdt_write_id(mc, name, socket);
         g_free(name);
     }
=20
@@ -396,7 +396,7 @@ static void create_fdt_socket_aclint(RISCVVirtState *=
s,
         0x0, RISCV_ACLINT_DEFAULT_MTIME);
     qemu_fdt_setprop(mc->fdt, name, "interrupts-extended",
         aclint_mtimer_cells, aclint_cells_size);
-    riscv_socket_fdt_write_id(mc, mc->fdt, name, socket);
+    riscv_socket_fdt_write_id(mc, name, socket);
     g_free(name);
=20
     if (s->aia_type !=3D VIRT_AIA_TYPE_APLIC_IMSIC) {
@@ -412,7 +412,7 @@ static void create_fdt_socket_aclint(RISCVVirtState *=
s,
             aclint_sswi_cells, aclint_cells_size);
         qemu_fdt_setprop(mc->fdt, name, "interrupt-controller", NULL, 0)=
;
         qemu_fdt_setprop_cell(mc->fdt, name, "#interrupt-cells", 0);
-        riscv_socket_fdt_write_id(mc, mc->fdt, name, socket);
+        riscv_socket_fdt_write_id(mc, name, socket);
         g_free(name);
     }
=20
@@ -471,7 +471,7 @@ static void create_fdt_socket_plic(RISCVVirtState *s,
         0x0, plic_addr, 0x0, memmap[VIRT_PLIC].size);
     qemu_fdt_setprop_cell(mc->fdt, plic_name, "riscv,ndev",
                           VIRT_IRQCHIP_NUM_SOURCES - 1);
-    riscv_socket_fdt_write_id(mc, mc->fdt, plic_name, socket);
+    riscv_socket_fdt_write_id(mc, plic_name, socket);
     qemu_fdt_setprop_cell(mc->fdt, plic_name, "phandle",
         plic_phandles[socket]);
=20
@@ -663,7 +663,7 @@ static void create_fdt_socket_aplic(RISCVVirtState *s=
,
         aplic_s_phandle);
     qemu_fdt_setprop_cells(mc->fdt, aplic_name, "riscv,delegate",
         aplic_s_phandle, 0x1, VIRT_IRQCHIP_NUM_SOURCES);
-    riscv_socket_fdt_write_id(mc, mc->fdt, aplic_name, socket);
+    riscv_socket_fdt_write_id(mc, aplic_name, socket);
     qemu_fdt_setprop_cell(mc->fdt, aplic_name, "phandle", aplic_m_phandl=
e);
     g_free(aplic_name);
=20
@@ -691,7 +691,7 @@ static void create_fdt_socket_aplic(RISCVVirtState *s=
,
         0x0, aplic_addr, 0x0, memmap[VIRT_APLIC_S].size);
     qemu_fdt_setprop_cell(mc->fdt, aplic_name, "riscv,num-sources",
         VIRT_IRQCHIP_NUM_SOURCES);
-    riscv_socket_fdt_write_id(mc, mc->fdt, aplic_name, socket);
+    riscv_socket_fdt_write_id(mc, aplic_name, socket);
     qemu_fdt_setprop_cell(mc->fdt, aplic_name, "phandle", aplic_s_phandl=
e);
=20
     if (!socket) {
--=20
2.39.0


