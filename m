Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC55430DF2
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 04:43:59 +0200 (CEST)
Received: from localhost ([::1]:53478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcId4-0002El-Fl
	for lists+qemu-devel@lfdr.de; Sun, 17 Oct 2021 22:43:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=918244500=alistair.francis@opensource.wdc.com>)
 id 1mcIYz-0004V3-UQ
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 22:39:45 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:39495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=918244500=alistair.francis@opensource.wdc.com>)
 id 1mcIYy-0006VR-5u
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 22:39:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1634524784; x=1666060784;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=I/kOVIVdvAiZLWeXZLafi4U1Nbb8L8qJl11aUdhkU9k=;
 b=UusUF2kN/VDHDE8mWcE6RpaWvWLT156PoVLzWVvucQrS+6ptUVjRpuKv
 MObMzQzsAyDHtrbmSIQHd38bD8GSXT6qDiGQL1kurGxRt79khbhtvXaqN
 TLnQ0z31ovvD5QMJWQ3TdYSXR+dTnuyU2023suwjAB3tReSuAv9SJguzw
 ZkvIdrZ5XikNSOUnv+70khQfJLdsyQc3poU8eh9r4D6wLy59syuhn4gMX
 5Wl2IW6rWB22ZWuJjfDTeQaXH43QaQYd8gFOulHdtHK9netiLgQECXZNf
 VSvc7qYu4T3JGAIPx6ZEGfQ9KnGW3C8eEzG+rcOXWC+XjYNmktnuyhO1e w==;
X-IronPort-AV: E=Sophos;i="5.85,381,1624291200"; d="scan'208";a="184083900"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 18 Oct 2021 10:39:40 +0800
IronPort-SDR: yxtawCM2VuFVYrDbHYPyeoPktaGP6Tg+DVSBSEvasY/c8AUWTIkyHttHdWgS3Y62nP5+rP2J4m
 hxDmJblaLzGRCeAZ5LU6ChPcXbDP10E4IQpV7DcgWa5TlgsvuBk5l+O2AO1rg7d+k3OQGZTRMm
 ymQbkjgfxDSriDy4sTzu9WRM61qDHXP68MxTkqoYrL0cp0jPXpX+4c2GK9MYNxZjyMfa95lEnb
 DIT1YjRQ11mPMACC14676n3RAq9DVff291bWwo1dG+MNZ+FB/CbsWZKHkdgXTEWyFdD3mCMLn2
 V9V8cwNb5Hy0r8p8o+UG2Kgs
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2021 19:15:19 -0700
IronPort-SDR: hJLb/APu+rXzvxa70HeNDimWXNzP1bVwzvIJ1W+TloPwkXdcYv6g6mJFRyMPCVEA1T7ZyOHBJk
 hmQG5XShnj+N7Lod/phcVTih0ffJI1JnYimYBpmA20vWs+zonAnnKhRB64VD2ULO/JKyN633EP
 fZhBa33fXl5ytfm+hlnsjCwiA3wZpNlggoIM8gFgmoL1FjozQRTy+t5pX/MzwGk1pigwFBGmuW
 7klAp4u++cqXayt0nD6OOL4iEOWxjR7OuBIU44B/nmAg9D3lrIEKW16+nhCTjJhMypW3RNDoO0
 lXs=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2021 19:39:40 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HXh0p6qPGz1Rvm1
 for <qemu-devel@nongnu.org>; Sun, 17 Oct 2021 19:39:38 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1634524778; x=1637116779; bh=I/kOVIVdvAiZLWeXZL
 afi4U1Nbb8L8qJl11aUdhkU9k=; b=n705YXXpEVpS+W0qF91fqmFTiNaqipB9cq
 KiBgR0jQGkX/Dp0RjluQQMytTbmyGvPZNmr/olnCZTtuEODTvRWCJTY4TLKVL1NJ
 CCeDtamOGBWUmWmIig9JtA+wbopooVGMG8y8LI/CGgCMZI5/gSNF/Dixx847ta7g
 7O7ocZ8yFncvvkV6brRr/3RKyCeRxab4r31MxY/eOEvMctV5H9qyoUVv+Paf47IS
 sgnpVs/kKPaSuMylzGWFIKEF4n+8yGJVJZJUYUFw+2b4Gig5qFoAQNvFGGavgjDs
 gjtFv4+7bmeN+WeGZodorqEFfZJnO733sMfY4h59z3T+hB4bjvgw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id jXYGq0VUnSNq for <qemu-devel@nongnu.org>;
 Sun, 17 Oct 2021 19:39:38 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.38])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HXh0j58rPz1RvlJ;
 Sun, 17 Oct 2021 19:39:33 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v1 4/9] hw/intc: sifive_plic: Cleanup the realize function
Date: Mon, 18 Oct 2021 12:39:26 +1000
Message-Id: <b94c098cb221e744683349b1ac794c23102ef471.1634524691.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <18b1b681b0f8dd2461e819d1217bf0b530812680.1634524691.git.alistair.francis@wdc.com>
References: <18b1b681b0f8dd2461e819d1217bf0b530812680.1634524691.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=918244500=alistair.francis@opensource.wdc.com;
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

From: Alistair Francis <alistair.francis@wdc.com>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/intc/sifive_plic.c | 45 +++++++++++++++++++++++--------------------
 1 file changed, 24 insertions(+), 21 deletions(-)

diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
index f0e2799efc..d77a5ced23 100644
--- a/hw/intc/sifive_plic.c
+++ b/hw/intc/sifive_plic.c
@@ -422,35 +422,38 @@ static void sifive_plic_irq_request(void *opaque, i=
nt irq, int level)
=20
 static void sifive_plic_realize(DeviceState *dev, Error **errp)
 {
-    SiFivePLICState *plic =3D SIFIVE_PLIC(dev);
+    SiFivePLICState *s =3D SIFIVE_PLIC(dev);
     int i;
=20
-    memory_region_init_io(&plic->mmio, OBJECT(dev), &sifive_plic_ops, pl=
ic,
-                          TYPE_SIFIVE_PLIC, plic->aperture_size);
-    parse_hart_config(plic);
-    plic->bitfield_words =3D (plic->num_sources + 31) >> 5;
-    plic->num_enables =3D plic->bitfield_words * plic->num_addrs;
-    plic->source_priority =3D g_new0(uint32_t, plic->num_sources);
-    plic->target_priority =3D g_new(uint32_t, plic->num_addrs);
-    plic->pending =3D g_new0(uint32_t, plic->bitfield_words);
-    plic->claimed =3D g_new0(uint32_t, plic->bitfield_words);
-    plic->enable =3D g_new0(uint32_t, plic->num_enables);
-    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &plic->mmio);
-    qdev_init_gpio_in(dev, sifive_plic_irq_request, plic->num_sources);
-
-    plic->s_external_irqs =3D g_malloc(sizeof(qemu_irq) * plic->num_hart=
s);
-    qdev_init_gpio_out(dev, plic->s_external_irqs, plic->num_harts);
-
-    plic->m_external_irqs =3D g_malloc(sizeof(qemu_irq) * plic->num_hart=
s);
-    qdev_init_gpio_out(dev, plic->m_external_irqs, plic->num_harts);
+    memory_region_init_io(&s->mmio, OBJECT(dev), &sifive_plic_ops, s,
+                          TYPE_SIFIVE_PLIC, s->aperture_size);
+    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->mmio);
+
+    parse_hart_config(s);
+
+    s->bitfield_words =3D (s->num_sources + 31) >> 5;
+    s->num_enables =3D s->bitfield_words * s->num_addrs;
+    s->source_priority =3D g_new0(uint32_t, s->num_sources);
+    s->target_priority =3D g_new(uint32_t, s->num_addrs);
+    s->pending =3D g_new0(uint32_t, s->bitfield_words);
+    s->claimed =3D g_new0(uint32_t, s->bitfield_words);
+    s->enable =3D g_new0(uint32_t, s->num_enables);
+
+    qdev_init_gpio_in(dev, sifive_plic_irq_request, s->num_sources);
+
+    s->s_external_irqs =3D g_malloc(sizeof(qemu_irq) * s->num_harts);
+    qdev_init_gpio_out(dev, s->s_external_irqs, s->num_harts);
+
+    s->m_external_irqs =3D g_malloc(sizeof(qemu_irq) * s->num_harts);
+    qdev_init_gpio_out(dev, s->m_external_irqs, s->num_harts);
=20
     /* We can't allow the supervisor to control SEIP as this would allow=
 the
      * supervisor to clear a pending external interrupt which will resul=
t in
      * lost a interrupt in the case a PLIC is attached. The SEIP bit mus=
t be
      * hardware controlled when a PLIC is attached.
      */
-    for (i =3D 0; i < plic->num_harts; i++) {
-        RISCVCPU *cpu =3D RISCV_CPU(qemu_get_cpu(plic->hartid_base + i))=
;
+    for (i =3D 0; i < s->num_harts; i++) {
+        RISCVCPU *cpu =3D RISCV_CPU(qemu_get_cpu(s->hartid_base + i));
         if (riscv_cpu_claim_interrupts(cpu, MIP_SEIP) < 0) {
             error_report("SEIP already claimed");
             exit(1);
--=20
2.31.1


