Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D67FC40ED00
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 23:59:11 +0200 (CEST)
Received: from localhost ([::1]:49162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQzPS-0007Xp-Si
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 17:59:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=886e160e1=alistair.francis@opensource.wdc.com>)
 id 1mQzH7-000625-Jh
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 17:50:34 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:17000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=886e160e1=alistair.francis@opensource.wdc.com>)
 id 1mQzH5-0002gE-BQ
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 17:50:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1631829029; x=1663365029;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eSLlChy6/h1DCzNMkxN/AbK2L7TZqOcL8W+8syU9+rQ=;
 b=H9IRB0usno2NsSW7jaHWfCCkJFSVlOzUYe3iatDiVYyV3e1XIzQ1rxWO
 CAd4F4HWQr8uUJLy3/8pWa5N0tTHd3XcWsqGEVJQGkv0hDL9qF7m3u+f2
 D5WjHJWLa20Cl62MT6lNp8izl4NKF1W3yO2Vs/3bFMI4LA0k/DtoHv6x2
 8MtLZ4MQNIu4SC1gxNRz7EHvnAhQI3AipbnqYnUQRuvUFL40lHVfqCdYQ
 Lzwi93SROHOo0eEXw3eZHroVRRK637hVTlOJuJWTlMoRmqRXZV7eaOdxU
 Fox90nO5CyyG2mu/DamXoS3z7GhK1A3eiKaNbhvLAto3bd44+QDdymViw w==;
X-IronPort-AV: E=Sophos;i="5.85,299,1624291200"; d="scan'208";a="180215089"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 17 Sep 2021 05:50:29 +0800
IronPort-SDR: ZyoKlFIoPMgTokY5017xoc+7yJU+k50wGu0Dt2dXVqkISxZfUayjZfmXF992rx4jEN3WSI/wGa
 MN+UivXJ3pkX1ytPH/kPJ6RFrTb3rDHLZCW+QRC9gy7KANSzO2qEFm2ksixzGDg3DTUkYAgUjF
 P/wV/5vQI7kSb4ra9ti6irA1gW82/jvn9gCbyb/U4jtFUPA0fzvptSeD7UUhmCQvIxRMh+R1IO
 fFCPK4Ei0ERmE6zYa7UcnhHY8MhodA6S1KMkB6WW3Bw20zkCchPA7e36qrNdQyruNnsuLlSE5x
 ER8w8G4fJgyKOztDDuSldiZ7
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 14:26:50 -0700
IronPort-SDR: 4wI4OSPfdOxTq4MW4SHPLaNu40TmTnQn7qDcwFN2sNuJlHAt8zKOEFLjxgK3xAx4FmOcNaJOol
 DQMQfTDhIALzMNaJRLEeGUA0r+uKWq+6GHNmoLz1v9wyHypdcLi7cikf8j7eGuVW/bEqcpi/Kz
 Gj/ZOTX4ItxdQQuZheobK7Qyp2S5Ktfq6aDxGCXMXNVX+N27hMNLofC6KB4bX9aQSKGgOlocl+
 /gUxWZpFjuDWNbxUgtESAEk896PcHer7lrrHOiT9kf0ml/dzHRNPI6oN3YT3M5KlRqAqxUiCED
 VAk=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 14:50:30 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4H9W3T2Z0Wz1RwsF
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 14:50:29 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1631829028; x=1634421029; bh=eSLlChy6/h1DCzNMkx
 N/AbK2L7TZqOcL8W+8syU9+rQ=; b=WkT+h/uB6oK4C8z2McXlOsyXeHBLs1xdVh
 dqNwoTEKq3FTaQi1U1Xm9ySKdWNBHkdZx84Ky4T1HqyJsqrOj/UmP6RsrmBzLsH8
 DazP6BUSWFlP9wB9p2LQcD6f3B6IHRpR+O6grMYV5NgZ0MbHT47b3O3M92KjFEzK
 4JRTNTcp9oWJJTcDq6GX+AOde3/5nOxnwBLQtdSOZyXYoYnDl51ypFEfAbGgnOnA
 O9x1kvOBtqwiU55qu+IE/PZBlH1vWGwX+Bhj5GEFTj0YgR8pSlrhRMwrBcqmhJqL
 Z5rxJNnttVvu5OnzjELsLVSHVSf8cLkhBrzjaUicKF/WIxfa1qnw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id gbmpiDrOtnjz for <qemu-devel@nongnu.org>;
 Thu, 16 Sep 2021 14:50:28 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.23])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4H9W3N2rt7z1Rws0;
 Thu, 16 Sep 2021 14:50:23 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Max Hsu <max.hsu@sifive.com>, Bin Meng <bmeng.cn@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 15/21] hw/dma: sifive_pdma: claim bit must be set before DMA
 transactions
Date: Fri, 17 Sep 2021 07:48:58 +1000
Message-Id: <20210916214904.734206-16-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210916214904.734206-1-alistair.francis@opensource.wdc.com>
References: <20210916214904.734206-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=886e160e1=alistair.francis@opensource.wdc.com;
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


