Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E51412F32
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 09:17:48 +0200 (CEST)
Received: from localhost ([::1]:37372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSa2F-0000yM-Gs
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 03:17:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=891501f09=alistair.francis@opensource.wdc.com>)
 id 1mSZhB-0000Mz-89
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 02:56:01 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:44976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=891501f09=alistair.francis@opensource.wdc.com>)
 id 1mSZh8-0004iu-IL
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 02:56:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1632207358; x=1663743358;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fazfbRAA85XFEXWLe3ZxHeGhqKDIQVKOgagvao2/N5A=;
 b=gIBC7F8IFJgpC9YWEQUatczM9Lx79VZHt7fWQdbUJPErDXvOGhPKobSN
 sbHtXLFeYpM8kVEzzjIgGvlDGLhhBlKaxN+WRDJrmidP86+z0URYvhnUX
 cN2S6pFsu7YmXghhBa3BFK08+NqSjVdD5V1rbm4X58YeP8cQAXi4+6jJD
 XiDm9fMfDE7oBjmDEN/AQ4n//rrnWo04m/ZJRjTaat3heDqU4QO0IvDEP
 JhCLDF2+7CyqRpZeFXUPNt31wpYO+x/P2UN/l9EbFzjv01EbqTkD5IHQB
 zZZZsdgB3QIh8d0BeDy6sTpAFUtdms9q3gXkGKum2PXzaB4wIdwuQBwab w==;
X-IronPort-AV: E=Sophos;i="5.85,310,1624291200"; d="scan'208";a="179591601"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 21 Sep 2021 14:55:57 +0800
IronPort-SDR: gXlE5SBVAJngJGJru4niSFScIXg8XGL+7fe6VCv94FgV59zvCi0/4MugyWl/nHokzCu+6l2DQa
 hjBRmFGXAaUuX0pzTocSy9mycQ7TRgCtofJOVmZy6Xb1bTfJPgPS2Yzmi7PaQ0Kp+JkoYMIB2d
 SbvRExr4tPR03Hzt0Q8753yr2zsMIpfb50rTyV/8EFHDXfDiUp/T53g7jEYD7IE47ZZh7pcv7l
 403ISGDURELySMfrRJOOYm48YbCZDT9XmnL4r/bDGOpDy1tWdcVdrsOIzaGWVEq5n+rOWSCdOB
 zlQOucP29q8hV50+le1oI9qG
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2021 23:30:39 -0700
IronPort-SDR: XE92Ly+eOwet+NVNntaU9SY+Cofdqy/FBcZyTyhzhR3cBpGCgCN0w+nWPo5pavrpSvNqzbcqUm
 Neg74fwnv1qFr7+x+h/Sf2lt8hr6mRbMk/o8aJVX8neWkm+hWJwOiLUfA62dGn4HSV5YaueZWz
 3qRS19pLeakHadvyu6YXepcoqOdFmfBjf9p+dRO181wqGfItuEpzsH/qVhkYPkJK7z/GSdHy41
 yRiFLlk1dvZuFfMmGJQ3AgsJFK+se2PnQcTZx9RXgJ7kZzsr9Kn62BVNGRcen4S6qcOsU/tmcx
 noA=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2021 23:55:57 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HDBz15PmDz1Rws6
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 23:55:57 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1632207357; x=1634799358; bh=fazfbRAA85XFEXWLe3
 ZxHeGhqKDIQVKOgagvao2/N5A=; b=M1uhwgPi0z8Iyfpk0N+1woBgTO8N/SPN13
 5B39gfwhw6C5PI0jK2sNpuKdLRrOv1mgM2EcGMXKY/H7Kd8BXHn9gYmt5wluYHNx
 FbJroeAxuaHK66Zhz/7977eTRzQVvi6Vt5S6vDySgKid1EaUYsWF7+3fThC9thA4
 r7mLJp7nZBBl5+ayR9KhuZJ8agWFCzZHCqvG5H46UmT47O0X1riTXukb4fwXh1Qu
 7j7C0LORcQFhLjUthkZCvjwywPMqT24tuzZESzIh072g/X2YzTlFb5qqd/4vwR7K
 wLeZbHQ/UFoS3WOGVVvORBFrZYzv3e7xfw0b9pyT4Bvj0jsmwxEg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id fLgr8mPMeGXI for <qemu-devel@nongnu.org>;
 Mon, 20 Sep 2021 23:55:57 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.26])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HDByv6S5Hz1RvlV;
 Mon, 20 Sep 2021 23:55:51 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Green Wan <green.wan@sifive.com>,
 Frank Chang <frank.chang@sifive.com>, Max Hsu <max.hsu@sifive.com>,
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 16/21] hw/dma: sifive_pdma: allow non-multiple transaction
 size transactions
Date: Tue, 21 Sep 2021 16:54:07 +1000
Message-Id: <20210921065412.312381-17-alistair.francis@opensource.wdc.com>
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


