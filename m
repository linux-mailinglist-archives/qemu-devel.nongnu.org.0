Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7C93FD171
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 04:40:56 +0200 (CEST)
Received: from localhost ([::1]:35454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLGBL-0003Rd-28
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 22:40:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=871df42ed=alistair.francis@opensource.wdc.com>)
 id 1mLFkY-0007w8-2a
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 22:13:14 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:25480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=871df42ed=alistair.francis@opensource.wdc.com>)
 id 1mLFkM-0000vn-Cw
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 22:13:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630462382; x=1661998382;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UkYP+R8GR9rDdHFoS71xp7/peSpQJfKki2BleBjjKCY=;
 b=BvnUYc9wfth8Jm0QTtH7o9ZGvNLMVRqBfwYzKW+aUaEW85FrGGSpCaYP
 ubgAx3XSgeCrDIKLTa3UebUMlROYbhGbNNQvb6kOngiyvtC51+XBbRMj8
 a+1Gvj6jhr0kjIU/5kz5Ndz1QQMSpExE4rCvkKMaMomwMI2TLoyWDLLkY
 WjRCkdZOwFYmmbr8krOwizUSI/pRFohAPMlHL4WUqFk0iVwobkogtsxME
 l5i2t0u6qM41/nM8K8l3X1Zk/inQK0rWE3x6Fl9N0IJrIXU0QPP4SpBIc
 +oKk/ITqX1WDjYBN4t4od+Z6Z7BVlbLaLq774exQ9fveyke4m0y7Rvvo/ w==;
X-IronPort-AV: E=Sophos;i="5.84,368,1620662400"; d="scan'208";a="282698205"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 01 Sep 2021 10:12:58 +0800
IronPort-SDR: 5Rj5kTYI5iP5oU4Pnyc+KkF7HaYJGntTGwDcPHTCWx2esE4CG7BdKgpvarlt9QJ2b/F/UaJqbX
 dTOzzmUdHXMsIZ4Ns5akasEPh/Vpwh3oj8RCbOD2Oiao/VnGnku2k+850cv8xjiyhp2pgZPipy
 IrMDpv3Pczj4KMFI5gXoGLSUnHSHHbjl42ff9i3t8L1R38XZcCA7kEAWQNljWzGrNGkbltNE70
 gKMNC4hNvCUfVmxkSY/4ScZB1qb/bvqMpUGSkd3egUKBPBVc8yUZ6NoFC00rq7FZYs6Wn5vsVb
 3aWB+V0fW3PK9FszOnVZxHm3
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 18:48:04 -0700
IronPort-SDR: Uphecyn3KL71NrWPNi4bGKPz+0Zs2/6KqZId3gJ+zXA95QduoltQAYu7zWEZOE8vnjqbDHfc9I
 IaIaUtmNSM8ii1AmYgJGLyaWFm2MwZr+G6fDnEkw/XRi/v9b6rTZZMP1IdjiM8wqIVtvWiUVH1
 1IBonFWzMm1kCQIMzdIv2eLxgWYQOteYI2Po08UxBgdmzS9BHDCdeHvI3dvbuYUi2JOEGYsiSe
 QT348FiWb0/kDLiJH0WI/Uq2j8LfqI9HAjDfHy12bnrxe+O9/90iPW/hf436KP5iwQL9CV8daT
 aLk=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 19:12:59 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Gzndk3C45z1RvmK
 for <qemu-devel@nongnu.org>; Tue, 31 Aug 2021 19:12:58 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1630462373; x=1633054374; bh=UkYP+R8GR9rDdHFoS7
 1xp7/peSpQJfKki2BleBjjKCY=; b=CunSoqMhG2/oqcHGoruKBPVxONkIuSYYqH
 YRAtzx+d9N5ETCLk3Rh5Ctao6N5l9OkhsBa6JgiVhvDFbQgYFCFegeD0Xfs+/pL5
 r1uJxcPdSUBgaOtwtL8uFVCyaVciN9a8C/qJk5GSmAhas13NQUYMOcv8gp89HFMg
 2GOc3UMwCd8PY/cgEPHqBQITkNDr5dVFTsKcD3bjjyAgf0dudnSRtRaxxJt9JjdM
 FHvfhtlVMUeOOFdW/a1WpvXDqATSWgZAN67aK8Fte3f5DoOt2/OUtwZHpWAMFtHO
 hMzmhvpYPi7fECnF4n9RPtvRen+6wmYQZGSOrqmFR9ebjp2wOYrg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 6c24-5Ocd9mO for <qemu-devel@nongnu.org>;
 Tue, 31 Aug 2021 19:12:53 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.16])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4GzndY28GCz1Rvl9;
 Tue, 31 Aug 2021 19:12:48 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 29/33] target/riscv: Use gen_shift_imm_fn for slli_uw
Date: Wed,  1 Sep 2021 12:09:54 +1000
Message-Id: <20210901020958.458454-30-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210901020958.458454-1-alistair.francis@opensource.wdc.com>
References: <20210901020958.458454-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=871df42ed=alistair.francis@opensource.wdc.com;
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

From: Richard Henderson <richard.henderson@linaro.org>

Always use tcg_gen_deposit_z_tl; the special case for
shamt >=3D 32 is handled there.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210823195529.560295-21-richard.henderson@linaro.org
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvb.c.inc | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_=
trans/trans_rvb.c.inc
index b97c3ca5da..b72e76255c 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -635,21 +635,14 @@ static bool trans_add_uw(DisasContext *ctx, arg_add=
_uw *a)
     return gen_arith(ctx, a, EXT_NONE, gen_add_uw);
 }
=20
+static void gen_slli_uw(TCGv dest, TCGv src, target_long shamt)
+{
+    tcg_gen_deposit_z_tl(dest, src, shamt, MIN(32, TARGET_LONG_BITS - sh=
amt));
+}
+
 static bool trans_slli_uw(DisasContext *ctx, arg_slli_uw *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVB);
-
-    TCGv source1 =3D tcg_temp_new();
-    gen_get_gpr(ctx, source1, a->rs1);
-
-    if (a->shamt < 32) {
-        tcg_gen_deposit_z_tl(source1, source1, a->shamt, 32);
-    } else {
-        tcg_gen_shli_tl(source1, source1, a->shamt);
-    }
-
-    gen_set_gpr(ctx, a->rd, source1);
-    tcg_temp_free(source1);
-    return true;
+    return gen_shift_imm_fn(ctx, a, EXT_NONE, gen_slli_uw);
 }
--=20
2.31.1


