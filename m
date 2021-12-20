Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8060347A4A9
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 06:38:30 +0100 (CET)
Received: from localhost ([::1]:34806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzBNV-000292-Fl
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 00:38:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAlX-0002CM-2d
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 23:59:15 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:51452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAlT-0008Bi-Io
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 23:59:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639976351; x=1671512351;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qPpzsAgT0+ZnG0gefRAq2WHAX4dOzdgz5bBoE7uZ6Bs=;
 b=TZ6GiJ4OzgJAgvpIav3mFdzPWZQyFx9/JHqH3TCk12N5hvdztstVfJZS
 jbm3sJJumsTKkGj+/zJE2BvLaWjQJSoTz/8BJbRW14mOWeF97RJxJ7par
 MYwa0lxppJWmiRhnD4G+GejPxmmn2/8X3jYycpqjHWtAa5XslKuncxM1J
 balMGbQ5LloMgi48saNLTa1uD5boeiCt1e9m9FIwTxmyRSSEPdM90NhKp
 J96ZWKukCgQBmUA1w1hRj3nr0cnaP65SzOLQpW1LUhHoW7YnfhkaL+vzR
 w2u5N3h19iLFKysbYdObG3TiqM7WVU3H2s3gvXRtd2RkSY0R8tFbeQx9c A==;
X-IronPort-AV: E=Sophos;i="5.88,219,1635177600"; d="scan'208";a="292661952"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2021 12:59:10 +0800
IronPort-SDR: El/wUPEI0DlLgSPIbGoRXR9OduDtqamUUezziSulcv4dcC3hjhBjx9QaymyWjZ6WMwOx/RudGx
 mFhMQCqUO9FD+s0VFbaH49kv5HOZCnC1eMm3gaf9JZ1U2ldGxOstLRKNQ0ZFP15ZuwG1LRmaaC
 K7JDWtFa+sKu57LEcalW+1EKv+hpxjz+FqdGBuN/UUWrH79Yml/QcxH8oKdabvK/ohPAmoHPVC
 k7KmBZuZnxMWTLILfgG7ihKYETIOE9aYXfPdtHCUX8CWcFUJMCQR07VjCUNUNhqutsc/SKvWP8
 oO7UGCo6Im6s/9cjNjHNzGtb
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:32:00 -0800
IronPort-SDR: UWqQzuj+B0rDBeYh3FekvWAQUG4WKeOg5YlXx228fSEhm4YYLURRgLzBpU4hdA0rCAEgGODmZz
 e9WdYWdcDnAl4EJeKAvUhoVexGs6mcGbXbvmsTY9l1o4LSjxtpT5oLqGYtcbeBr6D/pv2/qGOb
 PypEi2BYYH/0nLno75Qw3s+dH2HILAmjz7b3zrGeOpTrXE8r78qk9MKFUfC62COCuC8MXWAaDC
 5CneVaUPNNP4sxLfCBQ2oKOD/qeCxg8ipzBTTtghAWyhUQeAHfHwgwmn1vZlIey3KZiM3WWvZK
 2Pw=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:59:12 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JHS6k4Xp6z1Rwns
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 20:59:10 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639976349; x=1642568350; bh=qPpzsAgT0+ZnG0gefR
 Aq2WHAX4dOzdgz5bBoE7uZ6Bs=; b=poyFddTQ1QXcPWUCwYjW8THumImITkJOw+
 8FDlXDIkstnk7+3rJ/ZBMFqB0rExmfzt0eT2n+JH9q30RJmljjQgUmNoyosdwW9t
 3YIx6E5uE/NZa5R14YJ2S4Jy2RIi8K7x6bGFiAm17BmYrOyApXekDGJfBWllsDLI
 sybKO1khMMZvSnSFlnybWM7EdxYZ0iKg/oBRs5W6wy3NQZHxHKYMPQ4G4nybfbUH
 cj++YeS6tMvokUC57jtxJ1uRp9tB85f2EUtpHpqQCg2DSmav/eA1trqqtWuEj305
 Juevr1DLVj9zloNbfycaMKXb6x89QL4i6fJRKvAZkJ5J7ddbjgsA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id BPuisRNs17rE for <qemu-devel@nongnu.org>;
 Sun, 19 Dec 2021 20:59:09 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.68])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JHS6f6Qqdz1RtVG;
 Sun, 19 Dec 2021 20:59:06 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 26/88] target/riscv: rvv-1.0: remove amo operations instructions
Date: Mon, 20 Dec 2021 14:56:03 +1000
Message-Id: <20211220045705.62174-27-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
References: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=9816edf2f=alistair.francis@opensource.wdc.com;
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Vector AMOs are removed from standard vector extensions. Will be added
later as separate Zvamo extension, but will need a different encoding
from earlier proposal.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20211210075704.23951-19-frank.chang@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/helper.h                   |  27 -----
 target/riscv/insn32.decode              |  24 ----
 target/riscv/vector_helper.c            | 125 ---------------------
 target/riscv/insn_trans/trans_rvv.c.inc | 140 ------------------------
 4 files changed, 316 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index d25cf725c5..ecb6af6cd9 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -274,33 +274,6 @@ DEF_HELPER_5(vlhuff_v_w, void, ptr, ptr, tl, env, i3=
2)
 DEF_HELPER_5(vlhuff_v_d, void, ptr, ptr, tl, env, i32)
 DEF_HELPER_5(vlwuff_v_w, void, ptr, ptr, tl, env, i32)
 DEF_HELPER_5(vlwuff_v_d, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_6(vamoswapw_v_d, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vamoswapd_v_d, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vamoaddw_v_d,  void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vamoaddd_v_d,  void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vamoxorw_v_d,  void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vamoxord_v_d,  void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vamoandw_v_d,  void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vamoandd_v_d,  void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vamoorw_v_d,   void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vamoord_v_d,   void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vamominw_v_d,  void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vamomind_v_d,  void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vamomaxw_v_d,  void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vamomaxd_v_d,  void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vamominuw_v_d, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vamominud_v_d, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vamomaxuw_v_d, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vamomaxud_v_d, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vamoswapw_v_w, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vamoaddw_v_w,  void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vamoxorw_v_w,  void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vamoandw_v_w,  void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vamoorw_v_w,   void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vamominw_v_w,  void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vamomaxw_v_w,  void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vamominuw_v_w, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vamomaxuw_v_w, void, ptr, ptr, tl, ptr, env, i32)
=20
 DEF_HELPER_6(vadd_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vadd_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 6c4cde216b..3d57255fff 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -49,7 +49,6 @@
 &atomic    aq rl rs2 rs1 rd
 &rmrr      vm rd rs1 rs2
 &rmr       vm rd rs2
-&rwdvm     vm wd rd rs1 rs2
 &r2nfvm    vm rd rs1 nf
 &rnfvm     vm rd rs1 rs2 nf
=20
@@ -79,7 +78,6 @@
 @r_vm    ...... vm:1 ..... ..... ... ..... ....... &rmrr %rs2 %rs1 %rd
 @r_vm_1  ...... . ..... ..... ... ..... .......    &rmrr vm=3D1 %rs2 %rs=
1 %rd
 @r_vm_0  ...... . ..... ..... ... ..... .......    &rmrr vm=3D0 %rs2 %rs=
1 %rd
-@r_wdvm  ..... wd:1 vm:1 ..... ..... ... ..... ....... &rwdvm %rs2 %rs1 =
%rd
 @r2_zimm . zimm:11  ..... ... ..... ....... %rs1 %rd
 @r2_s    .......   ..... ..... ... ..... ....... %rs2 %rs1
=20
@@ -340,17 +338,6 @@ vsxh_v     ... -11 . ..... ..... 101 ..... 0100111 @=
r_nfvm
 vsxw_v     ... -11 . ..... ..... 110 ..... 0100111 @r_nfvm
 vsxe_v     ... -11 . ..... ..... 111 ..... 0100111 @r_nfvm
=20
-#*** Vector AMO operations are encoded under the standard AMO major opco=
de ***
-vamoswapw_v     00001 . . ..... ..... 110 ..... 0101111 @r_wdvm
-vamoaddw_v      00000 . . ..... ..... 110 ..... 0101111 @r_wdvm
-vamoxorw_v      00100 . . ..... ..... 110 ..... 0101111 @r_wdvm
-vamoandw_v      01100 . . ..... ..... 110 ..... 0101111 @r_wdvm
-vamoorw_v       01000 . . ..... ..... 110 ..... 0101111 @r_wdvm
-vamominw_v      10000 . . ..... ..... 110 ..... 0101111 @r_wdvm
-vamomaxw_v      10100 . . ..... ..... 110 ..... 0101111 @r_wdvm
-vamominuw_v     11000 . . ..... ..... 110 ..... 0101111 @r_wdvm
-vamomaxuw_v     11100 . . ..... ..... 110 ..... 0101111 @r_wdvm
-
 # *** new major opcode OP-V ***
 vadd_vv         000000 . ..... ..... 000 ..... 1010111 @r_vm
 vadd_vx         000000 . ..... ..... 100 ..... 1010111 @r_vm
@@ -649,17 +636,6 @@ vcompress_vm    010111 - ..... ..... 010 ..... 10101=
11 @r
 vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm
 vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
=20
-#*** Vector AMO operations (in addition to Zvamo) ***
-vamoswapd_v     00001 . . ..... ..... 111 ..... 0101111 @r_wdvm
-vamoaddd_v      00000 . . ..... ..... 111 ..... 0101111 @r_wdvm
-vamoxord_v      00100 . . ..... ..... 111 ..... 0101111 @r_wdvm
-vamoandd_v      01100 . . ..... ..... 111 ..... 0101111 @r_wdvm
-vamoord_v       01000 . . ..... ..... 111 ..... 0101111 @r_wdvm
-vamomind_v      10000 . . ..... ..... 111 ..... 0101111 @r_wdvm
-vamomaxd_v      10100 . . ..... ..... 111 ..... 0101111 @r_wdvm
-vamominud_v     11000 . . ..... ..... 111 ..... 0101111 @r_wdvm
-vamomaxud_v     11100 . . ..... ..... 111 ..... 0101111 @r_wdvm
-
 # *** RV32 Zba Standard Extension ***
 sh1add     0010000 .......... 010 ..... 0110011 @r
 sh2add     0010000 .......... 100 ..... 0110011 @r
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index db1a40a3db..bf976d364f 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -103,11 +103,6 @@ static inline int32_t vext_lmul(uint32_t desc)
     return sextract32(FIELD_EX32(simd_data(desc), VDATA, LMUL), 0, 3);
 }
=20
-static uint32_t vext_wd(uint32_t desc)
-{
-    return FIELD_EX32(simd_data(desc), VDATA, WD);
-}
-
 /*
  * Get vector group length in bytes. Its range is [64, 2048].
  *
@@ -633,38 +628,12 @@ GEN_VEXT_LDFF(vlhuff_v_d, uint16_t, uint64_t, ldhu_=
d)
 GEN_VEXT_LDFF(vlwuff_v_w, uint32_t, uint32_t, ldwu_w)
 GEN_VEXT_LDFF(vlwuff_v_d, uint32_t, uint64_t, ldwu_d)
=20
-/*
- *** Vector AMO Operations (Zvamo)
- */
-typedef void vext_amo_noatomic_fn(void *vs3, target_ulong addr,
-                                  uint32_t wd, uint32_t idx, CPURISCVSta=
te *env,
-                                  uintptr_t retaddr);
-
-/* no atomic opreation for vector atomic insructions */
 #define DO_SWAP(N, M) (M)
 #define DO_AND(N, M)  (N & M)
 #define DO_XOR(N, M)  (N ^ M)
 #define DO_OR(N, M)   (N | M)
 #define DO_ADD(N, M)  (N + M)
=20
-#define GEN_VEXT_AMO_NOATOMIC_OP(NAME, ESZ, MSZ, H, DO_OP, SUF) \
-static void                                                     \
-vext_##NAME##_noatomic_op(void *vs3, target_ulong addr,         \
-                          uint32_t wd, uint32_t idx,            \
-                          CPURISCVState *env, uintptr_t retaddr)\
-{                                                               \
-    typedef int##ESZ##_t ETYPE;                                 \
-    typedef int##MSZ##_t MTYPE;                                 \
-    typedef uint##MSZ##_t UMTYPE __attribute__((unused));       \
-    ETYPE *pe3 =3D (ETYPE *)vs3 + H(idx);                         \
-    MTYPE  a =3D cpu_ld##SUF##_data(env, addr), b =3D *pe3;         \
-                                                                \
-    cpu_st##SUF##_data(env, addr, DO_OP(a, b));                 \
-    if (wd) {                                                   \
-        *pe3 =3D a;                                               \
-    }                                                           \
-}
-
 /* Signed min/max */
 #define DO_MAX(N, M)  ((N) >=3D (M) ? (N) : (M))
 #define DO_MIN(N, M)  ((N) >=3D (M) ? (M) : (N))
@@ -673,100 +642,6 @@ vext_##NAME##_noatomic_op(void *vs3, target_ulong a=
ddr,         \
 #define DO_MAXU(N, M) DO_MAX((UMTYPE)N, (UMTYPE)M)
 #define DO_MINU(N, M) DO_MIN((UMTYPE)N, (UMTYPE)M)
=20
-GEN_VEXT_AMO_NOATOMIC_OP(vamoswapw_v_w, 32, 32, H4, DO_SWAP, l)
-GEN_VEXT_AMO_NOATOMIC_OP(vamoaddw_v_w,  32, 32, H4, DO_ADD,  l)
-GEN_VEXT_AMO_NOATOMIC_OP(vamoxorw_v_w,  32, 32, H4, DO_XOR,  l)
-GEN_VEXT_AMO_NOATOMIC_OP(vamoandw_v_w,  32, 32, H4, DO_AND,  l)
-GEN_VEXT_AMO_NOATOMIC_OP(vamoorw_v_w,   32, 32, H4, DO_OR,   l)
-GEN_VEXT_AMO_NOATOMIC_OP(vamominw_v_w,  32, 32, H4, DO_MIN,  l)
-GEN_VEXT_AMO_NOATOMIC_OP(vamomaxw_v_w,  32, 32, H4, DO_MAX,  l)
-GEN_VEXT_AMO_NOATOMIC_OP(vamominuw_v_w, 32, 32, H4, DO_MINU, l)
-GEN_VEXT_AMO_NOATOMIC_OP(vamomaxuw_v_w, 32, 32, H4, DO_MAXU, l)
-GEN_VEXT_AMO_NOATOMIC_OP(vamoswapw_v_d, 64, 32, H8, DO_SWAP, l)
-GEN_VEXT_AMO_NOATOMIC_OP(vamoswapd_v_d, 64, 64, H8, DO_SWAP, q)
-GEN_VEXT_AMO_NOATOMIC_OP(vamoaddw_v_d,  64, 32, H8, DO_ADD,  l)
-GEN_VEXT_AMO_NOATOMIC_OP(vamoaddd_v_d,  64, 64, H8, DO_ADD,  q)
-GEN_VEXT_AMO_NOATOMIC_OP(vamoxorw_v_d,  64, 32, H8, DO_XOR,  l)
-GEN_VEXT_AMO_NOATOMIC_OP(vamoxord_v_d,  64, 64, H8, DO_XOR,  q)
-GEN_VEXT_AMO_NOATOMIC_OP(vamoandw_v_d,  64, 32, H8, DO_AND,  l)
-GEN_VEXT_AMO_NOATOMIC_OP(vamoandd_v_d,  64, 64, H8, DO_AND,  q)
-GEN_VEXT_AMO_NOATOMIC_OP(vamoorw_v_d,   64, 32, H8, DO_OR,   l)
-GEN_VEXT_AMO_NOATOMIC_OP(vamoord_v_d,   64, 64, H8, DO_OR,   q)
-GEN_VEXT_AMO_NOATOMIC_OP(vamominw_v_d,  64, 32, H8, DO_MIN,  l)
-GEN_VEXT_AMO_NOATOMIC_OP(vamomind_v_d,  64, 64, H8, DO_MIN,  q)
-GEN_VEXT_AMO_NOATOMIC_OP(vamomaxw_v_d,  64, 32, H8, DO_MAX,  l)
-GEN_VEXT_AMO_NOATOMIC_OP(vamomaxd_v_d,  64, 64, H8, DO_MAX,  q)
-GEN_VEXT_AMO_NOATOMIC_OP(vamominuw_v_d, 64, 32, H8, DO_MINU, l)
-GEN_VEXT_AMO_NOATOMIC_OP(vamominud_v_d, 64, 64, H8, DO_MINU, q)
-GEN_VEXT_AMO_NOATOMIC_OP(vamomaxuw_v_d, 64, 32, H8, DO_MAXU, l)
-GEN_VEXT_AMO_NOATOMIC_OP(vamomaxud_v_d, 64, 64, H8, DO_MAXU, q)
-
-static inline void
-vext_amo_noatomic(void *vs3, void *v0, target_ulong base,
-                  void *vs2, CPURISCVState *env, uint32_t desc,
-                  vext_get_index_addr get_index_addr,
-                  vext_amo_noatomic_fn *noatomic_op,
-                  uint32_t esz, uint32_t msz, uintptr_t ra)
-{
-    uint32_t i;
-    target_long addr;
-    uint32_t wd =3D vext_wd(desc);
-    uint32_t vm =3D vext_vm(desc);
-
-    for (i =3D 0; i < env->vl; i++) {
-        if (!vm && !vext_elem_mask(v0, i)) {
-            continue;
-        }
-        probe_pages(env, get_index_addr(base, i, vs2), msz, ra, MMU_DATA=
_LOAD);
-        probe_pages(env, get_index_addr(base, i, vs2), msz, ra, MMU_DATA=
_STORE);
-    }
-    for (i =3D 0; i < env->vl; i++) {
-        if (!vm && !vext_elem_mask(v0, i)) {
-            continue;
-        }
-        addr =3D get_index_addr(base, i, vs2);
-        noatomic_op(vs3, addr, wd, i, env, ra);
-    }
-}
-
-#define GEN_VEXT_AMO(NAME, MTYPE, ETYPE, INDEX_FN)              \
-void HELPER(NAME)(void *vs3, void *v0, target_ulong base,       \
-                  void *vs2, CPURISCVState *env, uint32_t desc) \
-{                                                               \
-    vext_amo_noatomic(vs3, v0, base, vs2, env, desc,            \
-                      INDEX_FN, vext_##NAME##_noatomic_op,      \
-                      sizeof(ETYPE), sizeof(MTYPE),             \
-                      GETPC());                                 \
-}
-
-GEN_VEXT_AMO(vamoswapw_v_d, int32_t,  int64_t,  idx_d)
-GEN_VEXT_AMO(vamoswapd_v_d, int64_t,  int64_t,  idx_d)
-GEN_VEXT_AMO(vamoaddw_v_d,  int32_t,  int64_t,  idx_d)
-GEN_VEXT_AMO(vamoaddd_v_d,  int64_t,  int64_t,  idx_d)
-GEN_VEXT_AMO(vamoxorw_v_d,  int32_t,  int64_t,  idx_d)
-GEN_VEXT_AMO(vamoxord_v_d,  int64_t,  int64_t,  idx_d)
-GEN_VEXT_AMO(vamoandw_v_d,  int32_t,  int64_t,  idx_d)
-GEN_VEXT_AMO(vamoandd_v_d,  int64_t,  int64_t,  idx_d)
-GEN_VEXT_AMO(vamoorw_v_d,   int32_t,  int64_t,  idx_d)
-GEN_VEXT_AMO(vamoord_v_d,   int64_t,  int64_t,  idx_d)
-GEN_VEXT_AMO(vamominw_v_d,  int32_t,  int64_t,  idx_d)
-GEN_VEXT_AMO(vamomind_v_d,  int64_t,  int64_t,  idx_d)
-GEN_VEXT_AMO(vamomaxw_v_d,  int32_t,  int64_t,  idx_d)
-GEN_VEXT_AMO(vamomaxd_v_d,  int64_t,  int64_t,  idx_d)
-GEN_VEXT_AMO(vamominuw_v_d, uint32_t, uint64_t, idx_d)
-GEN_VEXT_AMO(vamominud_v_d, uint64_t, uint64_t, idx_d)
-GEN_VEXT_AMO(vamomaxuw_v_d, uint32_t, uint64_t, idx_d)
-GEN_VEXT_AMO(vamomaxud_v_d, uint64_t, uint64_t, idx_d)
-GEN_VEXT_AMO(vamoswapw_v_w, int32_t,  int32_t,  idx_w)
-GEN_VEXT_AMO(vamoaddw_v_w,  int32_t,  int32_t,  idx_w)
-GEN_VEXT_AMO(vamoxorw_v_w,  int32_t,  int32_t,  idx_w)
-GEN_VEXT_AMO(vamoandw_v_w,  int32_t,  int32_t,  idx_w)
-GEN_VEXT_AMO(vamoorw_v_w,   int32_t,  int32_t,  idx_w)
-GEN_VEXT_AMO(vamominw_v_w,  int32_t,  int32_t,  idx_w)
-GEN_VEXT_AMO(vamomaxw_v_w,  int32_t,  int32_t,  idx_w)
-GEN_VEXT_AMO(vamominuw_v_w, uint32_t, uint32_t, idx_w)
-GEN_VEXT_AMO(vamomaxuw_v_w, uint32_t, uint32_t, idx_w)
-
 /*
  *** Vector Integer Arithmetic Instructions
  */
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
index f9ace6ae41..afec187333 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -973,146 +973,6 @@ GEN_VEXT_TRANS(vlbuff_v, 4, r2nfvm, ldff_op, ld_us_=
check)
 GEN_VEXT_TRANS(vlhuff_v, 5, r2nfvm, ldff_op, ld_us_check)
 GEN_VEXT_TRANS(vlwuff_v, 6, r2nfvm, ldff_op, ld_us_check)
=20
-/*
- *** vector atomic operation
- */
-typedef void gen_helper_amo(TCGv_ptr, TCGv_ptr, TCGv, TCGv_ptr,
-                            TCGv_env, TCGv_i32);
-
-static bool amo_trans(uint32_t vd, uint32_t rs1, uint32_t vs2,
-                      uint32_t data, gen_helper_amo *fn, DisasContext *s=
)
-{
-    TCGv_ptr dest, mask, index;
-    TCGv base;
-    TCGv_i32 desc;
-
-    TCGLabel *over =3D gen_new_label();
-    tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
-
-    dest =3D tcg_temp_new_ptr();
-    mask =3D tcg_temp_new_ptr();
-    index =3D tcg_temp_new_ptr();
-    base =3D get_gpr(s, rs1, EXT_NONE);
-    desc =3D tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data))=
;
-
-    tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
-    tcg_gen_addi_ptr(index, cpu_env, vreg_ofs(s, vs2));
-    tcg_gen_addi_ptr(mask, cpu_env, vreg_ofs(s, 0));
-
-    fn(dest, mask, base, index, cpu_env, desc);
-
-    tcg_temp_free_ptr(dest);
-    tcg_temp_free_ptr(mask);
-    tcg_temp_free_ptr(index);
-    mark_vs_dirty(s);
-    gen_set_label(over);
-    return true;
-}
-
-static bool amo_op(DisasContext *s, arg_rwdvm *a, uint8_t seq)
-{
-    uint32_t data =3D 0;
-    gen_helper_amo *fn;
-    static gen_helper_amo *const fnsw[9] =3D {
-        /* no atomic operation */
-        gen_helper_vamoswapw_v_w,
-        gen_helper_vamoaddw_v_w,
-        gen_helper_vamoxorw_v_w,
-        gen_helper_vamoandw_v_w,
-        gen_helper_vamoorw_v_w,
-        gen_helper_vamominw_v_w,
-        gen_helper_vamomaxw_v_w,
-        gen_helper_vamominuw_v_w,
-        gen_helper_vamomaxuw_v_w
-    };
-    static gen_helper_amo *const fnsd[18] =3D {
-        gen_helper_vamoswapw_v_d,
-        gen_helper_vamoaddw_v_d,
-        gen_helper_vamoxorw_v_d,
-        gen_helper_vamoandw_v_d,
-        gen_helper_vamoorw_v_d,
-        gen_helper_vamominw_v_d,
-        gen_helper_vamomaxw_v_d,
-        gen_helper_vamominuw_v_d,
-        gen_helper_vamomaxuw_v_d,
-        gen_helper_vamoswapd_v_d,
-        gen_helper_vamoaddd_v_d,
-        gen_helper_vamoxord_v_d,
-        gen_helper_vamoandd_v_d,
-        gen_helper_vamoord_v_d,
-        gen_helper_vamomind_v_d,
-        gen_helper_vamomaxd_v_d,
-        gen_helper_vamominud_v_d,
-        gen_helper_vamomaxud_v_d
-    };
-
-    if (tb_cflags(s->base.tb) & CF_PARALLEL) {
-        gen_helper_exit_atomic(cpu_env);
-        s->base.is_jmp =3D DISAS_NORETURN;
-        return true;
-    }
-
-    switch (s->sew) {
-    case 0 ... 2:
-        assert(seq < ARRAY_SIZE(fnsw));
-        fn =3D fnsw[seq];
-        break;
-    case 3:
-        /* XLEN check done in amo_check(). */
-        assert(seq < ARRAY_SIZE(fnsd));
-        fn =3D fnsd[seq];
-        break;
-    default:
-        g_assert_not_reached();
-    }
-
-    data =3D FIELD_DP32(data, VDATA, VM, a->vm);
-    data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);
-    data =3D FIELD_DP32(data, VDATA, WD, a->wd);
-    return amo_trans(a->rd, a->rs1, a->rs2, data, fn, s);
-}
-/*
- * There are two rules check here.
- *
- * 1. SEW must be at least as wide as the AMO memory element size.
- *
- * 2. If SEW is greater than XLEN, an illegal instruction exception is r=
aised.
- */
-static bool amo_check(DisasContext *s, arg_rwdvm* a)
-{
-    return (!s->vill && has_ext(s, RVA) &&
-            (!a->wd || vext_check_overlap_mask(s, a->rd, a->vm, false)) =
&&
-            vext_check_reg(s, a->rd, false) &&
-            vext_check_reg(s, a->rs2, false) &&
-            ((1 << s->sew) <=3D sizeof(target_ulong)) &&
-            ((1 << s->sew) >=3D 4));
-}
-
-static bool amo_check64(DisasContext *s, arg_rwdvm* a)
-{
-    REQUIRE_64BIT(s);
-    return amo_check(s, a);
-}
-
-GEN_VEXT_TRANS(vamoswapw_v, 0, rwdvm, amo_op, amo_check)
-GEN_VEXT_TRANS(vamoaddw_v, 1, rwdvm, amo_op, amo_check)
-GEN_VEXT_TRANS(vamoxorw_v, 2, rwdvm, amo_op, amo_check)
-GEN_VEXT_TRANS(vamoandw_v, 3, rwdvm, amo_op, amo_check)
-GEN_VEXT_TRANS(vamoorw_v, 4, rwdvm, amo_op, amo_check)
-GEN_VEXT_TRANS(vamominw_v, 5, rwdvm, amo_op, amo_check)
-GEN_VEXT_TRANS(vamomaxw_v, 6, rwdvm, amo_op, amo_check)
-GEN_VEXT_TRANS(vamominuw_v, 7, rwdvm, amo_op, amo_check)
-GEN_VEXT_TRANS(vamomaxuw_v, 8, rwdvm, amo_op, amo_check)
-GEN_VEXT_TRANS(vamoswapd_v, 9, rwdvm, amo_op, amo_check64)
-GEN_VEXT_TRANS(vamoaddd_v, 10, rwdvm, amo_op, amo_check64)
-GEN_VEXT_TRANS(vamoxord_v, 11, rwdvm, amo_op, amo_check64)
-GEN_VEXT_TRANS(vamoandd_v, 12, rwdvm, amo_op, amo_check64)
-GEN_VEXT_TRANS(vamoord_v, 13, rwdvm, amo_op, amo_check64)
-GEN_VEXT_TRANS(vamomind_v, 14, rwdvm, amo_op, amo_check64)
-GEN_VEXT_TRANS(vamomaxd_v, 15, rwdvm, amo_op, amo_check64)
-GEN_VEXT_TRANS(vamominud_v, 16, rwdvm, amo_op, amo_check64)
-GEN_VEXT_TRANS(vamomaxud_v, 17, rwdvm, amo_op, amo_check64)
-
 /*
  *** Vector Integer Arithmetic Instructions
  */
--=20
2.31.1


