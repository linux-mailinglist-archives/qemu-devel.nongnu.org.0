Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD0E424DF2
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 09:14:09 +0200 (CEST)
Received: from localhost ([::1]:47200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYNbU-00025P-7j
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 03:14:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=907902f29=alistair.francis@opensource.wdc.com>)
 id 1mYNEi-0005Pq-UL
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 02:50:39 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:53991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=907902f29=alistair.francis@opensource.wdc.com>)
 id 1mYNEc-0007Mt-3y
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 02:50:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1633589429; x=1665125429;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BTzHRqg3KYihr5V4ei4vw2bJz+NKu62Z4H1nI+eZsMY=;
 b=VFGyz2Nv3NXXQQ0igDRIDNu8YtzG3lxbcIR9bo6ImmDUjG43HwMHVxrR
 dO9POYCb+H+yckX2uzeRgfGgwrMmqUGXH5XnfNhQIYBEnEW9sxWPQgFNV
 T6NSvhqgqJEovB5GtSwLE1WN1TCc3euMcqqX3Kt1oNj/vjBG9DLMTVVBA
 bdHKc0YrJYmVZ7l3yH0Z5oCSVyFsF6P+eeLbBYQLbTKv85kdUCoBNEFza
 et6AwHJ5lcgUrjQgkPfva7qyyiiWJLogL3SvfS9ifS4iYsOhs16GhMeSt
 yODzxt41R9ixFobkgsUeWL1BvXm4IEiMzEyn/tdZQd3H+39bfJNvN2uds w==;
X-IronPort-AV: E=Sophos;i="5.85,352,1624291200"; d="scan'208";a="293815549"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 07 Oct 2021 14:50:27 +0800
IronPort-SDR: 8ATTHI86h+NcxroBy4Q5ItQtFqnuq9ONVNf2L3TaINcXxkrUpbdsQmHx+BDHvqZoAXweDfjnYr
 WVxelBUHHj+1TrsCX/d4e0gwOmi52rJdxj3rWBQT9PHZWk1ixVLjIoITFRSxOsiPVOEx0ngkEa
 bV4qaHUETgw87pc8cltrLNTLqMIboj7R/W6nDUVcCayNfEhHCAzSsvDDqpkTyySzPK+8r5Zenx
 WzNNYvmPU+yJcOhZl+zAG+o+R5Mv3HRQoWn81aRIsIeuBEK42a7zOP33zafCGYXCa4QKW5nWdO
 r2cNmmonMomkPn3sDBqaUCJx
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 23:24:49 -0700
IronPort-SDR: h/zzGU3P6LTKrjD74OfBJuHqgdGzaCV7G6yiHKOHkBLKKbcXNqnVcxrshbcYj0F65vOd3wX+pX
 zvD7ng0T/EoNipXcULKJw9MXlWrodiAr2EXq80XYsQyJe7bC0nH8NXrNG9CkMed6TWWuwO3xRb
 G75XY8aRnx/+x7ch0IMC8J8KR9kDUhSCPyeycVdq1us2HGDJj+gmyNb4xU51pUfDbIJPRap/Nf
 NFV/BudlhdtNSd9UVx4PtUq8xX9/2jVZ+LZnkKv2aBlF8jyKIpeykNDtAJbTbKz3j/LaengST4
 fYs=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 23:50:28 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HQ25H2mjGz1RvmJ
 for <qemu-devel@nongnu.org>; Wed,  6 Oct 2021 23:50:27 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1633589425; x=1636181426; bh=BTzHRqg3KYihr5V4ei
 4vw2bJz+NKu62Z4H1nI+eZsMY=; b=uAQ92lc99dxXOlDTt+aTkhr1TAb8XAs2+/
 h3RNbagSsRISJKbztlsUMDinU+ejmciGUs2zXnEr8rKOPMQz0L91WIzPURUUQJ0z
 iDSrM0AuU5LRDFByiZCWBnE2/PcvEbb0p+aOemArnWxpfqGOUed+yWNVnIWrQPl1
 0OvMtOruSYDM4ClkDkpqi9+1FZEsHPGhOuRh6Apd4J65gaV+v4V73Er6U1OcoRJo
 WsPWQxV8hzhF/ItgDOEc6ERh3i+t1bF2mu9IYoynSY6pGHmDCoec5swpEe/vMwkP
 ZoI8tdfqQN/QAMjUQcfIIMyXwNOMiv4BOgKJIynPMD3rm6DoReOQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id Npyxsvx4OKA8 for <qemu-devel@nongnu.org>;
 Wed,  6 Oct 2021 23:50:25 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.32])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HQ2596rQSz1RvTg;
 Wed,  6 Oct 2021 23:50:20 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Bin Meng <bmeng.cn@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 25/26] hw/dma: sifive_pdma: Don't run DMA when channel is
 disclaimed
Date: Thu,  7 Oct 2021 16:47:50 +1000
Message-Id: <20211007064751.608580-26-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211007064751.608580-1-alistair.francis@opensource.wdc.com>
References: <20211007064751.608580-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=907902f29=alistair.francis@opensource.wdc.com;
 helo=esa1.hgst.iphmx.com
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

From: Bin Meng <bmeng.cn@gmail.com>

If Control.run bit is set while not preserving the Control.claim
bit, the DMA transfer shall not be started.

The following result is PDMA tested in U-Boot on Unleashed board:

=3D> mw.l 0x3000000 0x0                      <=3D Disclaim channel 0
=3D> mw.l 0x3000000 0x1                      <=3D Claim channel 0
=3D> mw.l 0x3000004 0x55000000               <=3D wsize =3D rsize =3D 5 (=
2^5 =3D 32 bytes)
=3D> mw.q 0x3000008 0x2                      <=3D NextBytes =3D 2
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
03000000: 00000001 55000000 00000002 00000000    .......U........
03000010: 84000000 00000000 84001000 00000000    ................
=3D> mw.l 0x3000000 0x2                      <=3D Set channel 0 run bit o=
nly
=3D> md.l 0x3000000 8                        <=3D Dump PDMA status
03000000: 00000000 55000000 00000002 00000000    .......U........
03000010: 84000000 00000000 84001000 00000000    ................
=3D> md.l 0x84000000 1; md.l 0x84001000 1    <=3D Dump src/dst memory con=
tents
84000000: 87654321                               !Ce.
84001000: 12345678                               xV4.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210927072124.1564129-2-bmeng.cn@gmail.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/dma/sifive_pdma.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/hw/dma/sifive_pdma.c b/hw/dma/sifive_pdma.c
index b8ec7621f3..85fe34f5f3 100644
--- a/hw/dma/sifive_pdma.c
+++ b/hw/dma/sifive_pdma.c
@@ -232,7 +232,7 @@ static void sifive_pdma_write(void *opaque, hwaddr of=
fset,
 {
     SiFivePDMAState *s =3D opaque;
     int ch =3D SIFIVE_PDMA_CHAN_NO(offset);
-    bool claimed;
+    bool claimed, run;
=20
     if (ch >=3D SIFIVE_PDMA_CHANS) {
         qemu_log_mask(LOG_GUEST_ERROR, "%s: Invalid channel no %d\n",
@@ -244,6 +244,7 @@ static void sifive_pdma_write(void *opaque, hwaddr of=
fset,
     switch (offset) {
     case DMA_CONTROL:
         claimed =3D !!(s->chan[ch].control & CONTROL_CLAIM);
+        run =3D !!(s->chan[ch].control & CONTROL_RUN);
=20
         if (!claimed && (value & CONTROL_CLAIM)) {
             /* reset Next* registers */
@@ -254,13 +255,19 @@ static void sifive_pdma_write(void *opaque, hwaddr =
offset,
             s->chan[ch].next_src =3D 0;
         }
=20
+        /* claim bit can only be cleared when run is low */
+        if (run && !(value & CONTROL_CLAIM)) {
+            value |=3D CONTROL_CLAIM;
+        }
+
         s->chan[ch].control =3D value;
=20
         /*
          * If channel was not claimed before run bit is set,
+         * or if the channel is disclaimed when run was low,
          * DMA won't run.
          */
-        if (!claimed) {
+        if (!claimed || (!run && !(value & CONTROL_CLAIM))) {
             s->chan[ch].control &=3D ~CONTROL_RUN;
             return;
         }
--=20
2.31.1


