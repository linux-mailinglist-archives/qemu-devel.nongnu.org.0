Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A999E47A4BB
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 06:54:23 +0100 (CET)
Received: from localhost ([::1]:60812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzBcs-00037o-Cz
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 00:54:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAlq-0002xe-L0
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 23:59:34 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:13325)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAln-0008DO-Mk
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 23:59:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639976372; x=1671512372;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+Vb3dDF+jNCxKXQWZhyaO1M+3y74+DWlefLZhzy6zcY=;
 b=CIGOL8V6X4vmSEUDs/S//JR/z748viqvKA9Thjz9w14BD4w0pDul8Ame
 UYLWyhxCUr9JFhiantSejJletJCKrvATczCB+s6aXCvtEMDNDSTVAMBbe
 n5q6T3BGXR+P7+q3neNTYywJn6D+mLq6fweREBdpS+Ui/JX7dMuDqxHb0
 m5S6O0y2EZVQQkbFtu3MzOnkyMEuaafqVZrO+elOsMAGPJSQBDL7WtaDC
 uy2W+xFaUbnuh3F+B6tgA+ebTpohFcBXNauO2+rXVaTD7nVs3GTaMkW1s
 NYGqDtxNeJf3jTyrDiMlrX9a+R9ZZro+fPzmZLm9CzguD/F+oOpJXkhaV g==;
X-IronPort-AV: E=Sophos;i="5.88,219,1635177600"; d="scan'208";a="189680049"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2021 12:59:30 +0800
IronPort-SDR: OQGXSINS1CxzmCJMzWUiEpIpOrHh0T/L8rn0xuK6FeNhcb0UInS62Tl2idtvZpA/dAmkWTmy5E
 LQlJuisufon7pQi8CA6Gv6EJWFWjhSJrmvmjoeLdYnTdLVTC202IGHhvlbQbt9RUBKStZcScsi
 16Fkh8pbnQKWraCELcbRjSwfY124SkaieB7Zh57wHfUhu7OLnfbWu1sfagM6xRlORG6oCuQYgs
 Ul3IEGll1pS4Yn/lggsFs+sXFXQzWlE/Ukczvp+bz7NI+/6g0i1ykdAxHmNl5bmisbp0/35GRo
 wWEhx9ByY9s9z9/hdSpIryZC
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:32:19 -0800
IronPort-SDR: FuQHXhWTPHjCnZoO44IpG1YwvPmkisko6gcW+N1rt60CiY+3RxOySoiJuReOyLa/rjoC3pnYj1
 VVqt27ifRQ0rVzLgBYbqw6O36nQHfHmhfzODL+FNdEiNxlPrjD6kboWkPYFCsKz101M/9XwS/S
 H70+/0ZrYPmVlc9QbwSpnJFcKzH3+ws1h1e00mXygzcPYGEh6kWKHcw2BV7nph3vxZkGFOzhaU
 BT16et8g240HQxjY/pZYybuuREeeBAx4fQroKnY100Y8AkBPO+Ez4nHHlJbDe0z+sM22GI6Onn
 2NE=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:59:31 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JHS755c1Hz1Rwnv
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 20:59:29 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639976368; x=1642568369; bh=+Vb3dDF+jNCxKXQWZh
 yaO1M+3y74+DWlefLZhzy6zcY=; b=O5SS+49R8HtUb1gRoGW5xGjGAsxmeGkM9Z
 QrXiH+o1ifVthA1RuO/qq7m8JyUxyjqn4Kh/r/lF4ulARYkeWkPRoHEPTcUDC0wO
 YFBYMCjlKkgSps55De18n9FveVjvLZgLAcSyCTa7baIyo84MDRPKEnXTy9G0EEmg
 uIOQPSZFXSvcZJ/Pm6g0Hm7sSzmuusWjuw3huE6FOt7blwBrNJ4fnsWOMIuH9eVS
 O9tTtnpd5k/FQmHP9mwbybdb1HQGSwgvYuxGG0O2PQJZq+RlL8dPYOhSZ3FYatVz
 thO7TjKxPmoZqB1se9yV1USofayvkhDftqSDYtDBqs61Ogd2OFlQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id B8X9VPaxH_iy for <qemu-devel@nongnu.org>;
 Sun, 19 Dec 2021 20:59:28 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.68])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JHS714Npqz1RtVG;
 Sun, 19 Dec 2021 20:59:25 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 31/88] target/riscv: rvv-1.0: fault-only-first unit stride load
Date: Mon, 20 Dec 2021 14:56:08 +1000
Message-Id: <20211220045705.62174-32-alistair.francis@opensource.wdc.com>
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
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20211210075704.23951-24-frank.chang@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/helper.h                   | 26 ++-------
 target/riscv/insn32.decode              | 14 ++---
 target/riscv/vector_helper.c            | 74 +++++++------------------
 target/riscv/insn_trans/trans_rvv.c.inc | 33 +++--------
 4 files changed, 38 insertions(+), 109 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 1beca6dc0d..57560b8c04 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -168,28 +168,10 @@ DEF_HELPER_6(vsxei64_8_v, void, ptr, ptr, tl, ptr, =
env, i32)
 DEF_HELPER_6(vsxei64_16_v, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vsxei64_32_v, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vsxei64_64_v, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_5(vlbff_v_b, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlbff_v_h, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlbff_v_w, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlbff_v_d, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlhff_v_h, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlhff_v_w, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlhff_v_d, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlwff_v_w, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlwff_v_d, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vleff_v_b, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vleff_v_h, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vleff_v_w, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vleff_v_d, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlbuff_v_b, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlbuff_v_h, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlbuff_v_w, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlbuff_v_d, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlhuff_v_h, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlhuff_v_w, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlhuff_v_d, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlwuff_v_w, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlwuff_v_d, void, ptr, ptr, tl, env, i32)
+DEF_HELPER_5(vle8ff_v, void, ptr, ptr, tl, env, i32)
+DEF_HELPER_5(vle16ff_v, void, ptr, ptr, tl, env, i32)
+DEF_HELPER_5(vle32ff_v, void, ptr, ptr, tl, env, i32)
+DEF_HELPER_5(vle64ff_v, void, ptr, ptr, tl, env, i32)
=20
 DEF_HELPER_6(vadd_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vadd_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index f34194d31c..180d97ecba 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -314,14 +314,6 @@ vsse16_v    ... 010 . ..... ..... 101 ..... 0100111 =
@r_nfvm
 vsse32_v    ... 010 . ..... ..... 110 ..... 0100111 @r_nfvm
 vsse64_v    ... 010 . ..... ..... 111 ..... 0100111 @r_nfvm
=20
-vlbff_v    ... 100 . 10000 ..... 000 ..... 0000111 @r2_nfvm
-vlhff_v    ... 100 . 10000 ..... 101 ..... 0000111 @r2_nfvm
-vlwff_v    ... 100 . 10000 ..... 110 ..... 0000111 @r2_nfvm
-vleff_v    ... 000 . 10000 ..... 111 ..... 0000111 @r2_nfvm
-vlbuff_v   ... 000 . 10000 ..... 000 ..... 0000111 @r2_nfvm
-vlhuff_v   ... 000 . 10000 ..... 101 ..... 0000111 @r2_nfvm
-vlwuff_v   ... 000 . 10000 ..... 110 ..... 0000111 @r2_nfvm
-
 # Vector ordered-indexed and unordered-indexed load insns.
 vlxei8_v      ... 0-1 . ..... ..... 000 ..... 0000111 @r_nfvm
 vlxei16_v     ... 0-1 . ..... ..... 101 ..... 0000111 @r_nfvm
@@ -334,6 +326,12 @@ vsxei16_v     ... 0-1 . ..... ..... 101 ..... 010011=
1 @r_nfvm
 vsxei32_v     ... 0-1 . ..... ..... 110 ..... 0100111 @r_nfvm
 vsxei64_v     ... 0-1 . ..... ..... 111 ..... 0100111 @r_nfvm
=20
+# Vector unit-stride fault-only-first load insns.
+vle8ff_v      ... 000 . 10000 ..... 000 ..... 0000111 @r2_nfvm
+vle16ff_v     ... 000 . 10000 ..... 101 ..... 0000111 @r2_nfvm
+vle32ff_v     ... 000 . 10000 ..... 110 ..... 0000111 @r2_nfvm
+vle64ff_v     ... 000 . 10000 ..... 111 ..... 0000111 @r2_nfvm
+
 # *** new major opcode OP-V ***
 vadd_vv         000000 . ..... ..... 000 ..... 1010111 @r_vm
 vadd_vx         000000 . ..... ..... 100 ..... 1010111 @r_vm
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 3da4f3b1e6..0e7bf5d27f 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -186,28 +186,10 @@ static void NAME(CPURISCVState *env, abi_ptr addr, =
        \
     *cur =3D cpu_##LDSUF##_data_ra(env, addr, retaddr);      \
 }                                                          \
=20
-GEN_VEXT_LD_ELEM(ldb_b, int8_t,  H1, ldsb)
-GEN_VEXT_LD_ELEM(ldb_h, int16_t, H2, ldsb)
-GEN_VEXT_LD_ELEM(ldb_w, int32_t, H4, ldsb)
-GEN_VEXT_LD_ELEM(ldb_d, int64_t, H8, ldsb)
-GEN_VEXT_LD_ELEM(ldh_h, int16_t, H2, ldsw)
-GEN_VEXT_LD_ELEM(ldh_w, int32_t, H4, ldsw)
-GEN_VEXT_LD_ELEM(ldh_d, int64_t, H8, ldsw)
-GEN_VEXT_LD_ELEM(ldw_w, int32_t, H4, ldl)
-GEN_VEXT_LD_ELEM(ldw_d, int64_t, H8, ldl)
 GEN_VEXT_LD_ELEM(lde_b, int8_t,  H1, ldsb)
 GEN_VEXT_LD_ELEM(lde_h, int16_t, H2, ldsw)
 GEN_VEXT_LD_ELEM(lde_w, int32_t, H4, ldl)
 GEN_VEXT_LD_ELEM(lde_d, int64_t, H8, ldq)
-GEN_VEXT_LD_ELEM(ldbu_b, uint8_t,  H1, ldub)
-GEN_VEXT_LD_ELEM(ldbu_h, uint16_t, H2, ldub)
-GEN_VEXT_LD_ELEM(ldbu_w, uint32_t, H4, ldub)
-GEN_VEXT_LD_ELEM(ldbu_d, uint64_t, H8, ldub)
-GEN_VEXT_LD_ELEM(ldhu_h, uint16_t, H2, lduw)
-GEN_VEXT_LD_ELEM(ldhu_w, uint32_t, H4, lduw)
-GEN_VEXT_LD_ELEM(ldhu_d, uint64_t, H8, lduw)
-GEN_VEXT_LD_ELEM(ldwu_w, uint32_t, H4, ldl)
-GEN_VEXT_LD_ELEM(ldwu_d, uint64_t, H8, ldl)
=20
 #define GEN_VEXT_ST_ELEM(NAME, ETYPE, H, STSUF)            \
 static void NAME(CPURISCVState *env, abi_ptr addr,         \
@@ -471,7 +453,7 @@ static inline void
 vext_ldff(void *vd, void *v0, target_ulong base,
           CPURISCVState *env, uint32_t desc,
           vext_ldst_elem_fn *ldst_elem,
-          uint32_t esz, uint32_t msz, uintptr_t ra)
+          uint32_t esz, uintptr_t ra)
 {
     void *host;
     uint32_t i, k, vl =3D 0;
@@ -485,24 +467,24 @@ vext_ldff(void *vd, void *v0, target_ulong base,
         if (!vm && !vext_elem_mask(v0, i)) {
             continue;
         }
-        addr =3D base + nf * i * msz;
+        addr =3D base + nf * i * esz;
         if (i =3D=3D 0) {
-            probe_pages(env, addr, nf * msz, ra, MMU_DATA_LOAD);
+            probe_pages(env, addr, nf * esz, ra, MMU_DATA_LOAD);
         } else {
             /* if it triggers an exception, no need to check watchpoint =
*/
-            remain =3D nf * msz;
+            remain =3D nf * esz;
             while (remain > 0) {
                 offset =3D -(addr | TARGET_PAGE_MASK);
                 host =3D tlb_vaddr_to_host(env, addr, MMU_DATA_LOAD,
                                          cpu_mmu_index(env, false));
                 if (host) {
 #ifdef CONFIG_USER_ONLY
-                    if (page_check_range(addr, nf * msz, PAGE_READ) < 0)=
 {
+                    if (page_check_range(addr, nf * esz, PAGE_READ) < 0)=
 {
                         vl =3D i;
                         goto ProbeSuccess;
                     }
 #else
-                    probe_pages(env, addr, nf * msz, ra, MMU_DATA_LOAD);
+                    probe_pages(env, addr, nf * esz, ra, MMU_DATA_LOAD);
 #endif
                 } else {
                     vl =3D i;
@@ -527,43 +509,25 @@ ProbeSuccess:
             continue;
         }
         while (k < nf) {
-            target_ulong addr =3D base + (i * nf + k) * msz;
+            target_ulong addr =3D base + (i * nf + k) * esz;
             ldst_elem(env, addr, i + k * vlmax, vd, ra);
             k++;
         }
     }
 }
=20
-#define GEN_VEXT_LDFF(NAME, MTYPE, ETYPE, LOAD_FN)               \
-void HELPER(NAME)(void *vd, void *v0, target_ulong base,         \
-                  CPURISCVState *env, uint32_t desc)             \
-{                                                                \
-    vext_ldff(vd, v0, base, env, desc, LOAD_FN,                  \
-              sizeof(ETYPE), sizeof(MTYPE), GETPC());            \
-}
-
-GEN_VEXT_LDFF(vlbff_v_b,  int8_t,   int8_t,   ldb_b)
-GEN_VEXT_LDFF(vlbff_v_h,  int8_t,   int16_t,  ldb_h)
-GEN_VEXT_LDFF(vlbff_v_w,  int8_t,   int32_t,  ldb_w)
-GEN_VEXT_LDFF(vlbff_v_d,  int8_t,   int64_t,  ldb_d)
-GEN_VEXT_LDFF(vlhff_v_h,  int16_t,  int16_t,  ldh_h)
-GEN_VEXT_LDFF(vlhff_v_w,  int16_t,  int32_t,  ldh_w)
-GEN_VEXT_LDFF(vlhff_v_d,  int16_t,  int64_t,  ldh_d)
-GEN_VEXT_LDFF(vlwff_v_w,  int32_t,  int32_t,  ldw_w)
-GEN_VEXT_LDFF(vlwff_v_d,  int32_t,  int64_t,  ldw_d)
-GEN_VEXT_LDFF(vleff_v_b,  int8_t,   int8_t,   lde_b)
-GEN_VEXT_LDFF(vleff_v_h,  int16_t,  int16_t,  lde_h)
-GEN_VEXT_LDFF(vleff_v_w,  int32_t,  int32_t,  lde_w)
-GEN_VEXT_LDFF(vleff_v_d,  int64_t,  int64_t,  lde_d)
-GEN_VEXT_LDFF(vlbuff_v_b, uint8_t,  uint8_t,  ldbu_b)
-GEN_VEXT_LDFF(vlbuff_v_h, uint8_t,  uint16_t, ldbu_h)
-GEN_VEXT_LDFF(vlbuff_v_w, uint8_t,  uint32_t, ldbu_w)
-GEN_VEXT_LDFF(vlbuff_v_d, uint8_t,  uint64_t, ldbu_d)
-GEN_VEXT_LDFF(vlhuff_v_h, uint16_t, uint16_t, ldhu_h)
-GEN_VEXT_LDFF(vlhuff_v_w, uint16_t, uint32_t, ldhu_w)
-GEN_VEXT_LDFF(vlhuff_v_d, uint16_t, uint64_t, ldhu_d)
-GEN_VEXT_LDFF(vlwuff_v_w, uint32_t, uint32_t, ldwu_w)
-GEN_VEXT_LDFF(vlwuff_v_d, uint32_t, uint64_t, ldwu_d)
+#define GEN_VEXT_LDFF(NAME, ETYPE, LOAD_FN)               \
+void HELPER(NAME)(void *vd, void *v0, target_ulong base,  \
+                  CPURISCVState *env, uint32_t desc)      \
+{                                                         \
+    vext_ldff(vd, v0, base, env, desc, LOAD_FN,           \
+              sizeof(ETYPE), GETPC());                    \
+}
+
+GEN_VEXT_LDFF(vle8ff_v,  int8_t,  lde_b)
+GEN_VEXT_LDFF(vle16ff_v, int16_t, lde_h)
+GEN_VEXT_LDFF(vle32ff_v, int32_t, lde_w)
+GEN_VEXT_LDFF(vle64ff_v, int64_t, lde_d)
=20
 #define DO_SWAP(N, M) (M)
 #define DO_AND(N, M)  (N & M)
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
index 6946d03340..5b5285b33f 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -935,28 +935,16 @@ static bool ldff_trans(uint32_t vd, uint32_t rs1, u=
int32_t data,
     return true;
 }
=20
-static bool ldff_op(DisasContext *s, arg_r2nfvm *a, uint8_t seq)
+static bool ldff_op(DisasContext *s, arg_r2nfvm *a, uint8_t eew)
 {
     uint32_t data =3D 0;
     gen_helper_ldst_us *fn;
-    static gen_helper_ldst_us * const fns[7][4] =3D {
-        { gen_helper_vlbff_v_b,  gen_helper_vlbff_v_h,
-          gen_helper_vlbff_v_w,  gen_helper_vlbff_v_d },
-        { NULL,                  gen_helper_vlhff_v_h,
-          gen_helper_vlhff_v_w,  gen_helper_vlhff_v_d },
-        { NULL,                  NULL,
-          gen_helper_vlwff_v_w,  gen_helper_vlwff_v_d },
-        { gen_helper_vleff_v_b,  gen_helper_vleff_v_h,
-          gen_helper_vleff_v_w,  gen_helper_vleff_v_d },
-        { gen_helper_vlbuff_v_b, gen_helper_vlbuff_v_h,
-          gen_helper_vlbuff_v_w, gen_helper_vlbuff_v_d },
-        { NULL,                  gen_helper_vlhuff_v_h,
-          gen_helper_vlhuff_v_w, gen_helper_vlhuff_v_d },
-        { NULL,                  NULL,
-          gen_helper_vlwuff_v_w, gen_helper_vlwuff_v_d }
+    static gen_helper_ldst_us * const fns[4] =3D {
+        gen_helper_vle8ff_v, gen_helper_vle16ff_v,
+        gen_helper_vle32ff_v, gen_helper_vle64ff_v
     };
=20
-    fn =3D  fns[seq][s->sew];
+    fn =3D fns[eew];
     if (fn =3D=3D NULL) {
         return false;
     }
@@ -967,13 +955,10 @@ static bool ldff_op(DisasContext *s, arg_r2nfvm *a,=
 uint8_t seq)
     return ldff_trans(a->rd, a->rs1, data, fn, s);
 }
=20
-GEN_VEXT_TRANS(vlbff_v, 0, r2nfvm, ldff_op, ld_us_check)
-GEN_VEXT_TRANS(vlhff_v, 1, r2nfvm, ldff_op, ld_us_check)
-GEN_VEXT_TRANS(vlwff_v, 2, r2nfvm, ldff_op, ld_us_check)
-GEN_VEXT_TRANS(vleff_v, 3, r2nfvm, ldff_op, ld_us_check)
-GEN_VEXT_TRANS(vlbuff_v, 4, r2nfvm, ldff_op, ld_us_check)
-GEN_VEXT_TRANS(vlhuff_v, 5, r2nfvm, ldff_op, ld_us_check)
-GEN_VEXT_TRANS(vlwuff_v, 6, r2nfvm, ldff_op, ld_us_check)
+GEN_VEXT_TRANS(vle8ff_v,  MO_8,  r2nfvm, ldff_op, ld_us_check)
+GEN_VEXT_TRANS(vle16ff_v, MO_16, r2nfvm, ldff_op, ld_us_check)
+GEN_VEXT_TRANS(vle32ff_v, MO_32, r2nfvm, ldff_op, ld_us_check)
+GEN_VEXT_TRANS(vle64ff_v, MO_64, r2nfvm, ldff_op, ld_us_check)
=20
 /*
  *** Vector Integer Arithmetic Instructions
--=20
2.31.1


