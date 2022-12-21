Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8762D653911
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 23:54:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p87oF-0003O5-L0; Wed, 21 Dec 2022 17:43:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3472792e2=alistair.francis@opensource.wdc.com>)
 id 1p87oA-0003GQ-BG
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 17:43:31 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3472792e2=alistair.francis@opensource.wdc.com>)
 id 1p87o8-0000Xf-Nm
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 17:43:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1671662608; x=1703198608;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qqZZTilR5d2pq+JF0832DzXY6m5V2ZSxxMPDsmHeovY=;
 b=jkGgImFrkhqn+5uCH35QRBe8gQsbmDyTQxDwGZkAHdTGMuE+Q4RkX+bi
 uWprw+GmY8GN9scFBunf6j72b9RF6CCpAilrWAkziNmA/vvcoj9HaQUHn
 X4TcaJE1hagbQqDORLGeL3H6MU2Bv92jVZIzUHrF0g4Qh7Vdpqz0xd+fI
 e0VtrlUFIIw07Z3D76c51jSEoyiG4FtkId6nNiP2DsltYFlratmb5Lw3o
 BAnYN9ge5vdcOt8bfN6c7irqLX+Vf8aRP3NYvR7ZNh084cZMxX5YRs2sy
 VRtu+vtD94D4hJKgIMklYOypCfvJZOZ+V3WfEbKrIf6W8xDvZUFl568OK A==;
X-IronPort-AV: E=Sophos;i="5.96,263,1665417600"; d="scan'208";a="323561475"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 22 Dec 2022 06:41:59 +0800
IronPort-SDR: bD73Fb8/JV6VhnuQXxbypYRfwCJFHv98b+tp/51CIBAoEE7nl840qy0Gso9/4TSULay9Vi9Hgj
 lUNe4rc/gGGQFJKgY4GvavuzLc2wyfWm689Hop6VgMwrxAJoI32yC5KjlivsMSZNePXISsgt0m
 dtI/lQHCQPRdWb/Vi/FmMDPmSM5Ky2Q0jFVPpDuGfXjBu8K2zVOzipLniq4q4yNl3GQr/6JDBN
 YeDUenjanZt7SReZB6kyjbB7uhUHhsChog/9jOwcifw8U6YFyUD+YGuqPnzdBpQ2rxJTN7GWas
 DkY=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Dec 2022 13:54:28 -0800
IronPort-SDR: d9R7QIbGkQNliPSF0kTXT/rNroiXU6gV/voyiBWgd/9Jp2BlO+TV8mNf063G7vJqRRvXUKwEMH
 PM1ZtkjLWh8wcT7j721sjiWhQuIlXIp5rD6BJmr7s+SERcsWDeK1kqTuYZPVjkfqYqGS7cVICZ
 OnjW7h7O4Cnq1e6rWs7EM9yDQcMZsQOXUpNf1JvvbrI1awoRBlpza2m4322fn7A6lHbgdCEFxG
 XrgORJtGmvq0oLSi/8iFVKUf+/6mFWTYNusUlfHF2ciNAajkboKHojFP0IqTGS9sAYB0Rh/DtH
 kO4=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Dec 2022 14:42:00 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4NcpN75Tssz1Rwrq
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 14:41:59 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1671662519; x=1674254520; bh=qqZZTilR5d2pq+JF08
 32DzXY6m5V2ZSxxMPDsmHeovY=; b=CRsCfy2uWXyA9o3BRQrXBZjiONv8yE2wb3
 CCrzabNoC07iVrBUs7Me07BXZD7AmVbcXzZjzJQ/AaA/oOYYFE2YaOM3aJFzXtt/
 yYOQnss2J09gfYWMeY2EBt33/Sc9JcHqEYzcFqjrccYFNBjoE4l54dkpa0i2Etza
 RzU3WSxv8myxzXMzBcu8FHETQUloB+PTdlpwBoCuvPO1uQAFfNtbIdnJcNvNePeC
 Ms6oMXE6iLDboc4YZyZbKMLCkPJT5iQd5s/gmxkhlqkuM3ssopbzWWcUYkDEGMVi
 AHoQnG0vpCIZApXHjuZXsZJCGikPrUSpDpc5Nbc5P43PwESY9a5A==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id mld9R8XyBkpb for <qemu-devel@nongnu.org>;
 Wed, 21 Dec 2022 14:41:59 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.8])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4NcpN52zTxz1RvTp;
 Wed, 21 Dec 2022 14:41:57 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bmeng@tinylab.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 42/45] hw/riscv: virt: Fix the value of "riscv,
 ndev" in the dtb
Date: Thu, 22 Dec 2022 08:40:19 +1000
Message-Id: <20221221224022.425831-43-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221221224022.425831-1-alistair.francis@opensource.wdc.com>
References: <20221221224022.425831-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=3472792e2=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
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


