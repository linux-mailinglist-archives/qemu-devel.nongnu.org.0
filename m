Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB953FD15D
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 04:34:02 +0200 (CEST)
Received: from localhost ([::1]:46136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLG4f-0008Hv-Py
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 22:34:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=871df42ed=alistair.francis@opensource.wdc.com>)
 id 1mLFjp-0007RO-Ec
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 22:12:32 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:10421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=871df42ed=alistair.francis@opensource.wdc.com>)
 id 1mLFjn-0000YF-NB
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 22:12:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630462347; x=1661998347;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ujTVEvvtKaYYHlia7+3yZCVIGg84nF/Tt9DFiNXfIvU=;
 b=fmm/q8RmnM+prZ1A6jpOFobG5JLnqHVNdV6qj8+TBnA+E3ucjyE5UPvN
 N01093H2zgRdLOS/wfdBemwZwlewpWjjBSv2zOdFMAtkeLdaaAAoE8ERw
 +pOP4240bQnU14QnlbtvZC1EWVRKSEb/HNrcpEyfZhDeP1EmJdeBa2hx+
 xTmYDU7NBnwfe4qMO5v3RTrlwCgbJaNSCO98fGURvSZ2wcdKpCnIVWezq
 LQE7U+H3drc9kPFu042gp/ce0YD+gHGqyAcSyUpavTKOVYF+eCMmz/5uC
 n7pzTxttzxLdlVSXgpzLliHuxQJ3D/P5ZlzhI4rAaoB2EVhHYqjIyWyDi g==;
X-IronPort-AV: E=Sophos;i="5.84,368,1620662400"; d="scan'208";a="178011755"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 01 Sep 2021 10:12:26 +0800
IronPort-SDR: EqlUs9GkK1yea5BKOiRCbxYNHGe/D1Di1xZ5/GuuDR72I9WU+kd8Jv73/B8zrPccV8zyo+niPD
 QmvmHoTobla9y9gj47RwY4sySbwI13ZSYJaW0OiSB/xKE6qXAeJP+srt5Gd07Dq3nedN3OJigq
 hyEj4CM9xrDP+cVgI1mPxa1sUJ22AMgBLGUmnG5yTJsFwN/+mf0fAIvRsW6NpmtL1xCsdzvo56
 jQttWX6qvUCg2c7kYZx476Y5LFkLdS2eXC3tPFJK5ltzbU1oYV7Tv8B4RXo/3cxmA2tT1+jzSE
 P6mnHbsE9S6Ra6RO4rUtAazr
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 18:49:15 -0700
IronPort-SDR: RQIGGIYZxwM6r7mdrvJQ2QQTBn+Dawwikm7aewxUI9jEF0USFd/QKap7D5DJvXrfocdWYZn6O5
 /8xXfc9QUPu1nXD03T5+72iubFsZn4VH8vtZRBmF7BN1osZdZDMj2r/faVJDd6+ehrCKi3ryiR
 tZU/vtHFdn1h5/q4xR3Z6uaOVtVZy1OZriMDLGaZ98WxxrmuI9eBukD4xNwKnI9+0eLcGbzdlS
 HyOxrkbJDYo2ust+L21mN4469S5XUXf8S7o7LuthjOXbkVYnnwBBLVzWgTdBXrquXW2WaRPe8L
 ADA=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 19:12:27 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Gznd64xcNz1RvmK
 for <qemu-devel@nongnu.org>; Tue, 31 Aug 2021 19:12:26 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1630462341; x=1633054342; bh=ujTVEvvtKaYYHlia7+
 3yZCVIGg84nF/Tt9DFiNXfIvU=; b=loBkRDJEtacpsgqSX4pBI45NIEBdajrqJq
 WoiVK4wRcGrTz9/LK7Vreci1sNdiND72ggg4qx8zh7W18NkAX8X937F/xfXUQPb2
 nfai0UHuBqNrnK4KghMAScO3ZsdmOhk/fS83zvp8NnopIP4ZeVsc1IuJlkGIqS3I
 FG6N4QkC6Qs2a6eq5LTCK5cKDXkZUJaiRIsH3FEEI6yUD7J/C/4D9csfHShqnTdL
 yaiXNKkw1P64uYdPvyXXzo+t2kjfhUixSWFoMRZc61lU2PsLf4j79zsEjnQSIqTj
 o2VDOg3yDtM/S/lV5JvHQcSVPRt0PZ14gWQHAEjGABpwy1MrWSRA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id HkhXPszC1kzQ for <qemu-devel@nongnu.org>;
 Tue, 31 Aug 2021 19:12:21 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.16])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Gzncw1nh1z1RvlZ;
 Tue, 31 Aug 2021 19:12:15 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 23/33] target/riscv: Use get_gpr in branches
Date: Wed,  1 Sep 2021 12:09:48 +1000
Message-Id: <20210901020958.458454-24-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210901020958.458454-1-alistair.francis@opensource.wdc.com>
References: <20210901020958.458454-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=871df42ed=alistair.francis@opensource.wdc.com;
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

From: Richard Henderson <richard.henderson@linaro.org>

Narrow the scope of t0 in trans_jalr.

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210823195529.560295-15-richard.henderson@linaro.org
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvi.c.inc | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_=
trans/trans_rvi.c.inc
index 9e8d99be51..a5249e71c2 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -54,24 +54,25 @@ static bool trans_jal(DisasContext *ctx, arg_jal *a)
=20
 static bool trans_jalr(DisasContext *ctx, arg_jalr *a)
 {
-    /* no chaining with JALR */
     TCGLabel *misaligned =3D NULL;
-    TCGv t0 =3D tcg_temp_new();
-
=20
-    gen_get_gpr(ctx, cpu_pc, a->rs1);
-    tcg_gen_addi_tl(cpu_pc, cpu_pc, a->imm);
+    tcg_gen_addi_tl(cpu_pc, get_gpr(ctx, a->rs1, EXT_NONE), a->imm);
     tcg_gen_andi_tl(cpu_pc, cpu_pc, (target_ulong)-2);
=20
     if (!has_ext(ctx, RVC)) {
+        TCGv t0 =3D tcg_temp_new();
+
         misaligned =3D gen_new_label();
         tcg_gen_andi_tl(t0, cpu_pc, 0x2);
         tcg_gen_brcondi_tl(TCG_COND_NE, t0, 0x0, misaligned);
+        tcg_temp_free(t0);
     }
=20
     if (a->rd !=3D 0) {
         tcg_gen_movi_tl(cpu_gpr[a->rd], ctx->pc_succ_insn);
     }
+
+    /* No chaining with JALR. */
     lookup_and_goto_ptr(ctx);
=20
     if (misaligned) {
@@ -80,21 +81,18 @@ static bool trans_jalr(DisasContext *ctx, arg_jalr *a=
)
     }
     ctx->base.is_jmp =3D DISAS_NORETURN;
=20
-    tcg_temp_free(t0);
     return true;
 }
=20
 static bool gen_branch(DisasContext *ctx, arg_b *a, TCGCond cond)
 {
     TCGLabel *l =3D gen_new_label();
-    TCGv source1, source2;
-    source1 =3D tcg_temp_new();
-    source2 =3D tcg_temp_new();
-    gen_get_gpr(ctx, source1, a->rs1);
-    gen_get_gpr(ctx, source2, a->rs2);
+    TCGv src1 =3D get_gpr(ctx, a->rs1, EXT_SIGN);
+    TCGv src2 =3D get_gpr(ctx, a->rs2, EXT_SIGN);
=20
-    tcg_gen_brcond_tl(cond, source1, source2, l);
+    tcg_gen_brcond_tl(cond, src1, src2, l);
     gen_goto_tb(ctx, 1, ctx->pc_succ_insn);
+
     gen_set_label(l); /* branch taken */
=20
     if (!has_ext(ctx, RVC) && ((ctx->base.pc_next + a->imm) & 0x3)) {
@@ -105,9 +103,6 @@ static bool gen_branch(DisasContext *ctx, arg_b *a, T=
CGCond cond)
     }
     ctx->base.is_jmp =3D DISAS_NORETURN;
=20
-    tcg_temp_free(source1);
-    tcg_temp_free(source2);
-
     return true;
 }
=20
--=20
2.31.1


