Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3877C50ACFA
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 02:53:57 +0200 (CEST)
Received: from localhost ([::1]:56154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhhYa-00075Z-8M
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 20:53:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1041ecfe3=alistair.francis@opensource.wdc.com>)
 id 1nhhJD-00076G-SE
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 20:38:04 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:17573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1041ecfe3=alistair.francis@opensource.wdc.com>)
 id 1nhhJA-0005Tm-GO
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 20:38:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1650587880; x=1682123880;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=su5YxZklaH/xa9o3VVgOYBluOVxxEPtn6VK/HCmbu3Q=;
 b=NkZK0rFk6s5qHuWjQaNmlmPO8KwwgUMHejTGHu0UgE9mu8GJ9rz5YzoC
 AeO5G8hVNFJWWhrFDtOtgugZATNhzwzTH5Cu+hOsAT5l2kwoKnxFaUt/U
 +AAAK2tdAgp0fjuf8YcDq9sOLwMN3vU8H7WNKHVJZkFaN7XKandV7q7rK
 vT/XexAZkwJAduVB92ofCaDH9liW1OlL9X1GvDEK4e/8Av/6ZrBzFV757
 BNjgxqDWz7qwIMX9lLtFIO2DuS0jGGTRHWOjDJSQLEelWL0t9H9+V5Y8+
 tShpr69WQfX99UivPlfMAnEDYwzSe7OQHKJwUQgdt/jribp9rQzBopBd+ Q==;
X-IronPort-AV: E=Sophos;i="5.90,280,1643644800"; d="scan'208";a="310483387"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 22 Apr 2022 08:37:55 +0800
IronPort-SDR: y4I3hT8jIu7wYKge2wuW203BZd070//s/Qh1pLoVXncqltSQiFXbWCN3viAK2YZNCbOM9Pq/Dl
 9BXf9P+UtNumvvfmyjBASAOoxZZ+8BjrYN+NK/NDnchSw7wr5JFOggcJM/kMP7QoRaueiFfQrb
 jcleEyNVLh5SBHOyJv7GK2wFBRxvakqlk+rdxIXldKBoIuH0RtvvsKi2Q7qKDO5ZSIjQAVDRT4
 3TOkdKCm/VlANcx7cNfWInd77Y2xbANTJ2dDP8L8CnG2N7Qivs9pajaKg0/2nfyQYLn+7TAVWS
 y4y7R/mSKvDslHLIEqaPcwbB
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Apr 2022 17:08:12 -0700
IronPort-SDR: jD/tgMZB6xjaFpwfWKWuPvV2z9GWHhe9nXA/QUZHNOEeVCAqexYkIZD1uMSLwdQf7Jq04VsJ/I
 U6AtZqI+EplKho3upxNz9yKJ4GEFKYNSeegtPIvVJZpANbDoxpCvMnG0IMTaH1pDCPwQFJ3FYP
 m8q+dl59e0dUm0HhsiWdcuzd9YnZQ76BvZ3ZRmM0KPLwW9tU3TtxkY0lzhfMXIbCVyTFntv2Ae
 Dqcby0OL65b9ZHR9h4zynlZ6pxi2ah8Yr3/NLaqW2ei+xYmq0GmZvGmBJ8pHMoLM5m9XBPs0B/
 Hoc=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Apr 2022 17:37:55 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KkwVW0Pdhz1SVp0
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 17:37:55 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1650587874; x=1653179875; bh=su5YxZklaH/xa9o3VV
 gOYBluOVxxEPtn6VK/HCmbu3Q=; b=GsNBhmvkZL29JhpRd2xzfQQvR1umVZUKiN
 dhhs8/qhS9ZWFC8e9rfBeQhf4izbLIikeeEU31Wbnt1W/zVO3xJ+NI2VtbLDk2RK
 upTFd+rrpRky+OoAc81wBS7YpYt5LPA5y9hk0CbI/xeHjvZchlfoBWBoG7HebydP
 sA90fU7y9jZ6jo++YiVNWgM1RBrPDp/BOHEog/ltvXr/O2AzEZ6tZ0P3o6emdJlT
 GU3TXyv/Py7k9YjpBeWI0hCchHw/DwWUyU14C0lRm+kUo3sGj2op3BBm/x5cXGpb
 0L5O5hkLTuVuyxB+duE5DYXMScaBX095Orq+6b9PfyrCdcD49mtw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id gEIRZjBsXuSL for <qemu-devel@nongnu.org>;
 Thu, 21 Apr 2022 17:37:54 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.120])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KkwVR6p4Hz1Rwrw;
 Thu, 21 Apr 2022 17:37:51 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Weiwei Li <liweiwei@iscas.ac.cn>,
 Junqiang Wang <wangjunqiang@iscas.ac.cn>,
 Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 13/31] target/riscv: optimize helper for vmv<nr>r.v
Date: Fri, 22 Apr 2022 10:36:38 +1000
Message-Id: <20220422003656.1648121-14-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220422003656.1648121-1-alistair.francis@opensource.wdc.com>
References: <20220422003656.1648121-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=1041ecfe3=alistair.francis@opensource.wdc.com;
 helo=esa1.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Weiwei Li <liweiwei@iscas.ac.cn>

LEN is not used for GEN_VEXT_VMV_WHOLE macro, so vmv<nr>r.v can share
the same helper

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220325085902.29500-2-liweiwei@iscas.ac.cn>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/helper.h                   |  5 +----
 target/riscv/vector_helper.c            | 29 ++++++++++---------------
 target/riscv/insn_trans/trans_rvv.c.inc | 17 +++++----------
 3 files changed, 18 insertions(+), 33 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 26bbab2fab..a669d0187b 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1086,10 +1086,7 @@ DEF_HELPER_6(vcompress_vm_h, void, ptr, ptr, ptr, =
ptr, env, i32)
 DEF_HELPER_6(vcompress_vm_w, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vcompress_vm_d, void, ptr, ptr, ptr, ptr, env, i32)
=20
-DEF_HELPER_4(vmv1r_v, void, ptr, ptr, env, i32)
-DEF_HELPER_4(vmv2r_v, void, ptr, ptr, env, i32)
-DEF_HELPER_4(vmv4r_v, void, ptr, ptr, env, i32)
-DEF_HELPER_4(vmv8r_v, void, ptr, ptr, env, i32)
+DEF_HELPER_4(vmvr_v, void, ptr, ptr, env, i32)
=20
 DEF_HELPER_5(vzext_vf2_h, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vzext_vf2_w, void, ptr, ptr, ptr, env, i32)
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 7a6ce0a3bc..99f3134aa0 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4888,25 +4888,18 @@ GEN_VEXT_VCOMPRESS_VM(vcompress_vm_w, uint32_t, H=
4)
 GEN_VEXT_VCOMPRESS_VM(vcompress_vm_d, uint64_t, H8)
=20
 /* Vector Whole Register Move */
-#define GEN_VEXT_VMV_WHOLE(NAME, LEN)                      \
-void HELPER(NAME)(void *vd, void *vs2, CPURISCVState *env, \
-                  uint32_t desc)                           \
-{                                                          \
-    /* EEW =3D 8 */                                          \
-    uint32_t maxsz =3D simd_maxsz(desc);                     \
-    uint32_t i =3D env->vstart;                              \
-                                                           \
-    memcpy((uint8_t *)vd + H1(i),                          \
-           (uint8_t *)vs2 + H1(i),                         \
-           maxsz - env->vstart);                           \
-                                                           \
-    env->vstart =3D 0;                                       \
-}
+void HELPER(vmvr_v)(void *vd, void *vs2, CPURISCVState *env, uint32_t de=
sc)
+{
+    /* EEW =3D 8 */
+    uint32_t maxsz =3D simd_maxsz(desc);
+    uint32_t i =3D env->vstart;
+
+    memcpy((uint8_t *)vd + H1(i),
+           (uint8_t *)vs2 + H1(i),
+           maxsz - env->vstart);
=20
-GEN_VEXT_VMV_WHOLE(vmv1r_v, 1)
-GEN_VEXT_VMV_WHOLE(vmv2r_v, 2)
-GEN_VEXT_VMV_WHOLE(vmv4r_v, 4)
-GEN_VEXT_VMV_WHOLE(vmv8r_v, 8)
+    env->vstart =3D 0;
+}
=20
 /* Vector Integer Extension */
 #define GEN_VEXT_INT_EXT(NAME, ETYPE, DTYPE, HD, HS1)            \
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
index b336d57270..90327509f7 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -3695,7 +3695,7 @@ static bool trans_vcompress_vm(DisasContext *s, arg=
_r *a)
  * Whole Vector Register Move Instructions ignore vtype and vl setting.
  * Thus, we don't need to check vill bit. (Section 16.6)
  */
-#define GEN_VMV_WHOLE_TRANS(NAME, LEN, SEQ)                             =
\
+#define GEN_VMV_WHOLE_TRANS(NAME, LEN)                             \
 static bool trans_##NAME(DisasContext *s, arg_##NAME * a)               =
\
 {                                                                       =
\
     if (require_rvv(s) &&                                               =
\
@@ -3710,13 +3710,8 @@ static bool trans_##NAME(DisasContext *s, arg_##NA=
ME * a)               \
         } else {                                                        =
\
             TCGLabel *over =3D gen_new_label();                         =
  \
             tcg_gen_brcondi_tl(TCG_COND_GEU, cpu_vstart, maxsz, over);  =
\
-                                                                        =
\
-            static gen_helper_gvec_2_ptr * const fns[4] =3D {           =
  \
-                gen_helper_vmv1r_v, gen_helper_vmv2r_v,                 =
\
-                gen_helper_vmv4r_v, gen_helper_vmv8r_v,                 =
\
-            };                                                          =
\
             tcg_gen_gvec_2_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, a->rs2), =
\
-                               cpu_env, maxsz, maxsz, 0, fns[SEQ]);     =
\
+                               cpu_env, maxsz, maxsz, 0, gen_helper_vmvr=
_v); \
             mark_vs_dirty(s);                                           =
\
             gen_set_label(over);                                        =
\
         }                                                               =
\
@@ -3725,10 +3720,10 @@ static bool trans_##NAME(DisasContext *s, arg_##N=
AME * a)               \
     return false;                                                       =
\
 }
=20
-GEN_VMV_WHOLE_TRANS(vmv1r_v, 1, 0)
-GEN_VMV_WHOLE_TRANS(vmv2r_v, 2, 1)
-GEN_VMV_WHOLE_TRANS(vmv4r_v, 4, 2)
-GEN_VMV_WHOLE_TRANS(vmv8r_v, 8, 3)
+GEN_VMV_WHOLE_TRANS(vmv1r_v, 1)
+GEN_VMV_WHOLE_TRANS(vmv2r_v, 2)
+GEN_VMV_WHOLE_TRANS(vmv4r_v, 4)
+GEN_VMV_WHOLE_TRANS(vmv8r_v, 8)
=20
 static bool int_ext_check(DisasContext *s, arg_rmr *a, uint8_t div)
 {
--=20
2.35.1


