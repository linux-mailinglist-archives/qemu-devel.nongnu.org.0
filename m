Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 894A8674E7F
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 08:44:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIm1n-0002IK-HP; Fri, 20 Jan 2023 02:41:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=37747d9ec=alistair.francis@opensource.wdc.com>)
 id 1pIm1Q-0001ZO-SF
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:41:16 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=37747d9ec=alistair.francis@opensource.wdc.com>)
 id 1pIm1P-0004pU-0i
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:41:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1674200470; x=1705736470;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=h6lX5TglrQHE+I8KdnJ4GjScoXIWRs0AC51Hu24OqvQ=;
 b=i0ABYifps6GUVZgoXM3sPVQANYqFv9OWTl3MzCOydZaJE1tYE+X03H9l
 l4X9ygQY0DD4rNY8znnnol7Y5ouIWe/I7jFVmKro5DBgtxhSRyLHRU//t
 msouieRdo+QvPcq2fJaFNCtjD+ahMV37fRNQ03vqlRMQhFgXSIx/Ay22k
 nh8l7RC2XyUgmjEmx8rE3bZ5KuUzILD7kWv76wRhdny93Kt9IkMQILSwb
 JP+9ETTeG+X98PSYWNuqiHbFie29yHglygO6lJ2DZRi+LtJpVJFZu2RsO
 wbKimHRs/TBn1+h+6QREN8nEDshK60TXSR/13xwrkbgNcxBhzP3NxZLVY w==;
X-IronPort-AV: E=Sophos;i="5.97,231,1669046400"; d="scan'208";a="221176758"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 20 Jan 2023 15:40:22 +0800
IronPort-SDR: vxyRgbDMrAUUv3x0gia8smv8O4o8rRz7gr9v3sYqyt3hFn1o9gqPUHYPiwi7bdzuTDeYkRwMXV
 5t1izYBhIZ/zZ3L83hJLlzcRFlNoiHUVCQFDkQEB2RFfz7GlJDp8kIZTO5Zk0KmivK1C1NMbEZ
 VU4+CVZdZWclzv5nIdp7/fP1an56f0UucufYBsCUjE7tVOx5lEnt5jZTQssrHQmD9NLpu+XQ0m
 DL/plRvg7j49MsPu+/YAG+Y1XfTlIDYBEwgQWVM1fvhIlt3HPAWMWDvXmnEB6T55e3tU0OWnAD
 wsE=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jan 2023 22:58:00 -0800
IronPort-SDR: CHoW9PzPV86IbXdZ0ukBoANegaiuxvN5uk7FLpR2QQ2es6sSJiBZOQihARqRNzwELQ+Kg3qbnq
 ffF7RuAFG5z+h7z7eAQRjVRIoIjAV4KtqaHzMaHuarMimPnL86CzvuPWgaWfcw4fZKSBRn0ew/
 8waxPZUP33ZuRfpm54YqNPjSMKhkb6ygOzLg3i9QCkViJBBQ48jqDz1c/ALHcJ3xCG9cfPJhUJ
 Y0HpMlwATlLOE9y6nJbMaGldip0EwLGZMVAxkjAED4k6Uf+V56xtL/gqcgiydYZDv2aEgs9yQL
 Qmc=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jan 2023 23:40:23 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Nyrxy4JnJz1Rwt8
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 23:40:22 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1674200422; x=1676792423; bh=h6lX5Tg
 lrQHE+I8KdnJ4GjScoXIWRs0AC51Hu24OqvQ=; b=m23BB7J1gw8GnIhrZEjWtz3
 R0/VKuBE+XwD+/PC2i+R9WJdbgWTxjkNZ5TmTZtwMX7VwpFDPsOYby5ICXhOtlVs
 xm9QmeI6wiNIr53sSoa/SYf5oXfXeQio2KWe0zXa6ZR1EFWgWlkYXDB6gdWD0Gup
 0nPQ29xIt3qC6byJ3Tdl5YJdZoLpcbVx1+34xsccaIJJUNvE99vrnRsToz8KI/iU
 K4fIAeLWRKaB1ct6dWRxU4mvHsS0KQnBi7Bp8pYxeXFEByNa4h9TBXllsA4K3v/X
 mSdKDS8cOSEkATiP589S9VW9FjS/QKlxuw6HmvHvknOJj3wXggEcWwgAq1kDgqA=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id ZEzdsz3UAwvw for <qemu-devel@nongnu.org>;
 Thu, 19 Jan 2023 23:40:22 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.167.38])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Nyrxw4Ll3z1RvLy;
 Thu, 19 Jan 2023 23:40:20 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 29/37] hw/riscv/virt.c: remove 'is_32_bit' param from
 create_fdt_socket_cpus()
Date: Fri, 20 Jan 2023 17:39:05 +1000
Message-Id: <20230120073913.1028407-30-alistair.francis@opensource.wdc.com>
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

create_fdt_socket_cpus() writes a different 'mmu-type' value if we're
running in 32 or 64 bits. However, the flag is being calculated during
virt_machine_init(), and is passed around in create_fdt(), then
create_fdt_socket(), and then finally create_fdt_socket_cpus(). None of
the intermediate functions are using the flag, which is a bit
misleading.

Remove 'is_32_bit' flag from create_fdt_socket_cpus() and calculate it
using the already available RISCVVirtState pointer. This will also
change the signature of create_fdt_socket() and create_fdt(), making it
clear that these functions don't do anything special when we're running
in 32 bit mode.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20230111170948.316276-5-dbarboza@ventanamicro.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/virt.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 1921d3caa3..99cb571024 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -223,12 +223,13 @@ static void create_pcie_irq_map(RISCVVirtState *s, =
void *fdt, char *nodename,
=20
 static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
                                    char *clust_name, uint32_t *phandle,
-                                   bool is_32_bit, uint32_t *intc_phandl=
es)
+                                   uint32_t *intc_phandles)
 {
     int cpu;
     uint32_t cpu_phandle;
     MachineState *mc =3D MACHINE(s);
     char *name, *cpu_name, *core_name, *intc_name;
+    bool is_32_bit =3D riscv_is_32bit(&s->soc[0]);
=20
     for (cpu =3D s->soc[socket].num_harts - 1; cpu >=3D 0; cpu--) {
         cpu_phandle =3D (*phandle)++;
@@ -721,7 +722,7 @@ static void create_fdt_pmu(RISCVVirtState *s)
 }
=20
 static void create_fdt_sockets(RISCVVirtState *s, const MemMapEntry *mem=
map,
-                               bool is_32_bit, uint32_t *phandle,
+                               uint32_t *phandle,
                                uint32_t *irq_mmio_phandle,
                                uint32_t *irq_pcie_phandle,
                                uint32_t *irq_virtio_phandle,
@@ -750,7 +751,7 @@ static void create_fdt_sockets(RISCVVirtState *s, con=
st MemMapEntry *memmap,
         qemu_fdt_add_subnode(mc->fdt, clust_name);
=20
         create_fdt_socket_cpus(s, socket, clust_name, phandle,
-            is_32_bit, &intc_phandles[phandle_pos]);
+                               &intc_phandles[phandle_pos]);
=20
         create_fdt_socket_memory(s, memmap, socket);
=20
@@ -998,8 +999,7 @@ static void create_fdt_fw_cfg(RISCVVirtState *s, cons=
t MemMapEntry *memmap)
     g_free(nodename);
 }
=20
-static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
-                       bool is_32_bit)
+static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap)
 {
     MachineState *mc =3D MACHINE(s);
     uint32_t phandle =3D 1, irq_mmio_phandle =3D 1, msi_pcie_phandle =3D=
 1;
@@ -1031,9 +1031,9 @@ static void create_fdt(RISCVVirtState *s, const Mem=
MapEntry *memmap,
     qemu_fdt_setprop_cell(mc->fdt, "/soc", "#size-cells", 0x2);
     qemu_fdt_setprop_cell(mc->fdt, "/soc", "#address-cells", 0x2);
=20
-    create_fdt_sockets(s, memmap, is_32_bit, &phandle,
-        &irq_mmio_phandle, &irq_pcie_phandle, &irq_virtio_phandle,
-        &msi_pcie_phandle);
+    create_fdt_sockets(s, memmap, &phandle, &irq_mmio_phandle,
+                       &irq_pcie_phandle, &irq_virtio_phandle,
+                       &msi_pcie_phandle);
=20
     create_fdt_virtio(s, memmap, irq_virtio_phandle);
=20
@@ -1507,7 +1507,7 @@ static void virt_machine_init(MachineState *machine=
)
     virt_flash_map(s, system_memory);
=20
     /* create device tree */
-    create_fdt(s, memmap, riscv_is_32bit(&s->soc[0]));
+    create_fdt(s, memmap);
=20
     s->machine_done.notify =3D virt_machine_done;
     qemu_add_machine_init_done_notifier(&s->machine_done);
--=20
2.39.0


