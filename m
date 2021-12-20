Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5356347A4DB
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 07:11:01 +0100 (CET)
Received: from localhost ([::1]:37780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzBsy-0001OR-AH
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 01:11:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAo0-0004Qh-FT
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 00:01:49 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:13359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAnc-0008G0-G2
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 00:01:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639976484; x=1671512484;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=O+vCbwn94WFN5CH0vtGjiS48XI5GZu2am6DxDJkYfPk=;
 b=D4x3SaM2AL/ETypShwtczB8u2aGN62kXBAtNlK1jELSJf5nyewuXt27k
 wqV4PXq/3hGlRk9wCrucoREW1T5ah2kp2fdI0Rd74JpfoRFZtjd5SD5uT
 ZbdV4UhPbP0xADvSCtvBZRa38o2PI7kDeqNZbfR7HEc06KpIyaFHvp5zz
 vEeQKzHA1wC6Yfh8PlLq31SyHOKo0kPNNzwPApjMlyyBtJLpctaVuWh6X
 B1kRCMSy7r+9SidMK7cpgWeD8UKMYntgjwd1bkRBmndB4920FhgRc66bW
 1aZEmnS9d1O8BRQERrTsUGh5KW2d2tDfq2cLizImezL0aymz/uOgY2ICl A==;
X-IronPort-AV: E=Sophos;i="5.88,219,1635177600"; d="scan'208";a="189680162"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2021 13:00:51 +0800
IronPort-SDR: I53ZSqGSxBoEoC0beKCG4SQz50IVPSi6rWp4aGjVe2oStjXXd7PeDp1qOZEaqu4IaEmyV8lZGC
 zlbBKEvMff4pjeN4ZoqIKGfaPArgHniauGBmNqpPNvbEJXv1Uase95dY7BYVO3JwwHZhHFYiYX
 XfgOydgkx5iXiaRnTKCJ5fEGe2HPa/nLlk30EiKpYNIpTteWUa3n8jikdAegwuDSD/vPYnWAFw
 JJZzhUX1GwhoE7ykthlrgVIjzV0ls+JQhE2ctdMnknhr9+cWCRaYQ0x8Glnx4sb1TNI6bByMZx
 Ovn+aLNTTkpYVj4f9TsxJBiA
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:33:39 -0800
IronPort-SDR: +5XWhUkxdjk23dELExxQuF6k57RVINHSXp+rNEYlFKwxkPoc2zBiZ219GvvOQdbZjI10KQ+bmY
 kvQrfL6GkFhjTggf2Pq9I2AKrbFiHo/ySLoSuYascT39ThSV715N33bZpg0ZBCG+4Q/OmRgBB9
 W1vF/iHT1ea1EWgC3FkkwuIC9T5o2kZRPytccgLA5wCgZ6RjBcJ9CA0OY+xky6biluWCWYibPq
 6CSLxT2oCOLbwXFEfwAo0VCh8nLH/NzxYf33ZdOx6h2MHxMkjaJ7VmDI3mbk9tiTIIIWESPaP1
 4r8=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 21:00:49 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JHS8d5PjRz1RvTg
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 21:00:49 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639976449; x=1642568450; bh=O+vCbwn94WFN5CH0vt
 GjiS48XI5GZu2am6DxDJkYfPk=; b=WEfuF7Yd38XLr3KasfDZslTZiGa99a/6gd
 Jljx2tC5FJWKNZQYkrxu+e/h3XgDnG10eWg99Ji/pYwSben35ZGaNMVTEij/UsC2
 gS+z/RMWdf2lauzg79MvrEDE3VX2pk8qE2660t/EZ+ooX759yzpzDD5Ty2t25COT
 MxnBdBMVMJxPpVDNbG7pjkNYl/w3kv3+jw/COTWRi/IsJSdzFvUyQ4MxRBK+WAPz
 6/nkWILL0Sbbvncfoad1JpGfuzdIUPOSarF6+oEe8gMutIDrAsyoghhOlccKokrv
 V7q6ZGdCvKBcFxs9J7l3y66U25vGOPjMvwuagOpuv+3QY3lz7c0Q==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id GGpYc98A3tzX for <qemu-devel@nongnu.org>;
 Sun, 19 Dec 2021 21:00:49 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.68])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JHS8Y51jXz1RtVG;
 Sun, 19 Dec 2021 21:00:45 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 52/88] target/riscv: rvv-1.0: narrowing integer right shift
 instructions
Date: Mon, 20 Dec 2021 14:56:29 +1000
Message-Id: <20211220045705.62174-53-alistair.francis@opensource.wdc.com>
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
Message-Id: <20211210075704.23951-45-frank.chang@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/helper.h                   | 24 +++++++-------
 target/riscv/insn32.decode              | 12 +++----
 target/riscv/vector_helper.c            | 24 +++++++-------
 target/riscv/insn_trans/trans_rvv.c.inc | 42 ++++++++++++-------------
 4 files changed, 51 insertions(+), 51 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index f2e8d107d2..304c12494d 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -351,18 +351,18 @@ DEF_HELPER_6(vsra_vx_h, void, ptr, ptr, tl, ptr, en=
v, i32)
 DEF_HELPER_6(vsra_vx_w, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vsra_vx_d, void, ptr, ptr, tl, ptr, env, i32)
=20
-DEF_HELPER_6(vnsrl_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
-DEF_HELPER_6(vnsrl_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
-DEF_HELPER_6(vnsrl_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
-DEF_HELPER_6(vnsra_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
-DEF_HELPER_6(vnsra_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
-DEF_HELPER_6(vnsra_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
-DEF_HELPER_6(vnsrl_vx_b, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vnsrl_vx_h, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vnsrl_vx_w, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vnsra_vx_b, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vnsra_vx_h, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vnsra_vx_w, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vnsrl_wv_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vnsrl_wv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vnsrl_wv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vnsra_wv_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vnsra_wv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vnsra_wv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vnsrl_wx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vnsrl_wx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vnsrl_wx_w, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vnsra_wx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vnsra_wx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vnsra_wx_w, void, ptr, ptr, tl, ptr, env, i32)
=20
 DEF_HELPER_6(vmseq_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vmseq_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 9c4089d7a7..a3f1101cd6 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -406,12 +406,12 @@ vsrl_vi         101000 . ..... ..... 011 ..... 1010=
111 @r_vm
 vsra_vv         101001 . ..... ..... 000 ..... 1010111 @r_vm
 vsra_vx         101001 . ..... ..... 100 ..... 1010111 @r_vm
 vsra_vi         101001 . ..... ..... 011 ..... 1010111 @r_vm
-vnsrl_vv        101100 . ..... ..... 000 ..... 1010111 @r_vm
-vnsrl_vx        101100 . ..... ..... 100 ..... 1010111 @r_vm
-vnsrl_vi        101100 . ..... ..... 011 ..... 1010111 @r_vm
-vnsra_vv        101101 . ..... ..... 000 ..... 1010111 @r_vm
-vnsra_vx        101101 . ..... ..... 100 ..... 1010111 @r_vm
-vnsra_vi        101101 . ..... ..... 011 ..... 1010111 @r_vm
+vnsrl_wv        101100 . ..... ..... 000 ..... 1010111 @r_vm
+vnsrl_wx        101100 . ..... ..... 100 ..... 1010111 @r_vm
+vnsrl_wi        101100 . ..... ..... 011 ..... 1010111 @r_vm
+vnsra_wv        101101 . ..... ..... 000 ..... 1010111 @r_vm
+vnsra_wx        101101 . ..... ..... 100 ..... 1010111 @r_vm
+vnsra_wi        101101 . ..... ..... 011 ..... 1010111 @r_vm
 vmseq_vv        011000 . ..... ..... 000 ..... 1010111 @r_vm
 vmseq_vx        011000 . ..... ..... 100 ..... 1010111 @r_vm
 vmseq_vi        011000 . ..... ..... 011 ..... 1010111 @r_vm
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 54405d898b..e885d4d353 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -1164,18 +1164,18 @@ GEN_VEXT_SHIFT_VX(vsra_vx_w, int32_t, int32_t, H4=
, H4, DO_SRL, 0x1f)
 GEN_VEXT_SHIFT_VX(vsra_vx_d, int64_t, int64_t, H8, H8, DO_SRL, 0x3f)
=20
 /* Vector Narrowing Integer Right Shift Instructions */
-GEN_VEXT_SHIFT_VV(vnsrl_vv_b, uint8_t,  uint16_t, H1, H2, DO_SRL, 0xf)
-GEN_VEXT_SHIFT_VV(vnsrl_vv_h, uint16_t, uint32_t, H2, H4, DO_SRL, 0x1f)
-GEN_VEXT_SHIFT_VV(vnsrl_vv_w, uint32_t, uint64_t, H4, H8, DO_SRL, 0x3f)
-GEN_VEXT_SHIFT_VV(vnsra_vv_b, uint8_t,  int16_t, H1, H2, DO_SRL, 0xf)
-GEN_VEXT_SHIFT_VV(vnsra_vv_h, uint16_t, int32_t, H2, H4, DO_SRL, 0x1f)
-GEN_VEXT_SHIFT_VV(vnsra_vv_w, uint32_t, int64_t, H4, H8, DO_SRL, 0x3f)
-GEN_VEXT_SHIFT_VX(vnsrl_vx_b, uint8_t, uint16_t, H1, H2, DO_SRL, 0xf)
-GEN_VEXT_SHIFT_VX(vnsrl_vx_h, uint16_t, uint32_t, H2, H4, DO_SRL, 0x1f)
-GEN_VEXT_SHIFT_VX(vnsrl_vx_w, uint32_t, uint64_t, H4, H8, DO_SRL, 0x3f)
-GEN_VEXT_SHIFT_VX(vnsra_vx_b, int8_t, int16_t, H1, H2, DO_SRL, 0xf)
-GEN_VEXT_SHIFT_VX(vnsra_vx_h, int16_t, int32_t, H2, H4, DO_SRL, 0x1f)
-GEN_VEXT_SHIFT_VX(vnsra_vx_w, int32_t, int64_t, H4, H8, DO_SRL, 0x3f)
+GEN_VEXT_SHIFT_VV(vnsrl_wv_b, uint8_t,  uint16_t, H1, H2, DO_SRL, 0xf)
+GEN_VEXT_SHIFT_VV(vnsrl_wv_h, uint16_t, uint32_t, H2, H4, DO_SRL, 0x1f)
+GEN_VEXT_SHIFT_VV(vnsrl_wv_w, uint32_t, uint64_t, H4, H8, DO_SRL, 0x3f)
+GEN_VEXT_SHIFT_VV(vnsra_wv_b, uint8_t,  int16_t, H1, H2, DO_SRL, 0xf)
+GEN_VEXT_SHIFT_VV(vnsra_wv_h, uint16_t, int32_t, H2, H4, DO_SRL, 0x1f)
+GEN_VEXT_SHIFT_VV(vnsra_wv_w, uint32_t, int64_t, H4, H8, DO_SRL, 0x3f)
+GEN_VEXT_SHIFT_VX(vnsrl_wx_b, uint8_t, uint16_t, H1, H2, DO_SRL, 0xf)
+GEN_VEXT_SHIFT_VX(vnsrl_wx_h, uint16_t, uint32_t, H2, H4, DO_SRL, 0x1f)
+GEN_VEXT_SHIFT_VX(vnsrl_wx_w, uint32_t, uint64_t, H4, H8, DO_SRL, 0x3f)
+GEN_VEXT_SHIFT_VX(vnsra_wx_b, int8_t, int16_t, H1, H2, DO_SRL, 0xf)
+GEN_VEXT_SHIFT_VX(vnsra_wx_h, int16_t, int32_t, H2, H4, DO_SRL, 0x1f)
+GEN_VEXT_SHIFT_VX(vnsra_wx_w, int32_t, int64_t, H4, H8, DO_SRL, 0x3f)
=20
 /* Vector Integer Comparison Instructions */
 #define DO_MSEQ(N, M) (N =3D=3D M)
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
index 357615a11c..f6202835ff 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -1690,7 +1690,7 @@ GEN_OPIVI_GVEC_TRANS(vsrl_vi, IMM_TRUNC_SEW, vsrl_v=
x, shri)
 GEN_OPIVI_GVEC_TRANS(vsra_vi, IMM_TRUNC_SEW, vsra_vx, sari)
=20
 /* Vector Narrowing Integer Right Shift Instructions */
-static bool opivv_narrow_check(DisasContext *s, arg_rmrr *a)
+static bool opiwv_narrow_check(DisasContext *s, arg_rmrr *a)
 {
     return require_rvv(s) &&
            vext_check_isa_ill(s) &&
@@ -1698,10 +1698,10 @@ static bool opivv_narrow_check(DisasContext *s, a=
rg_rmrr *a)
 }
=20
 /* OPIVV with NARROW */
-#define GEN_OPIVV_NARROW_TRANS(NAME)                               \
+#define GEN_OPIWV_NARROW_TRANS(NAME)                               \
 static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
 {                                                                  \
-    if (opivv_narrow_check(s, a)) {                                \
+    if (opiwv_narrow_check(s, a)) {                                \
         uint32_t data =3D 0;                                         \
         static gen_helper_gvec_4_ptr * const fns[3] =3D {            \
             gen_helper_##NAME##_b,                                 \
@@ -1724,10 +1724,10 @@ static bool trans_##NAME(DisasContext *s, arg_rmr=
r *a)             \
     }                                                              \
     return false;                                                  \
 }
-GEN_OPIVV_NARROW_TRANS(vnsra_vv)
-GEN_OPIVV_NARROW_TRANS(vnsrl_vv)
+GEN_OPIWV_NARROW_TRANS(vnsra_wv)
+GEN_OPIWV_NARROW_TRANS(vnsrl_wv)
=20
-static bool opivx_narrow_check(DisasContext *s, arg_rmrr *a)
+static bool opiwx_narrow_check(DisasContext *s, arg_rmrr *a)
 {
     return require_rvv(s) &&
            vext_check_isa_ill(s) &&
@@ -1735,10 +1735,10 @@ static bool opivx_narrow_check(DisasContext *s, a=
rg_rmrr *a)
 }
=20
 /* OPIVX with NARROW */
-#define GEN_OPIVX_NARROW_TRANS(NAME)                                    =
 \
+#define GEN_OPIWX_NARROW_TRANS(NAME)                                    =
 \
 static bool trans_##NAME(DisasContext *s, arg_rmrr *a)                  =
 \
 {                                                                       =
 \
-    if (opivx_narrow_check(s, a)) {                                     =
 \
+    if (opiwx_narrow_check(s, a)) {                                     =
 \
         static gen_helper_opivx * const fns[3] =3D {                    =
   \
             gen_helper_##NAME##_b,                                      =
 \
             gen_helper_##NAME##_h,                                      =
 \
@@ -1749,14 +1749,14 @@ static bool trans_##NAME(DisasContext *s, arg_rmr=
r *a)                   \
     return false;                                                       =
 \
 }
=20
-GEN_OPIVX_NARROW_TRANS(vnsra_vx)
-GEN_OPIVX_NARROW_TRANS(vnsrl_vx)
+GEN_OPIWX_NARROW_TRANS(vnsra_wx)
+GEN_OPIWX_NARROW_TRANS(vnsrl_wx)
=20
-/* OPIVI with NARROW */
-#define GEN_OPIVI_NARROW_TRANS(NAME, IMM_MODE, OPIVX)                   =
 \
+/* OPIWI with NARROW */
+#define GEN_OPIWI_NARROW_TRANS(NAME, IMM_MODE, OPIVX)                   =
 \
 static bool trans_##NAME(DisasContext *s, arg_rmrr *a)                  =
 \
 {                                                                       =
 \
-    if (opivx_narrow_check(s, a)) {                                     =
 \
+    if (opiwx_narrow_check(s, a)) {                                     =
 \
         static gen_helper_opivx * const fns[3] =3D {                    =
   \
             gen_helper_##OPIVX##_b,                                     =
 \
             gen_helper_##OPIVX##_h,                                     =
 \
@@ -1768,8 +1768,8 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr =
*a)                   \
     return false;                                                       =
 \
 }
=20
-GEN_OPIVI_NARROW_TRANS(vnsra_vi, IMM_ZX, vnsra_vx)
-GEN_OPIVI_NARROW_TRANS(vnsrl_vi, IMM_ZX, vnsrl_vx)
+GEN_OPIWI_NARROW_TRANS(vnsra_wi, IMM_ZX, vnsra_wx)
+GEN_OPIWI_NARROW_TRANS(vnsrl_wi, IMM_ZX, vnsrl_wx)
=20
 /* Vector Integer Comparison Instructions */
 /*
@@ -2034,12 +2034,12 @@ GEN_OPIVI_TRANS(vssrl_vi, IMM_ZX, vssrl_vx, opivx=
_check)
 GEN_OPIVI_TRANS(vssra_vi, IMM_SX, vssra_vx, opivx_check)
=20
 /* Vector Narrowing Fixed-Point Clip Instructions */
-GEN_OPIVV_NARROW_TRANS(vnclipu_vv)
-GEN_OPIVV_NARROW_TRANS(vnclip_vv)
-GEN_OPIVX_NARROW_TRANS(vnclipu_vx)
-GEN_OPIVX_NARROW_TRANS(vnclip_vx)
-GEN_OPIVI_NARROW_TRANS(vnclipu_vi, IMM_ZX, vnclipu_vx)
-GEN_OPIVI_NARROW_TRANS(vnclip_vi, IMM_ZX, vnclip_vx)
+GEN_OPIWV_NARROW_TRANS(vnclipu_vv)
+GEN_OPIWV_NARROW_TRANS(vnclip_vv)
+GEN_OPIWX_NARROW_TRANS(vnclipu_vx)
+GEN_OPIWX_NARROW_TRANS(vnclip_vx)
+GEN_OPIWI_NARROW_TRANS(vnclipu_vi, IMM_ZX, vnclipu_vx)
+GEN_OPIWI_NARROW_TRANS(vnclip_vi, IMM_ZX, vnclip_vx)
=20
 /*
  *** Vector Float Point Arithmetic Instructions
--=20
2.31.1


