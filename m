Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7764881C7
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 07:09:45 +0100 (CET)
Received: from localhost ([::1]:44360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n64vA-0005eQ-Cz
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 01:09:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=000118587=alistair.francis@opensource.wdc.com>)
 id 1n64dY-0007t4-Ho
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 00:51:40 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:46424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=000118587=alistair.francis@opensource.wdc.com>)
 id 1n64dW-0006jY-Dp
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 00:51:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1641621090; x=1673157090;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=A/4PPketQ1bmTcCFwhpLKb0+sGJY3yC/Flk12EP9sxo=;
 b=lj5yikIYwJjrUHOfslyJ6fk05EVrttx9QPuAzEk0Qc3FwFjqTM3BR84v
 huwcvEfkxsOU8KaXActPeSRpr0tDmAkhvc19KM7nc2uZtx9RPcKQb+nzH
 dltvz+BrayFethcsdyVo7SI35Mh8CpP/I1Xwb/XdsOQ4V2zwWBndB7PtC
 NMuXjkl4UM7qnBAcumxdxpGU7wc3rRxZpAYNkS43lq/zAzt3llaPmK4Qt
 akW3eHj29EyfymW3yNGEcDQzLvcRwpQ8R/f/OILxlvwnJVOSKKgeKT6ep
 /1XmLgpSP0yXMSDqJ7ivzXF1p9mOfFFYDRVJXvUqZ7BcDPNcRTDmZX6oD A==;
X-IronPort-AV: E=Sophos;i="5.88,272,1635177600"; d="scan'208";a="294027336"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 08 Jan 2022 13:51:24 +0800
IronPort-SDR: N2YFLhP0xuM9TtRrQD/deJqSjWbVQADHmBTOV/sGiKRwoKVwcHULVe3HQQ+4BZP1cETXC+ElOm
 O27lwSNo3V8qlsnNZWPD1WT+qHpT3ZwOEVmo4qD+DZRMSWZgZAmIm1N/F7oPLTE0rYSM+fLn5t
 g1Zr47c/TEk/GN9xxUuzJ00nVIhVdW0VSSUmEZqTR1ra46nOwuN+7QnHS4RtvMSG/PJ9RX3WXg
 KtCG1H2xLOLh95QqsdtO7e244uTkpxSiceY++GkPJBFz7Wrl27zlYpImwNu3NJvmLBvDcLAAvZ
 vKH4xwO97I0RcI4zasNQh9lF
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 21:25:12 -0800
IronPort-SDR: cV+kOaM85nXOZ3Qwn4XgJEdcw43G+NGoLL6Yf+Qb2SKy6KG9TUHdcN0rTTFBRm8X05sAKWzhlV
 RIPk/Mvh35V7NXJD/OLvY7mKWDSmAIIFCF21b17UWXF8ts4R9POK6dfL53zntpKLwX/bABRdYr
 wEJ+5pfYbgRzsfvAfvGKASd8EO8l+wwc83Sdee7A2rgk81T4DAV+XDPocMU0TB9tFgBcyU23U3
 7g6uAdqBwe6qcJjmeXleSW56N7tPj0ldfLYJNKpwWV1vqe8G7wHTu1JeMqw6AwkBTCxhdoJYRi
 IUQ=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 21:51:25 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JW8ND3q2Bz1VSkc
 for <qemu-devel@nongnu.org>; Fri,  7 Jan 2022 21:51:24 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1641621084; x=1644213085; bh=A/4PPke
 tQ1bmTcCFwhpLKb0+sGJY3yC/Flk12EP9sxo=; b=S0BuP9+EGv1ww+x9oWtBow9
 YHqNLGWH7kEc2G1eexohzDZdwfozVx4mTRLY05qQj4hAN9SgZ+dVOJszijxBrM+4
 GIZNxsVwlakiF57szHHW1JBKSDrhO7ejeQQqTZhuOhVzZIU1GohZOXXcIYPdtuV7
 Hri+x7q1bwb2SzbMgI1SAIr8DoVNpF3x/DfCvvPCyRKOBWOMNDbmo7+mQWy7cGel
 nzUDgA9ouEnxA/3uDDDjLAfakjcDBGhLo44Jv/dqbB3SJMIK/vb4CQAJSs6fRCC+
 F0A6cvNns0ko5CP2ms6KxtEQbTGiYEKox6AdyLAkcfI0dN+1A+6P9QyyOqAJbJA=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id RqWpQG7PBRVB for <qemu-devel@nongnu.org>;
 Fri,  7 Jan 2022 21:51:24 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.74])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JW8N90wQRz1VSkV;
 Fri,  7 Jan 2022 21:51:20 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PULL 04/37] hw/intc: sifive_plic: Add a reset function
Date: Sat,  8 Jan 2022 15:50:15 +1000
Message-Id: <20220108055048.3512645-5-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220108055048.3512645-1-alistair.francis@opensource.wdc.com>
References: <20220108055048.3512645-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=000118587=alistair.francis@opensource.wdc.com;
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alistair Francis <alistair.francis@wdc.com>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-Id: <20220105213937.1113508-2-alistair.francis@opensource.wdc.com=
>
---
 hw/intc/sifive_plic.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
index 877e76877c..a9f7a1bfb0 100644
--- a/hw/intc/sifive_plic.c
+++ b/hw/intc/sifive_plic.c
@@ -355,6 +355,23 @@ static const MemoryRegionOps sifive_plic_ops =3D {
     }
 };
=20
+static void sifive_plic_reset(DeviceState *dev)
+{
+    SiFivePLICState *s =3D SIFIVE_PLIC(dev);
+    int i;
+
+    memset(s->source_priority, 0, sizeof(uint32_t) * s->num_sources);
+    memset(s->target_priority, 0, sizeof(uint32_t) * s->num_addrs);
+    memset(s->pending, 0, sizeof(uint32_t) * s->bitfield_words);
+    memset(s->claimed, 0, sizeof(uint32_t) * s->bitfield_words);
+    memset(s->enable, 0, sizeof(uint32_t) * s->num_enables);
+
+    for (i =3D 0; i < s->num_harts; i++) {
+        qemu_set_irq(s->m_external_irqs[i], 0);
+        qemu_set_irq(s->s_external_irqs[i], 0);
+    }
+}
+
 /*
  * parse PLIC hart/mode address offset config
  *
@@ -501,6 +518,7 @@ static void sifive_plic_class_init(ObjectClass *klass=
, void *data)
 {
     DeviceClass *dc =3D DEVICE_CLASS(klass);
=20
+    dc->reset =3D sifive_plic_reset;
     device_class_set_props(dc, sifive_plic_properties);
     dc->realize =3D sifive_plic_realize;
     dc->vmsd =3D &vmstate_sifive_plic;
--=20
2.31.1


