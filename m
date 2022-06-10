Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD0D545B2B
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 06:37:46 +0200 (CEST)
Received: from localhost ([::1]:35382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzWP3-00035J-Ul
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 00:37:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1538de18e=alistair.francis@opensource.wdc.com>)
 id 1nzWF8-0002vg-Oo
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 00:27:30 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:23579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1538de18e=alistair.francis@opensource.wdc.com>)
 id 1nzWF6-00011H-Lz
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 00:27:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1654835248; x=1686371248;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GPIHidrtgMssmiGEwMporPJ6SxnKU3ugU20xUZ8bMvE=;
 b=XVVIb+nXolRBXMA5n2m7m1ecjcriZ6l9fhtUuantmoa4N02oQVWIka6e
 QFum6nzVVzYQFW2GPFWkwWyYKhLiVJVfQVfKpU3ve0e6N8b08/MolKh6N
 doCDcaTLYKzJT+n7CCaqN/Q8xmiWctMMyVBJyt2ypZoU5TWytZHuntqaF
 zk2KP+rmki9jO6Us8XTOy4Jfq7t/Oi3pRF5Knjs1JfBQgWoCpsUzKo6eJ
 UkNhbHWBQ+2VXP0DWreYV1gVNQrNR5DaWWEipP5WD+H/wh1T3TarE2qdZ
 I+q/XeQdGpJK2wNjIDd/KxomgyK99sP8M+VCCQNbBb9pyM1zNob87SwrL A==;
X-IronPort-AV: E=Sophos;i="5.91,288,1647273600"; d="scan'208";a="307046427"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 10 Jun 2022 12:27:28 +0800
IronPort-SDR: c7VO/YdSqpODjq9teBLIpDK6qMdTSVDsKiVz+iQ2dCkZEOd4aaW/U5IMiXiRxCRXu5FM3GmtyT
 lATsN2Lv3LgPRcozRaaMHba4Gni6mVe/3bMi86Ixs8ikkg/Zjoyn8+0LfB8kGK6G9qWvsuytIX
 nlsCm9rfMw/aHWvzFHtx6Ayml03EFREmzM/ts+Cx+I6T2NR4uaWFMyyqNsWDXnX9uJcqNkIlOQ
 tzcXI6/MbidrYYDi7Wa+J34xWx/KDKqFES7+Cc6slojXHi8PaUY5qelB6HqqbeeU1W/zJdSuwi
 VDhwpK0L5Ok2ORdfOlqfxbUL
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Jun 2022 20:50:36 -0700
IronPort-SDR: CIfzo0i9ChEVND4+Ql5bWF0KiDZIjd4h0AvK2epKNMNSWaE1YSu7WrwZkXQXGwdg6mlNSkqrn8
 G4n6nT8JbMETpKW+see1i/rD4tn4NPLbYh06VpzA/bNamJZHbVwH1inhkeBdEMN3mxgOM3XojV
 H8VnqpChXxnaLk+VRflnzVCAKMHUkqz7tX9oSvg5IiCKnrkJM3rRuBROPwWj+muQL6YImfrqTR
 udwn2P+yC7HiLJEpzlqEvq93p+EOpw0ly3eX9A1flEi1BCEiBPm9X1OUoVbYmxTYEtxGlPhybq
 NNU=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Jun 2022 21:27:27 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LK7Gl37xZz1Rwrw
 for <qemu-devel@nongnu.org>; Thu,  9 Jun 2022 21:27:27 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1654835247; x=1657427248; bh=GPIHidrtgMssmiGEwM
 porPJ6SxnKU3ugU20xUZ8bMvE=; b=E4xIcjdOGD9ELGjpLd4nDAnk8KKgKzhj0O
 yHn2r1l+f7esnoo+FbAAr1KwPmgFggWDW02OT5kCwWQsUX1yBZGeSkuH1NSyfvhr
 kbryzGlzwqLW9sxEUeXJclldmIyxT/BHWIEclp1MWnv4RdbZMK3U2C6rodUr+XBu
 Kro6PxrzkVgcBdbqN45JWcuk7gLjCWzi8jNi9uEUfEwqARj4eEM6UnrKH9TqbD6w
 SFyUkIzmXzR0QjeZnq2Kn5PcgBbaPnYf6Sfj0teKn7+c8RTFj0fg1yIdCAYlWIxd
 dieqOk7x2tooVexl58t9a5wHJmx0ygTluV3HI+YkolKsifv3dP7g==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 97bHAPjPKnpv for <qemu-devel@nongnu.org>;
 Thu,  9 Jun 2022 21:27:27 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.12])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LK7Gj03Tcz1Rvlx;
 Thu,  9 Jun 2022 21:27:24 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Atish Patra <atishp@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 03/25] hw/riscv: virt: Generate fw_cfg DT node correctly
Date: Fri, 10 Jun 2022 14:26:33 +1000
Message-Id: <20220610042655.2021686-4-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610042655.2021686-1-alistair.francis@opensource.wdc.com>
References: <20220610042655.2021686-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=1538de18e=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

From: Atish Patra <atishp@rivosinc.com>

fw_cfg DT node is generated after the create_fdt without any check
if the DT is being loaded from the commandline. This results in
FDT_ERR_EXISTS error if dtb is loaded from the commandline.

Generate fw_cfg node only if the DT is not loaded from the commandline.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220526203500.847165-1-atishp@rivosinc.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/virt.c | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 293e9c95b7..bc424dd2f5 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -975,6 +975,23 @@ static void create_fdt_flash(RISCVVirtState *s, cons=
t MemMapEntry *memmap)
     g_free(name);
 }
=20
+static void create_fdt_fw_cfg(RISCVVirtState *s, const MemMapEntry *memm=
ap)
+{
+    char *nodename;
+    MachineState *mc =3D MACHINE(s);
+    hwaddr base =3D memmap[VIRT_FW_CFG].base;
+    hwaddr size =3D memmap[VIRT_FW_CFG].size;
+
+    nodename =3D g_strdup_printf("/fw-cfg@%" PRIx64, base);
+    qemu_fdt_add_subnode(mc->fdt, nodename);
+    qemu_fdt_setprop_string(mc->fdt, nodename,
+                            "compatible", "qemu,fw-cfg-mmio");
+    qemu_fdt_setprop_sized_cells(mc->fdt, nodename, "reg",
+                                 2, base, 2, size);
+    qemu_fdt_setprop(mc->fdt, nodename, "dma-coherent", NULL, 0);
+    g_free(nodename);
+}
+
 static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
                        uint64_t mem_size, const char *cmdline, bool is_3=
2_bit)
 {
@@ -1023,6 +1040,7 @@ static void create_fdt(RISCVVirtState *s, const Mem=
MapEntry *memmap,
     create_fdt_rtc(s, memmap, irq_mmio_phandle);
=20
     create_fdt_flash(s, memmap);
+    create_fdt_fw_cfg(s, memmap);
=20
 update_bootargs:
     if (cmdline && *cmdline) {
@@ -1082,22 +1100,12 @@ static inline DeviceState *gpex_pcie_init(MemoryR=
egion *sys_mem,
 static FWCfgState *create_fw_cfg(const MachineState *mc)
 {
     hwaddr base =3D virt_memmap[VIRT_FW_CFG].base;
-    hwaddr size =3D virt_memmap[VIRT_FW_CFG].size;
     FWCfgState *fw_cfg;
-    char *nodename;
=20
     fw_cfg =3D fw_cfg_init_mem_wide(base + 8, base, 8, base + 16,
                                   &address_space_memory);
     fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, (uint16_t)mc->smp.cpus);
=20
-    nodename =3D g_strdup_printf("/fw-cfg@%" PRIx64, base);
-    qemu_fdt_add_subnode(mc->fdt, nodename);
-    qemu_fdt_setprop_string(mc->fdt, nodename,
-                            "compatible", "qemu,fw-cfg-mmio");
-    qemu_fdt_setprop_sized_cells(mc->fdt, nodename, "reg",
-                                 2, base, 2, size);
-    qemu_fdt_setprop(mc->fdt, nodename, "dma-coherent", NULL, 0);
-    g_free(nodename);
     return fw_cfg;
 }
=20
--=20
2.36.1


