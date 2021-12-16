Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2F7476947
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 05:56:41 +0100 (CET)
Received: from localhost ([::1]:43462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxiop-00050N-SY
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 23:56:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=977d27bfe=alistair.francis@opensource.wdc.com>)
 id 1mxin3-0002Kv-TX
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 23:54:50 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:18119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=977d27bfe=alistair.francis@opensource.wdc.com>)
 id 1mxin1-0003oX-Mx
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 23:54:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639630487; x=1671166487;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3lLEZM4gScoF01+Fu+KXzGB/NfgDsTqudT14Hm+pxMs=;
 b=Zs40abjsA5SS2YGiLEn4HfQGC7UVet1sqHY8HRRDKYGdTilvVGEFur1I
 RjBO+rGHUdR3lZgInyyQTieaU3ybqvz96RVS3Cf6fFbo+7vp0DlhkokMh
 hZuvMge4AFe3+OA/pF11UddZEslJQmL+tRd1gy7+2Ie53S8fC9YOdd3kV
 zvpWdTu96E2Mm8qzAXr8tCMo1VzEogp+L6R3KC/T0uF88yvg5kGvP7jLt
 rMWsHgu1tCoRuh3LhU3FWYdU3mXynWMrj8Ohe2K7fHbzV9SVtVE9QbNTg
 WfnSR4X1VUlsEa3fTQXMZLuWaiIyNlrrPWcok3SeG7djXIjJBcQvChJ/y Q==;
X-IronPort-AV: E=Sophos;i="5.88,210,1635177600"; d="scan'208";a="187354556"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 16 Dec 2021 12:54:44 +0800
IronPort-SDR: xb9HgVsELOLBrdO2Q9SGGbOyCsTo29JNrALudJs/xa3sGkyQ7/O3um45RISGwkP7k3Ne+mfGQY
 eH9TMaaCbW9YifBxtQl9oMBeT6zDdCC14x7ji4yzepeHcuQ5EzmP3HVQ90PfG4SCRnCRn64Ig4
 Ryj09Qxco4PlM5I2oZZQ+Lod9Ilgx6wOf7tqA20y9sV0/zfUAV3TLWT2+SgLz3UiKgaw8HzDoV
 1MluVtLaVRi67cVPccYwX0028iBNs+Y+RuCQjgkJEmHytGDQ8crJ2E/DI2gVaTBoaH6SrrRSUM
 HQg+OW2xRF6zJKLGN+JcKska
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 20:27:38 -0800
IronPort-SDR: 6+NyfkelgTustt9iMALa2R9iksBtNdVcxCWUvafmEa23YoBl2XCYM1q/Zfg4cHJvDiceq8rmVe
 fneTqEoR1NBq2ishAJKwu8ct6Gdl1KcegbSLCh+5CeJi6XLaUpyRJe0pqnOqEzd/2THUQQ6UD0
 CkG7QZGZL7c9ZwaUOC0dPUEDDV7D+1Nnhdwg02R9gNod3qRMatTkIrkFjXUkBAPT2y9c5QblDk
 JiyaH9czXIu1PX+qAB1ewD584w1E9rcc1WKLgJ3Zvg+/TL67QeLHXwLjcLVeGEyOICsxm83jnd
 ndg=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 20:54:45 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JF0CR6H67z1Rwvd
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 20:54:43 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639630483; x=1642222484; bh=3lLEZM4gScoF01+Fu+
 KXzGB/NfgDsTqudT14Hm+pxMs=; b=ZqJs7pBl+ppXh5r6N+asKBA/UtqKHGMx72
 XTIWpwSdoi3dj3tSzoSG2Z0lBWdJfkv8meE0UZCITcmeFmhvVz/wWBpVurktwp00
 sLpCFBIrD0AbdpTCBTOC15wi34YQSmlLROUxkritHTlSjG4l0mBHp4zezp6a+oRd
 luKuKeQo2wQ4TENd/z51Zujb4VUTCAlRfvEi+FOw7TFFUqugOfZ3/9NUlf5ZS9V7
 8eHdqaKg7EdJ477ZaZp1bYGg0CFnKQdNdYtp2nNs/8DDCpQWSajbBR4Gir5iHWPH
 0/GAkwRrwPzBzH/PcP2LrEERNzvYx9oVgOiPz5uKhmHQYmNZmmIg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 592qgeSKw3Hk for <qemu-devel@nongnu.org>;
 Wed, 15 Dec 2021 20:54:43 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.66])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JF0CL6BDLz1RtVG;
 Wed, 15 Dec 2021 20:54:38 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, alistair23@gmail.com,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, bmeng.cn@gmail.com
Subject: [PATCH v2 1/9] hw/intc: sifive_plic: Add a reset function
Date: Thu, 16 Dec 2021 14:54:19 +1000
Message-Id: <20211216045427.757779-2-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211216045427.757779-1-alistair.francis@opensource.wdc.com>
References: <20211216045427.757779-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=977d27bfe=alistair.francis@opensource.wdc.com;
 helo=esa4.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


