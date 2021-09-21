Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92674412F18
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 09:09:39 +0200 (CEST)
Received: from localhost ([::1]:45002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSZuM-0003i6-LX
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 03:09:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=891501f09=alistair.francis@opensource.wdc.com>)
 id 1mSZh7-0000Eb-Kt
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 02:55:58 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:44976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=891501f09=alistair.francis@opensource.wdc.com>)
 id 1mSZh5-0004iu-IA
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 02:55:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1632207355; x=1663743355;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eSLlChy6/h1DCzNMkxN/AbK2L7TZqOcL8W+8syU9+rQ=;
 b=okQITrZ6EO5uxmdIJ6tpvrRmVLCCoitol/Cy3rzBK7YCY3FAfKFWxdbr
 7vuVHDxRUamKG1KEmEwNBi1FES9PNqEGwiTfGPlQ4y5vM2gRt8AR5z6ps
 d0+3+mpP2EsIVWlHhoLJ2G3cFxdiUExhB1kMEysY3nVfMaVOdWAPXTiC2
 hDaz0rR2jlfaklVUr50hMKBLTXca42BdraXAmiCgCJK1Ps97KH/D6Rq2L
 cAxhRj52N6kYVy49mJC3siW7omcV77czARLzsnkzfH4GZJC8sEENBsh4q
 Vm2QscbjXaWLh+NhrMrWoyBFBxTu+TO48y74j8LiIA+iX18PzJ5+fCu9r w==;
X-IronPort-AV: E=Sophos;i="5.85,310,1624291200"; d="scan'208";a="179591587"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 21 Sep 2021 14:55:53 +0800
IronPort-SDR: RM8ivI3BmSBdU4Gkwk65Bub1UEl/Gy/xS0vikPcyNk4NOQbAG3dq3jAd5oSCJEJPjVCVh+uh3j
 vdSQNzSHZxKs6kT2ggyVo+tRYD1bD+BB2r5WJVMxCTVsU2RuAaZP3/izuULjJxYrje+nSAhjdM
 cS0YfykLjYFd9UommEi+ZTgPHArP68DOrfzurWXlSPl4+xenfA5PsR/rgBd0DQgU4XP+Ap5aAE
 1TJgY8ZCKe4VJiK9Q6W8FiuoTBlV3WIwj5N6XLxFoZA+EtbuC/lz4iD713m+FSyfa1+H2acr41
 md9E/vgrzA/JbcoLUUfggni7
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2021 23:30:34 -0700
IronPort-SDR: fFzoYfUR1SVzJpnyWYiofO7M1OB/wq1FD7s9YzCIwZthnpwrjK+iYg9XgH17y0J6+j33mPZVke
 lppMXZ3+RQ/JOlDfMmrqcJu2+Ao5co75xvH2sW3p672CERatvrMB5al698wlQAwJcXxTQcMXTR
 oNv08gwYjU5M7xVtS/0EtdVNfWn86ylxpOmj0CS0YR7Cm1x4NTw7ViMy6ZYIDOuxxeWxjrsBTU
 sf3YyVY0+dSwAzno1RCfhUUiYGM4rSXJwufWloeX8aUNOnZSfPW8suS9BlaU7xiYIittPdIHry
 Qfw=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2021 23:55:54 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HDByw6qJyz1Rws7
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 23:55:52 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1632207350; x=1634799351; bh=eSLlChy6/h1DCzNMkx
 N/AbK2L7TZqOcL8W+8syU9+rQ=; b=kR4UBoZmEJ3miStcoP0O3oBVWJSEpXsR/D
 3VxnpHffw2+zPwePnZxAq7bCpKTlv0eSJMjY7bb3GX9TPkxOTI3GmZVM7Z692X0h
 qWQNEHAbJCW6sEAG8Mua37K0jCHG3gHl9f0E+3/4IoJNlnlsVA7UFF3AA+wWwG1K
 IiL/fEdnOvLHlRmo3ktcm6wr/lWgFS7w9+4BOCdnrILRCMJputilFrq2gKN2B4Sq
 GSwXA6sw2tpQW5ya6K86ksU26wB/UkV8YdKlLSxrvX/xQlyRTOrHX305SfxXiaG5
 TVlvgyLGK7otQofrtsfs2O4wkiiX57monumUIsi0Gw8691CGLNiA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id z6KHVp-1JlTL for <qemu-devel@nongnu.org>;
 Mon, 20 Sep 2021 23:55:50 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.26])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HDByn3t1gz1RvlH;
 Mon, 20 Sep 2021 23:55:44 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Max Hsu <max.hsu@sifive.com>, Bin Meng <bmeng.cn@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 15/21] hw/dma: sifive_pdma: claim bit must be set before DMA
 transactions
Date: Tue, 21 Sep 2021 16:54:06 +1000
Message-Id: <20210921065412.312381-16-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210921065412.312381-1-alistair.francis@opensource.wdc.com>
References: <20210921065412.312381-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=891501f09=alistair.francis@opensource.wdc.com;
 helo=esa4.hgst.iphmx.com
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

Real PDMA must have Control.claim bit to be set before
Control.run bit is set to start any DMA transactions.
Otherwise nothing will be transferred.

The following result is PDMA tested in U-Boot on Unmatched board:

=3D> mw.l 0x3000000 0x0                      <=3D Disclaim channel 0
                                              (Channel 0 is not claimed)
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
03000000: 00000000 55000000 00000002 00000000    .......U........
03000010: 84000000 00000000 84001000 00000000    ................
=3D> mw.l 0x3000000 0x3                      <=3D Set channel 0 run and c=
laim bits
=3D> md.l 0x3000000 8                        <=3D Dump PDMA status
03000000: 00000001 66000000 00000000 00000000    .......f........
03000010: 00000000 00000000 00000000 00000000    ................
=3D> md.l 0x84000000 1; md.l 0x84001000 1    <=3D Dump src/dst memory con=
tents
84000000: 87654321                               !Ce.
84001000: 12345678                               xV4.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Tested-by: Max Hsu <max.hsu@sifive.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Tested-by: Bin Meng <bmeng.cn@gmail.com>
Message-id: 20210912130553.179501-3-frank.chang@sifive.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/dma/sifive_pdma.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/dma/sifive_pdma.c b/hw/dma/sifive_pdma.c
index d92e27dfdc..a8ce3e6699 100644
--- a/hw/dma/sifive_pdma.c
+++ b/hw/dma/sifive_pdma.c
@@ -252,6 +252,15 @@ static void sifive_pdma_write(void *opaque, hwaddr o=
ffset,
=20
         s->chan[ch].control =3D value;
=20
+        /*
+         * If channel was not claimed before run bit is set,
+         * DMA won't run.
+         */
+        if (!claimed) {
+            s->chan[ch].control &=3D ~CONTROL_RUN;
+            return;
+        }
+
         if (value & CONTROL_RUN) {
             sifive_pdma_run(s, ch);
         }
--=20
2.31.1


