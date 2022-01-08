Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D51E4881CB
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 07:14:28 +0100 (CET)
Received: from localhost ([::1]:52860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n64zj-0002yl-Fh
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 01:14:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=000118587=alistair.francis@opensource.wdc.com>)
 id 1n64dX-0007t3-BN
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 00:51:40 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:24134)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=000118587=alistair.francis@opensource.wdc.com>)
 id 1n64dP-0006jE-7z
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 00:51:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1641621083; x=1673157083;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=K3JqRM2SouGQK1NFcarIPIWUL53BxUKJ80hXq4zCH9w=;
 b=SxqoaRt54031pb/U0bewkisWcdFh0eb96ZR3pkuVxGvh5rCfS0vZvtWX
 IuNK9NpjHZQAcU5GlrCSIVmWczwAzcN0HxP2Pg6s4o7gkhC4ZI3ppBcM2
 tzPB7TkBeCpLCz3g3FHt8++igm9ULI42Bc82BQ5V39+/2SOCW5pXdR20C
 Tebn34aP2AnkyBrCuDfvvr9Ek+eaao/pq41jbnXaXURXFPZVPxu/gWtLB
 L0iO8b0wgjNB2PiuTEynA//oNtr/EYVABy/phqJ2aVgZUKovE+9GzmUSi
 VhXM8nb++ALItTyD7anGV2YmqXkBzoFwuuNmmD44dc34q1TZ5A4C2oKXi Q==;
X-IronPort-AV: E=Sophos;i="5.88,272,1635177600"; d="scan'208";a="294027334"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 08 Jan 2022 13:51:20 +0800
IronPort-SDR: yj2xed/DG6NRSPvzwo71diIBJp/lwlbNHbHGrR5Gx9Whv0auoUqYCRzjGBcH5uWnAyD43I8avH
 CKhHk/UbBNx1cobtcyPKuWbkpe9pTVQyAHgTDcR5wb5174hoBavOYPTLpIsCTOHoqflnrJ9bzO
 jbNxRc+6g+LFtjsZzxyNT9Nm/kmuWxbe93UuBz0oC3kWenoWcx3dRZWE8y9zUTkdM8ac8XWNMA
 jQE85awDRgJGHlRGOyhsLKGw//JClXEt3GJpQQLakvUcvsZsXGbMNN+IkV7/2nynJjey6XGzlH
 yfwIfIUGanfDkPBFA9ldD/1w
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 21:25:09 -0800
IronPort-SDR: MAScNfHWTONbvc9/tV0g/S7aKMsBGpS3PgYGaIvPvrQeyiJzhB2Xaf9dO6UZJu0VdWXChH2H6X
 qmTrMjVzQiDrz/EYVXQPGRr5KXZpzkNVmPULu1AfEZyejmJSG+1PkKOHfQ/VxFgJYcCcukxhjA
 4iDQkMsdk9GQJlQd5WowCQZs4/SA6lt9CymWoO1azHqiA8wkMkSxaeJ4lYLDnP9oGmzY5w8wfh
 1LrME6e9SFcr14a6kIiPnfuFfZ3oPdEgp3GQl9wXWhus7B7fqEyEzquHpzj9xANfnfN9yJxciJ
 2H0=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 21:51:22 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JW8N84nnLz1VSkV
 for <qemu-devel@nongnu.org>; Fri,  7 Jan 2022 21:51:20 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1641621080; x=1644213081; bh=K3JqRM2
 SouGQK1NFcarIPIWUL53BxUKJ80hXq4zCH9w=; b=InlpIY1l5KuY9C98b1eGneQ
 FTHV21QQsPJbuB76ClesXf5DKvx/wMCAec3NCHP+gwmM4DgvHlyw8f6Fslmt5MgH
 ggKYUdxV3d5DYa+WirEmLAGYC2mzjlvBka3GIMddh4NIsMlnH/4LkfNLTgOMHT6B
 uJILpsKjCRV/2RCE25IQuXhQbZSIsvGt0k723lv0hEOq4omxkvcVMGXkzl32cyGq
 roa5Mjv1ndPhnGw3T9UYibuVFcthMcn/Lt2sNMLVYHgc0f0yDroq6bFSzyylvr/k
 2Y6ovGtqn0VtDHFMkS9+5aDlXBFBEI6H09+y0vzo1BDnXkcEhm5a1MGA7YWtQJg=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 5soa1PMgDwvx for <qemu-devel@nongnu.org>;
 Fri,  7 Jan 2022 21:51:20 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.74])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JW8N42Szwz1VSkY;
 Fri,  7 Jan 2022 21:51:15 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Jim Shu <jim.shu@sifive.com>,
 Frank Chang <frank.chang@sifive.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [PULL 03/37] hw/dma: sifive_pdma: permit 4/8-byte access size of PDMA
 registers
Date: Sat,  8 Jan 2022 15:50:14 +1000
Message-Id: <20220108055048.3512645-4-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220108055048.3512645-1-alistair.francis@opensource.wdc.com>
References: <20220108055048.3512645-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=000118587=alistair.francis@opensource.wdc.com;
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

From: Jim Shu <jim.shu@sifive.com>

It's obvious that PDMA supports 64-bit access of 64-bit registers, and
in previous commit, we confirm that PDMA supports 32-bit access of
both 32/64-bit registers. Thus, we configure 32/64-bit memory access
of PDMA registers as valid in general.

Signed-off-by: Jim Shu <jim.shu@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Tested-by: Bin Meng <bmeng.cn@gmail.com>
Message-id: 20220104063408.658169-3-jim.shu@sifive.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/dma/sifive_pdma.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/dma/sifive_pdma.c b/hw/dma/sifive_pdma.c
index f4df16449b..1dd88f3479 100644
--- a/hw/dma/sifive_pdma.c
+++ b/hw/dma/sifive_pdma.c
@@ -444,6 +444,10 @@ static const MemoryRegionOps sifive_pdma_ops =3D {
     .impl =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 8,
+    },
+    .valid =3D {
+        .min_access_size =3D 4,
+        .max_access_size =3D 8,
     }
 };
=20
--=20
2.31.1


