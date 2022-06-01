Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E066539ACB
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 03:39:05 +0200 (CEST)
Received: from localhost ([::1]:44698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwDKC-0006Jn-AD
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 21:39:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=144e506c5=alistair.francis@opensource.wdc.com>)
 id 1nwDI4-0004A6-JP
 for qemu-devel@nongnu.org; Tue, 31 May 2022 21:36:54 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:17541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=144e506c5=alistair.francis@opensource.wdc.com>)
 id 1nwDI1-0005aC-QR
 for qemu-devel@nongnu.org; Tue, 31 May 2022 21:36:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1654047409; x=1685583409;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OukH25Gcj4nFoBEfbxCTSATKh4p9aSC6BR5bVd73LfQ=;
 b=Q5fSuGlfffqLk73FbFDa1K3jRTYLV7D4W5X5P0nTeHq18Gmg8pMcuhe/
 WzpCNQOquuHqbBd3Yb65yiUdHUkYwBpRiCmPgI/Y3JiNzA2W/mp23w0QF
 VT9NzrQLzHj5wdL2YFqDXNHnkPr7IHr3An3HoJMPk/Hsmz6Aaj7z3jzYN
 DO4NTD7847giMQgouVZVfTNCbjOdgthRW2Ga4PLLkf5R2jyVh5CUqcAHN
 /Q9Cdez0uZOi9gjxW43PpH8w1fawTsa9v6mWylLUWq8RUBH48/HINYnjR
 rwY9rqjhYtV9fdg/Ft+Ndo5apfx92AACKNsUPAs/A1KXhbWZdPXrxBerJ A==;
X-IronPort-AV: E=Sophos;i="5.91,266,1647273600"; d="scan'208";a="200696993"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 01 Jun 2022 09:36:40 +0800
IronPort-SDR: Up+rAYhbU4954SACmM8HgctZKUl2Cb5iB4vuGAvm2P60WZNuDIfYZjEIV6O7KfXAGUkckqOVZa
 VpzAVzsMxx79GbJyD5m9tEM4gUx5V41LOFQ/su6i9h31njJp89A1vji7IHGzgJyB6F3hfXla6B
 0MXG563kQkvaShhjPm5+Z4hq0rkFyb9ODmzTOL0RsKlC+qxhlojtLJxLVquTbJYdqn8yNGGCv2
 gWvY5/Xf38LqRlBTbDZ6kL7GNzuwW3n+M8tSazVbTq1XtLVJJ4S/GTWCo0FKVRLcH/7rXUfQJT
 lnO8+Z5UN9rnyTAcTROzkcD1
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 31 May 2022 18:00:25 -0700
IronPort-SDR: 2K+pff3Q2E2fT0LCN3nI/LTiKkC9uHz7b09OcIZiVYRS2cOhq1zYzuWNsemzhUajaHFq9JntlZ
 aPp6DFXu3UZ8KN0QwvjDIVIItRIlQIyqYXjaTmAf58Fo968mYC5PkpGvjIgkwWC+yX0r2cl0/9
 97WiKKdKUeu5rcQoc9azruPMmfiJuo5r38/Nkj28zcef+60AmPflTPa1pgZ3dWCC7E3lfbBI4L
 Rjcf4M9y34D1gE0KY0nda+PKApudxJ8nzdHTUkfz8d/RyIuK3Mkfk7IgJ1EtyHhIMCXdcaqgmp
 bV4=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 31 May 2022 18:36:41 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LCWvr4Q4jz1SVp1
 for <qemu-devel@nongnu.org>; Tue, 31 May 2022 18:36:40 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1654047399;
 x=1656639400; bh=OukH25Gcj4nFoBEfbxCTSATKh4p9aSC6BR5bVd73LfQ=; b=
 MMds2VeoLS1k9qd97FV613SZ7ZsKyDkt6WtAzDYrB9o+Jho4dX6rxZPPAiJpaI2p
 eWBGIOJb+N14gddE/9+XzvwFNXcTDoY5wxlwUPGhV5HtVvGrTBY7bte8+h1fH/FF
 pMsx2qD1PaYRSfH5AR66QrCZbVGoNAjSwZhAkcggNLm8//sa4Ir3OpF5w66radjA
 4FQRnVxwSlogJUTNXNoQfwo5SAJktu8nKCbi9Vn3PHP5QspRdbRYzzNok23vruKm
 5L6JZcLSEg+VyPQeYcnpfa4O9XwDFAqQ3SZVMvfbe94T1JAYoaH4lkqtSZuHNTDT
 uNHFFEotrLmP8VLtZM43hw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id ImWI_cf_GylT for <qemu-devel@nongnu.org>;
 Tue, 31 May 2022 18:36:39 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.8])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LCWvl2slwz1Rvlc;
 Tue, 31 May 2022 18:36:34 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: jiangyifei@huawei.com, limingwang@huawei.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: thuth@redhat.com, Bin Meng <bin.meng@windriver.com>, alistair23@gmail.com,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, bmeng.cn@gmail.com,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH] hw/intc: sifive_plic: Avoid overflowing the addr_config buffer
Date: Wed,  1 Jun 2022 11:36:31 +1000
Message-Id: <20220601013631.196854-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=144e506c5=alistair.francis@opensource.wdc.com;
 helo=esa4.hgst.iphmx.com
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

From: Alistair Francis <alistair.francis@wdc.com>

Since commit ad40be27 "target/riscv: Support start kernel directly by
KVM" we have been overflowing the addr_config on "M,MS..."
configurations, as reported https://gitlab.com/qemu-project/qemu/-/issues=
/1050.

This commit changes the loop in sifive_plic_create() from iterating over
the number of harts to just iterating over the addr_config. The
addr_config is based on the hart_config, and will contain interrup detail=
s
for all harts. This way we can't iterate past the end of addr_config.

Fixes: ad40be27084536 ("target/riscv: Support start kernel directly by KV=
M")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1050
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/intc/sifive_plic.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
index eebbcf33d4..56d60e9ac9 100644
--- a/hw/intc/sifive_plic.c
+++ b/hw/intc/sifive_plic.c
@@ -431,7 +431,7 @@ DeviceState *sifive_plic_create(hwaddr addr, char *ha=
rt_config,
     uint32_t context_stride, uint32_t aperture_size)
 {
     DeviceState *dev =3D qdev_new(TYPE_SIFIVE_PLIC);
-    int i, j =3D 0;
+    int i;
     SiFivePLICState *plic;
=20
     assert(enable_stride =3D=3D (enable_stride & -enable_stride));
@@ -451,18 +451,17 @@ DeviceState *sifive_plic_create(hwaddr addr, char *=
hart_config,
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
=20
     plic =3D SIFIVE_PLIC(dev);
-    for (i =3D 0; i < num_harts; i++) {
-        CPUState *cpu =3D qemu_get_cpu(hartid_base + i);
=20
-        if (plic->addr_config[j].mode =3D=3D PLICMode_M) {
-            j++;
-            qdev_connect_gpio_out(dev, num_harts + i,
+    for (i =3D 0; i < plic->num_addrs; i++) {
+        int cpu_num =3D plic->addr_config[i].hartid;
+        CPUState *cpu =3D qemu_get_cpu(hartid_base + cpu_num);
+
+        if (plic->addr_config[i].mode =3D=3D PLICMode_M) {
+            qdev_connect_gpio_out(dev, num_harts + cpu_num,
                                   qdev_get_gpio_in(DEVICE(cpu), IRQ_M_EX=
T));
         }
-
-        if (plic->addr_config[j].mode =3D=3D PLICMode_S) {
-            j++;
-            qdev_connect_gpio_out(dev, i,
+        if (plic->addr_config[i].mode =3D=3D PLICMode_S) {
+            qdev_connect_gpio_out(dev, cpu_num,
                                   qdev_get_gpio_in(DEVICE(cpu), IRQ_S_EX=
T));
         }
     }
--=20
2.35.3


