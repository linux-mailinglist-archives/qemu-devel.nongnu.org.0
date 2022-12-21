Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E12446538F5
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 23:45:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p87oK-0003ac-Be; Wed, 21 Dec 2022 17:43:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3472792e2=alistair.francis@opensource.wdc.com>)
 id 1p87oH-0003Vb-WC
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 17:43:38 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3472792e2=alistair.francis@opensource.wdc.com>)
 id 1p87oG-0000bf-4I
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 17:43:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1671662615; x=1703198615;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=33ydBuzuBnZFvlbDBH6+hF4mtGaD+zrqRMjuDlazzLE=;
 b=R11AyRIT1WcPpCkqVtwNSeBUi6/akuxwPduBGozgSMg+oHEq8NBAURa7
 lzuKdYpin1MVjrEE2g++q5ZgFmveZTXNbhE0Ax91mJxdnNqw3Idt9DGtF
 +rf9MKJ3L4LqRPqrlXAvCLSNFvQSZ9jSVHq03Mw7W0s2JAq3x+VYX7edr
 ZfCmBt5mSN5zYUxJALRM7F2qRf5NB460vMx8XMyHXyp2Gai3S/PLEVwi5
 SNtO6hDxUPy50cVhqnX8bJOenYmtCznSzH6FSLmDZlS3CcJlN8zb8Lr5x
 04dvfSVgnh2Nic7SDTyT9D2NdwHhdIDpLueZj4V+BSoz88T3L3mAAjSgS g==;
X-IronPort-AV: E=Sophos;i="5.96,263,1665417600"; d="scan'208";a="323561483"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 22 Dec 2022 06:42:02 +0800
IronPort-SDR: jUybs/j/F8SniGENihgic05fatxYKByeVm5Y/nFQVaXkv445BnWMU7YwSzjiyg/F0y5eZx8zDc
 MiB+OMB954eHK1R8RnM3VFJb1n1krhaJB+RyPFjtIrT4gNCpaLmz2J649rivLbmGXWa6ohursA
 GNKMzowxX0EyQ9deGtSmEnPWoN/Ih6XY3iGyJFEr+2ITbkLZz3BMVs76eQwB8/pqbbOfbZw9oh
 OoYYshi+qTNpgtgkZOBpjXfHlfdGNJN4XjUL8M2KQlNQKBGzLloAGgiBOOaAwFVmWBollIT/68
 r70=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Dec 2022 13:54:31 -0800
IronPort-SDR: HNKXpHpKBySRcdVIeI5IBlnmfpXYjVq6rIzVO5TGhvA+HrXSwytie67Ke3Elkwe4oinQn/vVn9
 1xGFGa2uI+P+t/So6mTKyqetb4mkPzM2arQ+iGW3Wfa/fJNOW2SoUTV+2qyyZrJARFKov5nocD
 Q+r6lf4ukLEB7Ac2kRB6yFsJ7BVj2kXeGDluGhQJAtyWe3XEAwhSQO2CIAUKw4ogRdoDUQxZyH
 iT4DT1u7At5jSEu1/lo+VKgQICfW4thor+xpO0QZ4L/pgt4PfMnJhoWo6NrZ5VmXxHRnoPxARf
 pq0=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Dec 2022 14:42:03 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4NcpNB4d7qz1RvTr
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 14:42:02 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1671662522; x=1674254523; bh=33ydBuzuBnZFvlbDBH
 6+hF4mtGaD+zrqRMjuDlazzLE=; b=LWn9+pnzoNE1EPv1f8UhuZIOGrAvSbMFV5
 oQ9nGem6SFLzwoPLsU6Qne9lbkE38MJ8pWkfdWEWaDRmCMsyB3kQdipbNe4xvhnt
 DOESWwPz3Uoxp/H4EXz2vgvkzlutBZWmgbEMVpRWPGnYC6arLeoGDfO7RDQkpwDk
 DbOOjiyiy6G/60l5Pzxwqf0EAkHfCuVIbrRLQVY03+W5n9jc3PMVZ6d+q4IBKy9K
 bF9KjxZVLyPykhVJZyBXlPE3NZ9AQX8IPN8hSNocjRo4/HhNNj6WgP8vqgC4D7QS
 rIHpE0pDJM/mtzvML9Qr9s6tvHDyEUl3pXMZ0CnjasHKg5sUKO7Q==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id ynKLWE5ETMlM for <qemu-devel@nongnu.org>;
 Wed, 21 Dec 2022 14:42:02 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.8])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4NcpN80fKNz1RvLy;
 Wed, 21 Dec 2022 14:41:59 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bmeng@tinylab.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>
Subject: [PULL v2 43/45] hw/intc: sifive_plic: Change "priority-base" to start
 from interrupt source 0
Date: Thu, 22 Dec 2022 08:40:20 +1000
Message-Id: <20221221224022.425831-44-alistair.francis@opensource.wdc.com>
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

At present the SiFive PLIC model "priority-base" expects interrupt
priority register base starting from source 1 instead source 0,
that's why on most platforms "priority-base" is set to 0x04 except
'opentitan' machine. 'opentitan' should have set "priority-base"
to 0x04 too.

Note the irq number calculation in sifive_plic_{read,write} is
correct as the codes make up for the irq number by adding 1.

Let's simply update "priority-base" to start from interrupt source
0 and add a comment to make it crystal clear.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Message-Id: <20221211030829.802437-14-bmeng@tinylab.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/riscv/microchip_pfsoc.h | 2 +-
 include/hw/riscv/shakti_c.h        | 2 +-
 include/hw/riscv/sifive_e.h        | 2 +-
 include/hw/riscv/sifive_u.h        | 2 +-
 include/hw/riscv/virt.h            | 2 +-
 hw/intc/sifive_plic.c              | 5 +++--
 6 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/include/hw/riscv/microchip_pfsoc.h b/include/hw/riscv/microc=
hip_pfsoc.h
index 577efad0c4..e65ffeb02d 100644
--- a/include/hw/riscv/microchip_pfsoc.h
+++ b/include/hw/riscv/microchip_pfsoc.h
@@ -155,7 +155,7 @@ enum {
=20
 #define MICROCHIP_PFSOC_PLIC_NUM_SOURCES        187
 #define MICROCHIP_PFSOC_PLIC_NUM_PRIORITIES     7
-#define MICROCHIP_PFSOC_PLIC_PRIORITY_BASE      0x04
+#define MICROCHIP_PFSOC_PLIC_PRIORITY_BASE      0x00
 #define MICROCHIP_PFSOC_PLIC_PENDING_BASE       0x1000
 #define MICROCHIP_PFSOC_PLIC_ENABLE_BASE        0x2000
 #define MICROCHIP_PFSOC_PLIC_ENABLE_STRIDE      0x80
diff --git a/include/hw/riscv/shakti_c.h b/include/hw/riscv/shakti_c.h
index daf0aae13f..539fe1156d 100644
--- a/include/hw/riscv/shakti_c.h
+++ b/include/hw/riscv/shakti_c.h
@@ -65,7 +65,7 @@ enum {
 #define SHAKTI_C_PLIC_NUM_SOURCES 28
 /* Excluding Priority 0 */
 #define SHAKTI_C_PLIC_NUM_PRIORITIES 2
-#define SHAKTI_C_PLIC_PRIORITY_BASE 0x04
+#define SHAKTI_C_PLIC_PRIORITY_BASE 0x00
 #define SHAKTI_C_PLIC_PENDING_BASE 0x1000
 #define SHAKTI_C_PLIC_ENABLE_BASE 0x2000
 #define SHAKTI_C_PLIC_ENABLE_STRIDE 0x80
diff --git a/include/hw/riscv/sifive_e.h b/include/hw/riscv/sifive_e.h
index 9e58247fd8..b824a79e2d 100644
--- a/include/hw/riscv/sifive_e.h
+++ b/include/hw/riscv/sifive_e.h
@@ -89,7 +89,7 @@ enum {
  */
 #define SIFIVE_E_PLIC_NUM_SOURCES 53
 #define SIFIVE_E_PLIC_NUM_PRIORITIES 7
-#define SIFIVE_E_PLIC_PRIORITY_BASE 0x04
+#define SIFIVE_E_PLIC_PRIORITY_BASE 0x00
 #define SIFIVE_E_PLIC_PENDING_BASE 0x1000
 #define SIFIVE_E_PLIC_ENABLE_BASE 0x2000
 #define SIFIVE_E_PLIC_ENABLE_STRIDE 0x80
diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
index 8f63a183c4..e680d61ece 100644
--- a/include/hw/riscv/sifive_u.h
+++ b/include/hw/riscv/sifive_u.h
@@ -158,7 +158,7 @@ enum {
=20
 #define SIFIVE_U_PLIC_NUM_SOURCES 54
 #define SIFIVE_U_PLIC_NUM_PRIORITIES 7
-#define SIFIVE_U_PLIC_PRIORITY_BASE 0x04
+#define SIFIVE_U_PLIC_PRIORITY_BASE 0x00
 #define SIFIVE_U_PLIC_PENDING_BASE 0x1000
 #define SIFIVE_U_PLIC_ENABLE_BASE 0x2000
 #define SIFIVE_U_PLIC_ENABLE_STRIDE 0x80
diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index e1ce0048af..3407c9e8dd 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -98,7 +98,7 @@ enum {
 #define VIRT_IRQCHIP_MAX_GUESTS_BITS 3
 #define VIRT_IRQCHIP_MAX_GUESTS ((1U << VIRT_IRQCHIP_MAX_GUESTS_BITS) - =
1U)
=20
-#define VIRT_PLIC_PRIORITY_BASE 0x04
+#define VIRT_PLIC_PRIORITY_BASE 0x00
 #define VIRT_PLIC_PENDING_BASE 0x1000
 #define VIRT_PLIC_ENABLE_BASE 0x2000
 #define VIRT_PLIC_ENABLE_STRIDE 0x80
diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
index 1edeb1e1ed..1a792cc3f5 100644
--- a/hw/intc/sifive_plic.c
+++ b/hw/intc/sifive_plic.c
@@ -140,7 +140,7 @@ static uint64_t sifive_plic_read(void *opaque, hwaddr=
 addr, unsigned size)
     SiFivePLICState *plic =3D opaque;
=20
     if (addr_between(addr, plic->priority_base, plic->num_sources << 2))=
 {
-        uint32_t irq =3D ((addr - plic->priority_base) >> 2) + 1;
+        uint32_t irq =3D (addr - plic->priority_base) >> 2;
=20
         return plic->source_priority[irq];
     } else if (addr_between(addr, plic->pending_base, plic->num_sources =
>> 3)) {
@@ -187,7 +187,7 @@ static void sifive_plic_write(void *opaque, hwaddr ad=
dr, uint64_t value,
     SiFivePLICState *plic =3D opaque;
=20
     if (addr_between(addr, plic->priority_base, plic->num_sources << 2))=
 {
-        uint32_t irq =3D ((addr - plic->priority_base) >> 2) + 1;
+        uint32_t irq =3D (addr - plic->priority_base) >> 2;
=20
         if (((plic->num_priorities + 1) & plic->num_priorities) =3D=3D 0=
) {
             /*
@@ -428,6 +428,7 @@ static Property sifive_plic_properties[] =3D {
     /* number of interrupt sources including interrupt source 0 */
     DEFINE_PROP_UINT32("num-sources", SiFivePLICState, num_sources, 1),
     DEFINE_PROP_UINT32("num-priorities", SiFivePLICState, num_priorities=
, 0),
+    /* interrupt priority register base starting from source 0 */
     DEFINE_PROP_UINT32("priority-base", SiFivePLICState, priority_base, =
0),
     DEFINE_PROP_UINT32("pending-base", SiFivePLICState, pending_base, 0)=
,
     DEFINE_PROP_UINT32("enable-base", SiFivePLICState, enable_base, 0),
--=20
2.38.1


