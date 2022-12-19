Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F31A1650663
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 03:28:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p75ic-0008CL-R0; Sun, 18 Dec 2022 21:17:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=345d64987=alistair.francis@opensource.wdc.com>)
 id 1p75iZ-0008BW-Oz
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 21:17:28 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=345d64987=alistair.francis@opensource.wdc.com>)
 id 1p75iY-00013c-5v
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 21:17:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1671416246; x=1702952246;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SPaspSsWq01oD2q07tmSbRBBdO5kaHAHyKb++qDpmvA=;
 b=gKgk5P8cujLoFicGG8Yml/TFUr5vYYdKLeZSy+qHYHOEy5+D11Ry0PUY
 WKOaverep5osuE7Sxf9Tdou6cKw5bM0LIwNoHvKWnPr9UBNkJx1cvx7rj
 2af5/bnMgKMnStJFVcakm4us4dw2JrCzmPmjPNGW+5kwPjGm4BjpGqHMk
 fiNQgVW2fD1RFqNwPYMmHrihvFLki1YTGe8lMFaQeb3/Z+5DM3LQqcnh4
 PNdim4gJnFGew9ohlI7uUiP2mHPkBdZhHzs+OpMhgLOTjjr2FpSOvj7ox
 JN+xuWjAYRCvti+/8GjlKZnVK5Duk6RvxMB+Fnr5mGZ4wm7WfcBdK1IOn Q==;
X-IronPort-AV: E=Sophos;i="5.96,254,1665417600"; d="scan'208";a="217199285"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 19 Dec 2022 10:17:25 +0800
IronPort-SDR: L+WRbhLXu0bUfvAlxc3tgHZC7RSJZYqx1wb82d7+X3/Xp7g0YzdyQQ2sjuR4iuOOW1fxpQ9OdJ
 NFw5eBXnTMKQG04SvjaqKw/JiONndsp+uKk5/y2LP0VKPP/A1CdeHanvINsFxgT4PdoyVU/qft
 jydY8jTGwZ/A3oyE/QojP7J+an/GYltsJHNEhFyMj0L5ShqSnErEJ9L1MELAbPSMp6/8v5NbAW
 vSW9YCHNK5DaCdZtxV+zn5YCAuzxjfvJ7Ae/KYO6uI1US/vdcP9K5qkx+02mPPONWcZMdtG+le
 X28=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Dec 2022 17:29:58 -0800
IronPort-SDR: bgaF0dua5T4TqfCWoLbsRGqoPPS4hVBgERE12y6bDxH0T/JNyljor4P7LaJHG2+swvh0vXE7SG
 xRZKQWGsmL7o5lsN7/LknY2g+06fHVam3zzlF/GhRsycpO9fAHzbBoRHHvYriL/yXh6/mEt1RM
 wkjZyFnuzmRTZz7EU1lavhxReQGB8S6fvgMZxTw040TxePHcMBDo3p31ZhoP0FF5Lgy6iWNTYS
 JDUUl6k8a+8+OS0oLVPTybVfxGSWVYN1M7h6eW9CWvVEPjZiD5s+zqyyKpCUdDiwyDMyKvrdKD
 t6c=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Dec 2022 18:17:25 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Nb3J52TQvz1RwqL
 for <qemu-devel@nongnu.org>; Sun, 18 Dec 2022 18:17:25 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1671416244; x=1674008245; bh=SPaspSsWq01oD2q07t
 mSbRBBdO5kaHAHyKb++qDpmvA=; b=hYcQMFqZSZmJi7Q8ElNuLmEQ7WngmTMEiJ
 2VR1A2MSV8yCHMykL8l7HuRQSeubtDlzKJknXlyCE/FJ4MRehM1Rrs3fewkL4oGS
 caPLl2anRUzEqtHbO0lFR4SlW+0lYMbpffcTJSRtFb341t5Z//JP2jBHX03mGcgK
 bXVGvSLbSMAoyjjFlZU1CvlyFGHmbkqSRQdOZDwlbo3N9ZZGUL1ZE6VF7v7VrL2l
 Tuf60i7lcy5duHFHaJoUrdVAF4mKZ05SmyPQihfDSapc3iF4nd1Q71c9EFbyDtFC
 Yb6y/cbadXNIjB8gw2j/201JzkMo7N+Y2nePqZHqdDEkmchmAd0A==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id Cn0HROBpbPIw for <qemu-devel@nongnu.org>;
 Sun, 18 Dec 2022 18:17:24 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.4])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Nb3J31PW3z1Rwrq;
 Sun, 18 Dec 2022 18:17:22 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 05/45] tcg/riscv: Fix reg overlap case in tcg_out_addsub2
Date: Mon, 19 Dec 2022 12:16:23 +1000
Message-Id: <20221219021703.20473-6-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221219021703.20473-1-alistair.francis@opensource.wdc.com>
References: <20221219021703.20473-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=345d64987=alistair.francis@opensource.wdc.com;
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


