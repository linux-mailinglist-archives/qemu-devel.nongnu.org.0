Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4518E46CDEC
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Dec 2021 07:53:03 +0100 (CET)
Received: from localhost ([::1]:53438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muqp3-0005U5-MJ
	for lists+qemu-devel@lfdr.de; Wed, 08 Dec 2021 01:53:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=96943765b=alistair.francis@opensource.wdc.com>)
 id 1muqfi-0002A2-JU
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 01:43:23 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:44140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=96943765b=alistair.francis@opensource.wdc.com>)
 id 1muqfg-00068H-92
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 01:43:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1638945799; x=1670481799;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=10EfuXqzKV2pcvz6aeyW2r/ek/x/2+By+o0jqscLmuc=;
 b=i4PaxdLaOnMgr+Wfr82PF5zbm5PtDDRma5ddn56vqx7A/dLaBDHgVQpQ
 Z/KYat2lMq8TifgjfIAUGSGIg7Ka+z6Z+eSeRinzBlls6LjWmr7mcyCAY
 CT4Az3Lag5TKcZzA5BDzRqN5Q5MkFV/60hhvSf1PBK2n16lOOzGtid2oi
 4UyyTKCVfeH0IRDv75XFd706kNzrX8xxNadlv2kmYdjCl3ORMDL0KrnzZ
 d9iQ7LmqHV+khG+r6j7RLtnzXXp3AmpNI1DUvUWzSgvdOrIcShZpdJPZM
 xqdEEqWgzeZ7Etb9KcQK+Sxw4Q/AVrkIiPAiYLW5C4dnOlYWRwv0Svoy7 A==;
X-IronPort-AV: E=Sophos;i="5.87,296,1631548800"; d="scan'208";a="192503595"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 08 Dec 2021 14:43:17 +0800
IronPort-SDR: ZZ9kADTIjg19JiglsWUpq2H5dwBm2PqxUR1gYKT2lY270h2xA6mInAD9vrrAAuuha51nWvZShk
 fqrA0YxVUHK+Ebsksyr9p9AtctcOloQcBjhfWch2KQej7fV5steo4BgK/tXvRD+Ff7WD30z3UH
 YyQELhpvXlVIfc5Uywx5cF94qBiedGc3szmNOf0hSHlVwraKBraCO/sJuJPsflNIZUgs8UUwTI
 o5xg2b+MSDJdIN7+AG2sMF6k+zblR9ZfyKDUC+Ao0do5WdLWYDoJtRaPPZNzVbQWYyobKbgwK6
 oIovzf1Kusz+CNlepuckeuVT
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2021 22:16:22 -0800
IronPort-SDR: dCFQ7lK93qoqeqsM81Nc2GFkpnodRliyXmJW7XCff0hO+izMIVNXMmHfKMCZU21TW/5kNfIrCC
 OtNYF8j6i7zT9eIfBB/wHuZL3d92gTl2kcCjy3fx/lCppCepd0c41XDsF89iJByicX6VYzSG09
 cB4dONvzB/52jHRbRKZZNy98Xok0+bIGuJQL24HPDaPc6STECOX4zbRapMGvUrZ7rmkVvwjpti
 xutB90B6mN0VNJjAKUokjiRCK/GE5COs4e6xK0vDsob3yLevBcgUiI9a7fxOt+PDj+IJkg1B2V
 A8A=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2021 22:43:19 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4J870Q1Kjvz1Rwnx
 for <qemu-devel@nongnu.org>; Tue,  7 Dec 2021 22:43:18 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1638945797; x=1641537798; bh=10EfuXqzKV2pcvz6ae
 yW2r/ek/x/2+By+o0jqscLmuc=; b=nmmXEScZRR8ch+vntPM145JQZX4/dRydFZ
 qqz1kJc1ahJ1IiyOagSX4V69FvHwCdkoIjEOIjRHE6Fmfjnn1V2n4ot8LhHVhUbL
 X0/VaHz36aIPQngA/GxfEM0DHl+S6e8gNLwIOLrRbJxgHgAnT2o8LxiU8QJnn6dh
 Q7mOK7OH/R4sYNCJEgTRCGO9lDalL2QLfig8EtcNGQeqxCyxfA0gT1HCyOwhLjYy
 xVScu7w0uBJhAVEQQ0pZBRpka9i/wVvPnV21A8x107YFkDuW7XYBNtSpWJavKkvl
 lyq4wGn3IesNbu7EEe+Cwid2gyc5qeixaX3cWAvddPOEeRirLUnA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id T6PrsqIFQq_b for <qemu-devel@nongnu.org>;
 Tue,  7 Dec 2021 22:43:17 -0800 (PST)
Received: from localhost.localdomain (unknown [10.225.165.65])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4J870J4TQ9z1RtVG;
 Tue,  7 Dec 2021 22:43:12 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>, alistair23@gmail.com,
 Alistair Francis <Alistair.Francis@wdc.com>, bmeng.cn@gmail.com
Subject: [PATCH 1/7] hw/intc: sifive_plic: Add a reset function
Date: Wed,  8 Dec 2021 16:42:46 +1000
Message-Id: <20211208064252.375360-2-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211208064252.375360-1-alistair.francis@opensource.wdc.com>
References: <20211208064252.375360-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=96943765b=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
---
 hw/intc/sifive_plic.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
index 877e76877c..35f097799a 100644
--- a/hw/intc/sifive_plic.c
+++ b/hw/intc/sifive_plic.c
@@ -355,6 +355,17 @@ static const MemoryRegionOps sifive_plic_ops =3D {
     }
 };
=20
+static void sifive_plic_reset(DeviceState *dev)
+{
+    SiFivePLICState *s =3D SIFIVE_PLIC(dev);
+
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
@@ -501,6 +512,7 @@ static void sifive_plic_class_init(ObjectClass *klass=
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


