Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C63A240ED10
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 00:03:38 +0200 (CEST)
Received: from localhost ([::1]:60190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQzTl-0006dB-Td
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 18:03:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=886e160e1=alistair.francis@opensource.wdc.com>)
 id 1mQzHM-0006hu-7N
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 17:50:48 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:57929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=886e160e1=alistair.francis@opensource.wdc.com>)
 id 1mQzHJ-0002rV-6W
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 17:50:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1631829044; x=1663365044;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CafDIZfOhoTiZSYGDtKIWyAk5qAT60BGAU38ssKl+R8=;
 b=HydhyCfkZLoldr/qEXHOQXvzTe4N7wnPvGXnu6Z4jlHG9QSwvpQ26e+f
 WWl1Z8CbXUCNAJjFsw/Uzmg7ohR8sLOPkLTkVLkVHpRs0dvVpc1p30Iun
 voXxZKvUsHs39jzwK+DveL338HIjkr9UTnM5LE9oMmJp1C7vpo89HY9sR
 VMFbthu+KyBsUk5ANiBfQv90WSNQsBLyVVNDkJbguc6+NCqUeuqy+3W6p
 GCZKoT5wrQ2kPj5IDJrXZlacc1fd04p3j1BR0zbR8w67wGW353QHyI4Qm
 B8GioD+hImUsVjQfL9zKuxCviUNzXDHq1ohmLRL0A/aXfvVkTtiZnGQUM g==;
X-IronPort-AV: E=Sophos;i="5.85,299,1624291200"; d="scan'208";a="284004754"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 17 Sep 2021 05:50:41 +0800
IronPort-SDR: YSQPiXZLmR7lcYkNUrZrvrNta+sPKx7teCNV9WYgscQy9xTPjgl9A8LbltkcTkmlxLRahJu2t3
 v6MbldslAZYNo6aJGZLr17402ZmAVlLOGRFsVDWHVRWY85ht62RacKustr50hn6Ga2swQ+dUOi
 JJobpA+X2OxnfDeWihXpJn7zYuuEQx4MqI9Rk/+s8f7JIvIAdSDbuxXolsg//8o+W2ARxQcDuK
 dQGk0fh+lI4sZdsKmyDdANvmUAKhPaMkJU2/ZeVGMLIUtJA+j63DitZdX0LM0p+/GyKqRmUGis
 JM4eTM1y/i1ZUMO4dSl1fNhW
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 14:25:29 -0700
IronPort-SDR: WMPsg1GSwyZhDCEQOtTiTYmLXqJ42JueQ8ygrQN8fhZ1te+Ushjgb+bN5Uz0cNcU5+eEbgqSDj
 osCcVcR86OUT2uaJ9+8SCm+SVoAmgW4KFZcvI2yQ8Gx4ipiByqOghnBXCMiu+S6ej/zGzGiV7p
 q4HoZu5AwJDw52zXmWDWewvtlDdCFHp1BiOX5+TjMQxMFs+EuUCPoULLlzZ9glfLW8o67ZgWzb
 CAjoqHt8KNgihk693OwR0R5h0HuYtnAkg3XpcTsFzjuveC8PoYqqFq1BTyLync9w4e+Yh+EmQY
 QDk=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 14:50:42 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4H9W3j1xjkz1RwsF
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 14:50:41 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1631829039; x=1634421040; bh=CafDIZfOhoTiZSYGDt
 KIWyAk5qAT60BGAU38ssKl+R8=; b=E8Gow1l+TsvhDHwzR2/N54yzXYAYfdji7W
 7j9yrX5Iy4n4d22dblYf9HHbHRwP9WRBgHkdfkqtltYK4zckOGsjeuUM99JwKlJF
 d8R8Ezw5npL3UFxYLWDZ5QXbfHn8m9yYBdfd96hAEI87SwYjXjkGdorr2bLfGnXK
 cuSSutoHbQyVJk1BcyGG31pHgIkudrpx8hPOFnVn01N3tA6O778RNPL0/sb2h9cR
 3iTy4NHvocVytn2jmTcyZUfwe7N9/Wm2bTYdK1dg+2KnMPCwAP/6NSE8TufpFWmO
 cQ5Iu9Vi/ZPuL9TFqWLLgIk1t7V908JGeHNNdfZXBxnMa8blncNg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id k9GnsoZLdNgR for <qemu-devel@nongnu.org>;
 Thu, 16 Sep 2021 14:50:39 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.23])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4H9W3b2JJHz1Rws0;
 Thu, 16 Sep 2021 14:50:34 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Max Hsu <max.hsu@sifive.com>, Bin Meng <bmeng.cn@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 17/21] hw/dma: sifive_pdma: don't set Control.error if 0 bytes
 to transfer
Date: Fri, 17 Sep 2021 07:49:00 +1000
Message-Id: <20210916214904.734206-18-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210916214904.734206-1-alistair.francis@opensource.wdc.com>
References: <20210916214904.734206-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=886e160e1=alistair.francis@opensource.wdc.com;
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


