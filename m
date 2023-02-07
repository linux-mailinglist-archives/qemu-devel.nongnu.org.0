Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C722968D03E
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 08:11:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPI7R-0006Rs-8S; Tue, 07 Feb 2023 02:10:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=395dd5341=alistair.francis@opensource.wdc.com>)
 id 1pPI79-0006Oh-Ef
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 02:10:05 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=395dd5341=alistair.francis@opensource.wdc.com>)
 id 1pPI75-0008RG-BJ
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 02:10:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1675753799; x=1707289799;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rv8HxBWrNfdQXe7z0ik519Oh4Sz72AnNuoOvIRr3Haw=;
 b=Ty/Jm8FGTQpDeRwrr8esb9rIo84AB0d7idppnRbVZkCDBZLjDeCgSP4s
 mGDFahKAxugmiTo07TX9jUH9Hb27JInXIXQmI5SokhIVOo1kbX49rVNOy
 1r7kxYMTsM2KGhAuBc7TiBntzGQlwPnDchepl1E/GfpAzs0I//qRW18SU
 z42KJoMEkAi+V1rBsqCs9m9Md3teUQEgBAabWWJeK1HO4MlJ98xMY8pez
 GOQcxolKa2zUQ+WdH2pwOA5HvgKkz5I2TCUVYnc/7pGNOHm8zmOklyJnX
 Cerz4mPrFrRNWbR91YgLh6rjYrrhzMa2EK1uqen7UhUDfXMVTJMNG+1Nj Q==;
X-IronPort-AV: E=Sophos;i="5.97,278,1669046400"; d="scan'208";a="227657445"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Feb 2023 15:09:51 +0800
IronPort-SDR: VEaT8PfzvwvWR6MVDuE1XB04Gs6nTr1ANaae51YWC1Q8HNlBlZmTcB30l5G2V7F7R+Tpv1mfyQ
 bWWsAQfQxerJ33+hx6JKSWrOmKruaf4SnT5NpSMJ0Nt8ycfgA9YbzV7UN/KmS2zcxqtDKdu+MY
 TuelNIFheCSZHxnMsoQ916YHrlBch0lRR1b/8EWapDOHHKnxi4TiD4VDJLe50Pmuu5Jxvu+75q
 HFs+BQN/2XHX/SSKsYsClfG7hVJfIn4acYEKkzKu3tKL6UuO4LS7piUWKqJ89RsrHIEWPg4cOc
 eS8=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Feb 2023 22:27:08 -0800
IronPort-SDR: JTmLsjo68e52t7AwX+gGaGRDXLsoE5+3EYwiE6PJGqCDoBZfT7DTTrGMlBfH15hTW7VFaycojI
 IfQyYhIwPWRnoHUKJ6ELD1OBFUSuEW3a2F4HKYwhCaHJr/6qP0xGiAuYuFCtlLS/RC46Tl3L4h
 wANqGkpgy1EhdkaIBgrSqW0DhOd97tE4SK54uF3H9WQNnANJ2KlQuOVBm7Po9Jk+/3v232DHRq
 j8GKZM9OJ8PINtLA6jCCrFkITktJDnSoSWUxaACrKCijhc0dBGJ3gEl90/XxcL55hHoECFsfz8
 Ohw=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Feb 2023 23:09:51 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4P9vQR4598z1Rwrq
 for <qemu-devel@nongnu.org>; Mon,  6 Feb 2023 23:09:51 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1675753791; x=1678345792; bh=rv8HxBWrNfdQXe7z0i
 k519Oh4Sz72AnNuoOvIRr3Haw=; b=Ji/K9XuHk3goans0puRr/zLOCafziDUJVZ
 DIp2P/4XFqhjj+Whmq+UbJZh8JXTz0FjuEBRHZV4lIFEcTdyftUgRp6hZ2Qmw0jY
 jcwpYoI5gsQFF9VFp1LF6K0n3fhh/Ru95DTzSwPQfsZgLIzw8mpfNhdA1nZrc26E
 r8vzzEQiMkzv+3X4iDS3+6bI/Z7IH5lPv5zqHNIwm1tbX88bkac+BtZCgJQQWQto
 07HdhTQdeQhaadgtCrV1hhqBAz2tID2muRFE3CgcRBTMFjjWi/4Gd3QoI8bXb9ck
 wPStFhJ02HOp+y6FAcauVgYNGHc+om/8V80O9BotDkfBwPiTOiWw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id bKtOO2TvIxTR for <qemu-devel@nongnu.org>;
 Mon,  6 Feb 2023 23:09:51 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.38])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4P9vQP6FSzz1RvTp;
 Mon,  6 Feb 2023 23:09:49 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 01/32] target/riscv: update disas.c for xnor/orn/andn and
 slli.uw
Date: Tue,  7 Feb 2023 17:09:12 +1000
Message-Id: <20230207070943.2558857-2-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207070943.2558857-1-alistair.francis@opensource.wdc.com>
References: <20230207070943.2558857-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=395dd5341=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Philipp Tomsich <philipp.tomsich@vrull.eu>

The decoding of the following instructions from Zb[abcs] currently
contains decoding/printing errors:
 * xnor,orn,andn: the rs2 operand is not being printed
 * slli.uw: decodes and prints the immediate shift-amount as a
            register (e.g. 'shift-by-2' becomes 'sp') instead of
	    interpreting this as an immediate

This commit updates the instruction descriptions to use the
appropriate decoding/printing formats.

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20230120151551.1022761-1-philipp.tomsich@vrull.eu>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 disas/riscv.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/disas/riscv.c b/disas/riscv.c
index d216b9c39b..ddda687c13 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -1626,9 +1626,9 @@ const rv_opcode_data opcode_data[] =3D {
     { "cpop", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
     { "sext.h", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
     { "sext.b", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
-    { "xnor", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
-    { "orn", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
-    { "andn", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
+    { "xnor", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "orn", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "andn", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
     { "rol", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
     { "ror", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
     { "sh1add", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
@@ -1647,7 +1647,7 @@ const rv_opcode_data opcode_data[] =3D {
     { "clzw", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
     { "clzw", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
     { "cpopw", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
-    { "slli.uw", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "slli.uw", rv_codec_i_sh5, rv_fmt_rd_rs1_imm, NULL, 0, 0, 0 },
     { "add.uw", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
     { "rolw", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
     { "rorw", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
--=20
2.39.1


