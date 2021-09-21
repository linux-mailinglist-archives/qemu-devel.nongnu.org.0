Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F8A412F08
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 09:06:31 +0200 (CEST)
Received: from localhost ([::1]:36174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSZrK-0005y5-5z
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 03:06:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=891501f09=alistair.francis@opensource.wdc.com>)
 id 1mSZhH-0000ZS-Ff
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 02:56:08 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:4211)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=891501f09=alistair.francis@opensource.wdc.com>)
 id 1mSZhF-0004v9-Pj
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 02:56:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1632207364; x=1663743364;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CafDIZfOhoTiZSYGDtKIWyAk5qAT60BGAU38ssKl+R8=;
 b=FRZweEbvNrkvpSGWmNQBIRz+Mqa56fr+w07jQMJ/oIzCKl1v7d44gL1k
 ozCjsLCKV/ilUgC5vwqkNjM8J8nJ7TG3IUFNRf1CaWOW/mlbddsoo5N/u
 tjHQhO8mlJ2AFLfeaqBvvBQVGBOhh0sgmtSBWHgch6LmQWf/9C6ps23rR
 QNyskZt8ymiHBdHTf/nnRcQBVCv3Ig9Il68PhwIpSZwGN8nph3hQ6KWcq
 gTizl3GCwFhUwP4sleZV9BeKz9dk52a9c4grEfkW7uuOb6QSHm/fKflu3
 DGm53L20uNnDqzOaWCdoR4vIVUvsfFepG3HjEv3IjEeTWs3XuWXeH3bM3 g==;
X-IronPort-AV: E=Sophos;i="5.85,310,1624291200"; d="scan'208";a="180529489"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 21 Sep 2021 14:56:03 +0800
IronPort-SDR: i6j0uD+5AgP+Cr3/VxeguKHoPQ2uJUu17M41kvPZhLPxl/mVu6mHh5fEFPt+vyR0i8eVZ/oDng
 yRfvN3huTIdTOIhyFDUbhMRLtzFJazKcflR3RqSkob6Sqvs6qyl4/X1v2iOnUVwmNmgUdSSsmx
 uG6iGvX5wCibmeTfXwBssbpPYKNiT+bDTZ6wqbSYwsxxPTV+S9LIBOLPGRrYuxX+2vLRnzorLX
 8LHG9ICfjZqjcJ5g+9AVjz3xg3YfLzUOMDBuWg4pAfermCVgJUxND2l7q9MiZftUkNuzjyLBg6
 OepD6bOI4Y25esNhYabSUDmL
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2021 23:30:46 -0700
IronPort-SDR: PbkqG5SFeSyls6ETt2iBBusrKjq/vU69mQmTThDVEEnKgz96HHZz03RYVazVPaxUPIO6C7+45K
 bIxKPvRJOiOf+AOh993U3iIi6g4CJfnA9opZ+mR0tsgzZuoBDGUBtVgBQ0nHz+P+sP8MQLOYAm
 +eyUlLhgpXksR5mXDDWRSKM/7lz+PxdSdT+KPbeCDwJLJxRqxxlMUbf2eE1CbHJvqLhSpXF/Ra
 IbW8d15QJ+WV1E0WIf9RGzCI6DSXO0fsou+VBqaNlfNH3OFAO1BRR4PpscMLQ/gwsWccCgmE2n
 muA=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2021 23:56:04 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HDBz81r1kz1Rws4
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 23:56:04 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1632207363; x=1634799364; bh=CafDIZfOhoTiZSYGDt
 KIWyAk5qAT60BGAU38ssKl+R8=; b=SA0w9CxEA0AVCJi+HOTKoxTplyCAePRGdz
 HMrus1np0ASKiLixQKX9n2EXTaPuT3/nwIsQ/eHq9Wn9OLliOxHUuoW8rtQYRoaW
 8aO9HeRoqgGhsEh97Ggms6DHP9QH1Mx01rqBuitgvBpbmrwJZupuA35k1NeA5rCY
 /F+j74Igp2EKuX4dZ/igTx6Ez8jG1BKpuYLcPq5QGwB/zsIxU8EX9AcSSagdsV4x
 XkM22xk2jx1htQdqC2o3ubIiYrwG0EwnBiijRywvyB5+GmoGCgCaorEEHZkIvDZk
 hI6OHB01j7UOeSncX18lq5dt0+H/ibqLKafR9eJH8N8+gzZzsWbg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id zc8_fDsfG9xe for <qemu-devel@nongnu.org>;
 Mon, 20 Sep 2021 23:56:03 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.26])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HDBz20wpbz1RvlH;
 Mon, 20 Sep 2021 23:55:57 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Max Hsu <max.hsu@sifive.com>, Bin Meng <bmeng.cn@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 17/21] hw/dma: sifive_pdma: don't set Control.error if 0
 bytes to transfer
Date: Tue, 21 Sep 2021 16:54:08 +1000
Message-Id: <20210921065412.312381-18-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210921065412.312381-1-alistair.francis@opensource.wdc.com>
References: <20210921065412.312381-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=891501f09=alistair.francis@opensource.wdc.com;
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

From: Frank Chang <frank.chang@sifive.com>

Real PDMA doesn't set Control.error if there are 0 bytes to be
transferred. The DMA transfer is still success.

The following result is PDMA tested in U-Boot on Unmatched board:

=3D> mw.l 0x3000000 0x0                      <=3D Disclaim channel 0
=3D> mw.l 0x3000000 0x1                      <=3D Claim channel 0
=3D> mw.l 0x3000004 0x55000000               <=3D wsize =3D rsize =3D 5 (=
2^5 =3D 32 bytes)
=3D> mw.q 0x3000008 0x0                      <=3D NextBytes =3D 0
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
03000000: 00000001 55000000 00000000 00000000    .......U........
03000010: 84000000 00000000 84001000 00000000    ................
=3D> mw.l 0x3000000 0x3                      <=3D Set channel 0 run and c=
laim bits
=3D> md.l 0x3000000 8                        <=3D Dump PDMA status
03000000: 40000001 55000000 00000000 00000000    ...@...U........
03000010: 84000000 00000000 84001000 00000000    ................
=3D> md.l 0x84000000 1; md.l 0x84001000 1    <=3D Dump src/dst memory con=
tents
84000000: 87654321                               !Ce.
84001000: 12345678                               xV4.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Tested-by: Max Hsu <max.hsu@sifive.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Tested-by: Bin Meng <bmeng.cn@gmail.com>
Message-id: 20210912130553.179501-5-frank.chang@sifive.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/dma/sifive_pdma.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/dma/sifive_pdma.c b/hw/dma/sifive_pdma.c
index d7d2c53e97..b4fd40573a 100644
--- a/hw/dma/sifive_pdma.c
+++ b/hw/dma/sifive_pdma.c
@@ -80,7 +80,7 @@ static void sifive_pdma_run(SiFivePDMAState *s, int ch)
=20
     /* do nothing if bytes to transfer is zero */
     if (!bytes) {
-        goto error;
+        goto done;
     }
=20
     /*
@@ -135,11 +135,6 @@ static void sifive_pdma_run(SiFivePDMAState *s, int =
ch)
         s->chan[ch].exec_bytes -=3D remainder;
     }
=20
-    /* indicate a DMA transfer is done */
-    s->chan[ch].state =3D DMA_CHAN_STATE_DONE;
-    s->chan[ch].control &=3D ~CONTROL_RUN;
-    s->chan[ch].control |=3D CONTROL_DONE;
-
     /* reload exec_ registers if repeat is required */
     if (s->chan[ch].next_config & CONFIG_REPEAT) {
         s->chan[ch].exec_bytes =3D bytes;
@@ -147,6 +142,11 @@ static void sifive_pdma_run(SiFivePDMAState *s, int =
ch)
         s->chan[ch].exec_src =3D src;
     }
=20
+done:
+    /* indicate a DMA transfer is done */
+    s->chan[ch].state =3D DMA_CHAN_STATE_DONE;
+    s->chan[ch].control &=3D ~CONTROL_RUN;
+    s->chan[ch].control |=3D CONTROL_DONE;
     return;
=20
 error:
--=20
2.31.1


