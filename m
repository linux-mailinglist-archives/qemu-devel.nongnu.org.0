Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC89F430DEF
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 04:43:07 +0200 (CEST)
Received: from localhost ([::1]:49860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcIcE-0008GO-RQ
	for lists+qemu-devel@lfdr.de; Sun, 17 Oct 2021 22:43:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=918244500=alistair.francis@opensource.wdc.com>)
 id 1mcIZU-0005Mm-Sm
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 22:40:18 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:45014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=918244500=alistair.francis@opensource.wdc.com>)
 id 1mcIZT-0006yu-8q
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 22:40:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1634524814; x=1666060814;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qXXuEJsNKB4hSe2Os7fvonD6VPGNA1yIPm/Pjck+4Cs=;
 b=ROrquB95V7/k+B1aA7q7cH1llgXiVeBSR6YvEfFB16s9b9X2F1JttkGq
 Lr+dUkysZsoa5EJlzIox9pOQ6o2jzstDMIPAqYEIyYXYnErloGgbQG9TJ
 EAwQUQ6ipl87E6m/GRwoIy/fynhIXVt+QXpNElu/4q9r6eaOFrpn5R1Zr
 Mdq1lcWT/bs2TJJbVLWjQwndEVZmsTaOe4U2jEdzv3Qz58qFKLuZ4Jy1k
 n2iBu9ay0dY598pvT5I2dzQugJ4gXCn8whpu2D84KFrK6ALy1KXCV3d71
 HAI1msUjsi0+KrrZiB93+9wlcXeT6Vd64JqICl5z6WDvkkqBT4rwLmhHX g==;
X-IronPort-AV: E=Sophos;i="5.85,381,1624291200"; d="scan'208";a="183138095"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 18 Oct 2021 10:40:09 +0800
IronPort-SDR: FR19u02DWfmmuvZxibMxQOAfsMiJT1Y/0V9LI9ukrIJyDGwZsnauk+q2RQmnCqDyI6Fw+Sidj6
 uSH10OnJIkjYie0b3eThIZHk0Xn5iuSTYrroCIN5VQuKPN2m6Fb1mLAwE/NCvskefQhaBft15x
 trCc+je9TTGXnHlZu1YmXdNbAeQRvb3fyAb+dyYVADbW4bDTGrg5QELoPCeSVBGYs2Nk+qtJzj
 rjcTCoad1G260WsAEaywctsVXyJ8d7CDTBKuzo698PtoykqtipNBDxAXkX6r6pCmsKL8k39hfl
 1gqf4l/Yq3Yj/kQVRgkH+QJg
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2021 19:15:50 -0700
IronPort-SDR: 4eF45y632WmeSBXwGQ6Fofj1bq4Yc9Zt8tlqIZ8GtY4QoR0d98xk/i+fmOT/v7KffjFl8K6JPp
 BabAv9+R6KdsefgUbN58tFP87QGAA0m8AbbAOalaGmFmhXw9Jny5LwJdUjADS+553d8BbUspzW
 SNTxO/nn1GEXvPAuj8QIyAbgeZD6Q8BUND0Qp20hmfb4rIi7YH0EX2MS5XmrI+PrbHNvuik7oB
 lsOdBmjzvfrKE7ZU1MLbZPQVA68FyQJU3TKNEbcOVdcmAjW1uzykiv5ymj/U6+yYVi8ZtPQkxt
 KAc=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2021 19:40:10 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HXh1P5RZqz1Rvm1
 for <qemu-devel@nongnu.org>; Sun, 17 Oct 2021 19:40:09 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1634524809; x=1637116810; bh=qXXuEJsNKB4hSe2Os7
 fvonD6VPGNA1yIPm/Pjck+4Cs=; b=o6ce1fzaCw8WTMyy1Yd+yQdPbTnETlla4s
 A0mYEHGIeec3gjRdWCq7j7pT70n2Q7tdqqHXKqUQlv2wC8W5RwBkHMY6FLp6psfC
 svtEQjwNzNJzo5l67iHURBuoutfpQsu5UXsRRO+haKTHYZ39c7zItt8yX7KNLhZa
 mLWzNkpPJAxgT5dhWTj4nOYvLgSv3IX0faDWWI2lj7JfLN6Zz7eB3ll6aButi8qd
 kzruYlUK1SjB0EAh8UaUgmpD5iJ48Sh2gMbPqNNohZZ2NMSGbbWL16cc+lXigW36
 AgOlbz+40PmbmSMoYFjMh1L/LgcTqXsK20ydQmzAc0NgMKaE3wSg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id U2gIhbRIHXBZ for <qemu-devel@nongnu.org>;
 Sun, 17 Oct 2021 19:40:09 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.38])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HXh1J4bwZz1RvTm;
 Sun, 17 Oct 2021 19:40:04 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v1 6/9] hw/intc: sifive_plic: Add a reset function
Date: Mon, 18 Oct 2021 12:39:57 +1000
Message-Id: <8fdf384ca71009a6c3f4e684dc88940c5cd3f284.1634524691.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <18b1b681b0f8dd2461e819d1217bf0b530812680.1634524691.git.alistair.francis@wdc.com>
References: <18b1b681b0f8dd2461e819d1217bf0b530812680.1634524691.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=918244500=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 hw/intc/sifive_plic.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
index 877e76877c..5444368ad4 100644
--- a/hw/intc/sifive_plic.c
+++ b/hw/intc/sifive_plic.c
@@ -355,6 +355,18 @@ static const MemoryRegionOps sifive_plic_ops =3D {
     }
 };
=20
+static void sifive_plic_reset(DeviceState *dev)
+{
+    SiFivePLICState *s =3D SIFIVE_PLIC(dev);
+
+    memset(s->claimed, 0, sizeof(uint32_t) * s->bitfield_words);
+    memset(s->source_priority, 0, sizeof(uint32_t) * s->num_sources);
+    memset(s->target_priority, 0, sizeof(uint32_t) * s->num_addrs);
+    memset(s->pending, 0, sizeof(uint32_t) * s->bitfield_words);
+    memset(s->claimed, 0, sizeof(uint32_t) * s->bitfield_words);
+    memset(s->enable, 0, sizeof(uint32_t) * s->num_enables);
+}
+
 /*
  * parse PLIC hart/mode address offset config
  *
@@ -501,6 +513,7 @@ static void sifive_plic_class_init(ObjectClass *klass=
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


