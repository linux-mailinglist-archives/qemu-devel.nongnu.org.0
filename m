Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FBE6538E7
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 23:43:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p87mn-0000gz-A3; Wed, 21 Dec 2022 17:42:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3472792e2=alistair.francis@opensource.wdc.com>)
 id 1p87ml-0000bR-4I
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 17:42:03 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3472792e2=alistair.francis@opensource.wdc.com>)
 id 1p87mj-0000bQ-Fu
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 17:42:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1671662521; x=1703198521;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lkr40dqOmoRlHb4uKWd/0UnkaNvhnwtWV+0/s7TpnTE=;
 b=C8RPgGv2lp27L02z1k+8rAc3f3DLARpjLUz7GmMgSTMQb+RrhPoZGv7p
 v+sOHg6hWHy6NsuSG17wGkvBpwOibdpKyjEImL45sC3sckw8t12+/yuKY
 5+N2yWIe2mdEvryVyREE3AbbA0BBG8rspGbjPfrGJJTiI38TFPokMKqS1
 uQWv+NtK6LyDr1+SkiUetibI/LhUiNvAsFHVe9ljmhHYHsK3kl6VeH08g
 yUmPWVf9zNqbNAnsW+zFLOqZiDFmuHMLKgIMd7CuW3DuG5p6RWyo9X4/N
 NVaj2Nnv6UxkWxQXU7MJ921OyR3DTyo94T04r1Bsvwh55zA6wJ7jAsqhZ Q==;
X-IronPort-AV: E=Sophos;i="5.96,263,1665417600"; d="scan'208";a="323561375"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 22 Dec 2022 06:41:18 +0800
IronPort-SDR: 9IprI3Y1JIUjA8+/yFv/klfMystyEUNeVyPLjpJNA4MzRbkz6boiduB08advrtYBo7b9myW42b
 MQh0mVoMJu45l8Ev5pe3r/XLblREHTVRAzfp6eYdr6muj6HU2QX38jZR+mOH8L6RmxkvB15rq1
 ZAzW92UgFkM0RpJVBEbONqVxMNd4tyIgpE6Egy5trej6GMTlkVUiljgJBPv80oqaBScBBZWzCr
 FQVT8x5SRUTov6k7SIB/y5tfqMxicG14C2wpJ7h/3+WBfFFrIbek6iXr/Anu3znRE3DdEnaNBz
 Xhw=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Dec 2022 13:53:47 -0800
IronPort-SDR: 7y+uvs4N4RlFMnovzkYHKJLfFo45bluAa9Owr2LguG0AHdtoJwli0dzk+IvFqUVAOqoFF0aXZ8
 22Ivg0XE4NfkpEszlM8Zv1rEOzruMa4g0Vf8xmXm+cLEnPNlXPjHuJvkzjZ/y3Ekra9rvfvKEK
 Ufkal7n2+e0DEzYw8/iPYTjuXgevgS7JRV+TMJp8HwSF5zkHyNBMNp6X8NUnWEOvdqWatzEWk8
 wZqSwFMolKdgeqzavYJ+Y7eWAwIk44MmokzGAw8eRfHqSVGOVs862MJrHZU/T9n/PquN3N5zK3
 7I4=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Dec 2022 14:41:18 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4NcpML2XFGz1Rwrq
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 14:41:18 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1671662477; x=1674254478; bh=lkr40dqOmoRlHb4uKW
 d/0UnkaNvhnwtWV+0/s7TpnTE=; b=lsxG9xXV9PTwHsAEyZUHh7blMa+aPZXDkM
 I4KtZmzKKXHtNVEJ/cOY4bDeQsO2G6GjES7X4K4BF9Ag4EUW14D9smnVx4Mvp94f
 i21tg1TOIsYf9uw2m6Ljqomy7x+Ug/nmRwje8qXjppRz7OpVfjFGPC5G3uyvFXdb
 7ePAvt6y4u/uq+QxpJ550GUOuvp+LET63VD3yA45yu6ag9qVjr91l/AjdhYiKs3B
 +AnE02YO/ZldIgJaYnwkbd3HOjNE6n80yQQ6HokD2jr/2H1jxPg/sbN1IahQik5g
 jcZrl1gq5IbD3DyJtT4qDldd15gy8kwwvQvZupBlHFurZ5xmeFxA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 4kCwpIL25Lnx for <qemu-devel@nongnu.org>;
 Wed, 21 Dec 2022 14:41:17 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.8])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4NcpMJ31z1z1RvTp;
 Wed, 21 Dec 2022 14:41:16 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Jim Shu <jim.shu@sifive.com>,
 Bin Meng <bmeng@tinylab.org>, Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 24/45] hw/intc: sifive_plic: fix out-of-bound access of
 source_priority array
Date: Thu, 22 Dec 2022 08:40:01 +1000
Message-Id: <20221221224022.425831-25-alistair.francis@opensource.wdc.com>
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

From: Jim Shu <jim.shu@sifive.com>

If the number of interrupt is not multiple of 32, PLIC will have
out-of-bound access to source_priority array. Compute the number of
interrupt in the last word to avoid this out-of-bound access of array.

Signed-off-by: Jim Shu <jim.shu@sifive.com>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Message-Id: <20221127165753.30533-1-jim.shu@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/intc/sifive_plic.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
index b4949bef97..0c7696520d 100644
--- a/hw/intc/sifive_plic.c
+++ b/hw/intc/sifive_plic.c
@@ -78,6 +78,7 @@ static uint32_t sifive_plic_claimed(SiFivePLICState *pl=
ic, uint32_t addrid)
     uint32_t max_irq =3D 0;
     uint32_t max_prio =3D plic->target_priority[addrid];
     int i, j;
+    int num_irq_in_word =3D 32;
=20
     for (i =3D 0; i < plic->bitfield_words; i++) {
         uint32_t pending_enabled_not_claimed =3D
@@ -88,7 +89,16 @@ static uint32_t sifive_plic_claimed(SiFivePLICState *p=
lic, uint32_t addrid)
             continue;
         }
=20
-        for (j =3D 0; j < 32; j++) {
+        if (i =3D=3D (plic->bitfield_words - 1)) {
+            /*
+             * If plic->num_sources is not multiple of 32, num-of-irq in=
 last
+             * word is not 32. Compute the num-of-irq of last word to av=
oid
+             * out-of-bound access of source_priority array.
+             */
+            num_irq_in_word =3D plic->num_sources - ((plic->bitfield_wor=
ds - 1) << 5);
+        }
+
+        for (j =3D 0; j < num_irq_in_word; j++) {
             int irq =3D (i << 5) + j;
             uint32_t prio =3D plic->source_priority[irq];
             int enabled =3D pending_enabled_not_claimed & (1 << j);
--=20
2.38.1


