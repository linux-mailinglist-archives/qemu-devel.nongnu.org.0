Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2440E40ECFD
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 23:58:42 +0200 (CEST)
Received: from localhost ([::1]:48136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQzOz-0006rB-7A
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 17:58:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=886e160e1=alistair.francis@opensource.wdc.com>)
 id 1mQzHD-0006FP-9U
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 17:50:39 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:21037)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=886e160e1=alistair.francis@opensource.wdc.com>)
 id 1mQzHB-0002kX-CI
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 17:50:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1631829036; x=1663365036;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fazfbRAA85XFEXWLe3ZxHeGhqKDIQVKOgagvao2/N5A=;
 b=eHcRfDr5LaFaqu34aVSyrjZ4b4yM03CcEJWWHPxkaFthESZnn2zRpxiL
 hijXkBIKczkyYD1mAzOkGF+J5fqDk7DoJ9uvA48vCfPXLRe6NXzMvXQTS
 EsSUO+cairsg62TGGkZSoCBkqtze+j46pDqHJSEtk+MgxsksZHWVmbIE1
 bc8bMaN3sGHqoyFdIlkrqvOp0kJx7XIaqhOCs+/6Z14N+xAihhIZGA1gf
 FotIqCGvPZmeq+xrXduoQIsAbK/sw8lSThrPigqG9PGQrOhZZotnYLhwj
 mHzAvvSsRhm9OdBdZDOdhsGNq13Ri1f/O1JtJCFrD7lx7PU1+qnSaOeWM Q==;
X-IronPort-AV: E=Sophos;i="5.85,299,1624291200"; d="scan'208";a="184998290"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 17 Sep 2021 05:50:34 +0800
IronPort-SDR: veWUDclsdS5871npTRFoQtYXKKgmhwGbdL3cM6PGYiLEocYVT0bPMJwUnYeDrBa09MV2vERjPC
 0h9GPIH5LQ6nxmJmXGNWVtEKHKWTAzJO6B/s8HlH/469x50LW9AKUMKJzEmoNRKlMqfNj0oXy1
 Ko1EXH9Dz6KutIc9hgNVntp2Sg6Ci+/9nnhhT233B5evxI+aWfPVtepC4Kq4ZPwMvk/Q6kHOIa
 EhSWOMZRDkeGOgsT4btWo2wcXKzCLX7aSGBuLXUVSFotM7IHHQ6UDQQKtbu5n4dRn4tthDG4Q1
 +ccHQ8Vd8/OstBSqRNfiwvwY
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 14:25:22 -0700
IronPort-SDR: KvfcW5N9imAlnDHGsWWsIGupt7hcj8I4pZEc9+486MiXz2qs3ztX82Z20RjightiqINDKcr1Ch
 YUB5tZ3Sb2QdR6WzBkfbD0pLIe2OHi6bdK/mYIvJEYM23u/XMro6JXLqXWe9eFKA4rBFBR5qim
 tM1YJCkNEGIw1esS9t3c/Fx54i7LrWau6g4o9sQaOc/n3nxUkqY8o5cTHcAk50rZfYyfDXgixs
 mfMXFiMJqcjvnb78xJ3H3430MNadSCCZuccqdgflMAk0+tePFxzOdQIE3v63AiaOQPYClzouCC
 6VE=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 14:50:35 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4H9W3Z6sv3z1Rwt3
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 14:50:34 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1631829034; x=1634421035; bh=fazfbRAA85XFEXWLe3
 ZxHeGhqKDIQVKOgagvao2/N5A=; b=G9nyp+T7AskC+JsS3rreuK161cW2Ayv1P7
 +JJLOWQEKronA6UYtsUDM2Aoe7jQeEQKgv5XkO30tY/XCKxucP5ms+5yIwgJUJlD
 R4xaxnZN8PrrV71pcqdSw2WxopWVKYyNk4lEkGdbVqVqrKE1XmKGyLjSmh9NoLaz
 bNFMfMaAb36ALDRktES8AYovz2uEwy5NLkZjbCupiQZc5E7dmkmuREEaHq0sV8mi
 TVm/uvwavrM+O0HUOHpARBrMv3q5tcOIn1VjLnb7bvaBejHvvhIoJCylg339Es95
 c5s8ttbTtjDKNPdEqJXjovvN79rj63N0lPVF3JtLgAPrpeZf4QcA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id I64JMDNWSk8p for <qemu-devel@nongnu.org>;
 Thu, 16 Sep 2021 14:50:34 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.23])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4H9W3T4Fdhz1Rws0;
 Thu, 16 Sep 2021 14:50:29 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Green Wan <green.wan@sifive.com>,
 Frank Chang <frank.chang@sifive.com>, Max Hsu <max.hsu@sifive.com>,
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 16/21] hw/dma: sifive_pdma: allow non-multiple transaction size
 transactions
Date: Fri, 17 Sep 2021 07:48:59 +1000
Message-Id: <20210916214904.734206-17-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210916214904.734206-1-alistair.francis@opensource.wdc.com>
References: <20210916214904.734206-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=886e160e1=alistair.francis@opensource.wdc.com;
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

From: Green Wan <green.wan@sifive.com>

Real PDMA is able to deal with non-multiple transaction size transactions=
.

The following result is PDMA tested in U-Boot on Unmatched board:

=3D> mw.l 0x3000000 0x0                      <=3D Disclaim channel 0
=3D> mw.l 0x3000000 0x1                      <=3D Claim channel 0
=3D> mw.l 0x3000004 0x11000000               <=3D wsize =3D rsize =3D 1 (=
2^1 =3D 2 bytes)
=3D> mw.q 0x3000008 0x3                      <=3D NextBytes =3D 3
=3D> mw.q 0x3000010 0x84000000               <=3D NextDestination =3D 0x8=
4000000
=3D> mw.q 0x3000018 0x84001000               <=3D NextSource =3D 0x840010=
00
=3D> mw.l 0x84000000 0x87654321              <=3D Fill test data to dst
=3D> mw.l 0x84001000 0x12345678              <=3D Fill test data to src
=3D> md.l 0x84000000 1; md.l 0x84001000 1    <=3D Dump src/dst memory con=
tents
84000000: 87654321                               !Ce.
84001000: 12345678                               xV4.
=3D> md.l 0x3000000 8                        <=3D Dump PDMA status
03000000: 00000001 11000000 00000003 00000000    ................
03000010: 84000000 00000000 84001000 00000000    ................
=3D> mw.l 0x3000000 0x3                      <=3D Set channel 0 run and c=
laim bits
=3D> md.l 0x3000000 8                        <=3D Dump PDMA status
03000000: 40000001 11000000 00000003 00000000    ...@............
03000010: 84000000 00000000 84001000 00000000    ................
=3D> md.l 0x84000000 1; md.l 0x84001000 1    <=3D Dump src/dst memory con=
tents
84000000: 87345678                               xV4.
84001000: 12345678                               xV4.

Signed-off-by: Green Wan <green.wan@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Tested-by: Max Hsu <max.hsu@sifive.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Tested-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
Message-id: 20210912130553.179501-4-frank.chang@sifive.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/dma/sifive_pdma.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/hw/dma/sifive_pdma.c b/hw/dma/sifive_pdma.c
index a8ce3e6699..d7d2c53e97 100644
--- a/hw/dma/sifive_pdma.c
+++ b/hw/dma/sifive_pdma.c
@@ -74,7 +74,7 @@ static void sifive_pdma_run(SiFivePDMAState *s, int ch)
     uint64_t dst =3D s->chan[ch].next_dst;
     uint64_t src =3D s->chan[ch].next_src;
     uint32_t config =3D s->chan[ch].next_config;
-    int wsize, rsize, size;
+    int wsize, rsize, size, remainder;
     uint8_t buf[64];
     int n;
=20
@@ -106,11 +106,7 @@ static void sifive_pdma_run(SiFivePDMAState *s, int =
ch)
         size =3D 6;
     }
     size =3D 1 << size;
-
-    /* the bytes to transfer should be multiple of transaction size */
-    if (bytes % size) {
-        goto error;
-    }
+    remainder =3D bytes % size;
=20
     /* indicate a DMA transfer is started */
     s->chan[ch].state =3D DMA_CHAN_STATE_STARTED;
@@ -131,6 +127,14 @@ static void sifive_pdma_run(SiFivePDMAState *s, int =
ch)
         s->chan[ch].exec_bytes -=3D size;
     }
=20
+    if (remainder) {
+        cpu_physical_memory_read(s->chan[ch].exec_src, buf, remainder);
+        cpu_physical_memory_write(s->chan[ch].exec_dst, buf, remainder);
+        s->chan[ch].exec_src +=3D remainder;
+        s->chan[ch].exec_dst +=3D remainder;
+        s->chan[ch].exec_bytes -=3D remainder;
+    }
+
     /* indicate a DMA transfer is done */
     s->chan[ch].state =3D DMA_CHAN_STATE_DONE;
     s->chan[ch].control &=3D ~CONTROL_RUN;
--=20
2.31.1


