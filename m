Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B02B6538E3
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 23:43:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p87lh-0007NP-VF; Wed, 21 Dec 2022 17:40:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3472792e2=alistair.francis@opensource.wdc.com>)
 id 1p87ld-0007M0-NM
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 17:40:54 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3472792e2=alistair.francis@opensource.wdc.com>)
 id 1p87la-0000bQ-IA
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 17:40:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1671662450; x=1703198450;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SPaspSsWq01oD2q07tmSbRBBdO5kaHAHyKb++qDpmvA=;
 b=hxfiUtfpu2MBXcmsI0kRKvwLD1GNRkHx2TUN3Nx2glxVmBuZw5Co5eWK
 gmd6rp9gBAUekmK/zQJpYyETzrbiovEtcwfUBD1LK4vYjuthIaqEWQ87s
 x+37g3LhRQC3Gkb0PhoE/rbo8nJXW+MHQUWvYiGk+e54+E5I/OXwh5eBs
 xDJejkDVgC8McQyxGee+1TQHeWL0AcCgUf6kKJMhWgT/kyanndqgRqUed
 TzeHlcPlJRgxvNX2wAm4pl3pvBI4QbXvCeAuPUye9WI9L08VilxO4Vcbx
 9mdzrsjfPz3+uHGfIMa7oIeAKVb8aeFMY3cmNcAup5fmPWdCxk2doId/L g==;
X-IronPort-AV: E=Sophos;i="5.96,263,1665417600"; d="scan'208";a="323561281"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 22 Dec 2022 06:40:41 +0800
IronPort-SDR: +uxMfVgwk3wCwdnoDLxTmZA23VNPMqZ84UhvkVhhfyv/04soUj4PD26qvZU15VpCBy155c09cl
 xUCTORxvRX2H0AmMJFFg+1jKYf2t9WM7fJl3Dde/jlzjOm59cRrrp03HZJlg83HkLnUUhV6Dke
 wyrLYuSi1VRNuyf760z07gtkyLlXIWqVwMvBFwafstsLhjMBaax8FI+e5UGi3iutqqgluX4TLO
 A0Dp/RHMwKxQsL6MGWcePM8iJUE/gvq1ZnLjfM9i7538LAqnjTsTrwaG/4hTxIJWI6hrbCsFQg
 PYY=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Dec 2022 13:53:08 -0800
IronPort-SDR: tEWB27miB/4tBOJvt6UG/k5AEKHr4Vu3nG2L3PkRIgauAyV33hV+Xua469SpCzsfLaevE2fcGd
 SiwpAnpqkGErdNJV60ELOipb2Go7QKssOxeDFqpzmbLcWJPBjSkCAzhiY9tTWMGULXIj318HjZ
 DrSzeasUHnSX5HKyZZsWJLiY/4e1m8W6JXk8EnLZ+zRBreXW0ngZ7+Q7182U8Q2/VBmJlPQoAq
 gc4c2EhOwrnjcIP7srHZzqnlU9XV/fQp0wNr6cne3XpjHjutYGzVL8/KdR4kMjn83WCAmQu3fu
 BW8=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Dec 2022 14:40:40 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4NcpLb30fzz1RvTp
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 14:40:39 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1671662439; x=1674254440; bh=SPaspSsWq01oD2q07t
 mSbRBBdO5kaHAHyKb++qDpmvA=; b=aoMbUVwswy2g7fuyIRbVn+RxcY3FmvWNoZ
 z9Dh7FB+XlD49xD/L5NbxRj4jRyZvWnCTeI2w6eaY88O5YODK6A2A2r++DFUqhwI
 CyW16gW4KD4Zeq83mZ8X0+bLqJxCl4e0IB/0WmFlHT5s/1dfednqRG7786Hm6dEG
 R14ZW5rFIKRxx4gdwUWYaoU7griLtcQUT3adtW1AGg7jmONjvsKU1racI/u9/fJd
 eICJYBQZRYuKytH/VzQow8VhY3d2ZoORhh6zq89TmepBHfW3O9NyDAVY5hKTUC9d
 6lYfuM4Mxf0r5Z85JQMnH5cxZDSVqCULpg24HpZX+JA1XDWis+Tw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id r5dBrs1uXF0K for <qemu-devel@nongnu.org>;
 Wed, 21 Dec 2022 14:40:39 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.8])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4NcpLY15CFz1Rwt8;
 Wed, 21 Dec 2022 14:40:36 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 05/45] tcg/riscv: Fix reg overlap case in tcg_out_addsub2
Date: Thu, 22 Dec 2022 08:39:42 +1000
Message-Id: <20221221224022.425831-6-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221221224022.425831-1-alistair.francis@opensource.wdc.com>
References: <20221221224022.425831-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=3472792e2=alistair.francis@opensource.wdc.com;
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Richard Henderson <richard.henderson@linaro.org>

There was a typo using opc_addi instead of opc_add with the
two registers.  While we're at it, simplify the gating test
to al =3D=3D bl to improve dynamic scheduling even when the
output register does not overlap the inputs.

Reported-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20221020233836.2341671-1-richard.henderson@linaro.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 tcg/riscv/tcg-target.c.inc | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 191197853f..2a84c57bec 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -700,9 +700,15 @@ static void tcg_out_addsub2(TCGContext *s,
         if (cbl) {
             tcg_out_opc_imm(s, opc_addi, rl, al, bl);
             tcg_out_opc_imm(s, OPC_SLTIU, TCG_REG_TMP0, rl, bl);
-        } else if (rl =3D=3D al && rl =3D=3D bl) {
+        } else if (al =3D=3D bl) {
+            /*
+             * If the input regs overlap, this is a simple doubling
+             * and carry-out is the input msb.  This special case is
+             * required when the output reg overlaps the input,
+             * but we might as well use it always.
+             */
             tcg_out_opc_imm(s, OPC_SLTI, TCG_REG_TMP0, al, 0);
-            tcg_out_opc_reg(s, opc_addi, rl, al, bl);
+            tcg_out_opc_reg(s, opc_add, rl, al, al);
         } else {
             tcg_out_opc_reg(s, opc_add, rl, al, bl);
             tcg_out_opc_reg(s, OPC_SLTU, TCG_REG_TMP0,
--=20
2.38.1


