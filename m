Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2F44378A4
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 16:03:12 +0200 (CEST)
Received: from localhost ([::1]:49618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdv8Z-00084H-Jg
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 10:03:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9222bbd82=alistair.francis@opensource.wdc.com>)
 id 1mdunK-0002yD-Tp
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 09:41:15 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:39739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9222bbd82=alistair.francis@opensource.wdc.com>)
 id 1mdunI-0001jp-NN
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 09:41:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1634910071; x=1666446071;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LDtzvFTXogtSDklUC9GZ7SxOxa/2dHjq0OoxLJZf4cs=;
 b=nHkhgu09wx3v15mATT/7drvZ9UcOOk52QdKcEpag/g6zglJwAZw/K3pc
 kEV6w4AB7SdpX/6Anzg1jwXBoOTqycJYW+uvf5YtualABNwffJeNlQUsY
 0nJo7//8RkorbWMOhHSdwgqwwzG7oS49cm20Goc8u6AYpCQP0PuTUhk3v
 sPqxZscatoS0ByI9pKnK9NWHc5kM8Yov/pYEtD8BItglAyKfm2g1eQyV4
 yoJOzHwaxy3NT5tCgkC7RVoe/SnMLQ2YdhngoxqgjjUttfiQhxM5aKdcE
 oDq5qiXFmsCVqgkuoTMT6nktjlno2YKBkR1PFhgNKh88LWPgfq2jHZ01p g==;
X-IronPort-AV: E=Sophos;i="5.87,173,1631548800"; d="scan'208";a="183617912"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 22 Oct 2021 21:40:49 +0800
IronPort-SDR: jO1ZrvICwWtE4ihnz58NTMFiPS54/MxOUP6kX4Nh8fhj2sMAar2LL+9wgq6O+tyP9+GgnWnEfc
 tkpXpp58JxDEMjjA0tL6OsNMKIgiVkgE2SKjRtNV7LPFvkQaJbt5KP2lB0IzR0CaGJfd/btkwr
 qt7taezX5uRVdLnKkUSnrPLSLRT+cPWbvtRWaIYrYs902bU9/pjiZJZG2RsG/ZLY7ENdZN8MTL
 JoxQHIpROeaKsk0wWehZn80nYrBKn0XHWmWb5oThblLAud0k7iRQEZChXGWaL7YeIUmCDddzO2
 Dn8lUCX2LwjE7l7xWR7QYo0K
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 06:16:25 -0700
IronPort-SDR: bJFF2/TEHWj4VKKLRll+IFShKhDHppWWMqOtH2aOvZalWVDx7+TIHbzg7ynbEkqGiHsUWwXwu9
 tEHtxYTrKyMFuCEDJwECN4j7xe5iV6weizhc9o2tBHKvHBEYHKNFwZvTFboBzN2wv3/92yHPzy
 4jddvg0dvB95x7vdaxOz7j+nkA7hycIhtdcoaKGL/wK48QO2WkovbcYqKjLhq4u6mVFrXLwylN
 WTHpfXwEHkyD3YxW2V0xXiHsYJhEkGZrnYCxhaxCLrQdi9R+9LCJ/4UajIgIQAs2y5deMMVhEQ
 9y8=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 06:40:50 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HbQTt1mqcz1RtVt
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 06:40:50 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1634910049; x=1637502050; bh=LDtzvFTXogtSDklUC9
 GZ7SxOxa/2dHjq0OoxLJZf4cs=; b=Vs0oUL5cGj56NWDfpjlQobLOK3zzShVkeR
 DAyanXYnqN9HIaoiH2xSwh1CMw6czT7yzyQoUHU5AwlOISWoVuCCGs/U0JevO5RI
 F0yzBoow0nXql2rrqzZgniUREcKNFfb8PCFF1KErDU+haNfowissYi0baOfvNd3j
 varmFUg5QiyonLnVt7HfoXrxTCZJ9xLT+IYs/zsTYfbhoFtfnp4z6ehahDPflG6x
 zycVHlDs7INC2LlCn66qf1aP6aNSewGoHNwrdPgjBCsV5Pr6eXNBWz6VyGdan30e
 MwlG6bXwYAP4BjHw+4HxSaISg6dfuVhc9nkeHf3xNHEXFNEI9DuA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 0k5Lv7ZbH82W for <qemu-devel@nongnu.org>;
 Fri, 22 Oct 2021 06:40:49 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.39])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HbQTp2BfJz1RtVl;
 Fri, 22 Oct 2021 06:40:45 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PULL 26/33] hw/intc: sifive_plic: Cleanup the realize function
Date: Fri, 22 Oct 2021 23:38:05 +1000
Message-Id: <20211022133812.3972903-27-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211022133812.3972903-1-alistair.francis@opensource.wdc.com>
References: <20211022133812.3972903-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=9222bbd82=alistair.francis@opensource.wdc.com;
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
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-id: b94c098cb221e744683349b1ac794c23102ef471.1634524691.git.alist=
air.francis@wdc.com
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


