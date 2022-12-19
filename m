Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD2E650650
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 03:21:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p75kI-0001y1-1d; Sun, 18 Dec 2022 21:19:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=345d64987=alistair.francis@opensource.wdc.com>)
 id 1p75kF-0001tA-Rm
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 21:19:11 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=345d64987=alistair.francis@opensource.wdc.com>)
 id 1p75kE-0001CM-3J
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 21:19:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1671416349; x=1702952349;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qqZZTilR5d2pq+JF0832DzXY6m5V2ZSxxMPDsmHeovY=;
 b=mM7ut7md9oyYB5vSaQOzBWGjth3Qvx1olcxoYdh0WBIE8KokW5wcVWWI
 5PeQO9nn/yFFhJml0XsXW0p0RXDeJclF2FaS4hyuUXfq5IEKUaM0vpuHd
 /a1NtmS5tLcqcxtNqjek5p8Ov0VLZQAB5ygBBCZbTE+uPdZbmBUYX4ucR
 qJH+uMbTFqmAseYu4YMMlqoJ1PTVuiNA+CkQBoIKTynvLa1zzced+QtRp
 COHbEEU89++A0pUwIqGS3ryNrbltLy8BQbVVloBT3hVz0EqgmDjHSYidg
 INV86SLY+jcu3oEi0gLf7oIjouq0k+XGCx9k5xjNx4+JE1hQnoV9UsQu8 A==;
X-IronPort-AV: E=Sophos;i="5.96,254,1665417600"; d="scan'208";a="331056838"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 19 Dec 2022 10:18:55 +0800
IronPort-SDR: XWK0dS4EMxaddPrDJTTCDJdldVD60JcVzmSXthrf62nzDlzMhzBnrekjHa9mlF48RpWy8WQkLG
 tgDAW27/+PKgZl09WSnxSS8KKiweyQQqZcTZ3eTg9hBapgxyX3F8/JRgbrBeDMtAKu01Vqew6H
 6y82vwUrLHCOCuTnQJZUcfmML/sC848uNcjjq1WJU9oKF9jTdvnmG/QASu/1OGWZ5R3e7TV3Ci
 6PuARp7U6wrU2Y5gVTwvxFtmzMxCbN+XEluGLh65uYaoP4gD6F71NHCFfZv8AqDyGZdihFwtQN
 ZOA=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Dec 2022 17:37:12 -0800
IronPort-SDR: y3qfqLMQE19AAUvxRUMCZfWZgz8tM9uZuA+S6yD7K5PfYk3AnXICJh7nZnT8oWshhq3Ww5U/Sz
 qsZRk9KXwo+NmiiWkbrkJpczdpFjhrc2ZPsOOeOoP3Z6htffzD61cfTHj3oDY+R+je8+hAqSJ8
 Fasw+eUMayN9UoWWc43WL3LmNqNE2rQyV9v/HaM8jBLqD45xcZJPSMctqDNiss/EBqbC5RjFuE
 1bL62pH+LzHV5/jQq5jY9EoM5HQKCUOUdDyZxNHhLHxsaffPAhVe2zIuoOahfs6WJVlitnMnkV
 uNA=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Dec 2022 18:18:55 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Nb3Kq2QnGz1RvTp
 for <qemu-devel@nongnu.org>; Sun, 18 Dec 2022 18:18:55 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1671416335; x=1674008336; bh=qqZZTilR5d2pq+JF08
 32DzXY6m5V2ZSxxMPDsmHeovY=; b=YKxdRAXsw36lwrpyrS9qKLYRY0H+p3vB4b
 nP7O2DhyjA9LjttC2reP/sJoOAJu8uUoemciP/qufSqnbfOg0l1AE8B2kycXUh1R
 1ijgw+fisaV/itp3mxuLXCeDa4vzLZbI1TXTjVwwkFK5miyfi8Wh2SxtwQmfxNvr
 GkRs9Q4bYUVkjdMPTFflp6/6/OP/VSRMMr4GMiAS0bKmRFBtrLpLTirgyomiZRao
 7B0AeOU4DtPpvFfcXn5DefUo/N4pKh5yM5vQ4+9OH6rlpJKVWdgb5SQ4rp8zgk7A
 anqv0bMCEcSjinK/woxH9Gt7Zlw0xrjFoZOqF8ex/NyusOtAfZ5A==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id OvI2MUiCvIeZ for <qemu-devel@nongnu.org>;
 Sun, 18 Dec 2022 18:18:55 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.4])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Nb3Kn4bGCz1RvLy;
 Sun, 18 Dec 2022 18:18:53 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bmeng@tinylab.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 42/45] hw/riscv: virt: Fix the value of "riscv, ndev" in the dtb
Date: Mon, 19 Dec 2022 12:17:00 +1000
Message-Id: <20221219021703.20473-43-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221219021703.20473-1-alistair.francis@opensource.wdc.com>
References: <20221219021703.20473-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=345d64987=alistair.francis@opensource.wdc.com;
 helo=esa1.hgst.iphmx.com
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

From: Bin Meng <bmeng@tinylab.org>

Commit 28d8c281200f ("hw/riscv: virt: Add optional AIA IMSIC support to v=
irt machine")
changed the value of VIRT_IRQCHIP_NUM_SOURCES from 127 to 53, which
is VIRTIO_NDEV and also used as the value of "riscv,ndev" property
in the dtb. Unfortunately this is wrong as VIRT_IRQCHIP_NUM_SOURCES
should include interrupt source 0 but "riscv,ndev" does not.

While we are here, we also fix the comments of platform bus irq range
which is now "64 to 96", but should be "64 to 95", introduced since
commit 1832b7cb3f64 ("hw/riscv: virt: Create a platform bus").

Fixes: 28d8c281200f ("hw/riscv: virt: Add optional AIA IMSIC support to v=
irt machine")
Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20221211030829.802437-13-bmeng@tinylab.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/riscv/virt.h | 5 ++---
 hw/riscv/virt.c         | 3 ++-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index 62513e075c..e1ce0048af 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -87,14 +87,13 @@ enum {
     VIRTIO_IRQ =3D 1, /* 1 to 8 */
     VIRTIO_COUNT =3D 8,
     PCIE_IRQ =3D 0x20, /* 32 to 35 */
-    VIRT_PLATFORM_BUS_IRQ =3D 64, /* 64 to 96 */
-    VIRTIO_NDEV =3D 96 /* Arbitrary maximum number of interrupts */
+    VIRT_PLATFORM_BUS_IRQ =3D 64, /* 64 to 95 */
 };
=20
 #define VIRT_PLATFORM_BUS_NUM_IRQS 32
=20
 #define VIRT_IRQCHIP_NUM_MSIS 255
-#define VIRT_IRQCHIP_NUM_SOURCES VIRTIO_NDEV
+#define VIRT_IRQCHIP_NUM_SOURCES 96
 #define VIRT_IRQCHIP_NUM_PRIO_BITS 3
 #define VIRT_IRQCHIP_MAX_GUESTS_BITS 3
 #define VIRT_IRQCHIP_MAX_GUESTS ((1U << VIRT_IRQCHIP_MAX_GUESTS_BITS) - =
1U)
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 6cf9355b99..94ff2a1584 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -468,7 +468,8 @@ static void create_fdt_socket_plic(RISCVVirtState *s,
         plic_cells, s->soc[socket].num_harts * sizeof(uint32_t) * 4);
     qemu_fdt_setprop_cells(mc->fdt, plic_name, "reg",
         0x0, plic_addr, 0x0, memmap[VIRT_PLIC].size);
-    qemu_fdt_setprop_cell(mc->fdt, plic_name, "riscv,ndev", VIRTIO_NDEV)=
;
+    qemu_fdt_setprop_cell(mc->fdt, plic_name, "riscv,ndev",
+                          VIRT_IRQCHIP_NUM_SOURCES - 1);
     riscv_socket_fdt_write_id(mc, mc->fdt, plic_name, socket);
     qemu_fdt_setprop_cell(mc->fdt, plic_name, "phandle",
         plic_phandles[socket]);
--=20
2.38.1


