Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 979FE47A508
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 07:33:00 +0100 (CET)
Received: from localhost ([::1]:48918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzCEF-00032R-Iw
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 01:32:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzApD-0004fG-0N
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 00:03:20 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:13359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzApA-0008G0-Hj
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 00:03:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639976581; x=1671512581;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Q0rJcoRjJpzx4pLcWsuz/5/wd/y5HLBa3TOvijD4R+4=;
 b=R6jVIjjy9cvSRMpg5fDhsV6bDJJfuzsgO/WGWWnXkz34Md9jf2LjP7y2
 rNN+BCxV+PILwj+tmOGke2+EDY8iYcc3fr8hjsOPZCeMN3TmeKgM/tlBm
 96z9xT/DXYsmeiYXF+egSXnmg6N8uSYNnvofB0DLJa2xYhHq5ONVcN/bM
 zuRzkVfdeGshFMNRRDLl6X9FBFi3pBmLr+uQK3c4pIICag1CfA5S7PZb3
 iJpN2/TGhLUl1z8CnK2tYzVy187myOuTYn5sXaXbqGScryRhzWlKO2o7O
 7N0sVYkuUSyepRDrM4Cdj/uggcXWsy7W2kiuxvYLBw/SsqHmlM5cIzlpp w==;
X-IronPort-AV: E=Sophos;i="5.88,219,1635177600"; d="scan'208";a="189680306"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2021 13:01:53 +0800
IronPort-SDR: 7sRWD0MXHIfZSpCkhfGkx0rSMVgZobVl0cFIX+AP4+Zznfob68b5qrxmmA397rwEYL+qdrLsRz
 f9DfZxIQmINQm6oEzPKsV5VaF5IcDbP14vuTS0dHMJbjNTgzDPgDZM5KYB9tw4h+ruJ8jdnPPz
 Amae6zFvjx2vEw8fCpvlXWaSqzyPddUEEKnkW6+jeWyoZKVj8Ovvue90T9dCI52qWLKr6keMTz
 h/fYGmX275ZfnN5PtEFtVkNZCXDdqbvquDxBufHgHXvQKBn6nOtqpO4C6IDM0/R1/HS2GWYBGs
 olOZJcJCdmd56MdRi6ns7bt/
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:34:41 -0800
IronPort-SDR: JIscS9Bbl3Pzw6s5FF0hBJp2jnyCEXUHvLhp6hZb3tmMPNavQctSFL3elKiTs8DGvQ5M+RjAQV
 yNbfec+UtxgifSA0a6vZgBG1z3LLg5gEXi7oQ97aExOZnFpNHKYepwE8+xolbXwIm4+y8UsMbV
 ZWTqnC42HV1AKQbLsXKt3OYzqvDtwUqbOrL0SzMY6dJXwYb2/IGLyIsrahGKzZ61SFOEA/rfCT
 MMioxhOS7dRdpJ3+3DbpabhAWbcloet463GwSWD1lNls7nejXFSV90anNkk4idsFRgcEOIa9si
 QGQ=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 21:01:52 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JHS9r0hj4z1RvTh
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 21:01:52 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639976511; x=1642568512; bh=Q0rJcoRjJpzx4pLcWs
 uz/5/wd/y5HLBa3TOvijD4R+4=; b=ZBQZmgyJYBlrjNIkWL/SrkKx4zlHKbUSCF
 za4lRWNVszmZsb6pa5TR7obrN7/DwUlnyVIK3KbaeDum+t2bGlYqVMDMWEvPt4+4
 jm1RObR/+dLgkPrFdbArYTCcgBsaxdMa8Kaw5ZGSEjLoSM0T4rQ4Rgrt+/md94hP
 fUaUgG8GIwyJFD6/JmDf8dUU/+OCGDaoJKAMr07PQb1RB02mwMO/bNLKjgWK+crg
 l0sCiOYrGHBASdMEkgOx8lhjixKJs/g/Eb0I6hUBdl7ZiK9p/SWQFlr8IWXM+pmk
 WtMXx3KbAd6GEsWs2US9zgY5NED7VH03ND4FIi+a+l1Kj6bcUlww==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id RvRaQx6J0Jbg for <qemu-devel@nongnu.org>;
 Sun, 19 Dec 2021 21:01:51 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.68])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JHS9m2km1z1RtVG;
 Sun, 19 Dec 2021 21:01:47 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 68/88] target/riscv: introduce floating-point rounding mode enum
Date: Mon, 20 Dec 2021 14:56:45 +1000
Message-Id: <20211220045705.62174-69-alistair.francis@opensource.wdc.com>
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

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211210075704.23951-61-frank.chang@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/internals.h                |  9 +++++++++
 target/riscv/fpu_helper.c               | 12 ++++++------
 target/riscv/insn_trans/trans_rvv.c.inc | 18 +++++++++---------
 3 files changed, 24 insertions(+), 15 deletions(-)

diff --git a/target/riscv/internals.h b/target/riscv/internals.h
index ac062dc0b4..db105d4d64 100644
--- a/target/riscv/internals.h
+++ b/target/riscv/internals.h
@@ -36,6 +36,15 @@ target_ulong fclass_d(uint64_t frs1);
 extern const VMStateDescription vmstate_riscv_cpu;
 #endif
=20
+enum {
+    RISCV_FRM_RNE =3D 0,  /* Round to Nearest, ties to Even */
+    RISCV_FRM_RTZ =3D 1,  /* Round towards Zero */
+    RISCV_FRM_RDN =3D 2,  /* Round Down */
+    RISCV_FRM_RUP =3D 3,  /* Round Up */
+    RISCV_FRM_RMM =3D 4,  /* Round to Nearest, ties to Max Magnitude */
+    RISCV_FRM_DYN =3D 7,  /* Dynamic rounding mode */
+};
+
 static inline uint64_t nanbox_s(float32 f)
 {
     return f | MAKE_64BIT_MASK(32, 32);
diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c
index 388e23ca67..dec39d4a9e 100644
--- a/target/riscv/fpu_helper.c
+++ b/target/riscv/fpu_helper.c
@@ -55,23 +55,23 @@ void helper_set_rounding_mode(CPURISCVState *env, uin=
t32_t rm)
 {
     int softrm;
=20
-    if (rm =3D=3D 7) {
+    if (rm =3D=3D RISCV_FRM_DYN) {
         rm =3D env->frm;
     }
     switch (rm) {
-    case 0:
+    case RISCV_FRM_RNE:
         softrm =3D float_round_nearest_even;
         break;
-    case 1:
+    case RISCV_FRM_RTZ:
         softrm =3D float_round_to_zero;
         break;
-    case 2:
+    case RISCV_FRM_RDN:
         softrm =3D float_round_down;
         break;
-    case 3:
+    case RISCV_FRM_RUP:
         softrm =3D float_round_up;
         break;
-    case 4:
+    case RISCV_FRM_RMM:
         softrm =3D float_round_ties_away;
         break;
     default:
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
index 1ce5a10b6a..047be5d5c4 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2088,7 +2088,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr =
*a)             \
             gen_helper_##NAME##_d,                                 \
         };                                                         \
         TCGLabel *over =3D gen_new_label();                          \
-        gen_set_rm(s, 7);                                          \
+        gen_set_rm(s, RISCV_FRM_DYN);                              \
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
                                                                    \
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);                 \
@@ -2167,7 +2167,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr =
*a)            \
             gen_helper_##NAME##_w,                                \
             gen_helper_##NAME##_d,                                \
         };                                                        \
-        gen_set_rm(s, 7);                                         \
+        gen_set_rm(s, RISCV_FRM_DYN);                             \
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);                \
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);            \
         return opfvf_trans(a->rd, a->rs1, a->rs2, data,           \
@@ -2199,7 +2199,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr =
*a)           \
             gen_helper_##NAME##_h, gen_helper_##NAME##_w,        \
         };                                                       \
         TCGLabel *over =3D gen_new_label();                        \
-        gen_set_rm(s, 7);                                        \
+        gen_set_rm(s, RISCV_FRM_DYN);                            \
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);        \
                                                                  \
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);               \
@@ -2236,7 +2236,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr =
*a)           \
         static gen_helper_opfvf *const fns[2] =3D {                \
             gen_helper_##NAME##_h, gen_helper_##NAME##_w,        \
         };                                                       \
-        gen_set_rm(s, 7);                                        \
+        gen_set_rm(s, RISCV_FRM_DYN);                            \
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);               \
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);           \
         return opfvf_trans(a->rd, a->rs1, a->rs2, data,          \
@@ -2266,7 +2266,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr =
*a)             \
             gen_helper_##NAME##_h, gen_helper_##NAME##_w,          \
         };                                                         \
         TCGLabel *over =3D gen_new_label();                          \
-        gen_set_rm(s, 7);                                          \
+        gen_set_rm(s, RISCV_FRM_DYN);                              \
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
                                                                    \
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);                 \
@@ -2303,7 +2303,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr =
*a)           \
         static gen_helper_opfvf *const fns[2] =3D {                \
             gen_helper_##NAME##_h, gen_helper_##NAME##_w,        \
         };                                                       \
-        gen_set_rm(s, 7);                                        \
+        gen_set_rm(s, RISCV_FRM_DYN);                            \
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);               \
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);           \
         return opfvf_trans(a->rd, a->rs1, a->rs2, data,          \
@@ -2380,7 +2380,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *=
a)              \
             gen_helper_##NAME##_d,                                 \
         };                                                         \
         TCGLabel *over =3D gen_new_label();                          \
-        gen_set_rm(s, 7);                                          \
+        gen_set_rm(s, RISCV_FRM_DYN);                              \
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
                                                                    \
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);                 \
@@ -2526,7 +2526,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *=
a)              \
             gen_helper_##NAME##_w,                                 \
         };                                                         \
         TCGLabel *over =3D gen_new_label();                          \
-        gen_set_rm(s, 7);                                          \
+        gen_set_rm(s, RISCV_FRM_DYN);                              \
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
                                                                    \
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);                 \
@@ -2574,7 +2574,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *=
a)              \
             gen_helper_##NAME##_w,                                 \
         };                                                         \
         TCGLabel *over =3D gen_new_label();                          \
-        gen_set_rm(s, 7);                                          \
+        gen_set_rm(s, RISCV_FRM_DYN);                              \
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
                                                                    \
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);                 \
--=20
2.31.1


