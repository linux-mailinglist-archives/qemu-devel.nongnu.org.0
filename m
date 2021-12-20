Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D15A547A42F
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 06:07:57 +0100 (CET)
Received: from localhost ([::1]:38488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzAtw-0006uc-I1
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 00:07:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAjr-0007oB-3a
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 23:57:31 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:50595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAjo-0007zs-Hm
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 23:57:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639976248; x=1671512248;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=g2oyOgtU7+EqbDyX1II4iIoFM5jQlvAzLFxTGStVWFE=;
 b=RnJjd8r6VYOZCU4LaDZdCrXzkdLjTTOa2G+s6QvuCqITew80qQlGc/cP
 IaqMOR8UqM7sBK1ih6FPT8vNfQrwT5/lF2Em5TRo/0UHEfzmVZrwXZoN1
 md4UmzmvI4ijjE5sMEPGUTM7AJYmXMdc5f4gvo9cg2MLLIxxzhtDQv5NJ
 5h9kxtolM+p/VOfjstMtwwvoAX9vwJRCFzDIU8dbg5L9tJIy95WgbULFi
 qHkDsp0+PlUoYdRAkk5cDXlkAo/z6YgreGcc10vicG96bK59jv8/xdvyl
 g6J0Apjvsb9XlDqrrJ03SF+qyTPz/AJm2JgcrrWJyC+0zAjcY8l0ZTiE3 Q==;
X-IronPort-AV: E=Sophos;i="5.88,219,1635177600"; d="scan'208";a="189679938"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2021 12:57:27 +0800
IronPort-SDR: vJmAywSI2+9d2FIzNcHNym4A+3bfOArU/akoHrtgvFkJC+UYxvLkMTaUj0Q+TIh4XOcqXIylp+
 pDTcr1fPRdGnWexEvI/pDgZI141TL0rl2+ldZbeRl6++T/GC0xzgWjjQejbuNMfVzEeRHRNaH8
 PksRwEDoBqVkT20QgT32fZ4Q6+JifBOrFqXl8H7ub1/Wc0DpJCalqv3GSqZPl4ZP5RVodXWDTs
 e97b7w5Cr1QEsfDSM32jaN7P+3xE39va/lcEb9pZ7VLSVzagZi7jUPnAvtD3+oNttzt/zwNrh6
 iUfZNg3s/ImgPJ1+Dt51hiSd
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:31:43 -0800
IronPort-SDR: q5iXdjthcx3ET6rHKXqd050HWvT9oL3Q43yhLcJfAJ6ekrgjoJOP5G/SuFAuDWDLztoo3RBd+Z
 eA5XcQVKNEpscK05kIjQE3ySCtSgAYkwFnQ0VKWG0cWCVlo3+tZB+QPEXYec7sUTumbfb8Tt8c
 i2P+xtEjaKqBUhuhZEr18V/5Q3s+DhWz7u9lw8/wqIu+g16fNUl7gSmKv5l5GiQsOW8E7H3nJA
 WRW5gcggkqUFUzdD/9W5n+kb7AidNfVAReaSJOTPjpJK/o84Qm8pjeuZ93TX26Nd6g30tPAjQY
 8iA=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:57:28 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JHS4k5fYvz1RwFN
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 20:57:26 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639976245; x=1642568246; bh=g2oyOgtU7+EqbDyX1I
 I4iIoFM5jQlvAzLFxTGStVWFE=; b=tmI9BTdmyXRFDzHQcR8iXmrTSokL3j6nJd
 SR+XRpCtsTzf9JhpS/G531RJANv6VM4VSOFFMpxrTb9nfoKc039Imws/IsI5LuTZ
 svD1xqR4tL51wwFy6Ffqg5luoi3dHF2wDnWUwINYrNOAq0ad1o0oHsyR+FxNF5FD
 9qHXeH6ZLArMgHdkV4c99/Hh7fnUJ00Xw9GJRlYGilZy2bpE1GNJgwyFiRv5NXMZ
 ZSVKLSVeE/2zT65mDL4f5WIumBaA61dOpNEZkK2OdIK22sBYawXPDUxLWjeH4hbN
 3Pqjf4OASeeWuDopQAINnWF3+Uq/nnb31Bu46EoHPj1X4BrrcPxg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id eccH2C-fFCdN for <qemu-devel@nongnu.org>;
 Sun, 19 Dec 2021 20:57:25 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.68])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JHS4d2F7kz1RtVG;
 Sun, 19 Dec 2021 20:57:20 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Kito Cheng <kito.cheng@sifive.com>,
 Chih-Min Chao <chihmin.chao@sifive.com>,
 Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 02/88] target/riscv: zfh: half-precision computational
Date: Mon, 20 Dec 2021 14:55:39 +1000
Message-Id: <20211220045705.62174-3-alistair.francis@opensource.wdc.com>
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

From: Kito Cheng <kito.cheng@sifive.com>

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
Signed-off-by: Chih-Min Chao <chihmin.chao@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20211210074329.5775-3-frank.chang@sifive.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/helper.h                     |  13 +++
 target/riscv/internals.h                  |  16 +++
 target/riscv/insn32.decode                |  11 ++
 target/riscv/fpu_helper.c                 |  86 +++++++++++++++
 target/riscv/insn_trans/trans_rvzfh.c.inc | 129 ++++++++++++++++++++++
 5 files changed, 255 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index c7a5376227..c6c0323faf 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -7,12 +7,16 @@ DEF_HELPER_FLAGS_2(set_rounding_mode, TCG_CALL_NO_WG, v=
oid, env, i32)
 /* Floating Point - fused */
 DEF_HELPER_FLAGS_4(fmadd_s, TCG_CALL_NO_RWG, i64, env, i64, i64, i64)
 DEF_HELPER_FLAGS_4(fmadd_d, TCG_CALL_NO_RWG, i64, env, i64, i64, i64)
+DEF_HELPER_FLAGS_4(fmadd_h, TCG_CALL_NO_RWG, i64, env, i64, i64, i64)
 DEF_HELPER_FLAGS_4(fmsub_s, TCG_CALL_NO_RWG, i64, env, i64, i64, i64)
 DEF_HELPER_FLAGS_4(fmsub_d, TCG_CALL_NO_RWG, i64, env, i64, i64, i64)
+DEF_HELPER_FLAGS_4(fmsub_h, TCG_CALL_NO_RWG, i64, env, i64, i64, i64)
 DEF_HELPER_FLAGS_4(fnmsub_s, TCG_CALL_NO_RWG, i64, env, i64, i64, i64)
 DEF_HELPER_FLAGS_4(fnmsub_d, TCG_CALL_NO_RWG, i64, env, i64, i64, i64)
+DEF_HELPER_FLAGS_4(fnmsub_h, TCG_CALL_NO_RWG, i64, env, i64, i64, i64)
 DEF_HELPER_FLAGS_4(fnmadd_s, TCG_CALL_NO_RWG, i64, env, i64, i64, i64)
 DEF_HELPER_FLAGS_4(fnmadd_d, TCG_CALL_NO_RWG, i64, env, i64, i64, i64)
+DEF_HELPER_FLAGS_4(fnmadd_h, TCG_CALL_NO_RWG, i64, env, i64, i64, i64)
=20
 /* Floating Point - Single Precision */
 DEF_HELPER_FLAGS_3(fadd_s, TCG_CALL_NO_RWG, i64, env, i64, i64)
@@ -62,6 +66,15 @@ DEF_HELPER_FLAGS_1(fclass_d, TCG_CALL_NO_RWG_SE, tl, i=
64)
 DEF_HELPER_FLAGS_2(clmul, TCG_CALL_NO_RWG_SE, tl, tl, tl)
 DEF_HELPER_FLAGS_2(clmulr, TCG_CALL_NO_RWG_SE, tl, tl, tl)
=20
+/* Floating Point - Half Precision */
+DEF_HELPER_FLAGS_3(fadd_h, TCG_CALL_NO_RWG, i64, env, i64, i64)
+DEF_HELPER_FLAGS_3(fsub_h, TCG_CALL_NO_RWG, i64, env, i64, i64)
+DEF_HELPER_FLAGS_3(fmul_h, TCG_CALL_NO_RWG, i64, env, i64, i64)
+DEF_HELPER_FLAGS_3(fdiv_h, TCG_CALL_NO_RWG, i64, env, i64, i64)
+DEF_HELPER_FLAGS_3(fmin_h, TCG_CALL_NO_RWG, i64, env, i64, i64)
+DEF_HELPER_FLAGS_3(fmax_h, TCG_CALL_NO_RWG, i64, env, i64, i64)
+DEF_HELPER_FLAGS_2(fsqrt_h, TCG_CALL_NO_RWG, i64, env, i64)
+
 /* Special functions */
 DEF_HELPER_2(csrr, tl, env, int)
 DEF_HELPER_3(csrw, void, env, int, tl)
diff --git a/target/riscv/internals.h b/target/riscv/internals.h
index b15ad394bb..bce91da11a 100644
--- a/target/riscv/internals.h
+++ b/target/riscv/internals.h
@@ -58,4 +58,20 @@ static inline float32 check_nanbox_s(uint64_t f)
     }
 }
=20
+static inline uint64_t nanbox_h(float16 f)
+{
+    return f | MAKE_64BIT_MASK(16, 48);
+}
+
+static inline float16 check_nanbox_h(uint64_t f)
+{
+    uint64_t mask =3D MAKE_64BIT_MASK(16, 48);
+
+    if (likely((f & mask) =3D=3D mask)) {
+        return (uint16_t)f;
+    } else {
+        return 0x7E00u; /* default qnan */
+    }
+}
+
 #endif
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index b36a3d8dbf..66c231a301 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -730,3 +730,14 @@ bseti      00101. ........... 001 ..... 0010011 @sh
 # *** RV32 Zfh Extension ***
 flh        ............   ..... 001 ..... 0000111 @i
 fsh        .......  ..... ..... 001 ..... 0100111 @s
+fmadd_h    ..... 10 ..... ..... ... ..... 1000011 @r4_rm
+fmsub_h    ..... 10 ..... ..... ... ..... 1000111 @r4_rm
+fnmsub_h   ..... 10 ..... ..... ... ..... 1001011 @r4_rm
+fnmadd_h   ..... 10 ..... ..... ... ..... 1001111 @r4_rm
+fadd_h     0000010  ..... ..... ... ..... 1010011 @r_rm
+fsub_h     0000110  ..... ..... ... ..... 1010011 @r_rm
+fmul_h     0001010  ..... ..... ... ..... 1010011 @r_rm
+fdiv_h     0001110  ..... ..... ... ..... 1010011 @r_rm
+fsqrt_h    0101110  00000 ..... ... ..... 1010011 @r2_rm
+fmin_h     0010110  ..... ..... 000 ..... 1010011 @r
+fmax_h     0010110  ..... ..... 001 ..... 1010011 @r
diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c
index d62f470900..20bb89ad14 100644
--- a/target/riscv/fpu_helper.c
+++ b/target/riscv/fpu_helper.c
@@ -81,6 +81,15 @@ void helper_set_rounding_mode(CPURISCVState *env, uint=
32_t rm)
     set_float_rounding_mode(softrm, &env->fp_status);
 }
=20
+static uint64_t do_fmadd_h(CPURISCVState *env, uint64_t rs1, uint64_t rs=
2,
+                           uint64_t rs3, int flags)
+{
+    float16 frs1 =3D check_nanbox_h(rs1);
+    float16 frs2 =3D check_nanbox_h(rs2);
+    float16 frs3 =3D check_nanbox_h(rs3);
+    return nanbox_h(float16_muladd(frs1, frs2, frs3, flags, &env->fp_sta=
tus));
+}
+
 static uint64_t do_fmadd_s(CPURISCVState *env, uint64_t rs1, uint64_t rs=
2,
                            uint64_t rs3, int flags)
 {
@@ -102,6 +111,12 @@ uint64_t helper_fmadd_d(CPURISCVState *env, uint64_t=
 frs1, uint64_t frs2,
     return float64_muladd(frs1, frs2, frs3, 0, &env->fp_status);
 }
=20
+uint64_t helper_fmadd_h(CPURISCVState *env, uint64_t frs1, uint64_t frs2=
,
+                        uint64_t frs3)
+{
+    return do_fmadd_h(env, frs1, frs2, frs3, 0);
+}
+
 uint64_t helper_fmsub_s(CPURISCVState *env, uint64_t frs1, uint64_t frs2=
,
                         uint64_t frs3)
 {
@@ -115,6 +130,12 @@ uint64_t helper_fmsub_d(CPURISCVState *env, uint64_t=
 frs1, uint64_t frs2,
                           &env->fp_status);
 }
=20
+uint64_t helper_fmsub_h(CPURISCVState *env, uint64_t frs1, uint64_t frs2=
,
+                        uint64_t frs3)
+{
+    return do_fmadd_h(env, frs1, frs2, frs3, float_muladd_negate_c);
+}
+
 uint64_t helper_fnmsub_s(CPURISCVState *env, uint64_t frs1, uint64_t frs=
2,
                          uint64_t frs3)
 {
@@ -128,6 +149,12 @@ uint64_t helper_fnmsub_d(CPURISCVState *env, uint64_=
t frs1, uint64_t frs2,
                           &env->fp_status);
 }
=20
+uint64_t helper_fnmsub_h(CPURISCVState *env, uint64_t frs1, uint64_t frs=
2,
+                         uint64_t frs3)
+{
+    return do_fmadd_h(env, frs1, frs2, frs3, float_muladd_negate_product=
);
+}
+
 uint64_t helper_fnmadd_s(CPURISCVState *env, uint64_t frs1, uint64_t frs=
2,
                          uint64_t frs3)
 {
@@ -142,6 +169,13 @@ uint64_t helper_fnmadd_d(CPURISCVState *env, uint64_=
t frs1, uint64_t frs2,
                           float_muladd_negate_product, &env->fp_status);
 }
=20
+uint64_t helper_fnmadd_h(CPURISCVState *env, uint64_t frs1, uint64_t frs=
2,
+                         uint64_t frs3)
+{
+    return do_fmadd_h(env, frs1, frs2, frs3,
+                      float_muladd_negate_c | float_muladd_negate_produc=
t);
+}
+
 uint64_t helper_fadd_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
 {
     float32 frs1 =3D check_nanbox_s(rs1);
@@ -374,3 +408,55 @@ target_ulong helper_fclass_d(uint64_t frs1)
 {
     return fclass_d(frs1);
 }
+
+uint64_t helper_fadd_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
+{
+    float16 frs1 =3D check_nanbox_h(rs1);
+    float16 frs2 =3D check_nanbox_h(rs2);
+    return nanbox_h(float16_add(frs1, frs2, &env->fp_status));
+}
+
+uint64_t helper_fsub_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
+{
+    float16 frs1 =3D check_nanbox_h(rs1);
+    float16 frs2 =3D check_nanbox_h(rs2);
+    return nanbox_h(float16_sub(frs1, frs2, &env->fp_status));
+}
+
+uint64_t helper_fmul_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
+{
+    float16 frs1 =3D check_nanbox_h(rs1);
+    float16 frs2 =3D check_nanbox_h(rs2);
+    return nanbox_h(float16_mul(frs1, frs2, &env->fp_status));
+}
+
+uint64_t helper_fdiv_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
+{
+    float16 frs1 =3D check_nanbox_h(rs1);
+    float16 frs2 =3D check_nanbox_h(rs2);
+    return nanbox_h(float16_div(frs1, frs2, &env->fp_status));
+}
+
+uint64_t helper_fmin_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
+{
+    float16 frs1 =3D check_nanbox_h(rs1);
+    float16 frs2 =3D check_nanbox_h(rs2);
+    return nanbox_h(env->priv_ver < PRIV_VERSION_1_11_0 ?
+                    float16_minnum(frs1, frs2, &env->fp_status) :
+                    float16_minimum_number(frs1, frs2, &env->fp_status))=
;
+}
+
+uint64_t helper_fmax_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
+{
+    float16 frs1 =3D check_nanbox_h(rs1);
+    float16 frs2 =3D check_nanbox_h(rs2);
+    return nanbox_h(env->priv_ver < PRIV_VERSION_1_11_0 ?
+                    float16_maxnum(frs1, frs2, &env->fp_status) :
+                    float16_maximum_number(frs1, frs2, &env->fp_status))=
;
+}
+
+uint64_t helper_fsqrt_h(CPURISCVState *env, uint64_t rs1)
+{
+    float16 frs1 =3D check_nanbox_h(rs1);
+    return nanbox_h(float16_sqrt(frs1, &env->fp_status));
+}
diff --git a/target/riscv/insn_trans/trans_rvzfh.c.inc b/target/riscv/ins=
n_trans/trans_rvzfh.c.inc
index dad1d703d7..9764d76f8b 100644
--- a/target/riscv/insn_trans/trans_rvzfh.c.inc
+++ b/target/riscv/insn_trans/trans_rvzfh.c.inc
@@ -63,3 +63,132 @@ static bool trans_fsh(DisasContext *ctx, arg_fsh *a)
=20
     return true;
 }
+
+static bool trans_fmadd_h(DisasContext *ctx, arg_fmadd_h *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFH(ctx);
+
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fmadd_h(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1],
+                       cpu_fpr[a->rs2], cpu_fpr[a->rs3]);
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_fmsub_h(DisasContext *ctx, arg_fmsub_h *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFH(ctx);
+
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fmsub_h(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1],
+                       cpu_fpr[a->rs2], cpu_fpr[a->rs3]);
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_fnmsub_h(DisasContext *ctx, arg_fnmsub_h *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFH(ctx);
+
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fnmsub_h(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1],
+                        cpu_fpr[a->rs2], cpu_fpr[a->rs3]);
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_fnmadd_h(DisasContext *ctx, arg_fnmadd_h *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFH(ctx);
+
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fnmadd_h(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1],
+                        cpu_fpr[a->rs2], cpu_fpr[a->rs3]);
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_fadd_h(DisasContext *ctx, arg_fadd_h *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFH(ctx);
+
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fadd_h(cpu_fpr[a->rd], cpu_env,
+                      cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_fsub_h(DisasContext *ctx, arg_fsub_h *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFH(ctx);
+
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fsub_h(cpu_fpr[a->rd], cpu_env,
+                      cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_fmul_h(DisasContext *ctx, arg_fmul_h *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFH(ctx);
+
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fmul_h(cpu_fpr[a->rd], cpu_env,
+                      cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_fdiv_h(DisasContext *ctx, arg_fdiv_h *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFH(ctx);
+
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fdiv_h(cpu_fpr[a->rd], cpu_env,
+                      cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_fsqrt_h(DisasContext *ctx, arg_fsqrt_h *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFH(ctx);
+
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fsqrt_h(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1]);
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_fmin_h(DisasContext *ctx, arg_fmin_h *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFH(ctx);
+
+    gen_helper_fmin_h(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1],
+                      cpu_fpr[a->rs2]);
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_fmax_h(DisasContext *ctx, arg_fmax_h *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFH(ctx);
+
+    gen_helper_fmax_h(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1],
+                      cpu_fpr[a->rs2]);
+    mark_fs_dirty(ctx);
+    return true;
+}
--=20
2.31.1


