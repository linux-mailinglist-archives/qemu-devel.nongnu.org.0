Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0363268D050
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 08:14:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPI7V-0006Vb-AA; Tue, 07 Feb 2023 02:10:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=395dd5341=alistair.francis@opensource.wdc.com>)
 id 1pPI7M-0006QP-St
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 02:10:16 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=395dd5341=alistair.francis@opensource.wdc.com>)
 id 1pPI7K-0000FD-MJ
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 02:10:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1675753814; x=1707289814;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WTrgcWXrbdLRcSW4PH51XzL7igSDdikWbFPeLLGTjlk=;
 b=THHjctMVbLb9oWTF0KaB8CmRpxwHr22CDNRg/vom1EIHN9uvVcsi2Fly
 jaz8E7FmTB1o/3LvuP0ukJDKS6mmBgUVkRdp7S8BYlisJPoGpRjUI0pGy
 N/p6QTF+s6kgKuVPTbaT9pI1GzVMFjMcJ+N2IfVfrFoA9izmvwU2mlRYu
 fNGGf9wlrzt+L1B5AUpncT7Awecf2+E04JpvBakxNBwYWMgH778rJTxUz
 DtEDGza3+TG8fqrn4AefR07Ktq5u0hh973Q8uU+/n3YFXFkERnGAEgNOe
 GDMZbRn4pl5IQzB7ihgncLFQRLoNO2g7+DGy076crD2pRabgSsrGr5+Ps w==;
X-IronPort-AV: E=Sophos;i="5.97,278,1669046400"; d="scan'208";a="227657488"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Feb 2023 15:10:09 +0800
IronPort-SDR: zAfG7CI6eP9VBJKYiJe4jF/2xk6PQQgq90INWefTJG3f9sBrZwlVceE51j3F6rbvytM6ppDGGn
 nT0DttukAHIST2GdJu2GcIqZ+sBQg6RGxKX4qxyjafDlns2QQepvVZPMu0qpGPFPZyEMFUK7pt
 M5J/alhZ1WvEByasyt85oN+30kG/08P+tpTulMH494nWEZjHHm7B2rNGSugWaXKBZtBpeR0VOM
 SIAYbpVp6FXWyuLUxO8zjGnf4c221wOIR3eK1hRCAgRSE9bKm+nLxNfyNWp8Opi0BbkcG33Aa/
 6iQ=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Feb 2023 22:27:26 -0800
IronPort-SDR: pfFc9kBIZdyWvcvIUmjrN+nMUCZI93hLkJz8J+4nOxEnzk+NrURJJgIef+O2i6R3KNym+A43En
 50GMcAJDqFLwzPR/MCKJwwqqZYu5xIkZkWWxCUCvU7HqAZ1KLJWSNE8Er+SDdqlUYoaPG+gAib
 lueY5T8KzMIw5padRlZocXsXeOQBSVjOmmK0nPnYzl9Av636k0/ovdbPE/GhyGojDzc1kAz/09
 LXPnBvRzNqznijLMbcFVorqViK+79q2DNEKmlrENFz+T5oFRWyX+cD9RaReNQUeZQvQycjIeUk
 yNM=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Feb 2023 23:10:09 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4P9vQn18dcz1RwvL
 for <qemu-devel@nongnu.org>; Mon,  6 Feb 2023 23:10:09 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1675753808; x=1678345809; bh=WTrgcWX
 rbdLRcSW4PH51XzL7igSDdikWbFPeLLGTjlk=; b=uM/uc9N5KbCt4xSet53X+r9
 dzTZw9Clk3f/PoJKmvGNiY5t+ixbGLO1ztdpIpCfF42nVBqCjRxP8sT4Owq07Er4
 bHvGA021ZTKTDfttQ7InFipEm0iYvoYGGh4v5H3aA6J1ZJugeafQZbBXpmxxrI1w
 vI88FII4gM2sbKi54voC9VqYov8DuFRIq8wrwncOeer8jgPSoMuEoW64xnZMmKS3
 MO615kRZrvjcivk6WjZNX0Cridwui5akwHGt5wQKnRodMbAy16kKVvu+95+ymTe7
 uFd+gp2G/YfM67wXfZOpe3M5ywfYWpg08/UVmsEPhii1BgJjLFIKftu6TYtoRSw=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id Iot29wW5RVIE for <qemu-devel@nongnu.org>;
 Mon,  6 Feb 2023 23:10:08 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.38])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4P9vQk1GTyz1RvTp;
 Mon,  6 Feb 2023 23:10:05 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 10/32] hw/riscv/spike.c: rename MachineState 'mc' pointers to'
 ms'
Date: Tue,  7 Feb 2023 17:09:21 +1000
Message-Id: <20230207070943.2558857-11-alistair.francis@opensource.wdc.com>
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

Follow the QEMU convention of naming MachineState pointers as 'ms' by
renaming the instances where we're calling it 'mc'.

Suggested-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-Id: <20230124212234.412630-4-dbarboza@ventanamicro.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/spike.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index badc11ec43..04d236296b 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -56,7 +56,7 @@ static void create_fdt(SpikeState *s, const MemMapEntry=
 *memmap,
     uint64_t addr, size;
     unsigned long clint_addr;
     int cpu, socket;
-    MachineState *mc =3D MACHINE(s);
+    MachineState *ms =3D MACHINE(s);
     uint32_t *clint_cells;
     uint32_t cpu_phandle, intc_phandle, phandle =3D 1;
     char *name, *mem_name, *clint_name, *clust_name;
@@ -65,7 +65,7 @@ static void create_fdt(SpikeState *s, const MemMapEntry=
 *memmap,
         "sifive,clint0", "riscv,clint0"
     };
=20
-    fdt =3D mc->fdt =3D create_device_tree(&fdt_size);
+    fdt =3D ms->fdt =3D create_device_tree(&fdt_size);
     if (!fdt) {
         error_report("create_device_tree() failed");
         exit(1);
@@ -96,7 +96,7 @@ static void create_fdt(SpikeState *s, const MemMapEntry=
 *memmap,
     qemu_fdt_setprop_cell(fdt, "/cpus", "#address-cells", 0x1);
     qemu_fdt_add_subnode(fdt, "/cpus/cpu-map");
=20
-    for (socket =3D (riscv_socket_count(mc) - 1); socket >=3D 0; socket-=
-) {
+    for (socket =3D (riscv_socket_count(ms) - 1); socket >=3D 0; socket-=
-) {
         clust_name =3D g_strdup_printf("/cpus/cpu-map/cluster%d", socket=
);
         qemu_fdt_add_subnode(fdt, clust_name);
=20
@@ -121,7 +121,7 @@ static void create_fdt(SpikeState *s, const MemMapEnt=
ry *memmap,
             qemu_fdt_setprop_cell(fdt, cpu_name, "reg",
                 s->soc[socket].hartid_base + cpu);
             qemu_fdt_setprop_string(fdt, cpu_name, "device_type", "cpu")=
;
-            riscv_socket_fdt_write_id(mc, cpu_name, socket);
+            riscv_socket_fdt_write_id(ms, cpu_name, socket);
             qemu_fdt_setprop_cell(fdt, cpu_name, "phandle", cpu_phandle)=
;
=20
             intc_name =3D g_strdup_printf("%s/interrupt-controller", cpu=
_name);
@@ -147,14 +147,14 @@ static void create_fdt(SpikeState *s, const MemMapE=
ntry *memmap,
             g_free(cpu_name);
         }
=20
-        addr =3D memmap[SPIKE_DRAM].base + riscv_socket_mem_offset(mc, s=
ocket);
-        size =3D riscv_socket_mem_size(mc, socket);
+        addr =3D memmap[SPIKE_DRAM].base + riscv_socket_mem_offset(ms, s=
ocket);
+        size =3D riscv_socket_mem_size(ms, socket);
         mem_name =3D g_strdup_printf("/memory@%lx", (long)addr);
         qemu_fdt_add_subnode(fdt, mem_name);
         qemu_fdt_setprop_cells(fdt, mem_name, "reg",
             addr >> 32, addr, size >> 32, size);
         qemu_fdt_setprop_string(fdt, mem_name, "device_type", "memory");
-        riscv_socket_fdt_write_id(mc, mem_name, socket);
+        riscv_socket_fdt_write_id(ms, mem_name, socket);
         g_free(mem_name);
=20
         clint_addr =3D memmap[SPIKE_CLINT].base +
@@ -167,14 +167,14 @@ static void create_fdt(SpikeState *s, const MemMapE=
ntry *memmap,
             0x0, clint_addr, 0x0, memmap[SPIKE_CLINT].size);
         qemu_fdt_setprop(fdt, clint_name, "interrupts-extended",
             clint_cells, s->soc[socket].num_harts * sizeof(uint32_t) * 4=
);
-        riscv_socket_fdt_write_id(mc, clint_name, socket);
+        riscv_socket_fdt_write_id(ms, clint_name, socket);
=20
         g_free(clint_name);
         g_free(clint_cells);
         g_free(clust_name);
     }
=20
-    riscv_socket_fdt_write_distance_matrix(mc);
+    riscv_socket_fdt_write_distance_matrix(ms);
=20
     qemu_fdt_add_subnode(fdt, "/chosen");
     qemu_fdt_setprop_string(fdt, "/chosen", "stdout-path", "/htif");
--=20
2.39.1


