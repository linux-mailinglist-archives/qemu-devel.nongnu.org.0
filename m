Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F99489015
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 07:17:02 +0100 (CET)
Received: from localhost ([::1]:40454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6nzJ-0000Ms-EW
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 01:17:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=002fe4623=alistair.francis@opensource.wdc.com>)
 id 1n6nwF-00078z-GQ
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 01:13:51 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:58594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=002fe4623=alistair.francis@opensource.wdc.com>)
 id 1n6nw7-0001aZ-4o
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 01:13:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1641795220; x=1673331220;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gE8Qlt3HSTD4xJo1vxOYA7bkRrLG1Gmw/VIXHoJ7Uw4=;
 b=gRkW8mFMAZdNBWSLSbSJX10hTx3KAiYll5JaedHLBWMtGVIPeKr6j3nh
 1oUhXoyCTH1d7qe6Da8g3c+weuNo7iKWWGX8zAK3sBk0W/iFE8MSpG1O7
 GuxQe52KDsBIyH2jeqBsVUBSI3kqjke2cS8Pg9KaregiuocwKo8+0xrqd
 yIsZcndq2qhC/r7nKT/UE7a6v1zKWdpohtGHYS+CinrCJsoWNfFeK1rrJ
 C7t4gzXPEBnemVi+DE7daosPOb6Ofz7nCNfbUg7E7TYH3d/IYO6t4TrH+
 T3I5QfjTp5HGh+wmyvxeSF+DnRIay0U/Vqv6JPxy1H1ecZWoVj6aWYmpc Q==;
X-IronPort-AV: E=Sophos;i="5.88,276,1635177600"; d="scan'208";a="194868373"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 10 Jan 2022 14:13:37 +0800
IronPort-SDR: GS5dEZgSFVRZSemHYA+46E542wEoN2HNWFn+YSLovYabNcX9oEHBmRu9P1rRuFK/T5QJmET8f7
 vGK5rEDou86ROxado45iVIBS+av1jx1NosSJEiyO0I76qp+OMljgO9FWT9m6hwFyFKVQDT6IRL
 NQjBQlvY6ejrrIehGDeNFwHYKubnyCPDQRF+1WOSXYItEBcj4HOIJcXonJn+Vppzu4zQEFZ22H
 7PkUeJhctmDT9Uau8ymenttCgHtfILGe/3cvyC/M3T1rrYLt4JptYervdUzI0zeGM7ceAi4LvW
 nPLG7hsrFz+QpMQo6NTcAgwl
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2022 21:46:04 -0800
IronPort-SDR: tn2yLbECz+REilRbwT7dKJkiZfc6VcUU1sIfw+al5uiQQr4WtToGAKHmr4GXotifoQci0zJ6qs
 qii4wKlTS+c94nT39RPYLwhxQ9T65DJ4DRcjxxMVwtI1aSOW3CdQp4Lq1Wd1O6X9JvwtUFautL
 i+vnWfGi300q5zb+XaTPSD0CIz4/jRJNpcmuZDa50/qjqIC+4xBy8r89Wdsm0p2msIJS96Le9K
 P9RHgNUuTsMJ79eGOuYNm79i9/yXk9TlXMAabiyQ6ohTmvRcOC5ra97fBOOIDOo3oYo5uAcl8Y
 cns=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2022 22:13:39 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JXNmz2tRmz1VSkX
 for <qemu-devel@nongnu.org>; Sun,  9 Jan 2022 22:13:39 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1641795219;
 x=1644387220; bh=gE8Qlt3HSTD4xJo1vxOYA7bkRrLG1Gmw/VIXHoJ7Uw4=; b=
 BPiZOrm4bFOv5VXevx0JdXV3vIT0WvFCH4KkMgxFHd6ayxaknlqN8zdgCGxFXz25
 hE0YoSdDm5Rcz7qdxxRG1+bGT+ePsHaHK7Rxfwfpxn7hrXPrw981QGFAVCytJ767
 8uVtb2VcS26SfQSaRRcJpm9a6nUcbykOnny7qa27lsa7TdgUnRyIk+vGbf7BAm8c
 FOUezdTOQv+rvbiHl8Uks+XxtZnEueKUv2QE1L1Xuke9frLE0oQnK0i5nRowdm73
 Rmz6vdVh/fCXRT6iEp9daLdX2PpbfK7X+meHGlrgskCBviXazOe/dtVbPP+DIEIg
 fp4wKIiQ7B8O/uQoOXGngA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id OIk0_XLCZYSo for <qemu-devel@nongnu.org>;
 Sun,  9 Jan 2022 22:13:39 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.75])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JXNmt5Qy5z1VSkW;
 Sun,  9 Jan 2022 22:13:34 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com, wilfred.mallawa@wdc.com
Subject: [PATCH 1/2] riscv: opentitan: fixup plic stride len
Date: Mon, 10 Jan 2022 16:13:20 +1000
Message-Id: <20220110061321.4040589-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=002fe4623=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

From: Wilfred Mallawa <wilfred.mallawa@wdc.com>

The following change was made to rectify incorrectly set stride length
on the PLIC. Where it should be 32bit and not 24bit (0x18). This was
discovered whilst attempting to fix a bug where a timer_interrupt was
not serviced on TockOS-OpenTitan.

Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
---
 hw/riscv/opentitan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index c531450b9f..5144845567 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -160,7 +160,7 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev=
_soc, Error **errp)
     qdev_prop_set_uint32(DEVICE(&s->plic), "priority-base", 0x00);
     qdev_prop_set_uint32(DEVICE(&s->plic), "pending-base", 0x1000);
     qdev_prop_set_uint32(DEVICE(&s->plic), "enable-base", 0x2000);
-    qdev_prop_set_uint32(DEVICE(&s->plic), "enable-stride", 0x18);
+    qdev_prop_set_uint32(DEVICE(&s->plic), "enable-stride", 32);
     qdev_prop_set_uint32(DEVICE(&s->plic), "context-base", 0x200000);
     qdev_prop_set_uint32(DEVICE(&s->plic), "context-stride", 8);
     qdev_prop_set_uint32(DEVICE(&s->plic), "aperture-size", memmap[IBEX_=
DEV_PLIC].size);
--=20
2.34.1


