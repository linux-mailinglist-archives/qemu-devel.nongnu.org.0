Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 757A347A4BA
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 06:53:54 +0100 (CET)
Received: from localhost ([::1]:60096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzBcO-0002eD-SU
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 00:53:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAm0-0003OE-8o
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 23:59:44 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:13353)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAlx-0008Ey-B1
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 23:59:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639976381; x=1671512381;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5HNAc9kbpo7/C7fkPGyRxz2tXdebnOcydGob30utdhM=;
 b=ds0HIyunNzMs+8DKlnJjAxw0f1nc5m18asy2G1YUer+puU2Es+S60umq
 1/Ous9Ii3kfsYUa9PyEJ5knISkJz4xuaoadITO5o/9RMLNJombHbpsYi7
 ivboKVXuje6NnlXY3njRN1YVZRpQBM9leuZmWQ44VJociYx3ENOnP4jxQ
 hHV7m5tnxMdhDZD3RpqYQ/gApAsrH+GCDHfsIFKPzj9l/s2B7kTuPLUcf
 ya2YGea43pqG7AC5irNN3XTSMPIzyMxBvNc1uu6KmPLv3L2ZXMvWVwK3M
 FPinvvMqiz+722C8WUxn0rof4m8jveSLySUek0NUmH8KLJHzyph5Jopge A==;
X-IronPort-AV: E=Sophos;i="5.88,219,1635177600"; d="scan'208";a="189680055"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2021 12:59:40 +0800
IronPort-SDR: WaIXHjtg/IIaZgmS5BJDlmd2Jv3DILxJypCFFMgBYmxc0ydV7L4ggYuSeLkazOi8VZPCiWWn20
 HLJ/dQA2KAitlygvPzH9w0GOfa32B7AUGh3mXZZaib1WF3E6eNYV7f2hHTjY+6ATNxezmTTVir
 7zzXNMojcwedbmbK4ThZSzEE6FB7lDYoPO/n5d2IDyPC6FZA5a5Sl5Rc35P44qMJufz3V1TgxD
 eMme5O/5vRvA4mew2J9KxYBhiI1bJgUosNQQma5P+QgFLu7lGQ15k+OiQqXzwafFfmQz62ngK5
 KbpqcGByW+RVY/gvkN7seYOE
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:32:29 -0800
IronPort-SDR: qqo2RvQZKia+yYRhdAYGlrlwnbSRMGBTOijfr2mW2Z97VMVDhpeCxgzx9NkZnMwsYbSrtaCadS
 nGV6NTBT9k05qvywKn2DcrpcLYVXf1klG0fGASDrn/4ZIGA4ghn9fAzC0UA357Uxp7WjdF2T/S
 Zk6qphj2S55u/03n092rVBWVXNkcyr254kU1NDfUxworLYO5Q2AeVAvOctATklnBQTNyWMathB
 HD6H2gxqYYQvB/kA9Tv+F9mQMErQ1fRLNeLJA17VvHd1aPTqdJf60tAfHuihk3lO288FwcgyQh
 ajg=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:59:41 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JHS7J1wH8z1Rwns
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 20:59:40 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639976379; x=1642568380; bh=5HNAc9kbpo7/C7fkPG
 yRxz2tXdebnOcydGob30utdhM=; b=tsRyo+uGJXzT7WVW0xRMpwJ5eyAAu4SuCQ
 QsBJopzoxUoT3BzpWafMesP5rLVCaBFoI2rbqVC5TFFNaBxf2gg8ENsit0kGF4r5
 2t+6O5TXi5oChfrs7OIQUkuyOIlCpbb4C0SkDR8RbE1DX111p+5qCAGTAihg1ufo
 Xr8nmhii9bab4yjDA928vX8o2NuabOFk78MUOu2Wdsv1WMGP6vhdLLqW81cafWan
 MT0DFRu4v+SAvD9F9eYCx9sIZ1DmGV+qtnpsrxfi/+AKpHG70h3KGWfbTc0NhLTy
 UMonhT6WaSLk1dothkKlve1QdDMD+VV7QipPqr39h3MTB0Tou2+A==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 7seP2w7A7zZz for <qemu-devel@nongnu.org>;
 Sun, 19 Dec 2021 20:59:39 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.68])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JHS7D5YpRz1RtVG;
 Sun, 19 Dec 2021 20:59:36 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 34/88] target/riscv: rvv-1.0: take fractional LMUL into vector
 max elements calculation
Date: Mon, 20 Dec 2021 14:56:11 +1000
Message-Id: <20211220045705.62174-35-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
References: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=9816edf2f=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
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

From: Frank Chang <frank.chang@sifive.com>

Update vext_get_vlmax() and MAXSZ() to take fractional LMUL into
calculation for RVV 1.0.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20211210075704.23951-27-frank.chang@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h                      | 27 ++++++++++++++++---------
 target/riscv/cpu_helper.c               | 16 ++++++++++++---
 target/riscv/insn_trans/trans_rvv.c.inc | 12 ++++++++++-
 3 files changed, 42 insertions(+), 13 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 709b7c3abb..11a0f41b27 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -430,18 +430,27 @@ static inline RISCVMXL riscv_cpu_mxl(CPURISCVState =
*env)
 #endif
=20
 /*
- * A simplification for VLMAX
- * =3D (1 << LMUL) * VLEN / (8 * (1 << SEW))
- * =3D (VLEN << LMUL) / (8 << SEW)
- * =3D (VLEN << LMUL) >> (SEW + 3)
- * =3D VLEN >> (SEW + 3 - LMUL)
+ * Encode LMUL to lmul as follows:
+ *     LMUL    vlmul    lmul
+ *      1       000       0
+ *      2       001       1
+ *      4       010       2
+ *      8       011       3
+ *      -       100       -
+ *     1/8      101      -3
+ *     1/4      110      -2
+ *     1/2      111      -1
+ *
+ * then, we can calculate VLMAX =3D vlen >> (vsew + 3 - lmul)
+ * e.g. vlen =3D 256 bits, SEW =3D 16, LMUL =3D 1/8
+ *      =3D> VLMAX =3D vlen >> (1 + 3 - (-3))
+ *               =3D 256 >> 7
+ *               =3D 2
  */
 static inline uint32_t vext_get_vlmax(RISCVCPU *cpu, target_ulong vtype)
 {
-    uint8_t sew, lmul;
-
-    sew =3D FIELD_EX64(vtype, VTYPE, VSEW);
-    lmul =3D FIELD_EX64(vtype, VTYPE, VLMUL);
+    uint8_t sew =3D FIELD_EX64(vtype, VTYPE, VSEW);
+    int8_t lmul =3D sextract32(FIELD_EX64(vtype, VTYPE, VLMUL), 0, 3);
     return cpu->cfg.vlen >> (sew + 3 - lmul);
 }
=20
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 1b31d0ad47..10f3baba53 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -75,12 +75,22 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_=
ulong *pc,
     *cs_base =3D 0;
=20
     if (riscv_has_ext(env, RVV)) {
+        /*
+         * If env->vl equals to VLMAX, we can use generic vector operati=
on
+         * expanders (GVEC) to accerlate the vector operations.
+         * However, as LMUL could be a fractional number. The maximum
+         * vector size can be operated might be less than 8 bytes,
+         * which is not supported by GVEC. So we set vl_eq_vlmax flag to=
 true
+         * only when maxsz >=3D 8 bytes.
+         */
         uint32_t vlmax =3D vext_get_vlmax(env_archcpu(env), env->vtype);
-        bool vl_eq_vlmax =3D (env->vstart =3D=3D 0) && (vlmax =3D=3D env=
->vl);
+        uint32_t sew =3D FIELD_EX64(env->vtype, VTYPE, VSEW);
+        uint32_t maxsz =3D vlmax << sew;
+        bool vl_eq_vlmax =3D (env->vstart =3D=3D 0) && (vlmax =3D=3D env=
->vl) &&
+                           (maxsz >=3D 8);
         flags =3D FIELD_DP32(flags, TB_FLAGS, VILL,
                     FIELD_EX64(env->vtype, VTYPE, VILL));
-        flags =3D FIELD_DP32(flags, TB_FLAGS, SEW,
-                    FIELD_EX64(env->vtype, VTYPE, VSEW));
+        flags =3D FIELD_DP32(flags, TB_FLAGS, SEW, sew);
         flags =3D FIELD_DP32(flags, TB_FLAGS, LMUL,
                     FIELD_EX64(env->vtype, VTYPE, VLMUL));
         flags =3D FIELD_DP32(flags, TB_FLAGS, VL_EQ_VLMAX, vl_eq_vlmax);
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
index e12db9aae8..5c04ac90da 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -1049,7 +1049,17 @@ GEN_LDST_WHOLE_TRANS(vs8r_v, 8, true)
 /*
  *** Vector Integer Arithmetic Instructions
  */
-#define MAXSZ(s) (s->vlen >> (3 - s->lmul))
+
+/*
+ * MAXSZ returns the maximum vector size can be operated in bytes,
+ * which is used in GVEC IR when vl_eq_vlmax flag is set to true
+ * to accerlate vector operation.
+ */
+static inline uint32_t MAXSZ(DisasContext *s)
+{
+    int scale =3D s->lmul - 3;
+    return scale < 0 ? s->vlen >> -scale : s->vlen << scale;
+}
=20
 static bool opivv_check(DisasContext *s, arg_rmrr *a)
 {
--=20
2.31.1


