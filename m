Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA8F47A489
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 06:26:49 +0100 (CET)
Received: from localhost ([::1]:41882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzBCC-0003ZF-Ty
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 00:26:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAlK-0001gJ-Mc
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 23:59:02 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:51439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAlF-0008AH-Ct
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 23:59:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639976337; x=1671512337;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JDHgEkotD0JHeEG1nkzLWzL0BzFUrcCCMtGMObOY16E=;
 b=diV57Y8Q/FmV1wmEyJxeg9tCsPL55AIiniXr2oL2MKkZ4eATV4Va8Krt
 iK2BC4+9ySVIQTjq9zEvaGx4i0Hh+LoLtIy/2MlMtA6R6qbemMOIF5HiM
 8w9b0UCixVkygcK+lIWyGowWaHpWMa5vVQZVgf2wO57l3283JZWx9PrdC
 Cr4rZjhAovVZq+8Kb8+Unvq4jqsZ/jjNaFZuBJP7PejDL1sLlzF1FIqOw
 hTzVbY4kViuMOd5CHwY/v80IWGEfL/CTWYCoLJHnTkablYf3zWI3sEs1G
 O4SXIitr/ffFFqZTSacg4uMNCG44MxDViplnyAJXq6okjqGzr+IqRuymN g==;
X-IronPort-AV: E=Sophos;i="5.88,219,1635177600"; d="scan'208";a="292661943"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2021 12:58:55 +0800
IronPort-SDR: kmKzyS2fP7tehzmkVoosk6mmmtcrYgD3rkoRIvWzSyh1o7mpJWjpfoXJmO6bXJ7nndHI3a34ZS
 EJTPNSERn+6R+Gr8rhMUnaNXAypwQ7IQDpd3M6nk1nUsQjZP54Vo77+StwtMsebqyOSeDRZGaJ
 87VjiPGpBRw25C5fPXPX9Fa0rvc5bR4Oox+1DQr5PuATWxC4b1+Mx69A3GqutqAG5zJWNUEe9O
 qTUGebSYMqKGvITXZ4BdMXr7MpxL3RMVFjKDRS4LCnr66K+AwFUFZYIwFCVtq7fEht+wH8g7sZ
 N3DhdXpavGO4qtUxKiz121Hf
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:31:45 -0800
IronPort-SDR: nhMzkJvQ/HKC87ZyHT8OVolrXhny2gkBV/cCMMR8i5jCpu77uKaGOK6xAyt5XHsb8Fw22ceRDc
 g8Kb1U5SSDm721maB7hCaR+KhRcm10FtZ4LIANqFR+CzWN46w//Gze0Ur4GDqbBzsmJqNO8mXg
 RqwSL3zB1WZZ720OP+IpeVocz2V5wrBDc+Zmnt0MtOkJgiALEozC7xsqi5DvSW5RhmRD+vK/KP
 cZkuTIJmBTQW/Y9Mo/Y3kZtOfFZl3+IO05sq44y2ejH3xKzKeejv98BMS3tOHsKbr/PWRgYc1C
 B1k=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:58:57 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JHS6R3LKGz1Rvlf
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 20:58:55 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639976333; x=1642568334; bh=JDHgEkotD0JHeEG1nk
 zLWzL0BzFUrcCCMtGMObOY16E=; b=MninulJaeRfUjX33pc+mwYKZOmSAf52g/L
 yEWb5n+t37RAuIMRyhXtPVm6kQP7BHNdL3eIAl0dN4Rcu2UgkMQnmRNb1HOS3ezg
 wmQ3svwbzoX/6U8LbmyCK4D8GDVVKWQB3FQE65vz7ynWw8XWs8RcXjVAELggSNRz
 WgvHmAeR6dUPLCFiFJlMtrmYa4TCzgB0zJALYAcflJeK8iaumY5oIeh5QhIVQBRv
 rwWDig+L6StIp+1ChzBzFDVUuQPc8FNodxHMcgz3iJkQSn2Ex2ug5OY20cng44BI
 lEazqeFoE1Z0+intvp0MOqkM8lkO/RCAkxbj+CBdLq2EnHumrw8w==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id qL-n4cfAMY1B for <qemu-devel@nongnu.org>;
 Sun, 19 Dec 2021 20:58:53 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.68])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JHS6J4cy7z1RtVG;
 Sun, 19 Dec 2021 20:58:48 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 22/88] target/riscv: rvv-1.0: add VMA and VTA
Date: Mon, 20 Dec 2021 14:55:59 +1000
Message-Id: <20211220045705.62174-23-alistair.francis@opensource.wdc.com>
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

Introduce vma and vta fields in vtype register.

According to RVV 1.0 spec (section 3.3.3):

When a set is marked agnostic, the corresponding set of destination
elements in any vector or mask destination operand can either retain
the value they previously held, or are overwritten with 1s.

So, either vta/vma is set to undisturbed or agnostic, it's legal to
retain the inactive masked-off elements and tail elements' original
values unchanged. Therefore, besides declaring vta/vma fields in vtype
register, also remove all the tail elements clean functions in this
commit.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20211210075704.23951-15-frank.chang@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h           |    2 +
 target/riscv/vector_helper.c | 1927 ++++++++++++++++------------------
 2 files changed, 891 insertions(+), 1038 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 17414bfff7..709b7c3abb 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -104,6 +104,8 @@ typedef struct CPURISCVState CPURISCVState;
=20
 FIELD(VTYPE, VLMUL, 0, 3)
 FIELD(VTYPE, VSEW, 3, 3)
+FIELD(VTYPE, VTA, 6, 1)
+FIELD(VTYPE, VMA, 7, 1)
 FIELD(VTYPE, VEDIV, 8, 2)
 FIELD(VTYPE, RESERVED, 10, sizeof(target_ulong) * 8 - 11)
 FIELD(VTYPE, VILL, sizeof(target_ulong) * 8 - 1, 1)
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 866bfb3571..db1a40a3db 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -146,55 +146,6 @@ static void probe_pages(CPURISCVState *env, target_u=
long addr,
     }
 }
=20
-#ifdef HOST_WORDS_BIGENDIAN
-static void vext_clear(void *tail, uint32_t cnt, uint32_t tot)
-{
-    /*
-     * Split the remaining range to two parts.
-     * The first part is in the last uint64_t unit.
-     * The second part start from the next uint64_t unit.
-     */
-    int part1 =3D 0, part2 =3D tot - cnt;
-    if (cnt % 8) {
-        part1 =3D 8 - (cnt % 8);
-        part2 =3D tot - cnt - part1;
-        memset(QEMU_ALIGN_PTR_DOWN(tail, 8), 0, part1);
-        memset(QEMU_ALIGN_PTR_UP(tail, 8), 0, part2);
-    } else {
-        memset(tail, 0, part2);
-    }
-}
-#else
-static void vext_clear(void *tail, uint32_t cnt, uint32_t tot)
-{
-    memset(tail, 0, tot - cnt);
-}
-#endif
-
-static void clearb(void *vd, uint32_t idx, uint32_t cnt, uint32_t tot)
-{
-    int8_t *cur =3D ((int8_t *)vd + H1(idx));
-    vext_clear(cur, cnt, tot);
-}
-
-static void clearh(void *vd, uint32_t idx, uint32_t cnt, uint32_t tot)
-{
-    int16_t *cur =3D ((int16_t *)vd + H2(idx));
-    vext_clear(cur, cnt, tot);
-}
-
-static void clearl(void *vd, uint32_t idx, uint32_t cnt, uint32_t tot)
-{
-    int32_t *cur =3D ((int32_t *)vd + H4(idx));
-    vext_clear(cur, cnt, tot);
-}
-
-static void clearq(void *vd, uint32_t idx, uint32_t cnt, uint32_t tot)
-{
-    int64_t *cur =3D (int64_t *)vd + idx;
-    vext_clear(cur, cnt, tot);
-}
-
 static inline void vext_set_elem_mask(void *v0, int index,
                                       uint8_t value)
 {
@@ -219,7 +170,6 @@ static inline int vext_elem_mask(void *v0, int index)
 /* elements operations for load and store */
 typedef void vext_ldst_elem_fn(CPURISCVState *env, target_ulong addr,
                                uint32_t idx, void *vd, uintptr_t retaddr=
);
-typedef void clear_fn(void *vd, uint32_t idx, uint32_t cnt, uint32_t tot=
);
=20
 #define GEN_VEXT_LD_ELEM(NAME, MTYPE, ETYPE, H, LDSUF)     \
 static void NAME(CPURISCVState *env, abi_ptr addr,         \
@@ -283,7 +233,7 @@ static void
 vext_ldst_stride(void *vd, void *v0, target_ulong base,
                  target_ulong stride, CPURISCVState *env,
                  uint32_t desc, uint32_t vm,
-                 vext_ldst_elem_fn *ldst_elem, clear_fn *clear_elem,
+                 vext_ldst_elem_fn *ldst_elem,
                  uint32_t esz, uint32_t msz, uintptr_t ra,
                  MMUAccessType access_type)
 {
@@ -310,47 +260,41 @@ vext_ldst_stride(void *vd, void *v0, target_ulong b=
ase,
             k++;
         }
     }
-    /* clear tail elements */
-    if (clear_elem) {
-        for (k =3D 0; k < nf; k++) {
-            clear_elem(vd, env->vl + k * vlmax, env->vl * esz, vlmax * e=
sz);
-        }
-    }
 }
=20
-#define GEN_VEXT_LD_STRIDE(NAME, MTYPE, ETYPE, LOAD_FN, CLEAR_FN)       =
\
+#define GEN_VEXT_LD_STRIDE(NAME, MTYPE, ETYPE, LOAD_FN)                 =
\
 void HELPER(NAME)(void *vd, void * v0, target_ulong base,               =
\
                   target_ulong stride, CPURISCVState *env,              =
\
                   uint32_t desc)                                        =
\
 {                                                                       =
\
     uint32_t vm =3D vext_vm(desc);                                      =
  \
     vext_ldst_stride(vd, v0, base, stride, env, desc, vm, LOAD_FN,      =
\
-                     CLEAR_FN, sizeof(ETYPE), sizeof(MTYPE),            =
\
+                     sizeof(ETYPE), sizeof(MTYPE),                      =
\
                      GETPC(), MMU_DATA_LOAD);                           =
\
 }
=20
-GEN_VEXT_LD_STRIDE(vlsb_v_b,  int8_t,   int8_t,   ldb_b,  clearb)
-GEN_VEXT_LD_STRIDE(vlsb_v_h,  int8_t,   int16_t,  ldb_h,  clearh)
-GEN_VEXT_LD_STRIDE(vlsb_v_w,  int8_t,   int32_t,  ldb_w,  clearl)
-GEN_VEXT_LD_STRIDE(vlsb_v_d,  int8_t,   int64_t,  ldb_d,  clearq)
-GEN_VEXT_LD_STRIDE(vlsh_v_h,  int16_t,  int16_t,  ldh_h,  clearh)
-GEN_VEXT_LD_STRIDE(vlsh_v_w,  int16_t,  int32_t,  ldh_w,  clearl)
-GEN_VEXT_LD_STRIDE(vlsh_v_d,  int16_t,  int64_t,  ldh_d,  clearq)
-GEN_VEXT_LD_STRIDE(vlsw_v_w,  int32_t,  int32_t,  ldw_w,  clearl)
-GEN_VEXT_LD_STRIDE(vlsw_v_d,  int32_t,  int64_t,  ldw_d,  clearq)
-GEN_VEXT_LD_STRIDE(vlse_v_b,  int8_t,   int8_t,   lde_b,  clearb)
-GEN_VEXT_LD_STRIDE(vlse_v_h,  int16_t,  int16_t,  lde_h,  clearh)
-GEN_VEXT_LD_STRIDE(vlse_v_w,  int32_t,  int32_t,  lde_w,  clearl)
-GEN_VEXT_LD_STRIDE(vlse_v_d,  int64_t,  int64_t,  lde_d,  clearq)
-GEN_VEXT_LD_STRIDE(vlsbu_v_b, uint8_t,  uint8_t,  ldbu_b, clearb)
-GEN_VEXT_LD_STRIDE(vlsbu_v_h, uint8_t,  uint16_t, ldbu_h, clearh)
-GEN_VEXT_LD_STRIDE(vlsbu_v_w, uint8_t,  uint32_t, ldbu_w, clearl)
-GEN_VEXT_LD_STRIDE(vlsbu_v_d, uint8_t,  uint64_t, ldbu_d, clearq)
-GEN_VEXT_LD_STRIDE(vlshu_v_h, uint16_t, uint16_t, ldhu_h, clearh)
-GEN_VEXT_LD_STRIDE(vlshu_v_w, uint16_t, uint32_t, ldhu_w, clearl)
-GEN_VEXT_LD_STRIDE(vlshu_v_d, uint16_t, uint64_t, ldhu_d, clearq)
-GEN_VEXT_LD_STRIDE(vlswu_v_w, uint32_t, uint32_t, ldwu_w, clearl)
-GEN_VEXT_LD_STRIDE(vlswu_v_d, uint32_t, uint64_t, ldwu_d, clearq)
+GEN_VEXT_LD_STRIDE(vlsb_v_b,  int8_t,   int8_t,   ldb_b)
+GEN_VEXT_LD_STRIDE(vlsb_v_h,  int8_t,   int16_t,  ldb_h)
+GEN_VEXT_LD_STRIDE(vlsb_v_w,  int8_t,   int32_t,  ldb_w)
+GEN_VEXT_LD_STRIDE(vlsb_v_d,  int8_t,   int64_t,  ldb_d)
+GEN_VEXT_LD_STRIDE(vlsh_v_h,  int16_t,  int16_t,  ldh_h)
+GEN_VEXT_LD_STRIDE(vlsh_v_w,  int16_t,  int32_t,  ldh_w)
+GEN_VEXT_LD_STRIDE(vlsh_v_d,  int16_t,  int64_t,  ldh_d)
+GEN_VEXT_LD_STRIDE(vlsw_v_w,  int32_t,  int32_t,  ldw_w)
+GEN_VEXT_LD_STRIDE(vlsw_v_d,  int32_t,  int64_t,  ldw_d)
+GEN_VEXT_LD_STRIDE(vlse_v_b,  int8_t,   int8_t,   lde_b)
+GEN_VEXT_LD_STRIDE(vlse_v_h,  int16_t,  int16_t,  lde_h)
+GEN_VEXT_LD_STRIDE(vlse_v_w,  int32_t,  int32_t,  lde_w)
+GEN_VEXT_LD_STRIDE(vlse_v_d,  int64_t,  int64_t,  lde_d)
+GEN_VEXT_LD_STRIDE(vlsbu_v_b, uint8_t,  uint8_t,  ldbu_b)
+GEN_VEXT_LD_STRIDE(vlsbu_v_h, uint8_t,  uint16_t, ldbu_h)
+GEN_VEXT_LD_STRIDE(vlsbu_v_w, uint8_t,  uint32_t, ldbu_w)
+GEN_VEXT_LD_STRIDE(vlsbu_v_d, uint8_t,  uint64_t, ldbu_d)
+GEN_VEXT_LD_STRIDE(vlshu_v_h, uint16_t, uint16_t, ldhu_h)
+GEN_VEXT_LD_STRIDE(vlshu_v_w, uint16_t, uint32_t, ldhu_w)
+GEN_VEXT_LD_STRIDE(vlshu_v_d, uint16_t, uint64_t, ldhu_d)
+GEN_VEXT_LD_STRIDE(vlswu_v_w, uint32_t, uint32_t, ldwu_w)
+GEN_VEXT_LD_STRIDE(vlswu_v_d, uint32_t, uint64_t, ldwu_d)
=20
 #define GEN_VEXT_ST_STRIDE(NAME, MTYPE, ETYPE, STORE_FN)                =
\
 void HELPER(NAME)(void *vd, void *v0, target_ulong base,                =
\
@@ -359,7 +303,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong ba=
se,                \
 {                                                                       =
\
     uint32_t vm =3D vext_vm(desc);                                      =
  \
     vext_ldst_stride(vd, v0, base, stride, env, desc, vm, STORE_FN,     =
\
-                     NULL, sizeof(ETYPE), sizeof(MTYPE),                =
\
+                     sizeof(ETYPE), sizeof(MTYPE),                      =
\
                      GETPC(), MMU_DATA_STORE);                          =
\
 }
=20
@@ -384,9 +328,8 @@ GEN_VEXT_ST_STRIDE(vsse_v_d, int64_t, int64_t, ste_d)
 /* unmasked unit-stride load and store operation*/
 static void
 vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t d=
esc,
-             vext_ldst_elem_fn *ldst_elem, clear_fn *clear_elem,
-             uint32_t esz, uint32_t msz, uintptr_t ra,
-             MMUAccessType access_type)
+             vext_ldst_elem_fn *ldst_elem, uint32_t esz, uint32_t msz,
+             uintptr_t ra, MMUAccessType access_type)
 {
     uint32_t i, k;
     uint32_t nf =3D vext_nf(desc);
@@ -403,12 +346,6 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVSt=
ate *env, uint32_t desc,
             k++;
         }
     }
-    /* clear tail elements */
-    if (clear_elem) {
-        for (k =3D 0; k < nf; k++) {
-            clear_elem(vd, env->vl + k * vlmax, env->vl * esz, vlmax * e=
sz);
-        }
-    }
 }
=20
 /*
@@ -416,45 +353,45 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVS=
tate *env, uint32_t desc,
  * stride =3D NF * sizeof (MTYPE)
  */
=20
-#define GEN_VEXT_LD_US(NAME, MTYPE, ETYPE, LOAD_FN, CLEAR_FN)           =
\
+#define GEN_VEXT_LD_US(NAME, MTYPE, ETYPE, LOAD_FN)                     =
\
 void HELPER(NAME##_mask)(void *vd, void *v0, target_ulong base,         =
\
                          CPURISCVState *env, uint32_t desc)             =
\
 {                                                                       =
\
     uint32_t stride =3D vext_nf(desc) * sizeof(MTYPE);                  =
  \
     vext_ldst_stride(vd, v0, base, stride, env, desc, false, LOAD_FN,   =
\
-                     CLEAR_FN, sizeof(ETYPE), sizeof(MTYPE),            =
\
+                     sizeof(ETYPE), sizeof(MTYPE),                      =
\
                      GETPC(), MMU_DATA_LOAD);                           =
\
 }                                                                       =
\
                                                                         =
\
 void HELPER(NAME)(void *vd, void *v0, target_ulong base,                =
\
                   CPURISCVState *env, uint32_t desc)                    =
\
 {                                                                       =
\
-    vext_ldst_us(vd, base, env, desc, LOAD_FN, CLEAR_FN,                =
\
+    vext_ldst_us(vd, base, env, desc, LOAD_FN,                          =
\
                  sizeof(ETYPE), sizeof(MTYPE), GETPC(), MMU_DATA_LOAD); =
\
 }
=20
-GEN_VEXT_LD_US(vlb_v_b,  int8_t,   int8_t,   ldb_b,  clearb)
-GEN_VEXT_LD_US(vlb_v_h,  int8_t,   int16_t,  ldb_h,  clearh)
-GEN_VEXT_LD_US(vlb_v_w,  int8_t,   int32_t,  ldb_w,  clearl)
-GEN_VEXT_LD_US(vlb_v_d,  int8_t,   int64_t,  ldb_d,  clearq)
-GEN_VEXT_LD_US(vlh_v_h,  int16_t,  int16_t,  ldh_h,  clearh)
-GEN_VEXT_LD_US(vlh_v_w,  int16_t,  int32_t,  ldh_w,  clearl)
-GEN_VEXT_LD_US(vlh_v_d,  int16_t,  int64_t,  ldh_d,  clearq)
-GEN_VEXT_LD_US(vlw_v_w,  int32_t,  int32_t,  ldw_w,  clearl)
-GEN_VEXT_LD_US(vlw_v_d,  int32_t,  int64_t,  ldw_d,  clearq)
-GEN_VEXT_LD_US(vle_v_b,  int8_t,   int8_t,   lde_b,  clearb)
-GEN_VEXT_LD_US(vle_v_h,  int16_t,  int16_t,  lde_h,  clearh)
-GEN_VEXT_LD_US(vle_v_w,  int32_t,  int32_t,  lde_w,  clearl)
-GEN_VEXT_LD_US(vle_v_d,  int64_t,  int64_t,  lde_d,  clearq)
-GEN_VEXT_LD_US(vlbu_v_b, uint8_t,  uint8_t,  ldbu_b, clearb)
-GEN_VEXT_LD_US(vlbu_v_h, uint8_t,  uint16_t, ldbu_h, clearh)
-GEN_VEXT_LD_US(vlbu_v_w, uint8_t,  uint32_t, ldbu_w, clearl)
-GEN_VEXT_LD_US(vlbu_v_d, uint8_t,  uint64_t, ldbu_d, clearq)
-GEN_VEXT_LD_US(vlhu_v_h, uint16_t, uint16_t, ldhu_h, clearh)
-GEN_VEXT_LD_US(vlhu_v_w, uint16_t, uint32_t, ldhu_w, clearl)
-GEN_VEXT_LD_US(vlhu_v_d, uint16_t, uint64_t, ldhu_d, clearq)
-GEN_VEXT_LD_US(vlwu_v_w, uint32_t, uint32_t, ldwu_w, clearl)
-GEN_VEXT_LD_US(vlwu_v_d, uint32_t, uint64_t, ldwu_d, clearq)
+GEN_VEXT_LD_US(vlb_v_b,  int8_t,   int8_t,   ldb_b)
+GEN_VEXT_LD_US(vlb_v_h,  int8_t,   int16_t,  ldb_h)
+GEN_VEXT_LD_US(vlb_v_w,  int8_t,   int32_t,  ldb_w)
+GEN_VEXT_LD_US(vlb_v_d,  int8_t,   int64_t,  ldb_d)
+GEN_VEXT_LD_US(vlh_v_h,  int16_t,  int16_t,  ldh_h)
+GEN_VEXT_LD_US(vlh_v_w,  int16_t,  int32_t,  ldh_w)
+GEN_VEXT_LD_US(vlh_v_d,  int16_t,  int64_t,  ldh_d)
+GEN_VEXT_LD_US(vlw_v_w,  int32_t,  int32_t,  ldw_w)
+GEN_VEXT_LD_US(vlw_v_d,  int32_t,  int64_t,  ldw_d)
+GEN_VEXT_LD_US(vle_v_b,  int8_t,   int8_t,   lde_b)
+GEN_VEXT_LD_US(vle_v_h,  int16_t,  int16_t,  lde_h)
+GEN_VEXT_LD_US(vle_v_w,  int32_t,  int32_t,  lde_w)
+GEN_VEXT_LD_US(vle_v_d,  int64_t,  int64_t,  lde_d)
+GEN_VEXT_LD_US(vlbu_v_b, uint8_t,  uint8_t,  ldbu_b)
+GEN_VEXT_LD_US(vlbu_v_h, uint8_t,  uint16_t, ldbu_h)
+GEN_VEXT_LD_US(vlbu_v_w, uint8_t,  uint32_t, ldbu_w)
+GEN_VEXT_LD_US(vlbu_v_d, uint8_t,  uint64_t, ldbu_d)
+GEN_VEXT_LD_US(vlhu_v_h, uint16_t, uint16_t, ldhu_h)
+GEN_VEXT_LD_US(vlhu_v_w, uint16_t, uint32_t, ldhu_w)
+GEN_VEXT_LD_US(vlhu_v_d, uint16_t, uint64_t, ldhu_d)
+GEN_VEXT_LD_US(vlwu_v_w, uint32_t, uint32_t, ldwu_w)
+GEN_VEXT_LD_US(vlwu_v_d, uint32_t, uint64_t, ldwu_d)
=20
 #define GEN_VEXT_ST_US(NAME, MTYPE, ETYPE, STORE_FN)                    =
\
 void HELPER(NAME##_mask)(void *vd, void *v0, target_ulong base,         =
\
@@ -462,14 +399,14 @@ void HELPER(NAME##_mask)(void *vd, void *v0, target=
_ulong base,         \
 {                                                                       =
\
     uint32_t stride =3D vext_nf(desc) * sizeof(MTYPE);                  =
  \
     vext_ldst_stride(vd, v0, base, stride, env, desc, false, STORE_FN,  =
\
-                     NULL, sizeof(ETYPE), sizeof(MTYPE),                =
\
+                     sizeof(ETYPE), sizeof(MTYPE),                      =
\
                      GETPC(), MMU_DATA_STORE);                          =
\
 }                                                                       =
\
                                                                         =
\
 void HELPER(NAME)(void *vd, void *v0, target_ulong base,                =
\
                   CPURISCVState *env, uint32_t desc)                    =
\
 {                                                                       =
\
-    vext_ldst_us(vd, base, env, desc, STORE_FN, NULL,                   =
\
+    vext_ldst_us(vd, base, env, desc, STORE_FN,                         =
\
                  sizeof(ETYPE), sizeof(MTYPE), GETPC(), MMU_DATA_STORE);=
\
 }
=20
@@ -510,7 +447,6 @@ vext_ldst_index(void *vd, void *v0, target_ulong base=
,
                 void *vs2, CPURISCVState *env, uint32_t desc,
                 vext_get_index_addr get_index_addr,
                 vext_ldst_elem_fn *ldst_elem,
-                clear_fn *clear_elem,
                 uint32_t esz, uint32_t msz, uintptr_t ra,
                 MMUAccessType access_type)
 {
@@ -539,52 +475,46 @@ vext_ldst_index(void *vd, void *v0, target_ulong ba=
se,
             k++;
         }
     }
-    /* clear tail elements */
-    if (clear_elem) {
-        for (k =3D 0; k < nf; k++) {
-            clear_elem(vd, env->vl + k * vlmax, env->vl * esz, vlmax * e=
sz);
-        }
-    }
 }
=20
-#define GEN_VEXT_LD_INDEX(NAME, MTYPE, ETYPE, INDEX_FN, LOAD_FN, CLEAR_F=
N) \
+#define GEN_VEXT_LD_INDEX(NAME, MTYPE, ETYPE, INDEX_FN, LOAD_FN)        =
   \
 void HELPER(NAME)(void *vd, void *v0, target_ulong base,                =
   \
                   void *vs2, CPURISCVState *env, uint32_t desc)         =
   \
 {                                                                       =
   \
     vext_ldst_index(vd, v0, base, vs2, env, desc, INDEX_FN,             =
   \
-                    LOAD_FN, CLEAR_FN, sizeof(ETYPE), sizeof(MTYPE),    =
   \
+                    LOAD_FN, sizeof(ETYPE), sizeof(MTYPE),              =
   \
                     GETPC(), MMU_DATA_LOAD);                            =
   \
 }
=20
-GEN_VEXT_LD_INDEX(vlxb_v_b,  int8_t,   int8_t,   idx_b, ldb_b,  clearb)
-GEN_VEXT_LD_INDEX(vlxb_v_h,  int8_t,   int16_t,  idx_h, ldb_h,  clearh)
-GEN_VEXT_LD_INDEX(vlxb_v_w,  int8_t,   int32_t,  idx_w, ldb_w,  clearl)
-GEN_VEXT_LD_INDEX(vlxb_v_d,  int8_t,   int64_t,  idx_d, ldb_d,  clearq)
-GEN_VEXT_LD_INDEX(vlxh_v_h,  int16_t,  int16_t,  idx_h, ldh_h,  clearh)
-GEN_VEXT_LD_INDEX(vlxh_v_w,  int16_t,  int32_t,  idx_w, ldh_w,  clearl)
-GEN_VEXT_LD_INDEX(vlxh_v_d,  int16_t,  int64_t,  idx_d, ldh_d,  clearq)
-GEN_VEXT_LD_INDEX(vlxw_v_w,  int32_t,  int32_t,  idx_w, ldw_w,  clearl)
-GEN_VEXT_LD_INDEX(vlxw_v_d,  int32_t,  int64_t,  idx_d, ldw_d,  clearq)
-GEN_VEXT_LD_INDEX(vlxe_v_b,  int8_t,   int8_t,   idx_b, lde_b,  clearb)
-GEN_VEXT_LD_INDEX(vlxe_v_h,  int16_t,  int16_t,  idx_h, lde_h,  clearh)
-GEN_VEXT_LD_INDEX(vlxe_v_w,  int32_t,  int32_t,  idx_w, lde_w,  clearl)
-GEN_VEXT_LD_INDEX(vlxe_v_d,  int64_t,  int64_t,  idx_d, lde_d,  clearq)
-GEN_VEXT_LD_INDEX(vlxbu_v_b, uint8_t,  uint8_t,  idx_b, ldbu_b, clearb)
-GEN_VEXT_LD_INDEX(vlxbu_v_h, uint8_t,  uint16_t, idx_h, ldbu_h, clearh)
-GEN_VEXT_LD_INDEX(vlxbu_v_w, uint8_t,  uint32_t, idx_w, ldbu_w, clearl)
-GEN_VEXT_LD_INDEX(vlxbu_v_d, uint8_t,  uint64_t, idx_d, ldbu_d, clearq)
-GEN_VEXT_LD_INDEX(vlxhu_v_h, uint16_t, uint16_t, idx_h, ldhu_h, clearh)
-GEN_VEXT_LD_INDEX(vlxhu_v_w, uint16_t, uint32_t, idx_w, ldhu_w, clearl)
-GEN_VEXT_LD_INDEX(vlxhu_v_d, uint16_t, uint64_t, idx_d, ldhu_d, clearq)
-GEN_VEXT_LD_INDEX(vlxwu_v_w, uint32_t, uint32_t, idx_w, ldwu_w, clearl)
-GEN_VEXT_LD_INDEX(vlxwu_v_d, uint32_t, uint64_t, idx_d, ldwu_d, clearq)
+GEN_VEXT_LD_INDEX(vlxb_v_b,  int8_t,   int8_t,   idx_b, ldb_b)
+GEN_VEXT_LD_INDEX(vlxb_v_h,  int8_t,   int16_t,  idx_h, ldb_h)
+GEN_VEXT_LD_INDEX(vlxb_v_w,  int8_t,   int32_t,  idx_w, ldb_w)
+GEN_VEXT_LD_INDEX(vlxb_v_d,  int8_t,   int64_t,  idx_d, ldb_d)
+GEN_VEXT_LD_INDEX(vlxh_v_h,  int16_t,  int16_t,  idx_h, ldh_h)
+GEN_VEXT_LD_INDEX(vlxh_v_w,  int16_t,  int32_t,  idx_w, ldh_w)
+GEN_VEXT_LD_INDEX(vlxh_v_d,  int16_t,  int64_t,  idx_d, ldh_d)
+GEN_VEXT_LD_INDEX(vlxw_v_w,  int32_t,  int32_t,  idx_w, ldw_w)
+GEN_VEXT_LD_INDEX(vlxw_v_d,  int32_t,  int64_t,  idx_d, ldw_d)
+GEN_VEXT_LD_INDEX(vlxe_v_b,  int8_t,   int8_t,   idx_b, lde_b)
+GEN_VEXT_LD_INDEX(vlxe_v_h,  int16_t,  int16_t,  idx_h, lde_h)
+GEN_VEXT_LD_INDEX(vlxe_v_w,  int32_t,  int32_t,  idx_w, lde_w)
+GEN_VEXT_LD_INDEX(vlxe_v_d,  int64_t,  int64_t,  idx_d, lde_d)
+GEN_VEXT_LD_INDEX(vlxbu_v_b, uint8_t,  uint8_t,  idx_b, ldbu_b)
+GEN_VEXT_LD_INDEX(vlxbu_v_h, uint8_t,  uint16_t, idx_h, ldbu_h)
+GEN_VEXT_LD_INDEX(vlxbu_v_w, uint8_t,  uint32_t, idx_w, ldbu_w)
+GEN_VEXT_LD_INDEX(vlxbu_v_d, uint8_t,  uint64_t, idx_d, ldbu_d)
+GEN_VEXT_LD_INDEX(vlxhu_v_h, uint16_t, uint16_t, idx_h, ldhu_h)
+GEN_VEXT_LD_INDEX(vlxhu_v_w, uint16_t, uint32_t, idx_w, ldhu_w)
+GEN_VEXT_LD_INDEX(vlxhu_v_d, uint16_t, uint64_t, idx_d, ldhu_d)
+GEN_VEXT_LD_INDEX(vlxwu_v_w, uint32_t, uint32_t, idx_w, ldwu_w)
+GEN_VEXT_LD_INDEX(vlxwu_v_d, uint32_t, uint64_t, idx_d, ldwu_d)
=20
 #define GEN_VEXT_ST_INDEX(NAME, MTYPE, ETYPE, INDEX_FN, STORE_FN)\
 void HELPER(NAME)(void *vd, void *v0, target_ulong base,         \
                   void *vs2, CPURISCVState *env, uint32_t desc)  \
 {                                                                \
     vext_ldst_index(vd, v0, base, vs2, env, desc, INDEX_FN,      \
-                    STORE_FN, NULL, sizeof(ETYPE), sizeof(MTYPE),\
+                    STORE_FN, sizeof(ETYPE), sizeof(MTYPE),      \
                     GETPC(), MMU_DATA_STORE);                    \
 }
=20
@@ -609,7 +539,6 @@ static inline void
 vext_ldff(void *vd, void *v0, target_ulong base,
           CPURISCVState *env, uint32_t desc,
           vext_ldst_elem_fn *ldst_elem,
-          clear_fn *clear_elem,
           uint32_t esz, uint32_t msz, uintptr_t ra)
 {
     void *host;
@@ -671,45 +600,38 @@ ProbeSuccess:
             k++;
         }
     }
-    /* clear tail elements */
-    if (vl !=3D 0) {
-        return;
-    }
-    for (k =3D 0; k < nf; k++) {
-        clear_elem(vd, env->vl + k * vlmax, env->vl * esz, vlmax * esz);
-    }
 }
=20
-#define GEN_VEXT_LDFF(NAME, MTYPE, ETYPE, LOAD_FN, CLEAR_FN)     \
+#define GEN_VEXT_LDFF(NAME, MTYPE, ETYPE, LOAD_FN)               \
 void HELPER(NAME)(void *vd, void *v0, target_ulong base,         \
                   CPURISCVState *env, uint32_t desc)             \
 {                                                                \
-    vext_ldff(vd, v0, base, env, desc, LOAD_FN, CLEAR_FN,        \
+    vext_ldff(vd, v0, base, env, desc, LOAD_FN,                  \
               sizeof(ETYPE), sizeof(MTYPE), GETPC());            \
 }
=20
-GEN_VEXT_LDFF(vlbff_v_b,  int8_t,   int8_t,   ldb_b,  clearb)
-GEN_VEXT_LDFF(vlbff_v_h,  int8_t,   int16_t,  ldb_h,  clearh)
-GEN_VEXT_LDFF(vlbff_v_w,  int8_t,   int32_t,  ldb_w,  clearl)
-GEN_VEXT_LDFF(vlbff_v_d,  int8_t,   int64_t,  ldb_d,  clearq)
-GEN_VEXT_LDFF(vlhff_v_h,  int16_t,  int16_t,  ldh_h,  clearh)
-GEN_VEXT_LDFF(vlhff_v_w,  int16_t,  int32_t,  ldh_w,  clearl)
-GEN_VEXT_LDFF(vlhff_v_d,  int16_t,  int64_t,  ldh_d,  clearq)
-GEN_VEXT_LDFF(vlwff_v_w,  int32_t,  int32_t,  ldw_w,  clearl)
-GEN_VEXT_LDFF(vlwff_v_d,  int32_t,  int64_t,  ldw_d,  clearq)
-GEN_VEXT_LDFF(vleff_v_b,  int8_t,   int8_t,   lde_b,  clearb)
-GEN_VEXT_LDFF(vleff_v_h,  int16_t,  int16_t,  lde_h,  clearh)
-GEN_VEXT_LDFF(vleff_v_w,  int32_t,  int32_t,  lde_w,  clearl)
-GEN_VEXT_LDFF(vleff_v_d,  int64_t,  int64_t,  lde_d,  clearq)
-GEN_VEXT_LDFF(vlbuff_v_b, uint8_t,  uint8_t,  ldbu_b, clearb)
-GEN_VEXT_LDFF(vlbuff_v_h, uint8_t,  uint16_t, ldbu_h, clearh)
-GEN_VEXT_LDFF(vlbuff_v_w, uint8_t,  uint32_t, ldbu_w, clearl)
-GEN_VEXT_LDFF(vlbuff_v_d, uint8_t,  uint64_t, ldbu_d, clearq)
-GEN_VEXT_LDFF(vlhuff_v_h, uint16_t, uint16_t, ldhu_h, clearh)
-GEN_VEXT_LDFF(vlhuff_v_w, uint16_t, uint32_t, ldhu_w, clearl)
-GEN_VEXT_LDFF(vlhuff_v_d, uint16_t, uint64_t, ldhu_d, clearq)
-GEN_VEXT_LDFF(vlwuff_v_w, uint32_t, uint32_t, ldwu_w, clearl)
-GEN_VEXT_LDFF(vlwuff_v_d, uint32_t, uint64_t, ldwu_d, clearq)
+GEN_VEXT_LDFF(vlbff_v_b,  int8_t,   int8_t,   ldb_b)
+GEN_VEXT_LDFF(vlbff_v_h,  int8_t,   int16_t,  ldb_h)
+GEN_VEXT_LDFF(vlbff_v_w,  int8_t,   int32_t,  ldb_w)
+GEN_VEXT_LDFF(vlbff_v_d,  int8_t,   int64_t,  ldb_d)
+GEN_VEXT_LDFF(vlhff_v_h,  int16_t,  int16_t,  ldh_h)
+GEN_VEXT_LDFF(vlhff_v_w,  int16_t,  int32_t,  ldh_w)
+GEN_VEXT_LDFF(vlhff_v_d,  int16_t,  int64_t,  ldh_d)
+GEN_VEXT_LDFF(vlwff_v_w,  int32_t,  int32_t,  ldw_w)
+GEN_VEXT_LDFF(vlwff_v_d,  int32_t,  int64_t,  ldw_d)
+GEN_VEXT_LDFF(vleff_v_b,  int8_t,   int8_t,   lde_b)
+GEN_VEXT_LDFF(vleff_v_h,  int16_t,  int16_t,  lde_h)
+GEN_VEXT_LDFF(vleff_v_w,  int32_t,  int32_t,  lde_w)
+GEN_VEXT_LDFF(vleff_v_d,  int64_t,  int64_t,  lde_d)
+GEN_VEXT_LDFF(vlbuff_v_b, uint8_t,  uint8_t,  ldbu_b)
+GEN_VEXT_LDFF(vlbuff_v_h, uint8_t,  uint16_t, ldbu_h)
+GEN_VEXT_LDFF(vlbuff_v_w, uint8_t,  uint32_t, ldbu_w)
+GEN_VEXT_LDFF(vlbuff_v_d, uint8_t,  uint64_t, ldbu_d)
+GEN_VEXT_LDFF(vlhuff_v_h, uint16_t, uint16_t, ldhu_h)
+GEN_VEXT_LDFF(vlhuff_v_w, uint16_t, uint32_t, ldhu_w)
+GEN_VEXT_LDFF(vlhuff_v_d, uint16_t, uint64_t, ldhu_d)
+GEN_VEXT_LDFF(vlwuff_v_w, uint32_t, uint32_t, ldwu_w)
+GEN_VEXT_LDFF(vlwuff_v_d, uint32_t, uint64_t, ldwu_d)
=20
 /*
  *** Vector AMO Operations (Zvamo)
@@ -784,14 +706,12 @@ vext_amo_noatomic(void *vs3, void *v0, target_ulong=
 base,
                   void *vs2, CPURISCVState *env, uint32_t desc,
                   vext_get_index_addr get_index_addr,
                   vext_amo_noatomic_fn *noatomic_op,
-                  clear_fn *clear_elem,
                   uint32_t esz, uint32_t msz, uintptr_t ra)
 {
     uint32_t i;
     target_long addr;
     uint32_t wd =3D vext_wd(desc);
     uint32_t vm =3D vext_vm(desc);
-    uint32_t vlmax =3D vext_maxsz(desc) / esz;
=20
     for (i =3D 0; i < env->vl; i++) {
         if (!vm && !vext_elem_mask(v0, i)) {
@@ -807,46 +727,45 @@ vext_amo_noatomic(void *vs3, void *v0, target_ulong=
 base,
         addr =3D get_index_addr(base, i, vs2);
         noatomic_op(vs3, addr, wd, i, env, ra);
     }
-    clear_elem(vs3, env->vl, env->vl * esz, vlmax * esz);
 }
=20
-#define GEN_VEXT_AMO(NAME, MTYPE, ETYPE, INDEX_FN, CLEAR_FN)    \
+#define GEN_VEXT_AMO(NAME, MTYPE, ETYPE, INDEX_FN)              \
 void HELPER(NAME)(void *vs3, void *v0, target_ulong base,       \
                   void *vs2, CPURISCVState *env, uint32_t desc) \
 {                                                               \
     vext_amo_noatomic(vs3, v0, base, vs2, env, desc,            \
                       INDEX_FN, vext_##NAME##_noatomic_op,      \
-                      CLEAR_FN, sizeof(ETYPE), sizeof(MTYPE),   \
+                      sizeof(ETYPE), sizeof(MTYPE),             \
                       GETPC());                                 \
 }
=20
-GEN_VEXT_AMO(vamoswapw_v_d, int32_t,  int64_t,  idx_d, clearq)
-GEN_VEXT_AMO(vamoswapd_v_d, int64_t,  int64_t,  idx_d, clearq)
-GEN_VEXT_AMO(vamoaddw_v_d,  int32_t,  int64_t,  idx_d, clearq)
-GEN_VEXT_AMO(vamoaddd_v_d,  int64_t,  int64_t,  idx_d, clearq)
-GEN_VEXT_AMO(vamoxorw_v_d,  int32_t,  int64_t,  idx_d, clearq)
-GEN_VEXT_AMO(vamoxord_v_d,  int64_t,  int64_t,  idx_d, clearq)
-GEN_VEXT_AMO(vamoandw_v_d,  int32_t,  int64_t,  idx_d, clearq)
-GEN_VEXT_AMO(vamoandd_v_d,  int64_t,  int64_t,  idx_d, clearq)
-GEN_VEXT_AMO(vamoorw_v_d,   int32_t,  int64_t,  idx_d, clearq)
-GEN_VEXT_AMO(vamoord_v_d,   int64_t,  int64_t,  idx_d, clearq)
-GEN_VEXT_AMO(vamominw_v_d,  int32_t,  int64_t,  idx_d, clearq)
-GEN_VEXT_AMO(vamomind_v_d,  int64_t,  int64_t,  idx_d, clearq)
-GEN_VEXT_AMO(vamomaxw_v_d,  int32_t,  int64_t,  idx_d, clearq)
-GEN_VEXT_AMO(vamomaxd_v_d,  int64_t,  int64_t,  idx_d, clearq)
-GEN_VEXT_AMO(vamominuw_v_d, uint32_t, uint64_t, idx_d, clearq)
-GEN_VEXT_AMO(vamominud_v_d, uint64_t, uint64_t, idx_d, clearq)
-GEN_VEXT_AMO(vamomaxuw_v_d, uint32_t, uint64_t, idx_d, clearq)
-GEN_VEXT_AMO(vamomaxud_v_d, uint64_t, uint64_t, idx_d, clearq)
-GEN_VEXT_AMO(vamoswapw_v_w, int32_t,  int32_t,  idx_w, clearl)
-GEN_VEXT_AMO(vamoaddw_v_w,  int32_t,  int32_t,  idx_w, clearl)
-GEN_VEXT_AMO(vamoxorw_v_w,  int32_t,  int32_t,  idx_w, clearl)
-GEN_VEXT_AMO(vamoandw_v_w,  int32_t,  int32_t,  idx_w, clearl)
-GEN_VEXT_AMO(vamoorw_v_w,   int32_t,  int32_t,  idx_w, clearl)
-GEN_VEXT_AMO(vamominw_v_w,  int32_t,  int32_t,  idx_w, clearl)
-GEN_VEXT_AMO(vamomaxw_v_w,  int32_t,  int32_t,  idx_w, clearl)
-GEN_VEXT_AMO(vamominuw_v_w, uint32_t, uint32_t, idx_w, clearl)
-GEN_VEXT_AMO(vamomaxuw_v_w, uint32_t, uint32_t, idx_w, clearl)
+GEN_VEXT_AMO(vamoswapw_v_d, int32_t,  int64_t,  idx_d)
+GEN_VEXT_AMO(vamoswapd_v_d, int64_t,  int64_t,  idx_d)
+GEN_VEXT_AMO(vamoaddw_v_d,  int32_t,  int64_t,  idx_d)
+GEN_VEXT_AMO(vamoaddd_v_d,  int64_t,  int64_t,  idx_d)
+GEN_VEXT_AMO(vamoxorw_v_d,  int32_t,  int64_t,  idx_d)
+GEN_VEXT_AMO(vamoxord_v_d,  int64_t,  int64_t,  idx_d)
+GEN_VEXT_AMO(vamoandw_v_d,  int32_t,  int64_t,  idx_d)
+GEN_VEXT_AMO(vamoandd_v_d,  int64_t,  int64_t,  idx_d)
+GEN_VEXT_AMO(vamoorw_v_d,   int32_t,  int64_t,  idx_d)
+GEN_VEXT_AMO(vamoord_v_d,   int64_t,  int64_t,  idx_d)
+GEN_VEXT_AMO(vamominw_v_d,  int32_t,  int64_t,  idx_d)
+GEN_VEXT_AMO(vamomind_v_d,  int64_t,  int64_t,  idx_d)
+GEN_VEXT_AMO(vamomaxw_v_d,  int32_t,  int64_t,  idx_d)
+GEN_VEXT_AMO(vamomaxd_v_d,  int64_t,  int64_t,  idx_d)
+GEN_VEXT_AMO(vamominuw_v_d, uint32_t, uint64_t, idx_d)
+GEN_VEXT_AMO(vamominud_v_d, uint64_t, uint64_t, idx_d)
+GEN_VEXT_AMO(vamomaxuw_v_d, uint32_t, uint64_t, idx_d)
+GEN_VEXT_AMO(vamomaxud_v_d, uint64_t, uint64_t, idx_d)
+GEN_VEXT_AMO(vamoswapw_v_w, int32_t,  int32_t,  idx_w)
+GEN_VEXT_AMO(vamoaddw_v_w,  int32_t,  int32_t,  idx_w)
+GEN_VEXT_AMO(vamoxorw_v_w,  int32_t,  int32_t,  idx_w)
+GEN_VEXT_AMO(vamoandw_v_w,  int32_t,  int32_t,  idx_w)
+GEN_VEXT_AMO(vamoorw_v_w,   int32_t,  int32_t,  idx_w)
+GEN_VEXT_AMO(vamominw_v_w,  int32_t,  int32_t,  idx_w)
+GEN_VEXT_AMO(vamomaxw_v_w,  int32_t,  int32_t,  idx_w)
+GEN_VEXT_AMO(vamominuw_v_w, uint32_t, uint32_t, idx_w)
+GEN_VEXT_AMO(vamomaxuw_v_w, uint32_t, uint32_t, idx_w)
=20
 /*
  *** Vector Integer Arithmetic Instructions
@@ -912,9 +831,8 @@ RVVCALL(OPIVV2, vsub_vv_d, OP_SSS_D, H8, H8, H8, DO_S=
UB)
 static void do_vext_vv(void *vd, void *v0, void *vs1, void *vs2,
                        CPURISCVState *env, uint32_t desc,
                        uint32_t esz, uint32_t dsz,
-                       opivv2_fn *fn, clear_fn *clearfn)
+                       opivv2_fn *fn)
 {
-    uint32_t vlmax =3D vext_maxsz(desc) / esz;
     uint32_t vm =3D vext_vm(desc);
     uint32_t vl =3D env->vl;
     uint32_t i;
@@ -925,27 +843,26 @@ static void do_vext_vv(void *vd, void *v0, void *vs=
1, void *vs2,
         }
         fn(vd, vs1, vs2, i);
     }
-    clearfn(vd, vl, vl * dsz,  vlmax * dsz);
 }
=20
 /* generate the helpers for OPIVV */
-#define GEN_VEXT_VV(NAME, ESZ, DSZ, CLEAR_FN)             \
+#define GEN_VEXT_VV(NAME, ESZ, DSZ)                       \
 void HELPER(NAME)(void *vd, void *v0, void *vs1,          \
                   void *vs2, CPURISCVState *env,          \
                   uint32_t desc)                          \
 {                                                         \
     do_vext_vv(vd, v0, vs1, vs2, env, desc, ESZ, DSZ,     \
-               do_##NAME, CLEAR_FN);                      \
+               do_##NAME);                                \
 }
=20
-GEN_VEXT_VV(vadd_vv_b, 1, 1, clearb)
-GEN_VEXT_VV(vadd_vv_h, 2, 2, clearh)
-GEN_VEXT_VV(vadd_vv_w, 4, 4, clearl)
-GEN_VEXT_VV(vadd_vv_d, 8, 8, clearq)
-GEN_VEXT_VV(vsub_vv_b, 1, 1, clearb)
-GEN_VEXT_VV(vsub_vv_h, 2, 2, clearh)
-GEN_VEXT_VV(vsub_vv_w, 4, 4, clearl)
-GEN_VEXT_VV(vsub_vv_d, 8, 8, clearq)
+GEN_VEXT_VV(vadd_vv_b, 1, 1)
+GEN_VEXT_VV(vadd_vv_h, 2, 2)
+GEN_VEXT_VV(vadd_vv_w, 4, 4)
+GEN_VEXT_VV(vadd_vv_d, 8, 8)
+GEN_VEXT_VV(vsub_vv_b, 1, 1)
+GEN_VEXT_VV(vsub_vv_h, 2, 2)
+GEN_VEXT_VV(vsub_vv_w, 4, 4)
+GEN_VEXT_VV(vsub_vv_d, 8, 8)
=20
 typedef void opivx2_fn(void *vd, target_long s1, void *vs2, int i);
=20
@@ -976,9 +893,8 @@ RVVCALL(OPIVX2, vrsub_vx_d, OP_SSS_D, H8, H8, DO_RSUB=
)
 static void do_vext_vx(void *vd, void *v0, target_long s1, void *vs2,
                        CPURISCVState *env, uint32_t desc,
                        uint32_t esz, uint32_t dsz,
-                       opivx2_fn fn, clear_fn *clearfn)
+                       opivx2_fn fn)
 {
-    uint32_t vlmax =3D vext_maxsz(desc) / esz;
     uint32_t vm =3D vext_vm(desc);
     uint32_t vl =3D env->vl;
     uint32_t i;
@@ -989,31 +905,30 @@ static void do_vext_vx(void *vd, void *v0, target_l=
ong s1, void *vs2,
         }
         fn(vd, s1, vs2, i);
     }
-    clearfn(vd, vl, vl * dsz,  vlmax * dsz);
 }
=20
 /* generate the helpers for OPIVX */
-#define GEN_VEXT_VX(NAME, ESZ, DSZ, CLEAR_FN)             \
+#define GEN_VEXT_VX(NAME, ESZ, DSZ)                       \
 void HELPER(NAME)(void *vd, void *v0, target_ulong s1,    \
                   void *vs2, CPURISCVState *env,          \
                   uint32_t desc)                          \
 {                                                         \
     do_vext_vx(vd, v0, s1, vs2, env, desc, ESZ, DSZ,      \
-               do_##NAME, CLEAR_FN);                      \
-}
-
-GEN_VEXT_VX(vadd_vx_b, 1, 1, clearb)
-GEN_VEXT_VX(vadd_vx_h, 2, 2, clearh)
-GEN_VEXT_VX(vadd_vx_w, 4, 4, clearl)
-GEN_VEXT_VX(vadd_vx_d, 8, 8, clearq)
-GEN_VEXT_VX(vsub_vx_b, 1, 1, clearb)
-GEN_VEXT_VX(vsub_vx_h, 2, 2, clearh)
-GEN_VEXT_VX(vsub_vx_w, 4, 4, clearl)
-GEN_VEXT_VX(vsub_vx_d, 8, 8, clearq)
-GEN_VEXT_VX(vrsub_vx_b, 1, 1, clearb)
-GEN_VEXT_VX(vrsub_vx_h, 2, 2, clearh)
-GEN_VEXT_VX(vrsub_vx_w, 4, 4, clearl)
-GEN_VEXT_VX(vrsub_vx_d, 8, 8, clearq)
+               do_##NAME);                                \
+}
+
+GEN_VEXT_VX(vadd_vx_b, 1, 1)
+GEN_VEXT_VX(vadd_vx_h, 2, 2)
+GEN_VEXT_VX(vadd_vx_w, 4, 4)
+GEN_VEXT_VX(vadd_vx_d, 8, 8)
+GEN_VEXT_VX(vsub_vx_b, 1, 1)
+GEN_VEXT_VX(vsub_vx_h, 2, 2)
+GEN_VEXT_VX(vsub_vx_w, 4, 4)
+GEN_VEXT_VX(vsub_vx_d, 8, 8)
+GEN_VEXT_VX(vrsub_vx_b, 1, 1)
+GEN_VEXT_VX(vrsub_vx_h, 2, 2)
+GEN_VEXT_VX(vrsub_vx_w, 4, 4)
+GEN_VEXT_VX(vrsub_vx_d, 8, 8)
=20
 void HELPER(vec_rsubs8)(void *d, void *a, uint64_t b, uint32_t desc)
 {
@@ -1092,30 +1007,30 @@ RVVCALL(OPIVV2, vwadd_wv_w, WOP_WSSS_W, H8, H4, H=
4, DO_ADD)
 RVVCALL(OPIVV2, vwsub_wv_b, WOP_WSSS_B, H2, H1, H1, DO_SUB)
 RVVCALL(OPIVV2, vwsub_wv_h, WOP_WSSS_H, H4, H2, H2, DO_SUB)
 RVVCALL(OPIVV2, vwsub_wv_w, WOP_WSSS_W, H8, H4, H4, DO_SUB)
-GEN_VEXT_VV(vwaddu_vv_b, 1, 2, clearh)
-GEN_VEXT_VV(vwaddu_vv_h, 2, 4, clearl)
-GEN_VEXT_VV(vwaddu_vv_w, 4, 8, clearq)
-GEN_VEXT_VV(vwsubu_vv_b, 1, 2, clearh)
-GEN_VEXT_VV(vwsubu_vv_h, 2, 4, clearl)
-GEN_VEXT_VV(vwsubu_vv_w, 4, 8, clearq)
-GEN_VEXT_VV(vwadd_vv_b, 1, 2, clearh)
-GEN_VEXT_VV(vwadd_vv_h, 2, 4, clearl)
-GEN_VEXT_VV(vwadd_vv_w, 4, 8, clearq)
-GEN_VEXT_VV(vwsub_vv_b, 1, 2, clearh)
-GEN_VEXT_VV(vwsub_vv_h, 2, 4, clearl)
-GEN_VEXT_VV(vwsub_vv_w, 4, 8, clearq)
-GEN_VEXT_VV(vwaddu_wv_b, 1, 2, clearh)
-GEN_VEXT_VV(vwaddu_wv_h, 2, 4, clearl)
-GEN_VEXT_VV(vwaddu_wv_w, 4, 8, clearq)
-GEN_VEXT_VV(vwsubu_wv_b, 1, 2, clearh)
-GEN_VEXT_VV(vwsubu_wv_h, 2, 4, clearl)
-GEN_VEXT_VV(vwsubu_wv_w, 4, 8, clearq)
-GEN_VEXT_VV(vwadd_wv_b, 1, 2, clearh)
-GEN_VEXT_VV(vwadd_wv_h, 2, 4, clearl)
-GEN_VEXT_VV(vwadd_wv_w, 4, 8, clearq)
-GEN_VEXT_VV(vwsub_wv_b, 1, 2, clearh)
-GEN_VEXT_VV(vwsub_wv_h, 2, 4, clearl)
-GEN_VEXT_VV(vwsub_wv_w, 4, 8, clearq)
+GEN_VEXT_VV(vwaddu_vv_b, 1, 2)
+GEN_VEXT_VV(vwaddu_vv_h, 2, 4)
+GEN_VEXT_VV(vwaddu_vv_w, 4, 8)
+GEN_VEXT_VV(vwsubu_vv_b, 1, 2)
+GEN_VEXT_VV(vwsubu_vv_h, 2, 4)
+GEN_VEXT_VV(vwsubu_vv_w, 4, 8)
+GEN_VEXT_VV(vwadd_vv_b, 1, 2)
+GEN_VEXT_VV(vwadd_vv_h, 2, 4)
+GEN_VEXT_VV(vwadd_vv_w, 4, 8)
+GEN_VEXT_VV(vwsub_vv_b, 1, 2)
+GEN_VEXT_VV(vwsub_vv_h, 2, 4)
+GEN_VEXT_VV(vwsub_vv_w, 4, 8)
+GEN_VEXT_VV(vwaddu_wv_b, 1, 2)
+GEN_VEXT_VV(vwaddu_wv_h, 2, 4)
+GEN_VEXT_VV(vwaddu_wv_w, 4, 8)
+GEN_VEXT_VV(vwsubu_wv_b, 1, 2)
+GEN_VEXT_VV(vwsubu_wv_h, 2, 4)
+GEN_VEXT_VV(vwsubu_wv_w, 4, 8)
+GEN_VEXT_VV(vwadd_wv_b, 1, 2)
+GEN_VEXT_VV(vwadd_wv_h, 2, 4)
+GEN_VEXT_VV(vwadd_wv_w, 4, 8)
+GEN_VEXT_VV(vwsub_wv_b, 1, 2)
+GEN_VEXT_VV(vwsub_wv_h, 2, 4)
+GEN_VEXT_VV(vwsub_wv_w, 4, 8)
=20
 RVVCALL(OPIVX2, vwaddu_vx_b, WOP_UUU_B, H2, H1, DO_ADD)
 RVVCALL(OPIVX2, vwaddu_vx_h, WOP_UUU_H, H4, H2, DO_ADD)
@@ -1141,42 +1056,40 @@ RVVCALL(OPIVX2, vwadd_wx_w, WOP_WSSS_W, H8, H4, D=
O_ADD)
 RVVCALL(OPIVX2, vwsub_wx_b, WOP_WSSS_B, H2, H1, DO_SUB)
 RVVCALL(OPIVX2, vwsub_wx_h, WOP_WSSS_H, H4, H2, DO_SUB)
 RVVCALL(OPIVX2, vwsub_wx_w, WOP_WSSS_W, H8, H4, DO_SUB)
-GEN_VEXT_VX(vwaddu_vx_b, 1, 2, clearh)
-GEN_VEXT_VX(vwaddu_vx_h, 2, 4, clearl)
-GEN_VEXT_VX(vwaddu_vx_w, 4, 8, clearq)
-GEN_VEXT_VX(vwsubu_vx_b, 1, 2, clearh)
-GEN_VEXT_VX(vwsubu_vx_h, 2, 4, clearl)
-GEN_VEXT_VX(vwsubu_vx_w, 4, 8, clearq)
-GEN_VEXT_VX(vwadd_vx_b, 1, 2, clearh)
-GEN_VEXT_VX(vwadd_vx_h, 2, 4, clearl)
-GEN_VEXT_VX(vwadd_vx_w, 4, 8, clearq)
-GEN_VEXT_VX(vwsub_vx_b, 1, 2, clearh)
-GEN_VEXT_VX(vwsub_vx_h, 2, 4, clearl)
-GEN_VEXT_VX(vwsub_vx_w, 4, 8, clearq)
-GEN_VEXT_VX(vwaddu_wx_b, 1, 2, clearh)
-GEN_VEXT_VX(vwaddu_wx_h, 2, 4, clearl)
-GEN_VEXT_VX(vwaddu_wx_w, 4, 8, clearq)
-GEN_VEXT_VX(vwsubu_wx_b, 1, 2, clearh)
-GEN_VEXT_VX(vwsubu_wx_h, 2, 4, clearl)
-GEN_VEXT_VX(vwsubu_wx_w, 4, 8, clearq)
-GEN_VEXT_VX(vwadd_wx_b, 1, 2, clearh)
-GEN_VEXT_VX(vwadd_wx_h, 2, 4, clearl)
-GEN_VEXT_VX(vwadd_wx_w, 4, 8, clearq)
-GEN_VEXT_VX(vwsub_wx_b, 1, 2, clearh)
-GEN_VEXT_VX(vwsub_wx_h, 2, 4, clearl)
-GEN_VEXT_VX(vwsub_wx_w, 4, 8, clearq)
+GEN_VEXT_VX(vwaddu_vx_b, 1, 2)
+GEN_VEXT_VX(vwaddu_vx_h, 2, 4)
+GEN_VEXT_VX(vwaddu_vx_w, 4, 8)
+GEN_VEXT_VX(vwsubu_vx_b, 1, 2)
+GEN_VEXT_VX(vwsubu_vx_h, 2, 4)
+GEN_VEXT_VX(vwsubu_vx_w, 4, 8)
+GEN_VEXT_VX(vwadd_vx_b, 1, 2)
+GEN_VEXT_VX(vwadd_vx_h, 2, 4)
+GEN_VEXT_VX(vwadd_vx_w, 4, 8)
+GEN_VEXT_VX(vwsub_vx_b, 1, 2)
+GEN_VEXT_VX(vwsub_vx_h, 2, 4)
+GEN_VEXT_VX(vwsub_vx_w, 4, 8)
+GEN_VEXT_VX(vwaddu_wx_b, 1, 2)
+GEN_VEXT_VX(vwaddu_wx_h, 2, 4)
+GEN_VEXT_VX(vwaddu_wx_w, 4, 8)
+GEN_VEXT_VX(vwsubu_wx_b, 1, 2)
+GEN_VEXT_VX(vwsubu_wx_h, 2, 4)
+GEN_VEXT_VX(vwsubu_wx_w, 4, 8)
+GEN_VEXT_VX(vwadd_wx_b, 1, 2)
+GEN_VEXT_VX(vwadd_wx_h, 2, 4)
+GEN_VEXT_VX(vwadd_wx_w, 4, 8)
+GEN_VEXT_VX(vwsub_wx_b, 1, 2)
+GEN_VEXT_VX(vwsub_wx_h, 2, 4)
+GEN_VEXT_VX(vwsub_wx_w, 4, 8)
=20
 /* Vector Integer Add-with-Carry / Subtract-with-Borrow Instructions */
 #define DO_VADC(N, M, C) (N + M + C)
 #define DO_VSBC(N, M, C) (N - M - C)
=20
-#define GEN_VEXT_VADC_VVM(NAME, ETYPE, H, DO_OP, CLEAR_FN)    \
+#define GEN_VEXT_VADC_VVM(NAME, ETYPE, H, DO_OP)              \
 void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
                   CPURISCVState *env, uint32_t desc)          \
 {                                                             \
     uint32_t vl =3D env->vl;                                    \
-    uint32_t esz =3D sizeof(ETYPE);                             \
-    uint32_t vlmax =3D vext_maxsz(desc) / esz;                  \
     uint32_t i;                                               \
                                                               \
     for (i =3D 0; i < vl; i++) {                                \
@@ -1186,26 +1099,23 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, =
void *vs2,   \
                                                               \
         *((ETYPE *)vd + H(i)) =3D DO_OP(s2, s1, carry);         \
     }                                                         \
-    CLEAR_FN(vd, vl, vl * esz, vlmax * esz);                  \
 }
=20
-GEN_VEXT_VADC_VVM(vadc_vvm_b, uint8_t,  H1, DO_VADC, clearb)
-GEN_VEXT_VADC_VVM(vadc_vvm_h, uint16_t, H2, DO_VADC, clearh)
-GEN_VEXT_VADC_VVM(vadc_vvm_w, uint32_t, H4, DO_VADC, clearl)
-GEN_VEXT_VADC_VVM(vadc_vvm_d, uint64_t, H8, DO_VADC, clearq)
+GEN_VEXT_VADC_VVM(vadc_vvm_b, uint8_t,  H1, DO_VADC)
+GEN_VEXT_VADC_VVM(vadc_vvm_h, uint16_t, H2, DO_VADC)
+GEN_VEXT_VADC_VVM(vadc_vvm_w, uint32_t, H4, DO_VADC)
+GEN_VEXT_VADC_VVM(vadc_vvm_d, uint64_t, H8, DO_VADC)
=20
-GEN_VEXT_VADC_VVM(vsbc_vvm_b, uint8_t,  H1, DO_VSBC, clearb)
-GEN_VEXT_VADC_VVM(vsbc_vvm_h, uint16_t, H2, DO_VSBC, clearh)
-GEN_VEXT_VADC_VVM(vsbc_vvm_w, uint32_t, H4, DO_VSBC, clearl)
-GEN_VEXT_VADC_VVM(vsbc_vvm_d, uint64_t, H8, DO_VSBC, clearq)
+GEN_VEXT_VADC_VVM(vsbc_vvm_b, uint8_t,  H1, DO_VSBC)
+GEN_VEXT_VADC_VVM(vsbc_vvm_h, uint16_t, H2, DO_VSBC)
+GEN_VEXT_VADC_VVM(vsbc_vvm_w, uint32_t, H4, DO_VSBC)
+GEN_VEXT_VADC_VVM(vsbc_vvm_d, uint64_t, H8, DO_VSBC)
=20
-#define GEN_VEXT_VADC_VXM(NAME, ETYPE, H, DO_OP, CLEAR_FN)              =
 \
+#define GEN_VEXT_VADC_VXM(NAME, ETYPE, H, DO_OP)                        =
 \
 void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,       =
 \
                   CPURISCVState *env, uint32_t desc)                    =
 \
 {                                                                       =
 \
     uint32_t vl =3D env->vl;                                            =
   \
-    uint32_t esz =3D sizeof(ETYPE);                                     =
   \
-    uint32_t vlmax =3D vext_maxsz(desc) / esz;                          =
   \
     uint32_t i;                                                         =
 \
                                                                         =
 \
     for (i =3D 0; i < vl; i++) {                                        =
   \
@@ -1214,18 +1124,17 @@ void HELPER(NAME)(void *vd, void *v0, target_ulon=
g s1, void *vs2,        \
                                                                         =
 \
         *((ETYPE *)vd + H(i)) =3D DO_OP(s2, (ETYPE)(target_long)s1, carr=
y);\
     }                                                                   =
 \
-    CLEAR_FN(vd, vl, vl * esz, vlmax * esz);                            =
 \
 }
=20
-GEN_VEXT_VADC_VXM(vadc_vxm_b, uint8_t,  H1, DO_VADC, clearb)
-GEN_VEXT_VADC_VXM(vadc_vxm_h, uint16_t, H2, DO_VADC, clearh)
-GEN_VEXT_VADC_VXM(vadc_vxm_w, uint32_t, H4, DO_VADC, clearl)
-GEN_VEXT_VADC_VXM(vadc_vxm_d, uint64_t, H8, DO_VADC, clearq)
+GEN_VEXT_VADC_VXM(vadc_vxm_b, uint8_t,  H1, DO_VADC)
+GEN_VEXT_VADC_VXM(vadc_vxm_h, uint16_t, H2, DO_VADC)
+GEN_VEXT_VADC_VXM(vadc_vxm_w, uint32_t, H4, DO_VADC)
+GEN_VEXT_VADC_VXM(vadc_vxm_d, uint64_t, H8, DO_VADC)
=20
-GEN_VEXT_VADC_VXM(vsbc_vxm_b, uint8_t,  H1, DO_VSBC, clearb)
-GEN_VEXT_VADC_VXM(vsbc_vxm_h, uint16_t, H2, DO_VSBC, clearh)
-GEN_VEXT_VADC_VXM(vsbc_vxm_w, uint32_t, H4, DO_VSBC, clearl)
-GEN_VEXT_VADC_VXM(vsbc_vxm_d, uint64_t, H8, DO_VSBC, clearq)
+GEN_VEXT_VADC_VXM(vsbc_vxm_b, uint8_t,  H1, DO_VSBC)
+GEN_VEXT_VADC_VXM(vsbc_vxm_h, uint16_t, H2, DO_VSBC)
+GEN_VEXT_VADC_VXM(vsbc_vxm_w, uint32_t, H4, DO_VSBC)
+GEN_VEXT_VADC_VXM(vsbc_vxm_d, uint64_t, H8, DO_VSBC)
=20
 #define DO_MADC(N, M, C) (C ? (__typeof(N))(N + M + 1) <=3D N :         =
  \
                           (__typeof(N))(N + M) < N)
@@ -1304,18 +1213,18 @@ RVVCALL(OPIVV2, vxor_vv_b, OP_SSS_B, H1, H1, H1, =
DO_XOR)
 RVVCALL(OPIVV2, vxor_vv_h, OP_SSS_H, H2, H2, H2, DO_XOR)
 RVVCALL(OPIVV2, vxor_vv_w, OP_SSS_W, H4, H4, H4, DO_XOR)
 RVVCALL(OPIVV2, vxor_vv_d, OP_SSS_D, H8, H8, H8, DO_XOR)
-GEN_VEXT_VV(vand_vv_b, 1, 1, clearb)
-GEN_VEXT_VV(vand_vv_h, 2, 2, clearh)
-GEN_VEXT_VV(vand_vv_w, 4, 4, clearl)
-GEN_VEXT_VV(vand_vv_d, 8, 8, clearq)
-GEN_VEXT_VV(vor_vv_b, 1, 1, clearb)
-GEN_VEXT_VV(vor_vv_h, 2, 2, clearh)
-GEN_VEXT_VV(vor_vv_w, 4, 4, clearl)
-GEN_VEXT_VV(vor_vv_d, 8, 8, clearq)
-GEN_VEXT_VV(vxor_vv_b, 1, 1, clearb)
-GEN_VEXT_VV(vxor_vv_h, 2, 2, clearh)
-GEN_VEXT_VV(vxor_vv_w, 4, 4, clearl)
-GEN_VEXT_VV(vxor_vv_d, 8, 8, clearq)
+GEN_VEXT_VV(vand_vv_b, 1, 1)
+GEN_VEXT_VV(vand_vv_h, 2, 2)
+GEN_VEXT_VV(vand_vv_w, 4, 4)
+GEN_VEXT_VV(vand_vv_d, 8, 8)
+GEN_VEXT_VV(vor_vv_b, 1, 1)
+GEN_VEXT_VV(vor_vv_h, 2, 2)
+GEN_VEXT_VV(vor_vv_w, 4, 4)
+GEN_VEXT_VV(vor_vv_d, 8, 8)
+GEN_VEXT_VV(vxor_vv_b, 1, 1)
+GEN_VEXT_VV(vxor_vv_h, 2, 2)
+GEN_VEXT_VV(vxor_vv_w, 4, 4)
+GEN_VEXT_VV(vxor_vv_d, 8, 8)
=20
 RVVCALL(OPIVX2, vand_vx_b, OP_SSS_B, H1, H1, DO_AND)
 RVVCALL(OPIVX2, vand_vx_h, OP_SSS_H, H2, H2, DO_AND)
@@ -1329,32 +1238,30 @@ RVVCALL(OPIVX2, vxor_vx_b, OP_SSS_B, H1, H1, DO_X=
OR)
 RVVCALL(OPIVX2, vxor_vx_h, OP_SSS_H, H2, H2, DO_XOR)
 RVVCALL(OPIVX2, vxor_vx_w, OP_SSS_W, H4, H4, DO_XOR)
 RVVCALL(OPIVX2, vxor_vx_d, OP_SSS_D, H8, H8, DO_XOR)
-GEN_VEXT_VX(vand_vx_b, 1, 1, clearb)
-GEN_VEXT_VX(vand_vx_h, 2, 2, clearh)
-GEN_VEXT_VX(vand_vx_w, 4, 4, clearl)
-GEN_VEXT_VX(vand_vx_d, 8, 8, clearq)
-GEN_VEXT_VX(vor_vx_b, 1, 1, clearb)
-GEN_VEXT_VX(vor_vx_h, 2, 2, clearh)
-GEN_VEXT_VX(vor_vx_w, 4, 4, clearl)
-GEN_VEXT_VX(vor_vx_d, 8, 8, clearq)
-GEN_VEXT_VX(vxor_vx_b, 1, 1, clearb)
-GEN_VEXT_VX(vxor_vx_h, 2, 2, clearh)
-GEN_VEXT_VX(vxor_vx_w, 4, 4, clearl)
-GEN_VEXT_VX(vxor_vx_d, 8, 8, clearq)
+GEN_VEXT_VX(vand_vx_b, 1, 1)
+GEN_VEXT_VX(vand_vx_h, 2, 2)
+GEN_VEXT_VX(vand_vx_w, 4, 4)
+GEN_VEXT_VX(vand_vx_d, 8, 8)
+GEN_VEXT_VX(vor_vx_b, 1, 1)
+GEN_VEXT_VX(vor_vx_h, 2, 2)
+GEN_VEXT_VX(vor_vx_w, 4, 4)
+GEN_VEXT_VX(vor_vx_d, 8, 8)
+GEN_VEXT_VX(vxor_vx_b, 1, 1)
+GEN_VEXT_VX(vxor_vx_h, 2, 2)
+GEN_VEXT_VX(vxor_vx_w, 4, 4)
+GEN_VEXT_VX(vxor_vx_d, 8, 8)
=20
 /* Vector Single-Width Bit Shift Instructions */
 #define DO_SLL(N, M)  (N << (M))
 #define DO_SRL(N, M)  (N >> (M))
=20
 /* generate the helpers for shift instructions with two vector operators=
 */
-#define GEN_VEXT_SHIFT_VV(NAME, TS1, TS2, HS1, HS2, OP, MASK, CLEAR_FN) =
  \
+#define GEN_VEXT_SHIFT_VV(NAME, TS1, TS2, HS1, HS2, OP, MASK)           =
  \
 void HELPER(NAME)(void *vd, void *v0, void *vs1,                        =
  \
                   void *vs2, CPURISCVState *env, uint32_t desc)         =
  \
 {                                                                       =
  \
     uint32_t vm =3D vext_vm(desc);                                      =
    \
     uint32_t vl =3D env->vl;                                            =
    \
-    uint32_t esz =3D sizeof(TS1);                                       =
    \
-    uint32_t vlmax =3D vext_maxsz(desc) / esz;                          =
    \
     uint32_t i;                                                         =
  \
                                                                         =
  \
     for (i =3D 0; i < vl; i++) {                                        =
    \
@@ -1365,73 +1272,69 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, =
                         \
         TS2 s2 =3D *((TS2 *)vs2 + HS2(i));                              =
    \
         *((TS1 *)vd + HS1(i)) =3D OP(s2, s1 & MASK);                    =
    \
     }                                                                   =
  \
-    CLEAR_FN(vd, vl, vl * esz, vlmax * esz);                            =
  \
 }
=20
-GEN_VEXT_SHIFT_VV(vsll_vv_b, uint8_t,  uint8_t, H1, H1, DO_SLL, 0x7, cle=
arb)
-GEN_VEXT_SHIFT_VV(vsll_vv_h, uint16_t, uint16_t, H2, H2, DO_SLL, 0xf, cl=
earh)
-GEN_VEXT_SHIFT_VV(vsll_vv_w, uint32_t, uint32_t, H4, H4, DO_SLL, 0x1f, c=
learl)
-GEN_VEXT_SHIFT_VV(vsll_vv_d, uint64_t, uint64_t, H8, H8, DO_SLL, 0x3f, c=
learq)
+GEN_VEXT_SHIFT_VV(vsll_vv_b, uint8_t,  uint8_t, H1, H1, DO_SLL, 0x7)
+GEN_VEXT_SHIFT_VV(vsll_vv_h, uint16_t, uint16_t, H2, H2, DO_SLL, 0xf)
+GEN_VEXT_SHIFT_VV(vsll_vv_w, uint32_t, uint32_t, H4, H4, DO_SLL, 0x1f)
+GEN_VEXT_SHIFT_VV(vsll_vv_d, uint64_t, uint64_t, H8, H8, DO_SLL, 0x3f)
=20
-GEN_VEXT_SHIFT_VV(vsrl_vv_b, uint8_t, uint8_t, H1, H1, DO_SRL, 0x7, clea=
rb)
-GEN_VEXT_SHIFT_VV(vsrl_vv_h, uint16_t, uint16_t, H2, H2, DO_SRL, 0xf, cl=
earh)
-GEN_VEXT_SHIFT_VV(vsrl_vv_w, uint32_t, uint32_t, H4, H4, DO_SRL, 0x1f, c=
learl)
-GEN_VEXT_SHIFT_VV(vsrl_vv_d, uint64_t, uint64_t, H8, H8, DO_SRL, 0x3f, c=
learq)
+GEN_VEXT_SHIFT_VV(vsrl_vv_b, uint8_t, uint8_t, H1, H1, DO_SRL, 0x7)
+GEN_VEXT_SHIFT_VV(vsrl_vv_h, uint16_t, uint16_t, H2, H2, DO_SRL, 0xf)
+GEN_VEXT_SHIFT_VV(vsrl_vv_w, uint32_t, uint32_t, H4, H4, DO_SRL, 0x1f)
+GEN_VEXT_SHIFT_VV(vsrl_vv_d, uint64_t, uint64_t, H8, H8, DO_SRL, 0x3f)
=20
-GEN_VEXT_SHIFT_VV(vsra_vv_b, uint8_t,  int8_t, H1, H1, DO_SRL, 0x7, clea=
rb)
-GEN_VEXT_SHIFT_VV(vsra_vv_h, uint16_t, int16_t, H2, H2, DO_SRL, 0xf, cle=
arh)
-GEN_VEXT_SHIFT_VV(vsra_vv_w, uint32_t, int32_t, H4, H4, DO_SRL, 0x1f, cl=
earl)
-GEN_VEXT_SHIFT_VV(vsra_vv_d, uint64_t, int64_t, H8, H8, DO_SRL, 0x3f, cl=
earq)
+GEN_VEXT_SHIFT_VV(vsra_vv_b, uint8_t,  int8_t, H1, H1, DO_SRL, 0x7)
+GEN_VEXT_SHIFT_VV(vsra_vv_h, uint16_t, int16_t, H2, H2, DO_SRL, 0xf)
+GEN_VEXT_SHIFT_VV(vsra_vv_w, uint32_t, int32_t, H4, H4, DO_SRL, 0x1f)
+GEN_VEXT_SHIFT_VV(vsra_vv_d, uint64_t, int64_t, H8, H8, DO_SRL, 0x3f)
=20
 /* generate the helpers for shift instructions with one vector and one s=
calar */
-#define GEN_VEXT_SHIFT_VX(NAME, TD, TS2, HD, HS2, OP, MASK, CLEAR_FN) \
-void HELPER(NAME)(void *vd, void *v0, target_ulong s1,                \
-        void *vs2, CPURISCVState *env, uint32_t desc)                 \
-{                                                                     \
-    uint32_t vm =3D vext_vm(desc);                                      =
\
-    uint32_t vl =3D env->vl;                                            =
\
-    uint32_t esz =3D sizeof(TD);                                        =
\
-    uint32_t vlmax =3D vext_maxsz(desc) / esz;                          =
\
-    uint32_t i;                                                       \
-                                                                      \
-    for (i =3D 0; i < vl; i++) {                                        =
\
-        if (!vm && !vext_elem_mask(v0, i)) {                          \
-            continue;                                                 \
-        }                                                             \
-        TS2 s2 =3D *((TS2 *)vs2 + HS2(i));                              =
\
-        *((TD *)vd + HD(i)) =3D OP(s2, s1 & MASK);                      =
\
-    }                                                                 \
-    CLEAR_FN(vd, vl, vl * esz, vlmax * esz);                          \
-}
-
-GEN_VEXT_SHIFT_VX(vsll_vx_b, uint8_t, int8_t, H1, H1, DO_SLL, 0x7, clear=
b)
-GEN_VEXT_SHIFT_VX(vsll_vx_h, uint16_t, int16_t, H2, H2, DO_SLL, 0xf, cle=
arh)
-GEN_VEXT_SHIFT_VX(vsll_vx_w, uint32_t, int32_t, H4, H4, DO_SLL, 0x1f, cl=
earl)
-GEN_VEXT_SHIFT_VX(vsll_vx_d, uint64_t, int64_t, H8, H8, DO_SLL, 0x3f, cl=
earq)
-
-GEN_VEXT_SHIFT_VX(vsrl_vx_b, uint8_t, uint8_t, H1, H1, DO_SRL, 0x7, clea=
rb)
-GEN_VEXT_SHIFT_VX(vsrl_vx_h, uint16_t, uint16_t, H2, H2, DO_SRL, 0xf, cl=
earh)
-GEN_VEXT_SHIFT_VX(vsrl_vx_w, uint32_t, uint32_t, H4, H4, DO_SRL, 0x1f, c=
learl)
-GEN_VEXT_SHIFT_VX(vsrl_vx_d, uint64_t, uint64_t, H8, H8, DO_SRL, 0x3f, c=
learq)
-
-GEN_VEXT_SHIFT_VX(vsra_vx_b, int8_t, int8_t, H1, H1, DO_SRL, 0x7, clearb=
)
-GEN_VEXT_SHIFT_VX(vsra_vx_h, int16_t, int16_t, H2, H2, DO_SRL, 0xf, clea=
rh)
-GEN_VEXT_SHIFT_VX(vsra_vx_w, int32_t, int32_t, H4, H4, DO_SRL, 0x1f, cle=
arl)
-GEN_VEXT_SHIFT_VX(vsra_vx_d, int64_t, int64_t, H8, H8, DO_SRL, 0x3f, cle=
arq)
+#define GEN_VEXT_SHIFT_VX(NAME, TD, TS2, HD, HS2, OP, MASK) \
+void HELPER(NAME)(void *vd, void *v0, target_ulong s1,      \
+        void *vs2, CPURISCVState *env, uint32_t desc)       \
+{                                                           \
+    uint32_t vm =3D vext_vm(desc);                            \
+    uint32_t vl =3D env->vl;                                  \
+    uint32_t i;                                             \
+                                                            \
+    for (i =3D 0; i < vl; i++) {                              \
+        if (!vm && !vext_elem_mask(v0, i)) {                \
+            continue;                                       \
+        }                                                   \
+        TS2 s2 =3D *((TS2 *)vs2 + HS2(i));                    \
+        *((TD *)vd + HD(i)) =3D OP(s2, s1 & MASK);            \
+    }                                                       \
+}
+
+GEN_VEXT_SHIFT_VX(vsll_vx_b, uint8_t, int8_t, H1, H1, DO_SLL, 0x7)
+GEN_VEXT_SHIFT_VX(vsll_vx_h, uint16_t, int16_t, H2, H2, DO_SLL, 0xf)
+GEN_VEXT_SHIFT_VX(vsll_vx_w, uint32_t, int32_t, H4, H4, DO_SLL, 0x1f)
+GEN_VEXT_SHIFT_VX(vsll_vx_d, uint64_t, int64_t, H8, H8, DO_SLL, 0x3f)
+
+GEN_VEXT_SHIFT_VX(vsrl_vx_b, uint8_t, uint8_t, H1, H1, DO_SRL, 0x7)
+GEN_VEXT_SHIFT_VX(vsrl_vx_h, uint16_t, uint16_t, H2, H2, DO_SRL, 0xf)
+GEN_VEXT_SHIFT_VX(vsrl_vx_w, uint32_t, uint32_t, H4, H4, DO_SRL, 0x1f)
+GEN_VEXT_SHIFT_VX(vsrl_vx_d, uint64_t, uint64_t, H8, H8, DO_SRL, 0x3f)
+
+GEN_VEXT_SHIFT_VX(vsra_vx_b, int8_t, int8_t, H1, H1, DO_SRL, 0x7)
+GEN_VEXT_SHIFT_VX(vsra_vx_h, int16_t, int16_t, H2, H2, DO_SRL, 0xf)
+GEN_VEXT_SHIFT_VX(vsra_vx_w, int32_t, int32_t, H4, H4, DO_SRL, 0x1f)
+GEN_VEXT_SHIFT_VX(vsra_vx_d, int64_t, int64_t, H8, H8, DO_SRL, 0x3f)
=20
 /* Vector Narrowing Integer Right Shift Instructions */
-GEN_VEXT_SHIFT_VV(vnsrl_vv_b, uint8_t,  uint16_t, H1, H2, DO_SRL, 0xf, c=
learb)
-GEN_VEXT_SHIFT_VV(vnsrl_vv_h, uint16_t, uint32_t, H2, H4, DO_SRL, 0x1f, =
clearh)
-GEN_VEXT_SHIFT_VV(vnsrl_vv_w, uint32_t, uint64_t, H4, H8, DO_SRL, 0x3f, =
clearl)
-GEN_VEXT_SHIFT_VV(vnsra_vv_b, uint8_t,  int16_t, H1, H2, DO_SRL, 0xf, cl=
earb)
-GEN_VEXT_SHIFT_VV(vnsra_vv_h, uint16_t, int32_t, H2, H4, DO_SRL, 0x1f, c=
learh)
-GEN_VEXT_SHIFT_VV(vnsra_vv_w, uint32_t, int64_t, H4, H8, DO_SRL, 0x3f, c=
learl)
-GEN_VEXT_SHIFT_VX(vnsrl_vx_b, uint8_t, uint16_t, H1, H2, DO_SRL, 0xf, cl=
earb)
-GEN_VEXT_SHIFT_VX(vnsrl_vx_h, uint16_t, uint32_t, H2, H4, DO_SRL, 0x1f, =
clearh)
-GEN_VEXT_SHIFT_VX(vnsrl_vx_w, uint32_t, uint64_t, H4, H8, DO_SRL, 0x3f, =
clearl)
-GEN_VEXT_SHIFT_VX(vnsra_vx_b, int8_t, int16_t, H1, H2, DO_SRL, 0xf, clea=
rb)
-GEN_VEXT_SHIFT_VX(vnsra_vx_h, int16_t, int32_t, H2, H4, DO_SRL, 0x1f, cl=
earh)
-GEN_VEXT_SHIFT_VX(vnsra_vx_w, int32_t, int64_t, H4, H8, DO_SRL, 0x3f, cl=
earl)
+GEN_VEXT_SHIFT_VV(vnsrl_vv_b, uint8_t,  uint16_t, H1, H2, DO_SRL, 0xf)
+GEN_VEXT_SHIFT_VV(vnsrl_vv_h, uint16_t, uint32_t, H2, H4, DO_SRL, 0x1f)
+GEN_VEXT_SHIFT_VV(vnsrl_vv_w, uint32_t, uint64_t, H4, H8, DO_SRL, 0x3f)
+GEN_VEXT_SHIFT_VV(vnsra_vv_b, uint8_t,  int16_t, H1, H2, DO_SRL, 0xf)
+GEN_VEXT_SHIFT_VV(vnsra_vv_h, uint16_t, int32_t, H2, H4, DO_SRL, 0x1f)
+GEN_VEXT_SHIFT_VV(vnsra_vv_w, uint32_t, int64_t, H4, H8, DO_SRL, 0x3f)
+GEN_VEXT_SHIFT_VX(vnsrl_vx_b, uint8_t, uint16_t, H1, H2, DO_SRL, 0xf)
+GEN_VEXT_SHIFT_VX(vnsrl_vx_h, uint16_t, uint32_t, H2, H4, DO_SRL, 0x1f)
+GEN_VEXT_SHIFT_VX(vnsrl_vx_w, uint32_t, uint64_t, H4, H8, DO_SRL, 0x3f)
+GEN_VEXT_SHIFT_VX(vnsra_vx_b, int8_t, int16_t, H1, H2, DO_SRL, 0xf)
+GEN_VEXT_SHIFT_VX(vnsra_vx_h, int16_t, int32_t, H2, H4, DO_SRL, 0x1f)
+GEN_VEXT_SHIFT_VX(vnsra_vx_w, int32_t, int64_t, H4, H8, DO_SRL, 0x3f)
=20
 /* Vector Integer Comparison Instructions */
 #define DO_MSEQ(N, M) (N =3D=3D M)
@@ -1571,22 +1474,22 @@ RVVCALL(OPIVV2, vmax_vv_b, OP_SSS_B, H1, H1, H1, =
DO_MAX)
 RVVCALL(OPIVV2, vmax_vv_h, OP_SSS_H, H2, H2, H2, DO_MAX)
 RVVCALL(OPIVV2, vmax_vv_w, OP_SSS_W, H4, H4, H4, DO_MAX)
 RVVCALL(OPIVV2, vmax_vv_d, OP_SSS_D, H8, H8, H8, DO_MAX)
-GEN_VEXT_VV(vminu_vv_b, 1, 1, clearb)
-GEN_VEXT_VV(vminu_vv_h, 2, 2, clearh)
-GEN_VEXT_VV(vminu_vv_w, 4, 4, clearl)
-GEN_VEXT_VV(vminu_vv_d, 8, 8, clearq)
-GEN_VEXT_VV(vmin_vv_b, 1, 1, clearb)
-GEN_VEXT_VV(vmin_vv_h, 2, 2, clearh)
-GEN_VEXT_VV(vmin_vv_w, 4, 4, clearl)
-GEN_VEXT_VV(vmin_vv_d, 8, 8, clearq)
-GEN_VEXT_VV(vmaxu_vv_b, 1, 1, clearb)
-GEN_VEXT_VV(vmaxu_vv_h, 2, 2, clearh)
-GEN_VEXT_VV(vmaxu_vv_w, 4, 4, clearl)
-GEN_VEXT_VV(vmaxu_vv_d, 8, 8, clearq)
-GEN_VEXT_VV(vmax_vv_b, 1, 1, clearb)
-GEN_VEXT_VV(vmax_vv_h, 2, 2, clearh)
-GEN_VEXT_VV(vmax_vv_w, 4, 4, clearl)
-GEN_VEXT_VV(vmax_vv_d, 8, 8, clearq)
+GEN_VEXT_VV(vminu_vv_b, 1, 1)
+GEN_VEXT_VV(vminu_vv_h, 2, 2)
+GEN_VEXT_VV(vminu_vv_w, 4, 4)
+GEN_VEXT_VV(vminu_vv_d, 8, 8)
+GEN_VEXT_VV(vmin_vv_b, 1, 1)
+GEN_VEXT_VV(vmin_vv_h, 2, 2)
+GEN_VEXT_VV(vmin_vv_w, 4, 4)
+GEN_VEXT_VV(vmin_vv_d, 8, 8)
+GEN_VEXT_VV(vmaxu_vv_b, 1, 1)
+GEN_VEXT_VV(vmaxu_vv_h, 2, 2)
+GEN_VEXT_VV(vmaxu_vv_w, 4, 4)
+GEN_VEXT_VV(vmaxu_vv_d, 8, 8)
+GEN_VEXT_VV(vmax_vv_b, 1, 1)
+GEN_VEXT_VV(vmax_vv_h, 2, 2)
+GEN_VEXT_VV(vmax_vv_w, 4, 4)
+GEN_VEXT_VV(vmax_vv_d, 8, 8)
=20
 RVVCALL(OPIVX2, vminu_vx_b, OP_UUU_B, H1, H1, DO_MIN)
 RVVCALL(OPIVX2, vminu_vx_h, OP_UUU_H, H2, H2, DO_MIN)
@@ -1604,22 +1507,22 @@ RVVCALL(OPIVX2, vmax_vx_b, OP_SSS_B, H1, H1, DO_M=
AX)
 RVVCALL(OPIVX2, vmax_vx_h, OP_SSS_H, H2, H2, DO_MAX)
 RVVCALL(OPIVX2, vmax_vx_w, OP_SSS_W, H4, H4, DO_MAX)
 RVVCALL(OPIVX2, vmax_vx_d, OP_SSS_D, H8, H8, DO_MAX)
-GEN_VEXT_VX(vminu_vx_b, 1, 1, clearb)
-GEN_VEXT_VX(vminu_vx_h, 2, 2, clearh)
-GEN_VEXT_VX(vminu_vx_w, 4, 4, clearl)
-GEN_VEXT_VX(vminu_vx_d, 8, 8, clearq)
-GEN_VEXT_VX(vmin_vx_b, 1, 1, clearb)
-GEN_VEXT_VX(vmin_vx_h, 2, 2, clearh)
-GEN_VEXT_VX(vmin_vx_w, 4, 4, clearl)
-GEN_VEXT_VX(vmin_vx_d, 8, 8, clearq)
-GEN_VEXT_VX(vmaxu_vx_b, 1, 1, clearb)
-GEN_VEXT_VX(vmaxu_vx_h, 2, 2, clearh)
-GEN_VEXT_VX(vmaxu_vx_w, 4, 4, clearl)
-GEN_VEXT_VX(vmaxu_vx_d, 8, 8,  clearq)
-GEN_VEXT_VX(vmax_vx_b, 1, 1, clearb)
-GEN_VEXT_VX(vmax_vx_h, 2, 2, clearh)
-GEN_VEXT_VX(vmax_vx_w, 4, 4, clearl)
-GEN_VEXT_VX(vmax_vx_d, 8, 8, clearq)
+GEN_VEXT_VX(vminu_vx_b, 1, 1)
+GEN_VEXT_VX(vminu_vx_h, 2, 2)
+GEN_VEXT_VX(vminu_vx_w, 4, 4)
+GEN_VEXT_VX(vminu_vx_d, 8, 8)
+GEN_VEXT_VX(vmin_vx_b, 1, 1)
+GEN_VEXT_VX(vmin_vx_h, 2, 2)
+GEN_VEXT_VX(vmin_vx_w, 4, 4)
+GEN_VEXT_VX(vmin_vx_d, 8, 8)
+GEN_VEXT_VX(vmaxu_vx_b, 1, 1)
+GEN_VEXT_VX(vmaxu_vx_h, 2, 2)
+GEN_VEXT_VX(vmaxu_vx_w, 4, 4)
+GEN_VEXT_VX(vmaxu_vx_d, 8, 8)
+GEN_VEXT_VX(vmax_vx_b, 1, 1)
+GEN_VEXT_VX(vmax_vx_h, 2, 2)
+GEN_VEXT_VX(vmax_vx_w, 4, 4)
+GEN_VEXT_VX(vmax_vx_d, 8, 8)
=20
 /* Vector Single-Width Integer Multiply Instructions */
 #define DO_MUL(N, M) (N * M)
@@ -1627,10 +1530,10 @@ RVVCALL(OPIVV2, vmul_vv_b, OP_SSS_B, H1, H1, H1, =
DO_MUL)
 RVVCALL(OPIVV2, vmul_vv_h, OP_SSS_H, H2, H2, H2, DO_MUL)
 RVVCALL(OPIVV2, vmul_vv_w, OP_SSS_W, H4, H4, H4, DO_MUL)
 RVVCALL(OPIVV2, vmul_vv_d, OP_SSS_D, H8, H8, H8, DO_MUL)
-GEN_VEXT_VV(vmul_vv_b, 1, 1, clearb)
-GEN_VEXT_VV(vmul_vv_h, 2, 2, clearh)
-GEN_VEXT_VV(vmul_vv_w, 4, 4, clearl)
-GEN_VEXT_VV(vmul_vv_d, 8, 8, clearq)
+GEN_VEXT_VV(vmul_vv_b, 1, 1)
+GEN_VEXT_VV(vmul_vv_h, 2, 2)
+GEN_VEXT_VV(vmul_vv_w, 4, 4)
+GEN_VEXT_VV(vmul_vv_d, 8, 8)
=20
 static int8_t do_mulh_b(int8_t s2, int8_t s1)
 {
@@ -1734,18 +1637,18 @@ RVVCALL(OPIVV2, vmulhsu_vv_b, OP_SUS_B, H1, H1, H=
1, do_mulhsu_b)
 RVVCALL(OPIVV2, vmulhsu_vv_h, OP_SUS_H, H2, H2, H2, do_mulhsu_h)
 RVVCALL(OPIVV2, vmulhsu_vv_w, OP_SUS_W, H4, H4, H4, do_mulhsu_w)
 RVVCALL(OPIVV2, vmulhsu_vv_d, OP_SUS_D, H8, H8, H8, do_mulhsu_d)
-GEN_VEXT_VV(vmulh_vv_b, 1, 1, clearb)
-GEN_VEXT_VV(vmulh_vv_h, 2, 2, clearh)
-GEN_VEXT_VV(vmulh_vv_w, 4, 4, clearl)
-GEN_VEXT_VV(vmulh_vv_d, 8, 8, clearq)
-GEN_VEXT_VV(vmulhu_vv_b, 1, 1, clearb)
-GEN_VEXT_VV(vmulhu_vv_h, 2, 2, clearh)
-GEN_VEXT_VV(vmulhu_vv_w, 4, 4, clearl)
-GEN_VEXT_VV(vmulhu_vv_d, 8, 8, clearq)
-GEN_VEXT_VV(vmulhsu_vv_b, 1, 1, clearb)
-GEN_VEXT_VV(vmulhsu_vv_h, 2, 2, clearh)
-GEN_VEXT_VV(vmulhsu_vv_w, 4, 4, clearl)
-GEN_VEXT_VV(vmulhsu_vv_d, 8, 8, clearq)
+GEN_VEXT_VV(vmulh_vv_b, 1, 1)
+GEN_VEXT_VV(vmulh_vv_h, 2, 2)
+GEN_VEXT_VV(vmulh_vv_w, 4, 4)
+GEN_VEXT_VV(vmulh_vv_d, 8, 8)
+GEN_VEXT_VV(vmulhu_vv_b, 1, 1)
+GEN_VEXT_VV(vmulhu_vv_h, 2, 2)
+GEN_VEXT_VV(vmulhu_vv_w, 4, 4)
+GEN_VEXT_VV(vmulhu_vv_d, 8, 8)
+GEN_VEXT_VV(vmulhsu_vv_b, 1, 1)
+GEN_VEXT_VV(vmulhsu_vv_h, 2, 2)
+GEN_VEXT_VV(vmulhsu_vv_w, 4, 4)
+GEN_VEXT_VV(vmulhsu_vv_d, 8, 8)
=20
 RVVCALL(OPIVX2, vmul_vx_b, OP_SSS_B, H1, H1, DO_MUL)
 RVVCALL(OPIVX2, vmul_vx_h, OP_SSS_H, H2, H2, DO_MUL)
@@ -1763,22 +1666,22 @@ RVVCALL(OPIVX2, vmulhsu_vx_b, OP_SUS_B, H1, H1, d=
o_mulhsu_b)
 RVVCALL(OPIVX2, vmulhsu_vx_h, OP_SUS_H, H2, H2, do_mulhsu_h)
 RVVCALL(OPIVX2, vmulhsu_vx_w, OP_SUS_W, H4, H4, do_mulhsu_w)
 RVVCALL(OPIVX2, vmulhsu_vx_d, OP_SUS_D, H8, H8, do_mulhsu_d)
-GEN_VEXT_VX(vmul_vx_b, 1, 1, clearb)
-GEN_VEXT_VX(vmul_vx_h, 2, 2, clearh)
-GEN_VEXT_VX(vmul_vx_w, 4, 4, clearl)
-GEN_VEXT_VX(vmul_vx_d, 8, 8, clearq)
-GEN_VEXT_VX(vmulh_vx_b, 1, 1, clearb)
-GEN_VEXT_VX(vmulh_vx_h, 2, 2, clearh)
-GEN_VEXT_VX(vmulh_vx_w, 4, 4, clearl)
-GEN_VEXT_VX(vmulh_vx_d, 8, 8, clearq)
-GEN_VEXT_VX(vmulhu_vx_b, 1, 1, clearb)
-GEN_VEXT_VX(vmulhu_vx_h, 2, 2, clearh)
-GEN_VEXT_VX(vmulhu_vx_w, 4, 4, clearl)
-GEN_VEXT_VX(vmulhu_vx_d, 8, 8, clearq)
-GEN_VEXT_VX(vmulhsu_vx_b, 1, 1, clearb)
-GEN_VEXT_VX(vmulhsu_vx_h, 2, 2, clearh)
-GEN_VEXT_VX(vmulhsu_vx_w, 4, 4, clearl)
-GEN_VEXT_VX(vmulhsu_vx_d, 8, 8, clearq)
+GEN_VEXT_VX(vmul_vx_b, 1, 1)
+GEN_VEXT_VX(vmul_vx_h, 2, 2)
+GEN_VEXT_VX(vmul_vx_w, 4, 4)
+GEN_VEXT_VX(vmul_vx_d, 8, 8)
+GEN_VEXT_VX(vmulh_vx_b, 1, 1)
+GEN_VEXT_VX(vmulh_vx_h, 2, 2)
+GEN_VEXT_VX(vmulh_vx_w, 4, 4)
+GEN_VEXT_VX(vmulh_vx_d, 8, 8)
+GEN_VEXT_VX(vmulhu_vx_b, 1, 1)
+GEN_VEXT_VX(vmulhu_vx_h, 2, 2)
+GEN_VEXT_VX(vmulhu_vx_w, 4, 4)
+GEN_VEXT_VX(vmulhu_vx_d, 8, 8)
+GEN_VEXT_VX(vmulhsu_vx_b, 1, 1)
+GEN_VEXT_VX(vmulhsu_vx_h, 2, 2)
+GEN_VEXT_VX(vmulhsu_vx_w, 4, 4)
+GEN_VEXT_VX(vmulhsu_vx_d, 8, 8)
=20
 /* Vector Integer Divide Instructions */
 #define DO_DIVU(N, M) (unlikely(M =3D=3D 0) ? (__typeof(N))(-1) : N / M)
@@ -1804,22 +1707,22 @@ RVVCALL(OPIVV2, vrem_vv_b, OP_SSS_B, H1, H1, H1, =
DO_REM)
 RVVCALL(OPIVV2, vrem_vv_h, OP_SSS_H, H2, H2, H2, DO_REM)
 RVVCALL(OPIVV2, vrem_vv_w, OP_SSS_W, H4, H4, H4, DO_REM)
 RVVCALL(OPIVV2, vrem_vv_d, OP_SSS_D, H8, H8, H8, DO_REM)
-GEN_VEXT_VV(vdivu_vv_b, 1, 1, clearb)
-GEN_VEXT_VV(vdivu_vv_h, 2, 2, clearh)
-GEN_VEXT_VV(vdivu_vv_w, 4, 4, clearl)
-GEN_VEXT_VV(vdivu_vv_d, 8, 8, clearq)
-GEN_VEXT_VV(vdiv_vv_b, 1, 1, clearb)
-GEN_VEXT_VV(vdiv_vv_h, 2, 2, clearh)
-GEN_VEXT_VV(vdiv_vv_w, 4, 4, clearl)
-GEN_VEXT_VV(vdiv_vv_d, 8, 8, clearq)
-GEN_VEXT_VV(vremu_vv_b, 1, 1, clearb)
-GEN_VEXT_VV(vremu_vv_h, 2, 2, clearh)
-GEN_VEXT_VV(vremu_vv_w, 4, 4, clearl)
-GEN_VEXT_VV(vremu_vv_d, 8, 8, clearq)
-GEN_VEXT_VV(vrem_vv_b, 1, 1, clearb)
-GEN_VEXT_VV(vrem_vv_h, 2, 2, clearh)
-GEN_VEXT_VV(vrem_vv_w, 4, 4, clearl)
-GEN_VEXT_VV(vrem_vv_d, 8, 8, clearq)
+GEN_VEXT_VV(vdivu_vv_b, 1, 1)
+GEN_VEXT_VV(vdivu_vv_h, 2, 2)
+GEN_VEXT_VV(vdivu_vv_w, 4, 4)
+GEN_VEXT_VV(vdivu_vv_d, 8, 8)
+GEN_VEXT_VV(vdiv_vv_b, 1, 1)
+GEN_VEXT_VV(vdiv_vv_h, 2, 2)
+GEN_VEXT_VV(vdiv_vv_w, 4, 4)
+GEN_VEXT_VV(vdiv_vv_d, 8, 8)
+GEN_VEXT_VV(vremu_vv_b, 1, 1)
+GEN_VEXT_VV(vremu_vv_h, 2, 2)
+GEN_VEXT_VV(vremu_vv_w, 4, 4)
+GEN_VEXT_VV(vremu_vv_d, 8, 8)
+GEN_VEXT_VV(vrem_vv_b, 1, 1)
+GEN_VEXT_VV(vrem_vv_h, 2, 2)
+GEN_VEXT_VV(vrem_vv_w, 4, 4)
+GEN_VEXT_VV(vrem_vv_d, 8, 8)
=20
 RVVCALL(OPIVX2, vdivu_vx_b, OP_UUU_B, H1, H1, DO_DIVU)
 RVVCALL(OPIVX2, vdivu_vx_h, OP_UUU_H, H2, H2, DO_DIVU)
@@ -1837,22 +1740,22 @@ RVVCALL(OPIVX2, vrem_vx_b, OP_SSS_B, H1, H1, DO_R=
EM)
 RVVCALL(OPIVX2, vrem_vx_h, OP_SSS_H, H2, H2, DO_REM)
 RVVCALL(OPIVX2, vrem_vx_w, OP_SSS_W, H4, H4, DO_REM)
 RVVCALL(OPIVX2, vrem_vx_d, OP_SSS_D, H8, H8, DO_REM)
-GEN_VEXT_VX(vdivu_vx_b, 1, 1, clearb)
-GEN_VEXT_VX(vdivu_vx_h, 2, 2, clearh)
-GEN_VEXT_VX(vdivu_vx_w, 4, 4, clearl)
-GEN_VEXT_VX(vdivu_vx_d, 8, 8, clearq)
-GEN_VEXT_VX(vdiv_vx_b, 1, 1, clearb)
-GEN_VEXT_VX(vdiv_vx_h, 2, 2, clearh)
-GEN_VEXT_VX(vdiv_vx_w, 4, 4, clearl)
-GEN_VEXT_VX(vdiv_vx_d, 8, 8, clearq)
-GEN_VEXT_VX(vremu_vx_b, 1, 1, clearb)
-GEN_VEXT_VX(vremu_vx_h, 2, 2, clearh)
-GEN_VEXT_VX(vremu_vx_w, 4, 4, clearl)
-GEN_VEXT_VX(vremu_vx_d, 8, 8, clearq)
-GEN_VEXT_VX(vrem_vx_b, 1, 1, clearb)
-GEN_VEXT_VX(vrem_vx_h, 2, 2, clearh)
-GEN_VEXT_VX(vrem_vx_w, 4, 4, clearl)
-GEN_VEXT_VX(vrem_vx_d, 8, 8, clearq)
+GEN_VEXT_VX(vdivu_vx_b, 1, 1)
+GEN_VEXT_VX(vdivu_vx_h, 2, 2)
+GEN_VEXT_VX(vdivu_vx_w, 4, 4)
+GEN_VEXT_VX(vdivu_vx_d, 8, 8)
+GEN_VEXT_VX(vdiv_vx_b, 1, 1)
+GEN_VEXT_VX(vdiv_vx_h, 2, 2)
+GEN_VEXT_VX(vdiv_vx_w, 4, 4)
+GEN_VEXT_VX(vdiv_vx_d, 8, 8)
+GEN_VEXT_VX(vremu_vx_b, 1, 1)
+GEN_VEXT_VX(vremu_vx_h, 2, 2)
+GEN_VEXT_VX(vremu_vx_w, 4, 4)
+GEN_VEXT_VX(vremu_vx_d, 8, 8)
+GEN_VEXT_VX(vrem_vx_b, 1, 1)
+GEN_VEXT_VX(vrem_vx_h, 2, 2)
+GEN_VEXT_VX(vrem_vx_w, 4, 4)
+GEN_VEXT_VX(vrem_vx_d, 8, 8)
=20
 /* Vector Widening Integer Multiply Instructions */
 RVVCALL(OPIVV2, vwmul_vv_b, WOP_SSS_B, H2, H1, H1, DO_MUL)
@@ -1864,15 +1767,15 @@ RVVCALL(OPIVV2, vwmulu_vv_w, WOP_UUU_W, H8, H4, H=
4, DO_MUL)
 RVVCALL(OPIVV2, vwmulsu_vv_b, WOP_SUS_B, H2, H1, H1, DO_MUL)
 RVVCALL(OPIVV2, vwmulsu_vv_h, WOP_SUS_H, H4, H2, H2, DO_MUL)
 RVVCALL(OPIVV2, vwmulsu_vv_w, WOP_SUS_W, H8, H4, H4, DO_MUL)
-GEN_VEXT_VV(vwmul_vv_b, 1, 2, clearh)
-GEN_VEXT_VV(vwmul_vv_h, 2, 4, clearl)
-GEN_VEXT_VV(vwmul_vv_w, 4, 8, clearq)
-GEN_VEXT_VV(vwmulu_vv_b, 1, 2, clearh)
-GEN_VEXT_VV(vwmulu_vv_h, 2, 4, clearl)
-GEN_VEXT_VV(vwmulu_vv_w, 4, 8, clearq)
-GEN_VEXT_VV(vwmulsu_vv_b, 1, 2, clearh)
-GEN_VEXT_VV(vwmulsu_vv_h, 2, 4, clearl)
-GEN_VEXT_VV(vwmulsu_vv_w, 4, 8, clearq)
+GEN_VEXT_VV(vwmul_vv_b, 1, 2)
+GEN_VEXT_VV(vwmul_vv_h, 2, 4)
+GEN_VEXT_VV(vwmul_vv_w, 4, 8)
+GEN_VEXT_VV(vwmulu_vv_b, 1, 2)
+GEN_VEXT_VV(vwmulu_vv_h, 2, 4)
+GEN_VEXT_VV(vwmulu_vv_w, 4, 8)
+GEN_VEXT_VV(vwmulsu_vv_b, 1, 2)
+GEN_VEXT_VV(vwmulsu_vv_h, 2, 4)
+GEN_VEXT_VV(vwmulsu_vv_w, 4, 8)
=20
 RVVCALL(OPIVX2, vwmul_vx_b, WOP_SSS_B, H2, H1, DO_MUL)
 RVVCALL(OPIVX2, vwmul_vx_h, WOP_SSS_H, H4, H2, DO_MUL)
@@ -1883,15 +1786,15 @@ RVVCALL(OPIVX2, vwmulu_vx_w, WOP_UUU_W, H8, H4, D=
O_MUL)
 RVVCALL(OPIVX2, vwmulsu_vx_b, WOP_SUS_B, H2, H1, DO_MUL)
 RVVCALL(OPIVX2, vwmulsu_vx_h, WOP_SUS_H, H4, H2, DO_MUL)
 RVVCALL(OPIVX2, vwmulsu_vx_w, WOP_SUS_W, H8, H4, DO_MUL)
-GEN_VEXT_VX(vwmul_vx_b, 1, 2, clearh)
-GEN_VEXT_VX(vwmul_vx_h, 2, 4, clearl)
-GEN_VEXT_VX(vwmul_vx_w, 4, 8, clearq)
-GEN_VEXT_VX(vwmulu_vx_b, 1, 2, clearh)
-GEN_VEXT_VX(vwmulu_vx_h, 2, 4, clearl)
-GEN_VEXT_VX(vwmulu_vx_w, 4, 8, clearq)
-GEN_VEXT_VX(vwmulsu_vx_b, 1, 2, clearh)
-GEN_VEXT_VX(vwmulsu_vx_h, 2, 4, clearl)
-GEN_VEXT_VX(vwmulsu_vx_w, 4, 8, clearq)
+GEN_VEXT_VX(vwmul_vx_b, 1, 2)
+GEN_VEXT_VX(vwmul_vx_h, 2, 4)
+GEN_VEXT_VX(vwmul_vx_w, 4, 8)
+GEN_VEXT_VX(vwmulu_vx_b, 1, 2)
+GEN_VEXT_VX(vwmulu_vx_h, 2, 4)
+GEN_VEXT_VX(vwmulu_vx_w, 4, 8)
+GEN_VEXT_VX(vwmulsu_vx_b, 1, 2)
+GEN_VEXT_VX(vwmulsu_vx_h, 2, 4)
+GEN_VEXT_VX(vwmulsu_vx_w, 4, 8)
=20
 /* Vector Single-Width Integer Multiply-Add Instructions */
 #define OPIVV3(NAME, TD, T1, T2, TX1, TX2, HD, HS1, HS2, OP)   \
@@ -1923,22 +1826,22 @@ RVVCALL(OPIVV3, vnmsub_vv_b, OP_SSS_B, H1, H1, H1=
, DO_NMSUB)
 RVVCALL(OPIVV3, vnmsub_vv_h, OP_SSS_H, H2, H2, H2, DO_NMSUB)
 RVVCALL(OPIVV3, vnmsub_vv_w, OP_SSS_W, H4, H4, H4, DO_NMSUB)
 RVVCALL(OPIVV3, vnmsub_vv_d, OP_SSS_D, H8, H8, H8, DO_NMSUB)
-GEN_VEXT_VV(vmacc_vv_b, 1, 1, clearb)
-GEN_VEXT_VV(vmacc_vv_h, 2, 2, clearh)
-GEN_VEXT_VV(vmacc_vv_w, 4, 4, clearl)
-GEN_VEXT_VV(vmacc_vv_d, 8, 8, clearq)
-GEN_VEXT_VV(vnmsac_vv_b, 1, 1, clearb)
-GEN_VEXT_VV(vnmsac_vv_h, 2, 2, clearh)
-GEN_VEXT_VV(vnmsac_vv_w, 4, 4, clearl)
-GEN_VEXT_VV(vnmsac_vv_d, 8, 8, clearq)
-GEN_VEXT_VV(vmadd_vv_b, 1, 1, clearb)
-GEN_VEXT_VV(vmadd_vv_h, 2, 2, clearh)
-GEN_VEXT_VV(vmadd_vv_w, 4, 4, clearl)
-GEN_VEXT_VV(vmadd_vv_d, 8, 8, clearq)
-GEN_VEXT_VV(vnmsub_vv_b, 1, 1, clearb)
-GEN_VEXT_VV(vnmsub_vv_h, 2, 2, clearh)
-GEN_VEXT_VV(vnmsub_vv_w, 4, 4, clearl)
-GEN_VEXT_VV(vnmsub_vv_d, 8, 8, clearq)
+GEN_VEXT_VV(vmacc_vv_b, 1, 1)
+GEN_VEXT_VV(vmacc_vv_h, 2, 2)
+GEN_VEXT_VV(vmacc_vv_w, 4, 4)
+GEN_VEXT_VV(vmacc_vv_d, 8, 8)
+GEN_VEXT_VV(vnmsac_vv_b, 1, 1)
+GEN_VEXT_VV(vnmsac_vv_h, 2, 2)
+GEN_VEXT_VV(vnmsac_vv_w, 4, 4)
+GEN_VEXT_VV(vnmsac_vv_d, 8, 8)
+GEN_VEXT_VV(vmadd_vv_b, 1, 1)
+GEN_VEXT_VV(vmadd_vv_h, 2, 2)
+GEN_VEXT_VV(vmadd_vv_w, 4, 4)
+GEN_VEXT_VV(vmadd_vv_d, 8, 8)
+GEN_VEXT_VV(vnmsub_vv_b, 1, 1)
+GEN_VEXT_VV(vnmsub_vv_h, 2, 2)
+GEN_VEXT_VV(vnmsub_vv_w, 4, 4)
+GEN_VEXT_VV(vnmsub_vv_d, 8, 8)
=20
 #define OPIVX3(NAME, TD, T1, T2, TX1, TX2, HD, HS2, OP)             \
 static void do_##NAME(void *vd, target_long s1, void *vs2, int i)   \
@@ -1964,22 +1867,22 @@ RVVCALL(OPIVX3, vnmsub_vx_b, OP_SSS_B, H1, H1, DO=
_NMSUB)
 RVVCALL(OPIVX3, vnmsub_vx_h, OP_SSS_H, H2, H2, DO_NMSUB)
 RVVCALL(OPIVX3, vnmsub_vx_w, OP_SSS_W, H4, H4, DO_NMSUB)
 RVVCALL(OPIVX3, vnmsub_vx_d, OP_SSS_D, H8, H8, DO_NMSUB)
-GEN_VEXT_VX(vmacc_vx_b, 1, 1, clearb)
-GEN_VEXT_VX(vmacc_vx_h, 2, 2, clearh)
-GEN_VEXT_VX(vmacc_vx_w, 4, 4, clearl)
-GEN_VEXT_VX(vmacc_vx_d, 8, 8, clearq)
-GEN_VEXT_VX(vnmsac_vx_b, 1, 1, clearb)
-GEN_VEXT_VX(vnmsac_vx_h, 2, 2, clearh)
-GEN_VEXT_VX(vnmsac_vx_w, 4, 4, clearl)
-GEN_VEXT_VX(vnmsac_vx_d, 8, 8, clearq)
-GEN_VEXT_VX(vmadd_vx_b, 1, 1, clearb)
-GEN_VEXT_VX(vmadd_vx_h, 2, 2, clearh)
-GEN_VEXT_VX(vmadd_vx_w, 4, 4, clearl)
-GEN_VEXT_VX(vmadd_vx_d, 8, 8, clearq)
-GEN_VEXT_VX(vnmsub_vx_b, 1, 1, clearb)
-GEN_VEXT_VX(vnmsub_vx_h, 2, 2, clearh)
-GEN_VEXT_VX(vnmsub_vx_w, 4, 4, clearl)
-GEN_VEXT_VX(vnmsub_vx_d, 8, 8, clearq)
+GEN_VEXT_VX(vmacc_vx_b, 1, 1)
+GEN_VEXT_VX(vmacc_vx_h, 2, 2)
+GEN_VEXT_VX(vmacc_vx_w, 4, 4)
+GEN_VEXT_VX(vmacc_vx_d, 8, 8)
+GEN_VEXT_VX(vnmsac_vx_b, 1, 1)
+GEN_VEXT_VX(vnmsac_vx_h, 2, 2)
+GEN_VEXT_VX(vnmsac_vx_w, 4, 4)
+GEN_VEXT_VX(vnmsac_vx_d, 8, 8)
+GEN_VEXT_VX(vmadd_vx_b, 1, 1)
+GEN_VEXT_VX(vmadd_vx_h, 2, 2)
+GEN_VEXT_VX(vmadd_vx_w, 4, 4)
+GEN_VEXT_VX(vmadd_vx_d, 8, 8)
+GEN_VEXT_VX(vnmsub_vx_b, 1, 1)
+GEN_VEXT_VX(vnmsub_vx_h, 2, 2)
+GEN_VEXT_VX(vnmsub_vx_w, 4, 4)
+GEN_VEXT_VX(vnmsub_vx_d, 8, 8)
=20
 /* Vector Widening Integer Multiply-Add Instructions */
 RVVCALL(OPIVV3, vwmaccu_vv_b, WOP_UUU_B, H2, H1, H1, DO_MACC)
@@ -1991,15 +1894,15 @@ RVVCALL(OPIVV3, vwmacc_vv_w, WOP_SSS_W, H8, H4, H=
4, DO_MACC)
 RVVCALL(OPIVV3, vwmaccsu_vv_b, WOP_SSU_B, H2, H1, H1, DO_MACC)
 RVVCALL(OPIVV3, vwmaccsu_vv_h, WOP_SSU_H, H4, H2, H2, DO_MACC)
 RVVCALL(OPIVV3, vwmaccsu_vv_w, WOP_SSU_W, H8, H4, H4, DO_MACC)
-GEN_VEXT_VV(vwmaccu_vv_b, 1, 2, clearh)
-GEN_VEXT_VV(vwmaccu_vv_h, 2, 4, clearl)
-GEN_VEXT_VV(vwmaccu_vv_w, 4, 8, clearq)
-GEN_VEXT_VV(vwmacc_vv_b, 1, 2, clearh)
-GEN_VEXT_VV(vwmacc_vv_h, 2, 4, clearl)
-GEN_VEXT_VV(vwmacc_vv_w, 4, 8, clearq)
-GEN_VEXT_VV(vwmaccsu_vv_b, 1, 2, clearh)
-GEN_VEXT_VV(vwmaccsu_vv_h, 2, 4, clearl)
-GEN_VEXT_VV(vwmaccsu_vv_w, 4, 8, clearq)
+GEN_VEXT_VV(vwmaccu_vv_b, 1, 2)
+GEN_VEXT_VV(vwmaccu_vv_h, 2, 4)
+GEN_VEXT_VV(vwmaccu_vv_w, 4, 8)
+GEN_VEXT_VV(vwmacc_vv_b, 1, 2)
+GEN_VEXT_VV(vwmacc_vv_h, 2, 4)
+GEN_VEXT_VV(vwmacc_vv_w, 4, 8)
+GEN_VEXT_VV(vwmaccsu_vv_b, 1, 2)
+GEN_VEXT_VV(vwmaccsu_vv_h, 2, 4)
+GEN_VEXT_VV(vwmaccsu_vv_w, 4, 8)
=20
 RVVCALL(OPIVX3, vwmaccu_vx_b, WOP_UUU_B, H2, H1, DO_MACC)
 RVVCALL(OPIVX3, vwmaccu_vx_h, WOP_UUU_H, H4, H2, DO_MACC)
@@ -2013,89 +1916,78 @@ RVVCALL(OPIVX3, vwmaccsu_vx_w, WOP_SSU_W, H8, H4,=
 DO_MACC)
 RVVCALL(OPIVX3, vwmaccus_vx_b, WOP_SUS_B, H2, H1, DO_MACC)
 RVVCALL(OPIVX3, vwmaccus_vx_h, WOP_SUS_H, H4, H2, DO_MACC)
 RVVCALL(OPIVX3, vwmaccus_vx_w, WOP_SUS_W, H8, H4, DO_MACC)
-GEN_VEXT_VX(vwmaccu_vx_b, 1, 2, clearh)
-GEN_VEXT_VX(vwmaccu_vx_h, 2, 4, clearl)
-GEN_VEXT_VX(vwmaccu_vx_w, 4, 8, clearq)
-GEN_VEXT_VX(vwmacc_vx_b, 1, 2, clearh)
-GEN_VEXT_VX(vwmacc_vx_h, 2, 4, clearl)
-GEN_VEXT_VX(vwmacc_vx_w, 4, 8, clearq)
-GEN_VEXT_VX(vwmaccsu_vx_b, 1, 2, clearh)
-GEN_VEXT_VX(vwmaccsu_vx_h, 2, 4, clearl)
-GEN_VEXT_VX(vwmaccsu_vx_w, 4, 8, clearq)
-GEN_VEXT_VX(vwmaccus_vx_b, 1, 2, clearh)
-GEN_VEXT_VX(vwmaccus_vx_h, 2, 4, clearl)
-GEN_VEXT_VX(vwmaccus_vx_w, 4, 8, clearq)
+GEN_VEXT_VX(vwmaccu_vx_b, 1, 2)
+GEN_VEXT_VX(vwmaccu_vx_h, 2, 4)
+GEN_VEXT_VX(vwmaccu_vx_w, 4, 8)
+GEN_VEXT_VX(vwmacc_vx_b, 1, 2)
+GEN_VEXT_VX(vwmacc_vx_h, 2, 4)
+GEN_VEXT_VX(vwmacc_vx_w, 4, 8)
+GEN_VEXT_VX(vwmaccsu_vx_b, 1, 2)
+GEN_VEXT_VX(vwmaccsu_vx_h, 2, 4)
+GEN_VEXT_VX(vwmaccsu_vx_w, 4, 8)
+GEN_VEXT_VX(vwmaccus_vx_b, 1, 2)
+GEN_VEXT_VX(vwmaccus_vx_h, 2, 4)
+GEN_VEXT_VX(vwmaccus_vx_w, 4, 8)
=20
 /* Vector Integer Merge and Move Instructions */
-#define GEN_VEXT_VMV_VV(NAME, ETYPE, H, CLEAR_FN)                    \
+#define GEN_VEXT_VMV_VV(NAME, ETYPE, H)                              \
 void HELPER(NAME)(void *vd, void *vs1, CPURISCVState *env,           \
                   uint32_t desc)                                     \
 {                                                                    \
     uint32_t vl =3D env->vl;                                           \
-    uint32_t esz =3D sizeof(ETYPE);                                    \
-    uint32_t vlmax =3D vext_maxsz(desc) / esz;                         \
     uint32_t i;                                                      \
                                                                      \
     for (i =3D 0; i < vl; i++) {                                       \
         ETYPE s1 =3D *((ETYPE *)vs1 + H(i));                           \
         *((ETYPE *)vd + H(i)) =3D s1;                                  \
     }                                                                \
-    CLEAR_FN(vd, vl, vl * esz, vlmax * esz);                         \
 }
=20
-GEN_VEXT_VMV_VV(vmv_v_v_b, int8_t,  H1, clearb)
-GEN_VEXT_VMV_VV(vmv_v_v_h, int16_t, H2, clearh)
-GEN_VEXT_VMV_VV(vmv_v_v_w, int32_t, H4, clearl)
-GEN_VEXT_VMV_VV(vmv_v_v_d, int64_t, H8, clearq)
+GEN_VEXT_VMV_VV(vmv_v_v_b, int8_t,  H1)
+GEN_VEXT_VMV_VV(vmv_v_v_h, int16_t, H2)
+GEN_VEXT_VMV_VV(vmv_v_v_w, int32_t, H4)
+GEN_VEXT_VMV_VV(vmv_v_v_d, int64_t, H8)
=20
-#define GEN_VEXT_VMV_VX(NAME, ETYPE, H, CLEAR_FN)                    \
+#define GEN_VEXT_VMV_VX(NAME, ETYPE, H)                              \
 void HELPER(NAME)(void *vd, uint64_t s1, CPURISCVState *env,         \
                   uint32_t desc)                                     \
 {                                                                    \
     uint32_t vl =3D env->vl;                                           \
-    uint32_t esz =3D sizeof(ETYPE);                                    \
-    uint32_t vlmax =3D vext_maxsz(desc) / esz;                         \
     uint32_t i;                                                      \
                                                                      \
     for (i =3D 0; i < vl; i++) {                                       \
         *((ETYPE *)vd + H(i)) =3D (ETYPE)s1;                           \
     }                                                                \
-    CLEAR_FN(vd, vl, vl * esz, vlmax * esz);                         \
 }
=20
-GEN_VEXT_VMV_VX(vmv_v_x_b, int8_t,  H1, clearb)
-GEN_VEXT_VMV_VX(vmv_v_x_h, int16_t, H2, clearh)
-GEN_VEXT_VMV_VX(vmv_v_x_w, int32_t, H4, clearl)
-GEN_VEXT_VMV_VX(vmv_v_x_d, int64_t, H8, clearq)
+GEN_VEXT_VMV_VX(vmv_v_x_b, int8_t,  H1)
+GEN_VEXT_VMV_VX(vmv_v_x_h, int16_t, H2)
+GEN_VEXT_VMV_VX(vmv_v_x_w, int32_t, H4)
+GEN_VEXT_VMV_VX(vmv_v_x_d, int64_t, H8)
=20
-#define GEN_VEXT_VMERGE_VV(NAME, ETYPE, H, CLEAR_FN)                 \
+#define GEN_VEXT_VMERGE_VV(NAME, ETYPE, H)                           \
 void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,          \
                   CPURISCVState *env, uint32_t desc)                 \
 {                                                                    \
     uint32_t vl =3D env->vl;                                           \
-    uint32_t esz =3D sizeof(ETYPE);                                    \
-    uint32_t vlmax =3D vext_maxsz(desc) / esz;                         \
     uint32_t i;                                                      \
                                                                      \
     for (i =3D 0; i < vl; i++) {                                       \
         ETYPE *vt =3D (!vext_elem_mask(v0, i) ? vs2 : vs1);            \
         *((ETYPE *)vd + H(i)) =3D *(vt + H(i));                        \
     }                                                                \
-    CLEAR_FN(vd, vl, vl * esz, vlmax * esz);                         \
 }
=20
-GEN_VEXT_VMERGE_VV(vmerge_vvm_b, int8_t,  H1, clearb)
-GEN_VEXT_VMERGE_VV(vmerge_vvm_h, int16_t, H2, clearh)
-GEN_VEXT_VMERGE_VV(vmerge_vvm_w, int32_t, H4, clearl)
-GEN_VEXT_VMERGE_VV(vmerge_vvm_d, int64_t, H8, clearq)
+GEN_VEXT_VMERGE_VV(vmerge_vvm_b, int8_t,  H1)
+GEN_VEXT_VMERGE_VV(vmerge_vvm_h, int16_t, H2)
+GEN_VEXT_VMERGE_VV(vmerge_vvm_w, int32_t, H4)
+GEN_VEXT_VMERGE_VV(vmerge_vvm_d, int64_t, H8)
=20
-#define GEN_VEXT_VMERGE_VX(NAME, ETYPE, H, CLEAR_FN)                 \
+#define GEN_VEXT_VMERGE_VX(NAME, ETYPE, H)                           \
 void HELPER(NAME)(void *vd, void *v0, target_ulong s1,               \
                   void *vs2, CPURISCVState *env, uint32_t desc)      \
 {                                                                    \
     uint32_t vl =3D env->vl;                                           \
-    uint32_t esz =3D sizeof(ETYPE);                                    \
-    uint32_t vlmax =3D vext_maxsz(desc) / esz;                         \
     uint32_t i;                                                      \
                                                                      \
     for (i =3D 0; i < vl; i++) {                                       \
@@ -2104,13 +1996,12 @@ void HELPER(NAME)(void *vd, void *v0, target_ulon=
g s1,               \
                    (ETYPE)(target_long)s1);                          \
         *((ETYPE *)vd + H(i)) =3D d;                                   \
     }                                                                \
-    CLEAR_FN(vd, vl, vl * esz, vlmax * esz);                         \
 }
=20
-GEN_VEXT_VMERGE_VX(vmerge_vxm_b, int8_t,  H1, clearb)
-GEN_VEXT_VMERGE_VX(vmerge_vxm_h, int16_t, H2, clearh)
-GEN_VEXT_VMERGE_VX(vmerge_vxm_w, int32_t, H4, clearl)
-GEN_VEXT_VMERGE_VX(vmerge_vxm_d, int64_t, H8, clearq)
+GEN_VEXT_VMERGE_VX(vmerge_vxm_b, int8_t,  H1)
+GEN_VEXT_VMERGE_VX(vmerge_vxm_h, int16_t, H2)
+GEN_VEXT_VMERGE_VX(vmerge_vxm_w, int32_t, H4)
+GEN_VEXT_VMERGE_VX(vmerge_vxm_d, int64_t, H8)
=20
 /*
  *** Vector Fixed-Point Arithmetic Instructions
@@ -2153,9 +2044,8 @@ static inline void
 vext_vv_rm_2(void *vd, void *v0, void *vs1, void *vs2,
              CPURISCVState *env,
              uint32_t desc, uint32_t esz, uint32_t dsz,
-             opivv2_rm_fn *fn, clear_fn *clearfn)
+             opivv2_rm_fn *fn)
 {
-    uint32_t vlmax =3D vext_maxsz(desc) / esz;
     uint32_t vm =3D vext_vm(desc);
     uint32_t vl =3D env->vl;
=20
@@ -2177,17 +2067,15 @@ vext_vv_rm_2(void *vd, void *v0, void *vs1, void =
*vs2,
                      env, vl, vm, 3, fn);
         break;
     }
-
-    clearfn(vd, vl, vl * dsz,  vlmax * dsz);
 }
=20
 /* generate helpers for fixed point instructions with OPIVV format */
-#define GEN_VEXT_VV_RM(NAME, ESZ, DSZ, CLEAR_FN)                \
+#define GEN_VEXT_VV_RM(NAME, ESZ, DSZ)                          \
 void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,     \
                   CPURISCVState *env, uint32_t desc)            \
 {                                                               \
     vext_vv_rm_2(vd, v0, vs1, vs2, env, desc, ESZ, DSZ,         \
-                 do_##NAME, CLEAR_FN);                          \
+                 do_##NAME);                                    \
 }
=20
 static inline uint8_t saddu8(CPURISCVState *env, int vxrm, uint8_t a, ui=
nt8_t b)
@@ -2237,10 +2125,10 @@ RVVCALL(OPIVV2_RM, vsaddu_vv_b, OP_UUU_B, H1, H1,=
 H1, saddu8)
 RVVCALL(OPIVV2_RM, vsaddu_vv_h, OP_UUU_H, H2, H2, H2, saddu16)
 RVVCALL(OPIVV2_RM, vsaddu_vv_w, OP_UUU_W, H4, H4, H4, saddu32)
 RVVCALL(OPIVV2_RM, vsaddu_vv_d, OP_UUU_D, H8, H8, H8, saddu64)
-GEN_VEXT_VV_RM(vsaddu_vv_b, 1, 1, clearb)
-GEN_VEXT_VV_RM(vsaddu_vv_h, 2, 2, clearh)
-GEN_VEXT_VV_RM(vsaddu_vv_w, 4, 4, clearl)
-GEN_VEXT_VV_RM(vsaddu_vv_d, 8, 8, clearq)
+GEN_VEXT_VV_RM(vsaddu_vv_b, 1, 1)
+GEN_VEXT_VV_RM(vsaddu_vv_h, 2, 2)
+GEN_VEXT_VV_RM(vsaddu_vv_w, 4, 4)
+GEN_VEXT_VV_RM(vsaddu_vv_d, 8, 8)
=20
 typedef void opivx2_rm_fn(void *vd, target_long s1, void *vs2, int i,
                           CPURISCVState *env, int vxrm);
@@ -2272,9 +2160,8 @@ static inline void
 vext_vx_rm_2(void *vd, void *v0, target_long s1, void *vs2,
              CPURISCVState *env,
              uint32_t desc, uint32_t esz, uint32_t dsz,
-             opivx2_rm_fn *fn, clear_fn *clearfn)
+             opivx2_rm_fn *fn)
 {
-    uint32_t vlmax =3D vext_maxsz(desc) / esz;
     uint32_t vm =3D vext_vm(desc);
     uint32_t vl =3D env->vl;
=20
@@ -2296,27 +2183,25 @@ vext_vx_rm_2(void *vd, void *v0, target_long s1, =
void *vs2,
                      env, vl, vm, 3, fn);
         break;
     }
-
-    clearfn(vd, vl, vl * dsz,  vlmax * dsz);
 }
=20
 /* generate helpers for fixed point instructions with OPIVX format */
-#define GEN_VEXT_VX_RM(NAME, ESZ, DSZ, CLEAR_FN)          \
+#define GEN_VEXT_VX_RM(NAME, ESZ, DSZ)                    \
 void HELPER(NAME)(void *vd, void *v0, target_ulong s1,    \
         void *vs2, CPURISCVState *env, uint32_t desc)     \
 {                                                         \
     vext_vx_rm_2(vd, v0, s1, vs2, env, desc, ESZ, DSZ,    \
-                 do_##NAME, CLEAR_FN);                    \
+                 do_##NAME);                              \
 }
=20
 RVVCALL(OPIVX2_RM, vsaddu_vx_b, OP_UUU_B, H1, H1, saddu8)
 RVVCALL(OPIVX2_RM, vsaddu_vx_h, OP_UUU_H, H2, H2, saddu16)
 RVVCALL(OPIVX2_RM, vsaddu_vx_w, OP_UUU_W, H4, H4, saddu32)
 RVVCALL(OPIVX2_RM, vsaddu_vx_d, OP_UUU_D, H8, H8, saddu64)
-GEN_VEXT_VX_RM(vsaddu_vx_b, 1, 1, clearb)
-GEN_VEXT_VX_RM(vsaddu_vx_h, 2, 2, clearh)
-GEN_VEXT_VX_RM(vsaddu_vx_w, 4, 4, clearl)
-GEN_VEXT_VX_RM(vsaddu_vx_d, 8, 8, clearq)
+GEN_VEXT_VX_RM(vsaddu_vx_b, 1, 1)
+GEN_VEXT_VX_RM(vsaddu_vx_h, 2, 2)
+GEN_VEXT_VX_RM(vsaddu_vx_w, 4, 4)
+GEN_VEXT_VX_RM(vsaddu_vx_d, 8, 8)
=20
 static inline int8_t sadd8(CPURISCVState *env, int vxrm, int8_t a, int8_=
t b)
 {
@@ -2362,19 +2247,19 @@ RVVCALL(OPIVV2_RM, vsadd_vv_b, OP_SSS_B, H1, H1, =
H1, sadd8)
 RVVCALL(OPIVV2_RM, vsadd_vv_h, OP_SSS_H, H2, H2, H2, sadd16)
 RVVCALL(OPIVV2_RM, vsadd_vv_w, OP_SSS_W, H4, H4, H4, sadd32)
 RVVCALL(OPIVV2_RM, vsadd_vv_d, OP_SSS_D, H8, H8, H8, sadd64)
-GEN_VEXT_VV_RM(vsadd_vv_b, 1, 1, clearb)
-GEN_VEXT_VV_RM(vsadd_vv_h, 2, 2, clearh)
-GEN_VEXT_VV_RM(vsadd_vv_w, 4, 4, clearl)
-GEN_VEXT_VV_RM(vsadd_vv_d, 8, 8, clearq)
+GEN_VEXT_VV_RM(vsadd_vv_b, 1, 1)
+GEN_VEXT_VV_RM(vsadd_vv_h, 2, 2)
+GEN_VEXT_VV_RM(vsadd_vv_w, 4, 4)
+GEN_VEXT_VV_RM(vsadd_vv_d, 8, 8)
=20
 RVVCALL(OPIVX2_RM, vsadd_vx_b, OP_SSS_B, H1, H1, sadd8)
 RVVCALL(OPIVX2_RM, vsadd_vx_h, OP_SSS_H, H2, H2, sadd16)
 RVVCALL(OPIVX2_RM, vsadd_vx_w, OP_SSS_W, H4, H4, sadd32)
 RVVCALL(OPIVX2_RM, vsadd_vx_d, OP_SSS_D, H8, H8, sadd64)
-GEN_VEXT_VX_RM(vsadd_vx_b, 1, 1, clearb)
-GEN_VEXT_VX_RM(vsadd_vx_h, 2, 2, clearh)
-GEN_VEXT_VX_RM(vsadd_vx_w, 4, 4, clearl)
-GEN_VEXT_VX_RM(vsadd_vx_d, 8, 8, clearq)
+GEN_VEXT_VX_RM(vsadd_vx_b, 1, 1)
+GEN_VEXT_VX_RM(vsadd_vx_h, 2, 2)
+GEN_VEXT_VX_RM(vsadd_vx_w, 4, 4)
+GEN_VEXT_VX_RM(vsadd_vx_d, 8, 8)
=20
 static inline uint8_t ssubu8(CPURISCVState *env, int vxrm, uint8_t a, ui=
nt8_t b)
 {
@@ -2423,19 +2308,19 @@ RVVCALL(OPIVV2_RM, vssubu_vv_b, OP_UUU_B, H1, H1,=
 H1, ssubu8)
 RVVCALL(OPIVV2_RM, vssubu_vv_h, OP_UUU_H, H2, H2, H2, ssubu16)
 RVVCALL(OPIVV2_RM, vssubu_vv_w, OP_UUU_W, H4, H4, H4, ssubu32)
 RVVCALL(OPIVV2_RM, vssubu_vv_d, OP_UUU_D, H8, H8, H8, ssubu64)
-GEN_VEXT_VV_RM(vssubu_vv_b, 1, 1, clearb)
-GEN_VEXT_VV_RM(vssubu_vv_h, 2, 2, clearh)
-GEN_VEXT_VV_RM(vssubu_vv_w, 4, 4, clearl)
-GEN_VEXT_VV_RM(vssubu_vv_d, 8, 8, clearq)
+GEN_VEXT_VV_RM(vssubu_vv_b, 1, 1)
+GEN_VEXT_VV_RM(vssubu_vv_h, 2, 2)
+GEN_VEXT_VV_RM(vssubu_vv_w, 4, 4)
+GEN_VEXT_VV_RM(vssubu_vv_d, 8, 8)
=20
 RVVCALL(OPIVX2_RM, vssubu_vx_b, OP_UUU_B, H1, H1, ssubu8)
 RVVCALL(OPIVX2_RM, vssubu_vx_h, OP_UUU_H, H2, H2, ssubu16)
 RVVCALL(OPIVX2_RM, vssubu_vx_w, OP_UUU_W, H4, H4, ssubu32)
 RVVCALL(OPIVX2_RM, vssubu_vx_d, OP_UUU_D, H8, H8, ssubu64)
-GEN_VEXT_VX_RM(vssubu_vx_b, 1, 1, clearb)
-GEN_VEXT_VX_RM(vssubu_vx_h, 2, 2, clearh)
-GEN_VEXT_VX_RM(vssubu_vx_w, 4, 4, clearl)
-GEN_VEXT_VX_RM(vssubu_vx_d, 8, 8, clearq)
+GEN_VEXT_VX_RM(vssubu_vx_b, 1, 1)
+GEN_VEXT_VX_RM(vssubu_vx_h, 2, 2)
+GEN_VEXT_VX_RM(vssubu_vx_w, 4, 4)
+GEN_VEXT_VX_RM(vssubu_vx_d, 8, 8)
=20
 static inline int8_t ssub8(CPURISCVState *env, int vxrm, int8_t a, int8_=
t b)
 {
@@ -2481,19 +2366,19 @@ RVVCALL(OPIVV2_RM, vssub_vv_b, OP_SSS_B, H1, H1, =
H1, ssub8)
 RVVCALL(OPIVV2_RM, vssub_vv_h, OP_SSS_H, H2, H2, H2, ssub16)
 RVVCALL(OPIVV2_RM, vssub_vv_w, OP_SSS_W, H4, H4, H4, ssub32)
 RVVCALL(OPIVV2_RM, vssub_vv_d, OP_SSS_D, H8, H8, H8, ssub64)
-GEN_VEXT_VV_RM(vssub_vv_b, 1, 1, clearb)
-GEN_VEXT_VV_RM(vssub_vv_h, 2, 2, clearh)
-GEN_VEXT_VV_RM(vssub_vv_w, 4, 4, clearl)
-GEN_VEXT_VV_RM(vssub_vv_d, 8, 8, clearq)
+GEN_VEXT_VV_RM(vssub_vv_b, 1, 1)
+GEN_VEXT_VV_RM(vssub_vv_h, 2, 2)
+GEN_VEXT_VV_RM(vssub_vv_w, 4, 4)
+GEN_VEXT_VV_RM(vssub_vv_d, 8, 8)
=20
 RVVCALL(OPIVX2_RM, vssub_vx_b, OP_SSS_B, H1, H1, ssub8)
 RVVCALL(OPIVX2_RM, vssub_vx_h, OP_SSS_H, H2, H2, ssub16)
 RVVCALL(OPIVX2_RM, vssub_vx_w, OP_SSS_W, H4, H4, ssub32)
 RVVCALL(OPIVX2_RM, vssub_vx_d, OP_SSS_D, H8, H8, ssub64)
-GEN_VEXT_VX_RM(vssub_vx_b, 1, 1, clearb)
-GEN_VEXT_VX_RM(vssub_vx_h, 2, 2, clearh)
-GEN_VEXT_VX_RM(vssub_vx_w, 4, 4, clearl)
-GEN_VEXT_VX_RM(vssub_vx_d, 8, 8, clearq)
+GEN_VEXT_VX_RM(vssub_vx_b, 1, 1)
+GEN_VEXT_VX_RM(vssub_vx_h, 2, 2)
+GEN_VEXT_VX_RM(vssub_vx_w, 4, 4)
+GEN_VEXT_VX_RM(vssub_vx_d, 8, 8)
=20
 /* Vector Single-Width Averaging Add and Subtract */
 static inline uint8_t get_round(int vxrm, uint64_t v, uint8_t shift)
@@ -2545,19 +2430,19 @@ RVVCALL(OPIVV2_RM, vaadd_vv_b, OP_SSS_B, H1, H1, =
H1, aadd32)
 RVVCALL(OPIVV2_RM, vaadd_vv_h, OP_SSS_H, H2, H2, H2, aadd32)
 RVVCALL(OPIVV2_RM, vaadd_vv_w, OP_SSS_W, H4, H4, H4, aadd32)
 RVVCALL(OPIVV2_RM, vaadd_vv_d, OP_SSS_D, H8, H8, H8, aadd64)
-GEN_VEXT_VV_RM(vaadd_vv_b, 1, 1, clearb)
-GEN_VEXT_VV_RM(vaadd_vv_h, 2, 2, clearh)
-GEN_VEXT_VV_RM(vaadd_vv_w, 4, 4, clearl)
-GEN_VEXT_VV_RM(vaadd_vv_d, 8, 8, clearq)
+GEN_VEXT_VV_RM(vaadd_vv_b, 1, 1)
+GEN_VEXT_VV_RM(vaadd_vv_h, 2, 2)
+GEN_VEXT_VV_RM(vaadd_vv_w, 4, 4)
+GEN_VEXT_VV_RM(vaadd_vv_d, 8, 8)
=20
 RVVCALL(OPIVX2_RM, vaadd_vx_b, OP_SSS_B, H1, H1, aadd32)
 RVVCALL(OPIVX2_RM, vaadd_vx_h, OP_SSS_H, H2, H2, aadd32)
 RVVCALL(OPIVX2_RM, vaadd_vx_w, OP_SSS_W, H4, H4, aadd32)
 RVVCALL(OPIVX2_RM, vaadd_vx_d, OP_SSS_D, H8, H8, aadd64)
-GEN_VEXT_VX_RM(vaadd_vx_b, 1, 1, clearb)
-GEN_VEXT_VX_RM(vaadd_vx_h, 2, 2, clearh)
-GEN_VEXT_VX_RM(vaadd_vx_w, 4, 4, clearl)
-GEN_VEXT_VX_RM(vaadd_vx_d, 8, 8, clearq)
+GEN_VEXT_VX_RM(vaadd_vx_b, 1, 1)
+GEN_VEXT_VX_RM(vaadd_vx_h, 2, 2)
+GEN_VEXT_VX_RM(vaadd_vx_w, 4, 4)
+GEN_VEXT_VX_RM(vaadd_vx_d, 8, 8)
=20
 static inline int32_t asub32(CPURISCVState *env, int vxrm, int32_t a, in=
t32_t b)
 {
@@ -2581,19 +2466,19 @@ RVVCALL(OPIVV2_RM, vasub_vv_b, OP_SSS_B, H1, H1, =
H1, asub32)
 RVVCALL(OPIVV2_RM, vasub_vv_h, OP_SSS_H, H2, H2, H2, asub32)
 RVVCALL(OPIVV2_RM, vasub_vv_w, OP_SSS_W, H4, H4, H4, asub32)
 RVVCALL(OPIVV2_RM, vasub_vv_d, OP_SSS_D, H8, H8, H8, asub64)
-GEN_VEXT_VV_RM(vasub_vv_b, 1, 1, clearb)
-GEN_VEXT_VV_RM(vasub_vv_h, 2, 2, clearh)
-GEN_VEXT_VV_RM(vasub_vv_w, 4, 4, clearl)
-GEN_VEXT_VV_RM(vasub_vv_d, 8, 8, clearq)
+GEN_VEXT_VV_RM(vasub_vv_b, 1, 1)
+GEN_VEXT_VV_RM(vasub_vv_h, 2, 2)
+GEN_VEXT_VV_RM(vasub_vv_w, 4, 4)
+GEN_VEXT_VV_RM(vasub_vv_d, 8, 8)
=20
 RVVCALL(OPIVX2_RM, vasub_vx_b, OP_SSS_B, H1, H1, asub32)
 RVVCALL(OPIVX2_RM, vasub_vx_h, OP_SSS_H, H2, H2, asub32)
 RVVCALL(OPIVX2_RM, vasub_vx_w, OP_SSS_W, H4, H4, asub32)
 RVVCALL(OPIVX2_RM, vasub_vx_d, OP_SSS_D, H8, H8, asub64)
-GEN_VEXT_VX_RM(vasub_vx_b, 1, 1, clearb)
-GEN_VEXT_VX_RM(vasub_vx_h, 2, 2, clearh)
-GEN_VEXT_VX_RM(vasub_vx_w, 4, 4, clearl)
-GEN_VEXT_VX_RM(vasub_vx_d, 8, 8, clearq)
+GEN_VEXT_VX_RM(vasub_vx_b, 1, 1)
+GEN_VEXT_VX_RM(vasub_vx_h, 2, 2)
+GEN_VEXT_VX_RM(vasub_vx_w, 4, 4)
+GEN_VEXT_VX_RM(vasub_vx_d, 8, 8)
=20
 /* Vector Single-Width Fractional Multiply with Rounding and Saturation =
*/
 static inline int8_t vsmul8(CPURISCVState *env, int vxrm, int8_t a, int8=
_t b)
@@ -2688,19 +2573,19 @@ RVVCALL(OPIVV2_RM, vsmul_vv_b, OP_SSS_B, H1, H1, =
H1, vsmul8)
 RVVCALL(OPIVV2_RM, vsmul_vv_h, OP_SSS_H, H2, H2, H2, vsmul16)
 RVVCALL(OPIVV2_RM, vsmul_vv_w, OP_SSS_W, H4, H4, H4, vsmul32)
 RVVCALL(OPIVV2_RM, vsmul_vv_d, OP_SSS_D, H8, H8, H8, vsmul64)
-GEN_VEXT_VV_RM(vsmul_vv_b, 1, 1, clearb)
-GEN_VEXT_VV_RM(vsmul_vv_h, 2, 2, clearh)
-GEN_VEXT_VV_RM(vsmul_vv_w, 4, 4, clearl)
-GEN_VEXT_VV_RM(vsmul_vv_d, 8, 8, clearq)
+GEN_VEXT_VV_RM(vsmul_vv_b, 1, 1)
+GEN_VEXT_VV_RM(vsmul_vv_h, 2, 2)
+GEN_VEXT_VV_RM(vsmul_vv_w, 4, 4)
+GEN_VEXT_VV_RM(vsmul_vv_d, 8, 8)
=20
 RVVCALL(OPIVX2_RM, vsmul_vx_b, OP_SSS_B, H1, H1, vsmul8)
 RVVCALL(OPIVX2_RM, vsmul_vx_h, OP_SSS_H, H2, H2, vsmul16)
 RVVCALL(OPIVX2_RM, vsmul_vx_w, OP_SSS_W, H4, H4, vsmul32)
 RVVCALL(OPIVX2_RM, vsmul_vx_d, OP_SSS_D, H8, H8, vsmul64)
-GEN_VEXT_VX_RM(vsmul_vx_b, 1, 1, clearb)
-GEN_VEXT_VX_RM(vsmul_vx_h, 2, 2, clearh)
-GEN_VEXT_VX_RM(vsmul_vx_w, 4, 4, clearl)
-GEN_VEXT_VX_RM(vsmul_vx_d, 8, 8, clearq)
+GEN_VEXT_VX_RM(vsmul_vx_b, 1, 1)
+GEN_VEXT_VX_RM(vsmul_vx_h, 2, 2)
+GEN_VEXT_VX_RM(vsmul_vx_w, 4, 4)
+GEN_VEXT_VX_RM(vsmul_vx_d, 8, 8)
=20
 /* Vector Widening Saturating Scaled Multiply-Add */
 static inline uint16_t
@@ -2753,9 +2638,9 @@ do_##NAME(void *vd, void *vs1, void *vs2, int i,   =
                \
 RVVCALL(OPIVV3_RM, vwsmaccu_vv_b, WOP_UUU_B, H2, H1, H1, vwsmaccu8)
 RVVCALL(OPIVV3_RM, vwsmaccu_vv_h, WOP_UUU_H, H4, H2, H2, vwsmaccu16)
 RVVCALL(OPIVV3_RM, vwsmaccu_vv_w, WOP_UUU_W, H8, H4, H4, vwsmaccu32)
-GEN_VEXT_VV_RM(vwsmaccu_vv_b, 1, 2, clearh)
-GEN_VEXT_VV_RM(vwsmaccu_vv_h, 2, 4, clearl)
-GEN_VEXT_VV_RM(vwsmaccu_vv_w, 4, 8, clearq)
+GEN_VEXT_VV_RM(vwsmaccu_vv_b, 1, 2)
+GEN_VEXT_VV_RM(vwsmaccu_vv_h, 2, 4)
+GEN_VEXT_VV_RM(vwsmaccu_vv_w, 4, 8)
=20
 #define OPIVX3_RM(NAME, TD, T1, T2, TX1, TX2, HD, HS2, OP)         \
 static inline void                                                 \
@@ -2770,9 +2655,9 @@ do_##NAME(void *vd, target_long s1, void *vs2, int =
i,              \
 RVVCALL(OPIVX3_RM, vwsmaccu_vx_b, WOP_UUU_B, H2, H1, vwsmaccu8)
 RVVCALL(OPIVX3_RM, vwsmaccu_vx_h, WOP_UUU_H, H4, H2, vwsmaccu16)
 RVVCALL(OPIVX3_RM, vwsmaccu_vx_w, WOP_UUU_W, H8, H4, vwsmaccu32)
-GEN_VEXT_VX_RM(vwsmaccu_vx_b, 1, 2, clearh)
-GEN_VEXT_VX_RM(vwsmaccu_vx_h, 2, 4, clearl)
-GEN_VEXT_VX_RM(vwsmaccu_vx_w, 4, 8, clearq)
+GEN_VEXT_VX_RM(vwsmaccu_vx_b, 1, 2)
+GEN_VEXT_VX_RM(vwsmaccu_vx_h, 2, 4)
+GEN_VEXT_VX_RM(vwsmaccu_vx_w, 4, 8)
=20
 static inline int16_t
 vwsmacc8(CPURISCVState *env, int vxrm, int8_t a, int8_t b, int16_t c)
@@ -2811,15 +2696,15 @@ vwsmacc32(CPURISCVState *env, int vxrm, int32_t a=
, int32_t b, int64_t c)
 RVVCALL(OPIVV3_RM, vwsmacc_vv_b, WOP_SSS_B, H2, H1, H1, vwsmacc8)
 RVVCALL(OPIVV3_RM, vwsmacc_vv_h, WOP_SSS_H, H4, H2, H2, vwsmacc16)
 RVVCALL(OPIVV3_RM, vwsmacc_vv_w, WOP_SSS_W, H8, H4, H4, vwsmacc32)
-GEN_VEXT_VV_RM(vwsmacc_vv_b, 1, 2, clearh)
-GEN_VEXT_VV_RM(vwsmacc_vv_h, 2, 4, clearl)
-GEN_VEXT_VV_RM(vwsmacc_vv_w, 4, 8, clearq)
+GEN_VEXT_VV_RM(vwsmacc_vv_b, 1, 2)
+GEN_VEXT_VV_RM(vwsmacc_vv_h, 2, 4)
+GEN_VEXT_VV_RM(vwsmacc_vv_w, 4, 8)
 RVVCALL(OPIVX3_RM, vwsmacc_vx_b, WOP_SSS_B, H2, H1, vwsmacc8)
 RVVCALL(OPIVX3_RM, vwsmacc_vx_h, WOP_SSS_H, H4, H2, vwsmacc16)
 RVVCALL(OPIVX3_RM, vwsmacc_vx_w, WOP_SSS_W, H8, H4, vwsmacc32)
-GEN_VEXT_VX_RM(vwsmacc_vx_b, 1, 2, clearh)
-GEN_VEXT_VX_RM(vwsmacc_vx_h, 2, 4, clearl)
-GEN_VEXT_VX_RM(vwsmacc_vx_w, 4, 8, clearq)
+GEN_VEXT_VX_RM(vwsmacc_vx_b, 1, 2)
+GEN_VEXT_VX_RM(vwsmacc_vx_h, 2, 4)
+GEN_VEXT_VX_RM(vwsmacc_vx_w, 4, 8)
=20
 static inline int16_t
 vwsmaccsu8(CPURISCVState *env, int vxrm, uint8_t a, int8_t b, int16_t c)
@@ -2857,15 +2742,15 @@ vwsmaccsu32(CPURISCVState *env, int vxrm, uint32_=
t a, int32_t b, int64_t c)
 RVVCALL(OPIVV3_RM, vwsmaccsu_vv_b, WOP_SSU_B, H2, H1, H1, vwsmaccsu8)
 RVVCALL(OPIVV3_RM, vwsmaccsu_vv_h, WOP_SSU_H, H4, H2, H2, vwsmaccsu16)
 RVVCALL(OPIVV3_RM, vwsmaccsu_vv_w, WOP_SSU_W, H8, H4, H4, vwsmaccsu32)
-GEN_VEXT_VV_RM(vwsmaccsu_vv_b, 1, 2, clearh)
-GEN_VEXT_VV_RM(vwsmaccsu_vv_h, 2, 4, clearl)
-GEN_VEXT_VV_RM(vwsmaccsu_vv_w, 4, 8, clearq)
+GEN_VEXT_VV_RM(vwsmaccsu_vv_b, 1, 2)
+GEN_VEXT_VV_RM(vwsmaccsu_vv_h, 2, 4)
+GEN_VEXT_VV_RM(vwsmaccsu_vv_w, 4, 8)
 RVVCALL(OPIVX3_RM, vwsmaccsu_vx_b, WOP_SSU_B, H2, H1, vwsmaccsu8)
 RVVCALL(OPIVX3_RM, vwsmaccsu_vx_h, WOP_SSU_H, H4, H2, vwsmaccsu16)
 RVVCALL(OPIVX3_RM, vwsmaccsu_vx_w, WOP_SSU_W, H8, H4, vwsmaccsu32)
-GEN_VEXT_VX_RM(vwsmaccsu_vx_b, 1, 2, clearh)
-GEN_VEXT_VX_RM(vwsmaccsu_vx_h, 2, 4, clearl)
-GEN_VEXT_VX_RM(vwsmaccsu_vx_w, 4, 8, clearq)
+GEN_VEXT_VX_RM(vwsmaccsu_vx_b, 1, 2)
+GEN_VEXT_VX_RM(vwsmaccsu_vx_h, 2, 4)
+GEN_VEXT_VX_RM(vwsmaccsu_vx_w, 4, 8)
=20
 static inline int16_t
 vwsmaccus8(CPURISCVState *env, int vxrm, int8_t a, uint8_t b, int16_t c)
@@ -2903,9 +2788,9 @@ vwsmaccus32(CPURISCVState *env, int vxrm, int32_t a=
, uint32_t b, int64_t c)
 RVVCALL(OPIVX3_RM, vwsmaccus_vx_b, WOP_SUS_B, H2, H1, vwsmaccus8)
 RVVCALL(OPIVX3_RM, vwsmaccus_vx_h, WOP_SUS_H, H4, H2, vwsmaccus16)
 RVVCALL(OPIVX3_RM, vwsmaccus_vx_w, WOP_SUS_W, H8, H4, vwsmaccus32)
-GEN_VEXT_VX_RM(vwsmaccus_vx_b, 1, 2, clearh)
-GEN_VEXT_VX_RM(vwsmaccus_vx_h, 2, 4, clearl)
-GEN_VEXT_VX_RM(vwsmaccus_vx_w, 4, 8, clearq)
+GEN_VEXT_VX_RM(vwsmaccus_vx_b, 1, 2)
+GEN_VEXT_VX_RM(vwsmaccus_vx_h, 2, 4)
+GEN_VEXT_VX_RM(vwsmaccus_vx_w, 4, 8)
=20
 /* Vector Single-Width Scaling Shift Instructions */
 static inline uint8_t
@@ -2952,19 +2837,19 @@ RVVCALL(OPIVV2_RM, vssrl_vv_b, OP_UUU_B, H1, H1, =
H1, vssrl8)
 RVVCALL(OPIVV2_RM, vssrl_vv_h, OP_UUU_H, H2, H2, H2, vssrl16)
 RVVCALL(OPIVV2_RM, vssrl_vv_w, OP_UUU_W, H4, H4, H4, vssrl32)
 RVVCALL(OPIVV2_RM, vssrl_vv_d, OP_UUU_D, H8, H8, H8, vssrl64)
-GEN_VEXT_VV_RM(vssrl_vv_b, 1, 1, clearb)
-GEN_VEXT_VV_RM(vssrl_vv_h, 2, 2, clearh)
-GEN_VEXT_VV_RM(vssrl_vv_w, 4, 4, clearl)
-GEN_VEXT_VV_RM(vssrl_vv_d, 8, 8, clearq)
+GEN_VEXT_VV_RM(vssrl_vv_b, 1, 1)
+GEN_VEXT_VV_RM(vssrl_vv_h, 2, 2)
+GEN_VEXT_VV_RM(vssrl_vv_w, 4, 4)
+GEN_VEXT_VV_RM(vssrl_vv_d, 8, 8)
=20
 RVVCALL(OPIVX2_RM, vssrl_vx_b, OP_UUU_B, H1, H1, vssrl8)
 RVVCALL(OPIVX2_RM, vssrl_vx_h, OP_UUU_H, H2, H2, vssrl16)
 RVVCALL(OPIVX2_RM, vssrl_vx_w, OP_UUU_W, H4, H4, vssrl32)
 RVVCALL(OPIVX2_RM, vssrl_vx_d, OP_UUU_D, H8, H8, vssrl64)
-GEN_VEXT_VX_RM(vssrl_vx_b, 1, 1, clearb)
-GEN_VEXT_VX_RM(vssrl_vx_h, 2, 2, clearh)
-GEN_VEXT_VX_RM(vssrl_vx_w, 4, 4, clearl)
-GEN_VEXT_VX_RM(vssrl_vx_d, 8, 8, clearq)
+GEN_VEXT_VX_RM(vssrl_vx_b, 1, 1)
+GEN_VEXT_VX_RM(vssrl_vx_h, 2, 2)
+GEN_VEXT_VX_RM(vssrl_vx_w, 4, 4)
+GEN_VEXT_VX_RM(vssrl_vx_d, 8, 8)
=20
 static inline int8_t
 vssra8(CPURISCVState *env, int vxrm, int8_t a, int8_t b)
@@ -3011,19 +2896,19 @@ RVVCALL(OPIVV2_RM, vssra_vv_b, OP_SSS_B, H1, H1, =
H1, vssra8)
 RVVCALL(OPIVV2_RM, vssra_vv_h, OP_SSS_H, H2, H2, H2, vssra16)
 RVVCALL(OPIVV2_RM, vssra_vv_w, OP_SSS_W, H4, H4, H4, vssra32)
 RVVCALL(OPIVV2_RM, vssra_vv_d, OP_SSS_D, H8, H8, H8, vssra64)
-GEN_VEXT_VV_RM(vssra_vv_b, 1, 1, clearb)
-GEN_VEXT_VV_RM(vssra_vv_h, 2, 2, clearh)
-GEN_VEXT_VV_RM(vssra_vv_w, 4, 4, clearl)
-GEN_VEXT_VV_RM(vssra_vv_d, 8, 8, clearq)
+GEN_VEXT_VV_RM(vssra_vv_b, 1, 1)
+GEN_VEXT_VV_RM(vssra_vv_h, 2, 2)
+GEN_VEXT_VV_RM(vssra_vv_w, 4, 4)
+GEN_VEXT_VV_RM(vssra_vv_d, 8, 8)
=20
 RVVCALL(OPIVX2_RM, vssra_vx_b, OP_SSS_B, H1, H1, vssra8)
 RVVCALL(OPIVX2_RM, vssra_vx_h, OP_SSS_H, H2, H2, vssra16)
 RVVCALL(OPIVX2_RM, vssra_vx_w, OP_SSS_W, H4, H4, vssra32)
 RVVCALL(OPIVX2_RM, vssra_vx_d, OP_SSS_D, H8, H8, vssra64)
-GEN_VEXT_VX_RM(vssra_vx_b, 1, 1, clearb)
-GEN_VEXT_VX_RM(vssra_vx_h, 2, 2, clearh)
-GEN_VEXT_VX_RM(vssra_vx_w, 4, 4, clearl)
-GEN_VEXT_VX_RM(vssra_vx_d, 8, 8, clearq)
+GEN_VEXT_VX_RM(vssra_vx_b, 1, 1)
+GEN_VEXT_VX_RM(vssra_vx_h, 2, 2)
+GEN_VEXT_VX_RM(vssra_vx_w, 4, 4)
+GEN_VEXT_VX_RM(vssra_vx_d, 8, 8)
=20
 /* Vector Narrowing Fixed-Point Clip Instructions */
 static inline int8_t
@@ -3086,16 +2971,16 @@ vnclip32(CPURISCVState *env, int vxrm, int64_t a,=
 int32_t b)
 RVVCALL(OPIVV2_RM, vnclip_vv_b, NOP_SSS_B, H1, H2, H1, vnclip8)
 RVVCALL(OPIVV2_RM, vnclip_vv_h, NOP_SSS_H, H2, H4, H2, vnclip16)
 RVVCALL(OPIVV2_RM, vnclip_vv_w, NOP_SSS_W, H4, H8, H4, vnclip32)
-GEN_VEXT_VV_RM(vnclip_vv_b, 1, 1, clearb)
-GEN_VEXT_VV_RM(vnclip_vv_h, 2, 2, clearh)
-GEN_VEXT_VV_RM(vnclip_vv_w, 4, 4, clearl)
+GEN_VEXT_VV_RM(vnclip_vv_b, 1, 1)
+GEN_VEXT_VV_RM(vnclip_vv_h, 2, 2)
+GEN_VEXT_VV_RM(vnclip_vv_w, 4, 4)
=20
 RVVCALL(OPIVX2_RM, vnclip_vx_b, NOP_SSS_B, H1, H2, vnclip8)
 RVVCALL(OPIVX2_RM, vnclip_vx_h, NOP_SSS_H, H2, H4, vnclip16)
 RVVCALL(OPIVX2_RM, vnclip_vx_w, NOP_SSS_W, H4, H8, vnclip32)
-GEN_VEXT_VX_RM(vnclip_vx_b, 1, 1, clearb)
-GEN_VEXT_VX_RM(vnclip_vx_h, 2, 2, clearh)
-GEN_VEXT_VX_RM(vnclip_vx_w, 4, 4, clearl)
+GEN_VEXT_VX_RM(vnclip_vx_b, 1, 1)
+GEN_VEXT_VX_RM(vnclip_vx_h, 2, 2)
+GEN_VEXT_VX_RM(vnclip_vx_w, 4, 4)
=20
 static inline uint8_t
 vnclipu8(CPURISCVState *env, int vxrm, uint16_t a, uint8_t b)
@@ -3148,16 +3033,16 @@ vnclipu32(CPURISCVState *env, int vxrm, uint64_t =
a, uint32_t b)
 RVVCALL(OPIVV2_RM, vnclipu_vv_b, NOP_UUU_B, H1, H2, H1, vnclipu8)
 RVVCALL(OPIVV2_RM, vnclipu_vv_h, NOP_UUU_H, H2, H4, H2, vnclipu16)
 RVVCALL(OPIVV2_RM, vnclipu_vv_w, NOP_UUU_W, H4, H8, H4, vnclipu32)
-GEN_VEXT_VV_RM(vnclipu_vv_b, 1, 1, clearb)
-GEN_VEXT_VV_RM(vnclipu_vv_h, 2, 2, clearh)
-GEN_VEXT_VV_RM(vnclipu_vv_w, 4, 4, clearl)
+GEN_VEXT_VV_RM(vnclipu_vv_b, 1, 1)
+GEN_VEXT_VV_RM(vnclipu_vv_h, 2, 2)
+GEN_VEXT_VV_RM(vnclipu_vv_w, 4, 4)
=20
 RVVCALL(OPIVX2_RM, vnclipu_vx_b, NOP_UUU_B, H1, H2, vnclipu8)
 RVVCALL(OPIVX2_RM, vnclipu_vx_h, NOP_UUU_H, H2, H4, vnclipu16)
 RVVCALL(OPIVX2_RM, vnclipu_vx_w, NOP_UUU_W, H4, H8, vnclipu32)
-GEN_VEXT_VX_RM(vnclipu_vx_b, 1, 1, clearb)
-GEN_VEXT_VX_RM(vnclipu_vx_h, 2, 2, clearh)
-GEN_VEXT_VX_RM(vnclipu_vx_w, 4, 4, clearl)
+GEN_VEXT_VX_RM(vnclipu_vx_b, 1, 1)
+GEN_VEXT_VX_RM(vnclipu_vx_h, 2, 2)
+GEN_VEXT_VX_RM(vnclipu_vx_w, 4, 4)
=20
 /*
  *** Vector Float Point Arithmetic Instructions
@@ -3172,12 +3057,11 @@ static void do_##NAME(void *vd, void *vs1, void *=
vs2, int i,   \
     *((TD *)vd + HD(i)) =3D OP(s2, s1, &env->fp_status);         \
 }
=20
-#define GEN_VEXT_VV_ENV(NAME, ESZ, DSZ, CLEAR_FN)         \
+#define GEN_VEXT_VV_ENV(NAME, ESZ, DSZ)                   \
 void HELPER(NAME)(void *vd, void *v0, void *vs1,          \
                   void *vs2, CPURISCVState *env,          \
                   uint32_t desc)                          \
 {                                                         \
-    uint32_t vlmax =3D vext_maxsz(desc) / ESZ;              \
     uint32_t vm =3D vext_vm(desc);                          \
     uint32_t vl =3D env->vl;                                \
     uint32_t i;                                           \
@@ -3188,15 +3072,14 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, =
         \
         }                                                 \
         do_##NAME(vd, vs1, vs2, i, env);                  \
     }                                                     \
-    CLEAR_FN(vd, vl, vl * DSZ,  vlmax * DSZ);             \
 }
=20
 RVVCALL(OPFVV2, vfadd_vv_h, OP_UUU_H, H2, H2, H2, float16_add)
 RVVCALL(OPFVV2, vfadd_vv_w, OP_UUU_W, H4, H4, H4, float32_add)
 RVVCALL(OPFVV2, vfadd_vv_d, OP_UUU_D, H8, H8, H8, float64_add)
-GEN_VEXT_VV_ENV(vfadd_vv_h, 2, 2, clearh)
-GEN_VEXT_VV_ENV(vfadd_vv_w, 4, 4, clearl)
-GEN_VEXT_VV_ENV(vfadd_vv_d, 8, 8, clearq)
+GEN_VEXT_VV_ENV(vfadd_vv_h, 2, 2)
+GEN_VEXT_VV_ENV(vfadd_vv_w, 4, 4)
+GEN_VEXT_VV_ENV(vfadd_vv_d, 8, 8)
=20
 #define OPFVF2(NAME, TD, T1, T2, TX1, TX2, HD, HS2, OP)        \
 static void do_##NAME(void *vd, uint64_t s1, void *vs2, int i, \
@@ -3206,12 +3089,11 @@ static void do_##NAME(void *vd, uint64_t s1, void=
 *vs2, int i, \
     *((TD *)vd + HD(i)) =3D OP(s2, (TX1)(T1)s1, &env->fp_status);\
 }
=20
-#define GEN_VEXT_VF(NAME, ESZ, DSZ, CLEAR_FN)             \
+#define GEN_VEXT_VF(NAME, ESZ, DSZ)                       \
 void HELPER(NAME)(void *vd, void *v0, uint64_t s1,        \
                   void *vs2, CPURISCVState *env,          \
                   uint32_t desc)                          \
 {                                                         \
-    uint32_t vlmax =3D vext_maxsz(desc) / ESZ;              \
     uint32_t vm =3D vext_vm(desc);                          \
     uint32_t vl =3D env->vl;                                \
     uint32_t i;                                           \
@@ -3222,28 +3104,27 @@ void HELPER(NAME)(void *vd, void *v0, uint64_t s1=
,        \
         }                                                 \
         do_##NAME(vd, s1, vs2, i, env);                   \
     }                                                     \
-    CLEAR_FN(vd, vl, vl * DSZ,  vlmax * DSZ);             \
 }
=20
 RVVCALL(OPFVF2, vfadd_vf_h, OP_UUU_H, H2, H2, float16_add)
 RVVCALL(OPFVF2, vfadd_vf_w, OP_UUU_W, H4, H4, float32_add)
 RVVCALL(OPFVF2, vfadd_vf_d, OP_UUU_D, H8, H8, float64_add)
-GEN_VEXT_VF(vfadd_vf_h, 2, 2, clearh)
-GEN_VEXT_VF(vfadd_vf_w, 4, 4, clearl)
-GEN_VEXT_VF(vfadd_vf_d, 8, 8, clearq)
+GEN_VEXT_VF(vfadd_vf_h, 2, 2)
+GEN_VEXT_VF(vfadd_vf_w, 4, 4)
+GEN_VEXT_VF(vfadd_vf_d, 8, 8)
=20
 RVVCALL(OPFVV2, vfsub_vv_h, OP_UUU_H, H2, H2, H2, float16_sub)
 RVVCALL(OPFVV2, vfsub_vv_w, OP_UUU_W, H4, H4, H4, float32_sub)
 RVVCALL(OPFVV2, vfsub_vv_d, OP_UUU_D, H8, H8, H8, float64_sub)
-GEN_VEXT_VV_ENV(vfsub_vv_h, 2, 2, clearh)
-GEN_VEXT_VV_ENV(vfsub_vv_w, 4, 4, clearl)
-GEN_VEXT_VV_ENV(vfsub_vv_d, 8, 8, clearq)
+GEN_VEXT_VV_ENV(vfsub_vv_h, 2, 2)
+GEN_VEXT_VV_ENV(vfsub_vv_w, 4, 4)
+GEN_VEXT_VV_ENV(vfsub_vv_d, 8, 8)
 RVVCALL(OPFVF2, vfsub_vf_h, OP_UUU_H, H2, H2, float16_sub)
 RVVCALL(OPFVF2, vfsub_vf_w, OP_UUU_W, H4, H4, float32_sub)
 RVVCALL(OPFVF2, vfsub_vf_d, OP_UUU_D, H8, H8, float64_sub)
-GEN_VEXT_VF(vfsub_vf_h, 2, 2, clearh)
-GEN_VEXT_VF(vfsub_vf_w, 4, 4, clearl)
-GEN_VEXT_VF(vfsub_vf_d, 8, 8, clearq)
+GEN_VEXT_VF(vfsub_vf_h, 2, 2)
+GEN_VEXT_VF(vfsub_vf_w, 4, 4)
+GEN_VEXT_VF(vfsub_vf_d, 8, 8)
=20
 static uint16_t float16_rsub(uint16_t a, uint16_t b, float_status *s)
 {
@@ -3263,9 +3144,9 @@ static uint64_t float64_rsub(uint64_t a, uint64_t b=
, float_status *s)
 RVVCALL(OPFVF2, vfrsub_vf_h, OP_UUU_H, H2, H2, float16_rsub)
 RVVCALL(OPFVF2, vfrsub_vf_w, OP_UUU_W, H4, H4, float32_rsub)
 RVVCALL(OPFVF2, vfrsub_vf_d, OP_UUU_D, H8, H8, float64_rsub)
-GEN_VEXT_VF(vfrsub_vf_h, 2, 2, clearh)
-GEN_VEXT_VF(vfrsub_vf_w, 4, 4, clearl)
-GEN_VEXT_VF(vfrsub_vf_d, 8, 8, clearq)
+GEN_VEXT_VF(vfrsub_vf_h, 2, 2)
+GEN_VEXT_VF(vfrsub_vf_w, 4, 4)
+GEN_VEXT_VF(vfrsub_vf_d, 8, 8)
=20
 /* Vector Widening Floating-Point Add/Subtract Instructions */
 static uint32_t vfwadd16(uint16_t a, uint16_t b, float_status *s)
@@ -3283,12 +3164,12 @@ static uint64_t vfwadd32(uint32_t a, uint32_t b, =
float_status *s)
=20
 RVVCALL(OPFVV2, vfwadd_vv_h, WOP_UUU_H, H4, H2, H2, vfwadd16)
 RVVCALL(OPFVV2, vfwadd_vv_w, WOP_UUU_W, H8, H4, H4, vfwadd32)
-GEN_VEXT_VV_ENV(vfwadd_vv_h, 2, 4, clearl)
-GEN_VEXT_VV_ENV(vfwadd_vv_w, 4, 8, clearq)
+GEN_VEXT_VV_ENV(vfwadd_vv_h, 2, 4)
+GEN_VEXT_VV_ENV(vfwadd_vv_w, 4, 8)
 RVVCALL(OPFVF2, vfwadd_vf_h, WOP_UUU_H, H4, H2, vfwadd16)
 RVVCALL(OPFVF2, vfwadd_vf_w, WOP_UUU_W, H8, H4, vfwadd32)
-GEN_VEXT_VF(vfwadd_vf_h, 2, 4, clearl)
-GEN_VEXT_VF(vfwadd_vf_w, 4, 8, clearq)
+GEN_VEXT_VF(vfwadd_vf_h, 2, 4)
+GEN_VEXT_VF(vfwadd_vf_w, 4, 8)
=20
 static uint32_t vfwsub16(uint16_t a, uint16_t b, float_status *s)
 {
@@ -3305,12 +3186,12 @@ static uint64_t vfwsub32(uint32_t a, uint32_t b, =
float_status *s)
=20
 RVVCALL(OPFVV2, vfwsub_vv_h, WOP_UUU_H, H4, H2, H2, vfwsub16)
 RVVCALL(OPFVV2, vfwsub_vv_w, WOP_UUU_W, H8, H4, H4, vfwsub32)
-GEN_VEXT_VV_ENV(vfwsub_vv_h, 2, 4, clearl)
-GEN_VEXT_VV_ENV(vfwsub_vv_w, 4, 8, clearq)
+GEN_VEXT_VV_ENV(vfwsub_vv_h, 2, 4)
+GEN_VEXT_VV_ENV(vfwsub_vv_w, 4, 8)
 RVVCALL(OPFVF2, vfwsub_vf_h, WOP_UUU_H, H4, H2, vfwsub16)
 RVVCALL(OPFVF2, vfwsub_vf_w, WOP_UUU_W, H8, H4, vfwsub32)
-GEN_VEXT_VF(vfwsub_vf_h, 2, 4, clearl)
-GEN_VEXT_VF(vfwsub_vf_w, 4, 8, clearq)
+GEN_VEXT_VF(vfwsub_vf_h, 2, 4)
+GEN_VEXT_VF(vfwsub_vf_w, 4, 8)
=20
 static uint32_t vfwaddw16(uint32_t a, uint16_t b, float_status *s)
 {
@@ -3324,12 +3205,12 @@ static uint64_t vfwaddw32(uint64_t a, uint32_t b,=
 float_status *s)
=20
 RVVCALL(OPFVV2, vfwadd_wv_h, WOP_WUUU_H, H4, H2, H2, vfwaddw16)
 RVVCALL(OPFVV2, vfwadd_wv_w, WOP_WUUU_W, H8, H4, H4, vfwaddw32)
-GEN_VEXT_VV_ENV(vfwadd_wv_h, 2, 4, clearl)
-GEN_VEXT_VV_ENV(vfwadd_wv_w, 4, 8, clearq)
+GEN_VEXT_VV_ENV(vfwadd_wv_h, 2, 4)
+GEN_VEXT_VV_ENV(vfwadd_wv_w, 4, 8)
 RVVCALL(OPFVF2, vfwadd_wf_h, WOP_WUUU_H, H4, H2, vfwaddw16)
 RVVCALL(OPFVF2, vfwadd_wf_w, WOP_WUUU_W, H8, H4, vfwaddw32)
-GEN_VEXT_VF(vfwadd_wf_h, 2, 4, clearl)
-GEN_VEXT_VF(vfwadd_wf_w, 4, 8, clearq)
+GEN_VEXT_VF(vfwadd_wf_h, 2, 4)
+GEN_VEXT_VF(vfwadd_wf_w, 4, 8)
=20
 static uint32_t vfwsubw16(uint32_t a, uint16_t b, float_status *s)
 {
@@ -3343,39 +3224,39 @@ static uint64_t vfwsubw32(uint64_t a, uint32_t b,=
 float_status *s)
=20
 RVVCALL(OPFVV2, vfwsub_wv_h, WOP_WUUU_H, H4, H2, H2, vfwsubw16)
 RVVCALL(OPFVV2, vfwsub_wv_w, WOP_WUUU_W, H8, H4, H4, vfwsubw32)
-GEN_VEXT_VV_ENV(vfwsub_wv_h, 2, 4, clearl)
-GEN_VEXT_VV_ENV(vfwsub_wv_w, 4, 8, clearq)
+GEN_VEXT_VV_ENV(vfwsub_wv_h, 2, 4)
+GEN_VEXT_VV_ENV(vfwsub_wv_w, 4, 8)
 RVVCALL(OPFVF2, vfwsub_wf_h, WOP_WUUU_H, H4, H2, vfwsubw16)
 RVVCALL(OPFVF2, vfwsub_wf_w, WOP_WUUU_W, H8, H4, vfwsubw32)
-GEN_VEXT_VF(vfwsub_wf_h, 2, 4, clearl)
-GEN_VEXT_VF(vfwsub_wf_w, 4, 8, clearq)
+GEN_VEXT_VF(vfwsub_wf_h, 2, 4)
+GEN_VEXT_VF(vfwsub_wf_w, 4, 8)
=20
 /* Vector Single-Width Floating-Point Multiply/Divide Instructions */
 RVVCALL(OPFVV2, vfmul_vv_h, OP_UUU_H, H2, H2, H2, float16_mul)
 RVVCALL(OPFVV2, vfmul_vv_w, OP_UUU_W, H4, H4, H4, float32_mul)
 RVVCALL(OPFVV2, vfmul_vv_d, OP_UUU_D, H8, H8, H8, float64_mul)
-GEN_VEXT_VV_ENV(vfmul_vv_h, 2, 2, clearh)
-GEN_VEXT_VV_ENV(vfmul_vv_w, 4, 4, clearl)
-GEN_VEXT_VV_ENV(vfmul_vv_d, 8, 8, clearq)
+GEN_VEXT_VV_ENV(vfmul_vv_h, 2, 2)
+GEN_VEXT_VV_ENV(vfmul_vv_w, 4, 4)
+GEN_VEXT_VV_ENV(vfmul_vv_d, 8, 8)
 RVVCALL(OPFVF2, vfmul_vf_h, OP_UUU_H, H2, H2, float16_mul)
 RVVCALL(OPFVF2, vfmul_vf_w, OP_UUU_W, H4, H4, float32_mul)
 RVVCALL(OPFVF2, vfmul_vf_d, OP_UUU_D, H8, H8, float64_mul)
-GEN_VEXT_VF(vfmul_vf_h, 2, 2, clearh)
-GEN_VEXT_VF(vfmul_vf_w, 4, 4, clearl)
-GEN_VEXT_VF(vfmul_vf_d, 8, 8, clearq)
+GEN_VEXT_VF(vfmul_vf_h, 2, 2)
+GEN_VEXT_VF(vfmul_vf_w, 4, 4)
+GEN_VEXT_VF(vfmul_vf_d, 8, 8)
=20
 RVVCALL(OPFVV2, vfdiv_vv_h, OP_UUU_H, H2, H2, H2, float16_div)
 RVVCALL(OPFVV2, vfdiv_vv_w, OP_UUU_W, H4, H4, H4, float32_div)
 RVVCALL(OPFVV2, vfdiv_vv_d, OP_UUU_D, H8, H8, H8, float64_div)
-GEN_VEXT_VV_ENV(vfdiv_vv_h, 2, 2, clearh)
-GEN_VEXT_VV_ENV(vfdiv_vv_w, 4, 4, clearl)
-GEN_VEXT_VV_ENV(vfdiv_vv_d, 8, 8, clearq)
+GEN_VEXT_VV_ENV(vfdiv_vv_h, 2, 2)
+GEN_VEXT_VV_ENV(vfdiv_vv_w, 4, 4)
+GEN_VEXT_VV_ENV(vfdiv_vv_d, 8, 8)
 RVVCALL(OPFVF2, vfdiv_vf_h, OP_UUU_H, H2, H2, float16_div)
 RVVCALL(OPFVF2, vfdiv_vf_w, OP_UUU_W, H4, H4, float32_div)
 RVVCALL(OPFVF2, vfdiv_vf_d, OP_UUU_D, H8, H8, float64_div)
-GEN_VEXT_VF(vfdiv_vf_h, 2, 2, clearh)
-GEN_VEXT_VF(vfdiv_vf_w, 4, 4, clearl)
-GEN_VEXT_VF(vfdiv_vf_d, 8, 8, clearq)
+GEN_VEXT_VF(vfdiv_vf_h, 2, 2)
+GEN_VEXT_VF(vfdiv_vf_w, 4, 4)
+GEN_VEXT_VF(vfdiv_vf_d, 8, 8)
=20
 static uint16_t float16_rdiv(uint16_t a, uint16_t b, float_status *s)
 {
@@ -3395,9 +3276,9 @@ static uint64_t float64_rdiv(uint64_t a, uint64_t b=
, float_status *s)
 RVVCALL(OPFVF2, vfrdiv_vf_h, OP_UUU_H, H2, H2, float16_rdiv)
 RVVCALL(OPFVF2, vfrdiv_vf_w, OP_UUU_W, H4, H4, float32_rdiv)
 RVVCALL(OPFVF2, vfrdiv_vf_d, OP_UUU_D, H8, H8, float64_rdiv)
-GEN_VEXT_VF(vfrdiv_vf_h, 2, 2, clearh)
-GEN_VEXT_VF(vfrdiv_vf_w, 4, 4, clearl)
-GEN_VEXT_VF(vfrdiv_vf_d, 8, 8, clearq)
+GEN_VEXT_VF(vfrdiv_vf_h, 2, 2)
+GEN_VEXT_VF(vfrdiv_vf_w, 4, 4)
+GEN_VEXT_VF(vfrdiv_vf_d, 8, 8)
=20
 /* Vector Widening Floating-Point Multiply */
 static uint32_t vfwmul16(uint16_t a, uint16_t b, float_status *s)
@@ -3414,12 +3295,12 @@ static uint64_t vfwmul32(uint32_t a, uint32_t b, =
float_status *s)
 }
 RVVCALL(OPFVV2, vfwmul_vv_h, WOP_UUU_H, H4, H2, H2, vfwmul16)
 RVVCALL(OPFVV2, vfwmul_vv_w, WOP_UUU_W, H8, H4, H4, vfwmul32)
-GEN_VEXT_VV_ENV(vfwmul_vv_h, 2, 4, clearl)
-GEN_VEXT_VV_ENV(vfwmul_vv_w, 4, 8, clearq)
+GEN_VEXT_VV_ENV(vfwmul_vv_h, 2, 4)
+GEN_VEXT_VV_ENV(vfwmul_vv_w, 4, 8)
 RVVCALL(OPFVF2, vfwmul_vf_h, WOP_UUU_H, H4, H2, vfwmul16)
 RVVCALL(OPFVF2, vfwmul_vf_w, WOP_UUU_W, H8, H4, vfwmul32)
-GEN_VEXT_VF(vfwmul_vf_h, 2, 4, clearl)
-GEN_VEXT_VF(vfwmul_vf_w, 4, 8, clearq)
+GEN_VEXT_VF(vfwmul_vf_h, 2, 4)
+GEN_VEXT_VF(vfwmul_vf_w, 4, 8)
=20
 /* Vector Single-Width Floating-Point Fused Multiply-Add Instructions */
 #define OPFVV3(NAME, TD, T1, T2, TX1, TX2, HD, HS1, HS2, OP)       \
@@ -3450,9 +3331,9 @@ static uint64_t fmacc64(uint64_t a, uint64_t b, uin=
t64_t d, float_status *s)
 RVVCALL(OPFVV3, vfmacc_vv_h, OP_UUU_H, H2, H2, H2, fmacc16)
 RVVCALL(OPFVV3, vfmacc_vv_w, OP_UUU_W, H4, H4, H4, fmacc32)
 RVVCALL(OPFVV3, vfmacc_vv_d, OP_UUU_D, H8, H8, H8, fmacc64)
-GEN_VEXT_VV_ENV(vfmacc_vv_h, 2, 2, clearh)
-GEN_VEXT_VV_ENV(vfmacc_vv_w, 4, 4, clearl)
-GEN_VEXT_VV_ENV(vfmacc_vv_d, 8, 8, clearq)
+GEN_VEXT_VV_ENV(vfmacc_vv_h, 2, 2)
+GEN_VEXT_VV_ENV(vfmacc_vv_w, 4, 4)
+GEN_VEXT_VV_ENV(vfmacc_vv_d, 8, 8)
=20
 #define OPFVF3(NAME, TD, T1, T2, TX1, TX2, HD, HS2, OP)           \
 static void do_##NAME(void *vd, uint64_t s1, void *vs2, int i,    \
@@ -3466,9 +3347,9 @@ static void do_##NAME(void *vd, uint64_t s1, void *=
vs2, int i,    \
 RVVCALL(OPFVF3, vfmacc_vf_h, OP_UUU_H, H2, H2, fmacc16)
 RVVCALL(OPFVF3, vfmacc_vf_w, OP_UUU_W, H4, H4, fmacc32)
 RVVCALL(OPFVF3, vfmacc_vf_d, OP_UUU_D, H8, H8, fmacc64)
-GEN_VEXT_VF(vfmacc_vf_h, 2, 2, clearh)
-GEN_VEXT_VF(vfmacc_vf_w, 4, 4, clearl)
-GEN_VEXT_VF(vfmacc_vf_d, 8, 8, clearq)
+GEN_VEXT_VF(vfmacc_vf_h, 2, 2)
+GEN_VEXT_VF(vfmacc_vf_w, 4, 4)
+GEN_VEXT_VF(vfmacc_vf_d, 8, 8)
=20
 static uint16_t fnmacc16(uint16_t a, uint16_t b, uint16_t d, float_statu=
s *s)
 {
@@ -3491,15 +3372,15 @@ static uint64_t fnmacc64(uint64_t a, uint64_t b, =
uint64_t d, float_status *s)
 RVVCALL(OPFVV3, vfnmacc_vv_h, OP_UUU_H, H2, H2, H2, fnmacc16)
 RVVCALL(OPFVV3, vfnmacc_vv_w, OP_UUU_W, H4, H4, H4, fnmacc32)
 RVVCALL(OPFVV3, vfnmacc_vv_d, OP_UUU_D, H8, H8, H8, fnmacc64)
-GEN_VEXT_VV_ENV(vfnmacc_vv_h, 2, 2, clearh)
-GEN_VEXT_VV_ENV(vfnmacc_vv_w, 4, 4, clearl)
-GEN_VEXT_VV_ENV(vfnmacc_vv_d, 8, 8, clearq)
+GEN_VEXT_VV_ENV(vfnmacc_vv_h, 2, 2)
+GEN_VEXT_VV_ENV(vfnmacc_vv_w, 4, 4)
+GEN_VEXT_VV_ENV(vfnmacc_vv_d, 8, 8)
 RVVCALL(OPFVF3, vfnmacc_vf_h, OP_UUU_H, H2, H2, fnmacc16)
 RVVCALL(OPFVF3, vfnmacc_vf_w, OP_UUU_W, H4, H4, fnmacc32)
 RVVCALL(OPFVF3, vfnmacc_vf_d, OP_UUU_D, H8, H8, fnmacc64)
-GEN_VEXT_VF(vfnmacc_vf_h, 2, 2, clearh)
-GEN_VEXT_VF(vfnmacc_vf_w, 4, 4, clearl)
-GEN_VEXT_VF(vfnmacc_vf_d, 8, 8, clearq)
+GEN_VEXT_VF(vfnmacc_vf_h, 2, 2)
+GEN_VEXT_VF(vfnmacc_vf_w, 4, 4)
+GEN_VEXT_VF(vfnmacc_vf_d, 8, 8)
=20
 static uint16_t fmsac16(uint16_t a, uint16_t b, uint16_t d, float_status=
 *s)
 {
@@ -3519,15 +3400,15 @@ static uint64_t fmsac64(uint64_t a, uint64_t b, u=
int64_t d, float_status *s)
 RVVCALL(OPFVV3, vfmsac_vv_h, OP_UUU_H, H2, H2, H2, fmsac16)
 RVVCALL(OPFVV3, vfmsac_vv_w, OP_UUU_W, H4, H4, H4, fmsac32)
 RVVCALL(OPFVV3, vfmsac_vv_d, OP_UUU_D, H8, H8, H8, fmsac64)
-GEN_VEXT_VV_ENV(vfmsac_vv_h, 2, 2, clearh)
-GEN_VEXT_VV_ENV(vfmsac_vv_w, 4, 4, clearl)
-GEN_VEXT_VV_ENV(vfmsac_vv_d, 8, 8, clearq)
+GEN_VEXT_VV_ENV(vfmsac_vv_h, 2, 2)
+GEN_VEXT_VV_ENV(vfmsac_vv_w, 4, 4)
+GEN_VEXT_VV_ENV(vfmsac_vv_d, 8, 8)
 RVVCALL(OPFVF3, vfmsac_vf_h, OP_UUU_H, H2, H2, fmsac16)
 RVVCALL(OPFVF3, vfmsac_vf_w, OP_UUU_W, H4, H4, fmsac32)
 RVVCALL(OPFVF3, vfmsac_vf_d, OP_UUU_D, H8, H8, fmsac64)
-GEN_VEXT_VF(vfmsac_vf_h, 2, 2, clearh)
-GEN_VEXT_VF(vfmsac_vf_w, 4, 4, clearl)
-GEN_VEXT_VF(vfmsac_vf_d, 8, 8, clearq)
+GEN_VEXT_VF(vfmsac_vf_h, 2, 2)
+GEN_VEXT_VF(vfmsac_vf_w, 4, 4)
+GEN_VEXT_VF(vfmsac_vf_d, 8, 8)
=20
 static uint16_t fnmsac16(uint16_t a, uint16_t b, uint16_t d, float_statu=
s *s)
 {
@@ -3547,15 +3428,15 @@ static uint64_t fnmsac64(uint64_t a, uint64_t b, =
uint64_t d, float_status *s)
 RVVCALL(OPFVV3, vfnmsac_vv_h, OP_UUU_H, H2, H2, H2, fnmsac16)
 RVVCALL(OPFVV3, vfnmsac_vv_w, OP_UUU_W, H4, H4, H4, fnmsac32)
 RVVCALL(OPFVV3, vfnmsac_vv_d, OP_UUU_D, H8, H8, H8, fnmsac64)
-GEN_VEXT_VV_ENV(vfnmsac_vv_h, 2, 2, clearh)
-GEN_VEXT_VV_ENV(vfnmsac_vv_w, 4, 4, clearl)
-GEN_VEXT_VV_ENV(vfnmsac_vv_d, 8, 8, clearq)
+GEN_VEXT_VV_ENV(vfnmsac_vv_h, 2, 2)
+GEN_VEXT_VV_ENV(vfnmsac_vv_w, 4, 4)
+GEN_VEXT_VV_ENV(vfnmsac_vv_d, 8, 8)
 RVVCALL(OPFVF3, vfnmsac_vf_h, OP_UUU_H, H2, H2, fnmsac16)
 RVVCALL(OPFVF3, vfnmsac_vf_w, OP_UUU_W, H4, H4, fnmsac32)
 RVVCALL(OPFVF3, vfnmsac_vf_d, OP_UUU_D, H8, H8, fnmsac64)
-GEN_VEXT_VF(vfnmsac_vf_h, 2, 2, clearh)
-GEN_VEXT_VF(vfnmsac_vf_w, 4, 4, clearl)
-GEN_VEXT_VF(vfnmsac_vf_d, 8, 8, clearq)
+GEN_VEXT_VF(vfnmsac_vf_h, 2, 2)
+GEN_VEXT_VF(vfnmsac_vf_w, 4, 4)
+GEN_VEXT_VF(vfnmsac_vf_d, 8, 8)
=20
 static uint16_t fmadd16(uint16_t a, uint16_t b, uint16_t d, float_status=
 *s)
 {
@@ -3575,15 +3456,15 @@ static uint64_t fmadd64(uint64_t a, uint64_t b, u=
int64_t d, float_status *s)
 RVVCALL(OPFVV3, vfmadd_vv_h, OP_UUU_H, H2, H2, H2, fmadd16)
 RVVCALL(OPFVV3, vfmadd_vv_w, OP_UUU_W, H4, H4, H4, fmadd32)
 RVVCALL(OPFVV3, vfmadd_vv_d, OP_UUU_D, H8, H8, H8, fmadd64)
-GEN_VEXT_VV_ENV(vfmadd_vv_h, 2, 2, clearh)
-GEN_VEXT_VV_ENV(vfmadd_vv_w, 4, 4, clearl)
-GEN_VEXT_VV_ENV(vfmadd_vv_d, 8, 8, clearq)
+GEN_VEXT_VV_ENV(vfmadd_vv_h, 2, 2)
+GEN_VEXT_VV_ENV(vfmadd_vv_w, 4, 4)
+GEN_VEXT_VV_ENV(vfmadd_vv_d, 8, 8)
 RVVCALL(OPFVF3, vfmadd_vf_h, OP_UUU_H, H2, H2, fmadd16)
 RVVCALL(OPFVF3, vfmadd_vf_w, OP_UUU_W, H4, H4, fmadd32)
 RVVCALL(OPFVF3, vfmadd_vf_d, OP_UUU_D, H8, H8, fmadd64)
-GEN_VEXT_VF(vfmadd_vf_h, 2, 2, clearh)
-GEN_VEXT_VF(vfmadd_vf_w, 4, 4, clearl)
-GEN_VEXT_VF(vfmadd_vf_d, 8, 8, clearq)
+GEN_VEXT_VF(vfmadd_vf_h, 2, 2)
+GEN_VEXT_VF(vfmadd_vf_w, 4, 4)
+GEN_VEXT_VF(vfmadd_vf_d, 8, 8)
=20
 static uint16_t fnmadd16(uint16_t a, uint16_t b, uint16_t d, float_statu=
s *s)
 {
@@ -3606,15 +3487,15 @@ static uint64_t fnmadd64(uint64_t a, uint64_t b, =
uint64_t d, float_status *s)
 RVVCALL(OPFVV3, vfnmadd_vv_h, OP_UUU_H, H2, H2, H2, fnmadd16)
 RVVCALL(OPFVV3, vfnmadd_vv_w, OP_UUU_W, H4, H4, H4, fnmadd32)
 RVVCALL(OPFVV3, vfnmadd_vv_d, OP_UUU_D, H8, H8, H8, fnmadd64)
-GEN_VEXT_VV_ENV(vfnmadd_vv_h, 2, 2, clearh)
-GEN_VEXT_VV_ENV(vfnmadd_vv_w, 4, 4, clearl)
-GEN_VEXT_VV_ENV(vfnmadd_vv_d, 8, 8, clearq)
+GEN_VEXT_VV_ENV(vfnmadd_vv_h, 2, 2)
+GEN_VEXT_VV_ENV(vfnmadd_vv_w, 4, 4)
+GEN_VEXT_VV_ENV(vfnmadd_vv_d, 8, 8)
 RVVCALL(OPFVF3, vfnmadd_vf_h, OP_UUU_H, H2, H2, fnmadd16)
 RVVCALL(OPFVF3, vfnmadd_vf_w, OP_UUU_W, H4, H4, fnmadd32)
 RVVCALL(OPFVF3, vfnmadd_vf_d, OP_UUU_D, H8, H8, fnmadd64)
-GEN_VEXT_VF(vfnmadd_vf_h, 2, 2, clearh)
-GEN_VEXT_VF(vfnmadd_vf_w, 4, 4, clearl)
-GEN_VEXT_VF(vfnmadd_vf_d, 8, 8, clearq)
+GEN_VEXT_VF(vfnmadd_vf_h, 2, 2)
+GEN_VEXT_VF(vfnmadd_vf_w, 4, 4)
+GEN_VEXT_VF(vfnmadd_vf_d, 8, 8)
=20
 static uint16_t fmsub16(uint16_t a, uint16_t b, uint16_t d, float_status=
 *s)
 {
@@ -3634,15 +3515,15 @@ static uint64_t fmsub64(uint64_t a, uint64_t b, u=
int64_t d, float_status *s)
 RVVCALL(OPFVV3, vfmsub_vv_h, OP_UUU_H, H2, H2, H2, fmsub16)
 RVVCALL(OPFVV3, vfmsub_vv_w, OP_UUU_W, H4, H4, H4, fmsub32)
 RVVCALL(OPFVV3, vfmsub_vv_d, OP_UUU_D, H8, H8, H8, fmsub64)
-GEN_VEXT_VV_ENV(vfmsub_vv_h, 2, 2, clearh)
-GEN_VEXT_VV_ENV(vfmsub_vv_w, 4, 4, clearl)
-GEN_VEXT_VV_ENV(vfmsub_vv_d, 8, 8, clearq)
+GEN_VEXT_VV_ENV(vfmsub_vv_h, 2, 2)
+GEN_VEXT_VV_ENV(vfmsub_vv_w, 4, 4)
+GEN_VEXT_VV_ENV(vfmsub_vv_d, 8, 8)
 RVVCALL(OPFVF3, vfmsub_vf_h, OP_UUU_H, H2, H2, fmsub16)
 RVVCALL(OPFVF3, vfmsub_vf_w, OP_UUU_W, H4, H4, fmsub32)
 RVVCALL(OPFVF3, vfmsub_vf_d, OP_UUU_D, H8, H8, fmsub64)
-GEN_VEXT_VF(vfmsub_vf_h, 2, 2, clearh)
-GEN_VEXT_VF(vfmsub_vf_w, 4, 4, clearl)
-GEN_VEXT_VF(vfmsub_vf_d, 8, 8, clearq)
+GEN_VEXT_VF(vfmsub_vf_h, 2, 2)
+GEN_VEXT_VF(vfmsub_vf_w, 4, 4)
+GEN_VEXT_VF(vfmsub_vf_d, 8, 8)
=20
 static uint16_t fnmsub16(uint16_t a, uint16_t b, uint16_t d, float_statu=
s *s)
 {
@@ -3662,15 +3543,15 @@ static uint64_t fnmsub64(uint64_t a, uint64_t b, =
uint64_t d, float_status *s)
 RVVCALL(OPFVV3, vfnmsub_vv_h, OP_UUU_H, H2, H2, H2, fnmsub16)
 RVVCALL(OPFVV3, vfnmsub_vv_w, OP_UUU_W, H4, H4, H4, fnmsub32)
 RVVCALL(OPFVV3, vfnmsub_vv_d, OP_UUU_D, H8, H8, H8, fnmsub64)
-GEN_VEXT_VV_ENV(vfnmsub_vv_h, 2, 2, clearh)
-GEN_VEXT_VV_ENV(vfnmsub_vv_w, 4, 4, clearl)
-GEN_VEXT_VV_ENV(vfnmsub_vv_d, 8, 8, clearq)
+GEN_VEXT_VV_ENV(vfnmsub_vv_h, 2, 2)
+GEN_VEXT_VV_ENV(vfnmsub_vv_w, 4, 4)
+GEN_VEXT_VV_ENV(vfnmsub_vv_d, 8, 8)
 RVVCALL(OPFVF3, vfnmsub_vf_h, OP_UUU_H, H2, H2, fnmsub16)
 RVVCALL(OPFVF3, vfnmsub_vf_w, OP_UUU_W, H4, H4, fnmsub32)
 RVVCALL(OPFVF3, vfnmsub_vf_d, OP_UUU_D, H8, H8, fnmsub64)
-GEN_VEXT_VF(vfnmsub_vf_h, 2, 2, clearh)
-GEN_VEXT_VF(vfnmsub_vf_w, 4, 4, clearl)
-GEN_VEXT_VF(vfnmsub_vf_d, 8, 8, clearq)
+GEN_VEXT_VF(vfnmsub_vf_h, 2, 2)
+GEN_VEXT_VF(vfnmsub_vf_w, 4, 4)
+GEN_VEXT_VF(vfnmsub_vf_d, 8, 8)
=20
 /* Vector Widening Floating-Point Fused Multiply-Add Instructions */
 static uint32_t fwmacc16(uint16_t a, uint16_t b, uint32_t d, float_statu=
s *s)
@@ -3687,12 +3568,12 @@ static uint64_t fwmacc32(uint32_t a, uint32_t b, =
uint64_t d, float_status *s)
=20
 RVVCALL(OPFVV3, vfwmacc_vv_h, WOP_UUU_H, H4, H2, H2, fwmacc16)
 RVVCALL(OPFVV3, vfwmacc_vv_w, WOP_UUU_W, H8, H4, H4, fwmacc32)
-GEN_VEXT_VV_ENV(vfwmacc_vv_h, 2, 4, clearl)
-GEN_VEXT_VV_ENV(vfwmacc_vv_w, 4, 8, clearq)
+GEN_VEXT_VV_ENV(vfwmacc_vv_h, 2, 4)
+GEN_VEXT_VV_ENV(vfwmacc_vv_w, 4, 8)
 RVVCALL(OPFVF3, vfwmacc_vf_h, WOP_UUU_H, H4, H2, fwmacc16)
 RVVCALL(OPFVF3, vfwmacc_vf_w, WOP_UUU_W, H8, H4, fwmacc32)
-GEN_VEXT_VF(vfwmacc_vf_h, 2, 4, clearl)
-GEN_VEXT_VF(vfwmacc_vf_w, 4, 8, clearq)
+GEN_VEXT_VF(vfwmacc_vf_h, 2, 4)
+GEN_VEXT_VF(vfwmacc_vf_w, 4, 8)
=20
 static uint32_t fwnmacc16(uint16_t a, uint16_t b, uint32_t d, float_stat=
us *s)
 {
@@ -3710,12 +3591,12 @@ static uint64_t fwnmacc32(uint32_t a, uint32_t b,=
 uint64_t d, float_status *s)
=20
 RVVCALL(OPFVV3, vfwnmacc_vv_h, WOP_UUU_H, H4, H2, H2, fwnmacc16)
 RVVCALL(OPFVV3, vfwnmacc_vv_w, WOP_UUU_W, H8, H4, H4, fwnmacc32)
-GEN_VEXT_VV_ENV(vfwnmacc_vv_h, 2, 4, clearl)
-GEN_VEXT_VV_ENV(vfwnmacc_vv_w, 4, 8, clearq)
+GEN_VEXT_VV_ENV(vfwnmacc_vv_h, 2, 4)
+GEN_VEXT_VV_ENV(vfwnmacc_vv_w, 4, 8)
 RVVCALL(OPFVF3, vfwnmacc_vf_h, WOP_UUU_H, H4, H2, fwnmacc16)
 RVVCALL(OPFVF3, vfwnmacc_vf_w, WOP_UUU_W, H8, H4, fwnmacc32)
-GEN_VEXT_VF(vfwnmacc_vf_h, 2, 4, clearl)
-GEN_VEXT_VF(vfwnmacc_vf_w, 4, 8, clearq)
+GEN_VEXT_VF(vfwnmacc_vf_h, 2, 4)
+GEN_VEXT_VF(vfwnmacc_vf_w, 4, 8)
=20
 static uint32_t fwmsac16(uint16_t a, uint16_t b, uint32_t d, float_statu=
s *s)
 {
@@ -3733,12 +3614,12 @@ static uint64_t fwmsac32(uint32_t a, uint32_t b, =
uint64_t d, float_status *s)
=20
 RVVCALL(OPFVV3, vfwmsac_vv_h, WOP_UUU_H, H4, H2, H2, fwmsac16)
 RVVCALL(OPFVV3, vfwmsac_vv_w, WOP_UUU_W, H8, H4, H4, fwmsac32)
-GEN_VEXT_VV_ENV(vfwmsac_vv_h, 2, 4, clearl)
-GEN_VEXT_VV_ENV(vfwmsac_vv_w, 4, 8, clearq)
+GEN_VEXT_VV_ENV(vfwmsac_vv_h, 2, 4)
+GEN_VEXT_VV_ENV(vfwmsac_vv_w, 4, 8)
 RVVCALL(OPFVF3, vfwmsac_vf_h, WOP_UUU_H, H4, H2, fwmsac16)
 RVVCALL(OPFVF3, vfwmsac_vf_w, WOP_UUU_W, H8, H4, fwmsac32)
-GEN_VEXT_VF(vfwmsac_vf_h, 2, 4, clearl)
-GEN_VEXT_VF(vfwmsac_vf_w, 4, 8, clearq)
+GEN_VEXT_VF(vfwmsac_vf_h, 2, 4)
+GEN_VEXT_VF(vfwmsac_vf_w, 4, 8)
=20
 static uint32_t fwnmsac16(uint16_t a, uint16_t b, uint32_t d, float_stat=
us *s)
 {
@@ -3756,12 +3637,12 @@ static uint64_t fwnmsac32(uint32_t a, uint32_t b,=
 uint64_t d, float_status *s)
=20
 RVVCALL(OPFVV3, vfwnmsac_vv_h, WOP_UUU_H, H4, H2, H2, fwnmsac16)
 RVVCALL(OPFVV3, vfwnmsac_vv_w, WOP_UUU_W, H8, H4, H4, fwnmsac32)
-GEN_VEXT_VV_ENV(vfwnmsac_vv_h, 2, 4, clearl)
-GEN_VEXT_VV_ENV(vfwnmsac_vv_w, 4, 8, clearq)
+GEN_VEXT_VV_ENV(vfwnmsac_vv_h, 2, 4)
+GEN_VEXT_VV_ENV(vfwnmsac_vv_w, 4, 8)
 RVVCALL(OPFVF3, vfwnmsac_vf_h, WOP_UUU_H, H4, H2, fwnmsac16)
 RVVCALL(OPFVF3, vfwnmsac_vf_w, WOP_UUU_W, H8, H4, fwnmsac32)
-GEN_VEXT_VF(vfwnmsac_vf_h, 2, 4, clearl)
-GEN_VEXT_VF(vfwnmsac_vf_w, 4, 8, clearq)
+GEN_VEXT_VF(vfwnmsac_vf_h, 2, 4)
+GEN_VEXT_VF(vfwnmsac_vf_w, 4, 8)
=20
 /* Vector Floating-Point Square-Root Instruction */
 /* (TD, T2, TX2) */
@@ -3777,11 +3658,10 @@ static void do_##NAME(void *vd, void *vs2, int i,=
      \
     *((TD *)vd + HD(i)) =3D OP(s2, &env->fp_status);     \
 }
=20
-#define GEN_VEXT_V_ENV(NAME, ESZ, DSZ, CLEAR_FN)       \
+#define GEN_VEXT_V_ENV(NAME, ESZ, DSZ)                 \
 void HELPER(NAME)(void *vd, void *v0, void *vs2,       \
         CPURISCVState *env, uint32_t desc)             \
 {                                                      \
-    uint32_t vlmax =3D vext_maxsz(desc) / ESZ;           \
     uint32_t vm =3D vext_vm(desc);                       \
     uint32_t vl =3D env->vl;                             \
     uint32_t i;                                        \
@@ -3795,42 +3675,41 @@ void HELPER(NAME)(void *vd, void *v0, void *vs2, =
      \
         }                                              \
         do_##NAME(vd, vs2, i, env);                    \
     }                                                  \
-    CLEAR_FN(vd, vl, vl * DSZ,  vlmax * DSZ);          \
 }
=20
 RVVCALL(OPFVV1, vfsqrt_v_h, OP_UU_H, H2, H2, float16_sqrt)
 RVVCALL(OPFVV1, vfsqrt_v_w, OP_UU_W, H4, H4, float32_sqrt)
 RVVCALL(OPFVV1, vfsqrt_v_d, OP_UU_D, H8, H8, float64_sqrt)
-GEN_VEXT_V_ENV(vfsqrt_v_h, 2, 2, clearh)
-GEN_VEXT_V_ENV(vfsqrt_v_w, 4, 4, clearl)
-GEN_VEXT_V_ENV(vfsqrt_v_d, 8, 8, clearq)
+GEN_VEXT_V_ENV(vfsqrt_v_h, 2, 2)
+GEN_VEXT_V_ENV(vfsqrt_v_w, 4, 4)
+GEN_VEXT_V_ENV(vfsqrt_v_d, 8, 8)
=20
 /* Vector Floating-Point MIN/MAX Instructions */
 RVVCALL(OPFVV2, vfmin_vv_h, OP_UUU_H, H2, H2, H2, float16_minnum)
 RVVCALL(OPFVV2, vfmin_vv_w, OP_UUU_W, H4, H4, H4, float32_minnum)
 RVVCALL(OPFVV2, vfmin_vv_d, OP_UUU_D, H8, H8, H8, float64_minnum)
-GEN_VEXT_VV_ENV(vfmin_vv_h, 2, 2, clearh)
-GEN_VEXT_VV_ENV(vfmin_vv_w, 4, 4, clearl)
-GEN_VEXT_VV_ENV(vfmin_vv_d, 8, 8, clearq)
+GEN_VEXT_VV_ENV(vfmin_vv_h, 2, 2)
+GEN_VEXT_VV_ENV(vfmin_vv_w, 4, 4)
+GEN_VEXT_VV_ENV(vfmin_vv_d, 8, 8)
 RVVCALL(OPFVF2, vfmin_vf_h, OP_UUU_H, H2, H2, float16_minnum)
 RVVCALL(OPFVF2, vfmin_vf_w, OP_UUU_W, H4, H4, float32_minnum)
 RVVCALL(OPFVF2, vfmin_vf_d, OP_UUU_D, H8, H8, float64_minnum)
-GEN_VEXT_VF(vfmin_vf_h, 2, 2, clearh)
-GEN_VEXT_VF(vfmin_vf_w, 4, 4, clearl)
-GEN_VEXT_VF(vfmin_vf_d, 8, 8, clearq)
+GEN_VEXT_VF(vfmin_vf_h, 2, 2)
+GEN_VEXT_VF(vfmin_vf_w, 4, 4)
+GEN_VEXT_VF(vfmin_vf_d, 8, 8)
=20
 RVVCALL(OPFVV2, vfmax_vv_h, OP_UUU_H, H2, H2, H2, float16_maxnum)
 RVVCALL(OPFVV2, vfmax_vv_w, OP_UUU_W, H4, H4, H4, float32_maxnum)
 RVVCALL(OPFVV2, vfmax_vv_d, OP_UUU_D, H8, H8, H8, float64_maxnum)
-GEN_VEXT_VV_ENV(vfmax_vv_h, 2, 2, clearh)
-GEN_VEXT_VV_ENV(vfmax_vv_w, 4, 4, clearl)
-GEN_VEXT_VV_ENV(vfmax_vv_d, 8, 8, clearq)
+GEN_VEXT_VV_ENV(vfmax_vv_h, 2, 2)
+GEN_VEXT_VV_ENV(vfmax_vv_w, 4, 4)
+GEN_VEXT_VV_ENV(vfmax_vv_d, 8, 8)
 RVVCALL(OPFVF2, vfmax_vf_h, OP_UUU_H, H2, H2, float16_maxnum)
 RVVCALL(OPFVF2, vfmax_vf_w, OP_UUU_W, H4, H4, float32_maxnum)
 RVVCALL(OPFVF2, vfmax_vf_d, OP_UUU_D, H8, H8, float64_maxnum)
-GEN_VEXT_VF(vfmax_vf_h, 2, 2, clearh)
-GEN_VEXT_VF(vfmax_vf_w, 4, 4, clearl)
-GEN_VEXT_VF(vfmax_vf_d, 8, 8, clearq)
+GEN_VEXT_VF(vfmax_vf_h, 2, 2)
+GEN_VEXT_VF(vfmax_vf_w, 4, 4)
+GEN_VEXT_VF(vfmax_vf_d, 8, 8)
=20
 /* Vector Floating-Point Sign-Injection Instructions */
 static uint16_t fsgnj16(uint16_t a, uint16_t b, float_status *s)
@@ -3851,15 +3730,15 @@ static uint64_t fsgnj64(uint64_t a, uint64_t b, f=
loat_status *s)
 RVVCALL(OPFVV2, vfsgnj_vv_h, OP_UUU_H, H2, H2, H2, fsgnj16)
 RVVCALL(OPFVV2, vfsgnj_vv_w, OP_UUU_W, H4, H4, H4, fsgnj32)
 RVVCALL(OPFVV2, vfsgnj_vv_d, OP_UUU_D, H8, H8, H8, fsgnj64)
-GEN_VEXT_VV_ENV(vfsgnj_vv_h, 2, 2, clearh)
-GEN_VEXT_VV_ENV(vfsgnj_vv_w, 4, 4, clearl)
-GEN_VEXT_VV_ENV(vfsgnj_vv_d, 8, 8, clearq)
+GEN_VEXT_VV_ENV(vfsgnj_vv_h, 2, 2)
+GEN_VEXT_VV_ENV(vfsgnj_vv_w, 4, 4)
+GEN_VEXT_VV_ENV(vfsgnj_vv_d, 8, 8)
 RVVCALL(OPFVF2, vfsgnj_vf_h, OP_UUU_H, H2, H2, fsgnj16)
 RVVCALL(OPFVF2, vfsgnj_vf_w, OP_UUU_W, H4, H4, fsgnj32)
 RVVCALL(OPFVF2, vfsgnj_vf_d, OP_UUU_D, H8, H8, fsgnj64)
-GEN_VEXT_VF(vfsgnj_vf_h, 2, 2, clearh)
-GEN_VEXT_VF(vfsgnj_vf_w, 4, 4, clearl)
-GEN_VEXT_VF(vfsgnj_vf_d, 8, 8, clearq)
+GEN_VEXT_VF(vfsgnj_vf_h, 2, 2)
+GEN_VEXT_VF(vfsgnj_vf_w, 4, 4)
+GEN_VEXT_VF(vfsgnj_vf_d, 8, 8)
=20
 static uint16_t fsgnjn16(uint16_t a, uint16_t b, float_status *s)
 {
@@ -3879,15 +3758,15 @@ static uint64_t fsgnjn64(uint64_t a, uint64_t b, =
float_status *s)
 RVVCALL(OPFVV2, vfsgnjn_vv_h, OP_UUU_H, H2, H2, H2, fsgnjn16)
 RVVCALL(OPFVV2, vfsgnjn_vv_w, OP_UUU_W, H4, H4, H4, fsgnjn32)
 RVVCALL(OPFVV2, vfsgnjn_vv_d, OP_UUU_D, H8, H8, H8, fsgnjn64)
-GEN_VEXT_VV_ENV(vfsgnjn_vv_h, 2, 2, clearh)
-GEN_VEXT_VV_ENV(vfsgnjn_vv_w, 4, 4, clearl)
-GEN_VEXT_VV_ENV(vfsgnjn_vv_d, 8, 8, clearq)
+GEN_VEXT_VV_ENV(vfsgnjn_vv_h, 2, 2)
+GEN_VEXT_VV_ENV(vfsgnjn_vv_w, 4, 4)
+GEN_VEXT_VV_ENV(vfsgnjn_vv_d, 8, 8)
 RVVCALL(OPFVF2, vfsgnjn_vf_h, OP_UUU_H, H2, H2, fsgnjn16)
 RVVCALL(OPFVF2, vfsgnjn_vf_w, OP_UUU_W, H4, H4, fsgnjn32)
 RVVCALL(OPFVF2, vfsgnjn_vf_d, OP_UUU_D, H8, H8, fsgnjn64)
-GEN_VEXT_VF(vfsgnjn_vf_h, 2, 2, clearh)
-GEN_VEXT_VF(vfsgnjn_vf_w, 4, 4, clearl)
-GEN_VEXT_VF(vfsgnjn_vf_d, 8, 8, clearq)
+GEN_VEXT_VF(vfsgnjn_vf_h, 2, 2)
+GEN_VEXT_VF(vfsgnjn_vf_w, 4, 4)
+GEN_VEXT_VF(vfsgnjn_vf_d, 8, 8)
=20
 static uint16_t fsgnjx16(uint16_t a, uint16_t b, float_status *s)
 {
@@ -3907,15 +3786,15 @@ static uint64_t fsgnjx64(uint64_t a, uint64_t b, =
float_status *s)
 RVVCALL(OPFVV2, vfsgnjx_vv_h, OP_UUU_H, H2, H2, H2, fsgnjx16)
 RVVCALL(OPFVV2, vfsgnjx_vv_w, OP_UUU_W, H4, H4, H4, fsgnjx32)
 RVVCALL(OPFVV2, vfsgnjx_vv_d, OP_UUU_D, H8, H8, H8, fsgnjx64)
-GEN_VEXT_VV_ENV(vfsgnjx_vv_h, 2, 2, clearh)
-GEN_VEXT_VV_ENV(vfsgnjx_vv_w, 4, 4, clearl)
-GEN_VEXT_VV_ENV(vfsgnjx_vv_d, 8, 8, clearq)
+GEN_VEXT_VV_ENV(vfsgnjx_vv_h, 2, 2)
+GEN_VEXT_VV_ENV(vfsgnjx_vv_w, 4, 4)
+GEN_VEXT_VV_ENV(vfsgnjx_vv_d, 8, 8)
 RVVCALL(OPFVF2, vfsgnjx_vf_h, OP_UUU_H, H2, H2, fsgnjx16)
 RVVCALL(OPFVF2, vfsgnjx_vf_w, OP_UUU_W, H4, H4, fsgnjx32)
 RVVCALL(OPFVF2, vfsgnjx_vf_d, OP_UUU_D, H8, H8, fsgnjx64)
-GEN_VEXT_VF(vfsgnjx_vf_h, 2, 2, clearh)
-GEN_VEXT_VF(vfsgnjx_vf_w, 4, 4, clearl)
-GEN_VEXT_VF(vfsgnjx_vf_d, 8, 8, clearq)
+GEN_VEXT_VF(vfsgnjx_vf_h, 2, 2)
+GEN_VEXT_VF(vfsgnjx_vf_w, 4, 4)
+GEN_VEXT_VF(vfsgnjx_vf_d, 8, 8)
=20
 /* Vector Floating-Point Compare Instructions */
 #define GEN_VEXT_CMP_VV_ENV(NAME, ETYPE, H, DO_OP)            \
@@ -4072,11 +3951,10 @@ static void do_##NAME(void *vd, void *vs2, int i)=
      \
     *((TD *)vd + HD(i)) =3D OP(s2);                      \
 }
=20
-#define GEN_VEXT_V(NAME, ESZ, DSZ, CLEAR_FN)           \
+#define GEN_VEXT_V(NAME, ESZ, DSZ)                     \
 void HELPER(NAME)(void *vd, void *v0, void *vs2,       \
                   CPURISCVState *env, uint32_t desc)   \
 {                                                      \
-    uint32_t vlmax =3D vext_maxsz(desc) / ESZ;           \
     uint32_t vm =3D vext_vm(desc);                       \
     uint32_t vl =3D env->vl;                             \
     uint32_t i;                                        \
@@ -4087,7 +3965,6 @@ void HELPER(NAME)(void *vd, void *v0, void *vs2,   =
    \
         }                                              \
         do_##NAME(vd, vs2, i);                         \
     }                                                  \
-    CLEAR_FN(vd, vl, vl * DSZ,  vlmax * DSZ);          \
 }
=20
 target_ulong fclass_h(uint64_t frs1)
@@ -4150,19 +4027,17 @@ target_ulong fclass_d(uint64_t frs1)
 RVVCALL(OPIVV1, vfclass_v_h, OP_UU_H, H2, H2, fclass_h)
 RVVCALL(OPIVV1, vfclass_v_w, OP_UU_W, H4, H4, fclass_s)
 RVVCALL(OPIVV1, vfclass_v_d, OP_UU_D, H8, H8, fclass_d)
-GEN_VEXT_V(vfclass_v_h, 2, 2, clearh)
-GEN_VEXT_V(vfclass_v_w, 4, 4, clearl)
-GEN_VEXT_V(vfclass_v_d, 8, 8, clearq)
+GEN_VEXT_V(vfclass_v_h, 2, 2)
+GEN_VEXT_V(vfclass_v_w, 4, 4)
+GEN_VEXT_V(vfclass_v_d, 8, 8)
=20
 /* Vector Floating-Point Merge Instruction */
-#define GEN_VFMERGE_VF(NAME, ETYPE, H, CLEAR_FN)              \
+#define GEN_VFMERGE_VF(NAME, ETYPE, H)                        \
 void HELPER(NAME)(void *vd, void *v0, uint64_t s1, void *vs2, \
                   CPURISCVState *env, uint32_t desc)          \
 {                                                             \
     uint32_t vm =3D vext_vm(desc);                              \
     uint32_t vl =3D env->vl;                                    \
-    uint32_t esz =3D sizeof(ETYPE);                             \
-    uint32_t vlmax =3D vext_maxsz(desc) / esz;                  \
     uint32_t i;                                               \
                                                               \
     for (i =3D 0; i < vl; i++) {                                \
@@ -4170,45 +4045,44 @@ void HELPER(NAME)(void *vd, void *v0, uint64_t s1=
, void *vs2, \
         *((ETYPE *)vd + H(i))                                 \
           =3D (!vm && !vext_elem_mask(v0, i) ? s2 : s1);        \
     }                                                         \
-    CLEAR_FN(vd, vl, vl * esz, vlmax * esz);                  \
 }
=20
-GEN_VFMERGE_VF(vfmerge_vfm_h, int16_t, H2, clearh)
-GEN_VFMERGE_VF(vfmerge_vfm_w, int32_t, H4, clearl)
-GEN_VFMERGE_VF(vfmerge_vfm_d, int64_t, H8, clearq)
+GEN_VFMERGE_VF(vfmerge_vfm_h, int16_t, H2)
+GEN_VFMERGE_VF(vfmerge_vfm_w, int32_t, H4)
+GEN_VFMERGE_VF(vfmerge_vfm_d, int64_t, H8)
=20
 /* Single-Width Floating-Point/Integer Type-Convert Instructions */
 /* vfcvt.xu.f.v vd, vs2, vm # Convert float to unsigned integer. */
 RVVCALL(OPFVV1, vfcvt_xu_f_v_h, OP_UU_H, H2, H2, float16_to_uint16)
 RVVCALL(OPFVV1, vfcvt_xu_f_v_w, OP_UU_W, H4, H4, float32_to_uint32)
 RVVCALL(OPFVV1, vfcvt_xu_f_v_d, OP_UU_D, H8, H8, float64_to_uint64)
-GEN_VEXT_V_ENV(vfcvt_xu_f_v_h, 2, 2, clearh)
-GEN_VEXT_V_ENV(vfcvt_xu_f_v_w, 4, 4, clearl)
-GEN_VEXT_V_ENV(vfcvt_xu_f_v_d, 8, 8, clearq)
+GEN_VEXT_V_ENV(vfcvt_xu_f_v_h, 2, 2)
+GEN_VEXT_V_ENV(vfcvt_xu_f_v_w, 4, 4)
+GEN_VEXT_V_ENV(vfcvt_xu_f_v_d, 8, 8)
=20
 /* vfcvt.x.f.v vd, vs2, vm # Convert float to signed integer. */
 RVVCALL(OPFVV1, vfcvt_x_f_v_h, OP_UU_H, H2, H2, float16_to_int16)
 RVVCALL(OPFVV1, vfcvt_x_f_v_w, OP_UU_W, H4, H4, float32_to_int32)
 RVVCALL(OPFVV1, vfcvt_x_f_v_d, OP_UU_D, H8, H8, float64_to_int64)
-GEN_VEXT_V_ENV(vfcvt_x_f_v_h, 2, 2, clearh)
-GEN_VEXT_V_ENV(vfcvt_x_f_v_w, 4, 4, clearl)
-GEN_VEXT_V_ENV(vfcvt_x_f_v_d, 8, 8, clearq)
+GEN_VEXT_V_ENV(vfcvt_x_f_v_h, 2, 2)
+GEN_VEXT_V_ENV(vfcvt_x_f_v_w, 4, 4)
+GEN_VEXT_V_ENV(vfcvt_x_f_v_d, 8, 8)
=20
 /* vfcvt.f.xu.v vd, vs2, vm # Convert unsigned integer to float. */
 RVVCALL(OPFVV1, vfcvt_f_xu_v_h, OP_UU_H, H2, H2, uint16_to_float16)
 RVVCALL(OPFVV1, vfcvt_f_xu_v_w, OP_UU_W, H4, H4, uint32_to_float32)
 RVVCALL(OPFVV1, vfcvt_f_xu_v_d, OP_UU_D, H8, H8, uint64_to_float64)
-GEN_VEXT_V_ENV(vfcvt_f_xu_v_h, 2, 2, clearh)
-GEN_VEXT_V_ENV(vfcvt_f_xu_v_w, 4, 4, clearl)
-GEN_VEXT_V_ENV(vfcvt_f_xu_v_d, 8, 8, clearq)
+GEN_VEXT_V_ENV(vfcvt_f_xu_v_h, 2, 2)
+GEN_VEXT_V_ENV(vfcvt_f_xu_v_w, 4, 4)
+GEN_VEXT_V_ENV(vfcvt_f_xu_v_d, 8, 8)
=20
 /* vfcvt.f.x.v vd, vs2, vm # Convert integer to float. */
 RVVCALL(OPFVV1, vfcvt_f_x_v_h, OP_UU_H, H2, H2, int16_to_float16)
 RVVCALL(OPFVV1, vfcvt_f_x_v_w, OP_UU_W, H4, H4, int32_to_float32)
 RVVCALL(OPFVV1, vfcvt_f_x_v_d, OP_UU_D, H8, H8, int64_to_float64)
-GEN_VEXT_V_ENV(vfcvt_f_x_v_h, 2, 2, clearh)
-GEN_VEXT_V_ENV(vfcvt_f_x_v_w, 4, 4, clearl)
-GEN_VEXT_V_ENV(vfcvt_f_x_v_d, 8, 8, clearq)
+GEN_VEXT_V_ENV(vfcvt_f_x_v_h, 2, 2)
+GEN_VEXT_V_ENV(vfcvt_f_x_v_w, 4, 4)
+GEN_VEXT_V_ENV(vfcvt_f_x_v_d, 8, 8)
=20
 /* Widening Floating-Point/Integer Type-Convert Instructions */
 /* (TD, T2, TX2) */
@@ -4217,26 +4091,26 @@ GEN_VEXT_V_ENV(vfcvt_f_x_v_d, 8, 8, clearq)
 /* vfwcvt.xu.f.v vd, vs2, vm # Convert float to double-width unsigned in=
teger.*/
 RVVCALL(OPFVV1, vfwcvt_xu_f_v_h, WOP_UU_H, H4, H2, float16_to_uint32)
 RVVCALL(OPFVV1, vfwcvt_xu_f_v_w, WOP_UU_W, H8, H4, float32_to_uint64)
-GEN_VEXT_V_ENV(vfwcvt_xu_f_v_h, 2, 4, clearl)
-GEN_VEXT_V_ENV(vfwcvt_xu_f_v_w, 4, 8, clearq)
+GEN_VEXT_V_ENV(vfwcvt_xu_f_v_h, 2, 4)
+GEN_VEXT_V_ENV(vfwcvt_xu_f_v_w, 4, 8)
=20
 /* vfwcvt.x.f.v vd, vs2, vm # Convert float to double-width signed integ=
er. */
 RVVCALL(OPFVV1, vfwcvt_x_f_v_h, WOP_UU_H, H4, H2, float16_to_int32)
 RVVCALL(OPFVV1, vfwcvt_x_f_v_w, WOP_UU_W, H8, H4, float32_to_int64)
-GEN_VEXT_V_ENV(vfwcvt_x_f_v_h, 2, 4, clearl)
-GEN_VEXT_V_ENV(vfwcvt_x_f_v_w, 4, 8, clearq)
+GEN_VEXT_V_ENV(vfwcvt_x_f_v_h, 2, 4)
+GEN_VEXT_V_ENV(vfwcvt_x_f_v_w, 4, 8)
=20
 /* vfwcvt.f.xu.v vd, vs2, vm # Convert unsigned integer to double-width =
float */
 RVVCALL(OPFVV1, vfwcvt_f_xu_v_h, WOP_UU_H, H4, H2, uint16_to_float32)
 RVVCALL(OPFVV1, vfwcvt_f_xu_v_w, WOP_UU_W, H8, H4, uint32_to_float64)
-GEN_VEXT_V_ENV(vfwcvt_f_xu_v_h, 2, 4, clearl)
-GEN_VEXT_V_ENV(vfwcvt_f_xu_v_w, 4, 8, clearq)
+GEN_VEXT_V_ENV(vfwcvt_f_xu_v_h, 2, 4)
+GEN_VEXT_V_ENV(vfwcvt_f_xu_v_w, 4, 8)
=20
 /* vfwcvt.f.x.v vd, vs2, vm # Convert integer to double-width float. */
 RVVCALL(OPFVV1, vfwcvt_f_x_v_h, WOP_UU_H, H4, H2, int16_to_float32)
 RVVCALL(OPFVV1, vfwcvt_f_x_v_w, WOP_UU_W, H8, H4, int32_to_float64)
-GEN_VEXT_V_ENV(vfwcvt_f_x_v_h, 2, 4, clearl)
-GEN_VEXT_V_ENV(vfwcvt_f_x_v_w, 4, 8, clearq)
+GEN_VEXT_V_ENV(vfwcvt_f_x_v_h, 2, 4)
+GEN_VEXT_V_ENV(vfwcvt_f_x_v_w, 4, 8)
=20
 /*
  * vfwcvt.f.f.v vd, vs2, vm #
@@ -4249,8 +4123,8 @@ static uint32_t vfwcvtffv16(uint16_t a, float_statu=
s *s)
=20
 RVVCALL(OPFVV1, vfwcvt_f_f_v_h, WOP_UU_H, H4, H2, vfwcvtffv16)
 RVVCALL(OPFVV1, vfwcvt_f_f_v_w, WOP_UU_W, H8, H4, float32_to_float64)
-GEN_VEXT_V_ENV(vfwcvt_f_f_v_h, 2, 4, clearl)
-GEN_VEXT_V_ENV(vfwcvt_f_f_v_w, 4, 8, clearq)
+GEN_VEXT_V_ENV(vfwcvt_f_f_v_h, 2, 4)
+GEN_VEXT_V_ENV(vfwcvt_f_f_v_w, 4, 8)
=20
 /* Narrowing Floating-Point/Integer Type-Convert Instructions */
 /* (TD, T2, TX2) */
@@ -4259,26 +4133,26 @@ GEN_VEXT_V_ENV(vfwcvt_f_f_v_w, 4, 8, clearq)
 /* vfncvt.xu.f.v vd, vs2, vm # Convert float to unsigned integer. */
 RVVCALL(OPFVV1, vfncvt_xu_f_v_h, NOP_UU_H, H2, H4, float32_to_uint16)
 RVVCALL(OPFVV1, vfncvt_xu_f_v_w, NOP_UU_W, H4, H8, float64_to_uint32)
-GEN_VEXT_V_ENV(vfncvt_xu_f_v_h, 2, 2, clearh)
-GEN_VEXT_V_ENV(vfncvt_xu_f_v_w, 4, 4, clearl)
+GEN_VEXT_V_ENV(vfncvt_xu_f_v_h, 2, 2)
+GEN_VEXT_V_ENV(vfncvt_xu_f_v_w, 4, 4)
=20
 /* vfncvt.x.f.v vd, vs2, vm # Convert double-width float to signed integ=
er. */
 RVVCALL(OPFVV1, vfncvt_x_f_v_h, NOP_UU_H, H2, H4, float32_to_int16)
 RVVCALL(OPFVV1, vfncvt_x_f_v_w, NOP_UU_W, H4, H8, float64_to_int32)
-GEN_VEXT_V_ENV(vfncvt_x_f_v_h, 2, 2, clearh)
-GEN_VEXT_V_ENV(vfncvt_x_f_v_w, 4, 4, clearl)
+GEN_VEXT_V_ENV(vfncvt_x_f_v_h, 2, 2)
+GEN_VEXT_V_ENV(vfncvt_x_f_v_w, 4, 4)
=20
 /* vfncvt.f.xu.v vd, vs2, vm # Convert double-width unsigned integer to =
float */
 RVVCALL(OPFVV1, vfncvt_f_xu_v_h, NOP_UU_H, H2, H4, uint32_to_float16)
 RVVCALL(OPFVV1, vfncvt_f_xu_v_w, NOP_UU_W, H4, H8, uint64_to_float32)
-GEN_VEXT_V_ENV(vfncvt_f_xu_v_h, 2, 2, clearh)
-GEN_VEXT_V_ENV(vfncvt_f_xu_v_w, 4, 4, clearl)
+GEN_VEXT_V_ENV(vfncvt_f_xu_v_h, 2, 2)
+GEN_VEXT_V_ENV(vfncvt_f_xu_v_w, 4, 4)
=20
 /* vfncvt.f.x.v vd, vs2, vm # Convert double-width integer to float. */
 RVVCALL(OPFVV1, vfncvt_f_x_v_h, NOP_UU_H, H2, H4, int32_to_float16)
 RVVCALL(OPFVV1, vfncvt_f_x_v_w, NOP_UU_W, H4, H8, int64_to_float32)
-GEN_VEXT_V_ENV(vfncvt_f_x_v_h, 2, 2, clearh)
-GEN_VEXT_V_ENV(vfncvt_f_x_v_w, 4, 4, clearl)
+GEN_VEXT_V_ENV(vfncvt_f_x_v_h, 2, 2)
+GEN_VEXT_V_ENV(vfncvt_f_x_v_w, 4, 4)
=20
 /* vfncvt.f.f.v vd, vs2, vm # Convert double float to single-width float=
. */
 static uint16_t vfncvtffv16(uint32_t a, float_status *s)
@@ -4288,21 +4162,20 @@ static uint16_t vfncvtffv16(uint32_t a, float_sta=
tus *s)
=20
 RVVCALL(OPFVV1, vfncvt_f_f_v_h, NOP_UU_H, H2, H4, vfncvtffv16)
 RVVCALL(OPFVV1, vfncvt_f_f_v_w, NOP_UU_W, H4, H8, float64_to_float32)
-GEN_VEXT_V_ENV(vfncvt_f_f_v_h, 2, 2, clearh)
-GEN_VEXT_V_ENV(vfncvt_f_f_v_w, 4, 4, clearl)
+GEN_VEXT_V_ENV(vfncvt_f_f_v_h, 2, 2)
+GEN_VEXT_V_ENV(vfncvt_f_f_v_w, 4, 4)
=20
 /*
  *** Vector Reduction Operations
  */
 /* Vector Single-Width Integer Reduction Instructions */
-#define GEN_VEXT_RED(NAME, TD, TS2, HD, HS2, OP, CLEAR_FN)\
+#define GEN_VEXT_RED(NAME, TD, TS2, HD, HS2, OP)          \
 void HELPER(NAME)(void *vd, void *v0, void *vs1,          \
         void *vs2, CPURISCVState *env, uint32_t desc)     \
 {                                                         \
     uint32_t vm =3D vext_vm(desc);                          \
     uint32_t vl =3D env->vl;                                \
     uint32_t i;                                           \
-    uint32_t tot =3D env_archcpu(env)->cfg.vlen / 8;        \
     TD s1 =3D  *((TD *)vs1 + HD(0));                        \
                                                           \
     for (i =3D 0; i < vl; i++) {                            \
@@ -4313,70 +4186,69 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, =
         \
         s1 =3D OP(s1, (TD)s2);                              \
     }                                                     \
     *((TD *)vd + HD(0)) =3D s1;                             \
-    CLEAR_FN(vd, 1, sizeof(TD), tot);                     \
 }
=20
 /* vd[0] =3D sum(vs1[0], vs2[*]) */
-GEN_VEXT_RED(vredsum_vs_b, int8_t, int8_t, H1, H1, DO_ADD, clearb)
-GEN_VEXT_RED(vredsum_vs_h, int16_t, int16_t, H2, H2, DO_ADD, clearh)
-GEN_VEXT_RED(vredsum_vs_w, int32_t, int32_t, H4, H4, DO_ADD, clearl)
-GEN_VEXT_RED(vredsum_vs_d, int64_t, int64_t, H8, H8, DO_ADD, clearq)
+GEN_VEXT_RED(vredsum_vs_b, int8_t,  int8_t,  H1, H1, DO_ADD)
+GEN_VEXT_RED(vredsum_vs_h, int16_t, int16_t, H2, H2, DO_ADD)
+GEN_VEXT_RED(vredsum_vs_w, int32_t, int32_t, H4, H4, DO_ADD)
+GEN_VEXT_RED(vredsum_vs_d, int64_t, int64_t, H8, H8, DO_ADD)
=20
 /* vd[0] =3D maxu(vs1[0], vs2[*]) */
-GEN_VEXT_RED(vredmaxu_vs_b, uint8_t, uint8_t, H1, H1, DO_MAX, clearb)
-GEN_VEXT_RED(vredmaxu_vs_h, uint16_t, uint16_t, H2, H2, DO_MAX, clearh)
-GEN_VEXT_RED(vredmaxu_vs_w, uint32_t, uint32_t, H4, H4, DO_MAX, clearl)
-GEN_VEXT_RED(vredmaxu_vs_d, uint64_t, uint64_t, H8, H8, DO_MAX, clearq)
+GEN_VEXT_RED(vredmaxu_vs_b, uint8_t,  uint8_t,  H1, H1, DO_MAX)
+GEN_VEXT_RED(vredmaxu_vs_h, uint16_t, uint16_t, H2, H2, DO_MAX)
+GEN_VEXT_RED(vredmaxu_vs_w, uint32_t, uint32_t, H4, H4, DO_MAX)
+GEN_VEXT_RED(vredmaxu_vs_d, uint64_t, uint64_t, H8, H8, DO_MAX)
=20
 /* vd[0] =3D max(vs1[0], vs2[*]) */
-GEN_VEXT_RED(vredmax_vs_b, int8_t, int8_t, H1, H1, DO_MAX, clearb)
-GEN_VEXT_RED(vredmax_vs_h, int16_t, int16_t, H2, H2, DO_MAX, clearh)
-GEN_VEXT_RED(vredmax_vs_w, int32_t, int32_t, H4, H4, DO_MAX, clearl)
-GEN_VEXT_RED(vredmax_vs_d, int64_t, int64_t, H8, H8, DO_MAX, clearq)
+GEN_VEXT_RED(vredmax_vs_b, int8_t,  int8_t,  H1, H1, DO_MAX)
+GEN_VEXT_RED(vredmax_vs_h, int16_t, int16_t, H2, H2, DO_MAX)
+GEN_VEXT_RED(vredmax_vs_w, int32_t, int32_t, H4, H4, DO_MAX)
+GEN_VEXT_RED(vredmax_vs_d, int64_t, int64_t, H8, H8, DO_MAX)
=20
 /* vd[0] =3D minu(vs1[0], vs2[*]) */
-GEN_VEXT_RED(vredminu_vs_b, uint8_t, uint8_t, H1, H1, DO_MIN, clearb)
-GEN_VEXT_RED(vredminu_vs_h, uint16_t, uint16_t, H2, H2, DO_MIN, clearh)
-GEN_VEXT_RED(vredminu_vs_w, uint32_t, uint32_t, H4, H4, DO_MIN, clearl)
-GEN_VEXT_RED(vredminu_vs_d, uint64_t, uint64_t, H8, H8, DO_MIN, clearq)
+GEN_VEXT_RED(vredminu_vs_b, uint8_t,  uint8_t,  H1, H1, DO_MIN)
+GEN_VEXT_RED(vredminu_vs_h, uint16_t, uint16_t, H2, H2, DO_MIN)
+GEN_VEXT_RED(vredminu_vs_w, uint32_t, uint32_t, H4, H4, DO_MIN)
+GEN_VEXT_RED(vredminu_vs_d, uint64_t, uint64_t, H8, H8, DO_MIN)
=20
 /* vd[0] =3D min(vs1[0], vs2[*]) */
-GEN_VEXT_RED(vredmin_vs_b, int8_t, int8_t, H1, H1, DO_MIN, clearb)
-GEN_VEXT_RED(vredmin_vs_h, int16_t, int16_t, H2, H2, DO_MIN, clearh)
-GEN_VEXT_RED(vredmin_vs_w, int32_t, int32_t, H4, H4, DO_MIN, clearl)
-GEN_VEXT_RED(vredmin_vs_d, int64_t, int64_t, H8, H8, DO_MIN, clearq)
+GEN_VEXT_RED(vredmin_vs_b, int8_t,  int8_t,  H1, H1, DO_MIN)
+GEN_VEXT_RED(vredmin_vs_h, int16_t, int16_t, H2, H2, DO_MIN)
+GEN_VEXT_RED(vredmin_vs_w, int32_t, int32_t, H4, H4, DO_MIN)
+GEN_VEXT_RED(vredmin_vs_d, int64_t, int64_t, H8, H8, DO_MIN)
=20
 /* vd[0] =3D and(vs1[0], vs2[*]) */
-GEN_VEXT_RED(vredand_vs_b, int8_t, int8_t, H1, H1, DO_AND, clearb)
-GEN_VEXT_RED(vredand_vs_h, int16_t, int16_t, H2, H2, DO_AND, clearh)
-GEN_VEXT_RED(vredand_vs_w, int32_t, int32_t, H4, H4, DO_AND, clearl)
-GEN_VEXT_RED(vredand_vs_d, int64_t, int64_t, H8, H8, DO_AND, clearq)
+GEN_VEXT_RED(vredand_vs_b, int8_t,  int8_t,  H1, H1, DO_AND)
+GEN_VEXT_RED(vredand_vs_h, int16_t, int16_t, H2, H2, DO_AND)
+GEN_VEXT_RED(vredand_vs_w, int32_t, int32_t, H4, H4, DO_AND)
+GEN_VEXT_RED(vredand_vs_d, int64_t, int64_t, H8, H8, DO_AND)
=20
 /* vd[0] =3D or(vs1[0], vs2[*]) */
-GEN_VEXT_RED(vredor_vs_b, int8_t, int8_t, H1, H1, DO_OR, clearb)
-GEN_VEXT_RED(vredor_vs_h, int16_t, int16_t, H2, H2, DO_OR, clearh)
-GEN_VEXT_RED(vredor_vs_w, int32_t, int32_t, H4, H4, DO_OR, clearl)
-GEN_VEXT_RED(vredor_vs_d, int64_t, int64_t, H8, H8, DO_OR, clearq)
+GEN_VEXT_RED(vredor_vs_b, int8_t,  int8_t,  H1, H1, DO_OR)
+GEN_VEXT_RED(vredor_vs_h, int16_t, int16_t, H2, H2, DO_OR)
+GEN_VEXT_RED(vredor_vs_w, int32_t, int32_t, H4, H4, DO_OR)
+GEN_VEXT_RED(vredor_vs_d, int64_t, int64_t, H8, H8, DO_OR)
=20
 /* vd[0] =3D xor(vs1[0], vs2[*]) */
-GEN_VEXT_RED(vredxor_vs_b, int8_t, int8_t, H1, H1, DO_XOR, clearb)
-GEN_VEXT_RED(vredxor_vs_h, int16_t, int16_t, H2, H2, DO_XOR, clearh)
-GEN_VEXT_RED(vredxor_vs_w, int32_t, int32_t, H4, H4, DO_XOR, clearl)
-GEN_VEXT_RED(vredxor_vs_d, int64_t, int64_t, H8, H8, DO_XOR, clearq)
+GEN_VEXT_RED(vredxor_vs_b, int8_t,  int8_t,  H1, H1, DO_XOR)
+GEN_VEXT_RED(vredxor_vs_h, int16_t, int16_t, H2, H2, DO_XOR)
+GEN_VEXT_RED(vredxor_vs_w, int32_t, int32_t, H4, H4, DO_XOR)
+GEN_VEXT_RED(vredxor_vs_d, int64_t, int64_t, H8, H8, DO_XOR)
=20
 /* Vector Widening Integer Reduction Instructions */
 /* signed sum reduction into double-width accumulator */
-GEN_VEXT_RED(vwredsum_vs_b, int16_t, int8_t, H2, H1, DO_ADD, clearh)
-GEN_VEXT_RED(vwredsum_vs_h, int32_t, int16_t, H4, H2, DO_ADD, clearl)
-GEN_VEXT_RED(vwredsum_vs_w, int64_t, int32_t, H8, H4, DO_ADD, clearq)
+GEN_VEXT_RED(vwredsum_vs_b, int16_t, int8_t,  H2, H1, DO_ADD)
+GEN_VEXT_RED(vwredsum_vs_h, int32_t, int16_t, H4, H2, DO_ADD)
+GEN_VEXT_RED(vwredsum_vs_w, int64_t, int32_t, H8, H4, DO_ADD)
=20
 /* Unsigned sum reduction into double-width accumulator */
-GEN_VEXT_RED(vwredsumu_vs_b, uint16_t, uint8_t, H2, H1, DO_ADD, clearh)
-GEN_VEXT_RED(vwredsumu_vs_h, uint32_t, uint16_t, H4, H2, DO_ADD, clearl)
-GEN_VEXT_RED(vwredsumu_vs_w, uint64_t, uint32_t, H8, H4, DO_ADD, clearq)
+GEN_VEXT_RED(vwredsumu_vs_b, uint16_t, uint8_t,  H2, H1, DO_ADD)
+GEN_VEXT_RED(vwredsumu_vs_h, uint32_t, uint16_t, H4, H2, DO_ADD)
+GEN_VEXT_RED(vwredsumu_vs_w, uint64_t, uint32_t, H8, H4, DO_ADD)
=20
 /* Vector Single-Width Floating-Point Reduction Instructions */
-#define GEN_VEXT_FRED(NAME, TD, TS2, HD, HS2, OP, CLEAR_FN)\
+#define GEN_VEXT_FRED(NAME, TD, TS2, HD, HS2, OP)          \
 void HELPER(NAME)(void *vd, void *v0, void *vs1,           \
                   void *vs2, CPURISCVState *env,           \
                   uint32_t desc)                           \
@@ -4384,7 +4256,6 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,   =
        \
     uint32_t vm =3D vext_vm(desc);                           \
     uint32_t vl =3D env->vl;                                 \
     uint32_t i;                                            \
-    uint32_t tot =3D env_archcpu(env)->cfg.vlen / 8;         \
     TD s1 =3D  *((TD *)vs1 + HD(0));                         \
                                                            \
     for (i =3D 0; i < vl; i++) {                             \
@@ -4395,23 +4266,22 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, =
          \
         s1 =3D OP(s1, (TD)s2, &env->fp_status);              \
     }                                                      \
     *((TD *)vd + HD(0)) =3D s1;                              \
-    CLEAR_FN(vd, 1, sizeof(TD), tot);                      \
 }
=20
 /* Unordered sum */
-GEN_VEXT_FRED(vfredsum_vs_h, uint16_t, uint16_t, H2, H2, float16_add, cl=
earh)
-GEN_VEXT_FRED(vfredsum_vs_w, uint32_t, uint32_t, H4, H4, float32_add, cl=
earl)
-GEN_VEXT_FRED(vfredsum_vs_d, uint64_t, uint64_t, H8, H8, float64_add, cl=
earq)
+GEN_VEXT_FRED(vfredsum_vs_h, uint16_t, uint16_t, H2, H2, float16_add)
+GEN_VEXT_FRED(vfredsum_vs_w, uint32_t, uint32_t, H4, H4, float32_add)
+GEN_VEXT_FRED(vfredsum_vs_d, uint64_t, uint64_t, H8, H8, float64_add)
=20
 /* Maximum value */
-GEN_VEXT_FRED(vfredmax_vs_h, uint16_t, uint16_t, H2, H2, float16_maxnum,=
 clearh)
-GEN_VEXT_FRED(vfredmax_vs_w, uint32_t, uint32_t, H4, H4, float32_maxnum,=
 clearl)
-GEN_VEXT_FRED(vfredmax_vs_d, uint64_t, uint64_t, H8, H8, float64_maxnum,=
 clearq)
+GEN_VEXT_FRED(vfredmax_vs_h, uint16_t, uint16_t, H2, H2, float16_maxnum)
+GEN_VEXT_FRED(vfredmax_vs_w, uint32_t, uint32_t, H4, H4, float32_maxnum)
+GEN_VEXT_FRED(vfredmax_vs_d, uint64_t, uint64_t, H8, H8, float64_maxnum)
=20
 /* Minimum value */
-GEN_VEXT_FRED(vfredmin_vs_h, uint16_t, uint16_t, H2, H2, float16_minnum,=
 clearh)
-GEN_VEXT_FRED(vfredmin_vs_w, uint32_t, uint32_t, H4, H4, float32_minnum,=
 clearl)
-GEN_VEXT_FRED(vfredmin_vs_d, uint64_t, uint64_t, H8, H8, float64_minnum,=
 clearq)
+GEN_VEXT_FRED(vfredmin_vs_h, uint16_t, uint16_t, H2, H2, float16_minnum)
+GEN_VEXT_FRED(vfredmin_vs_w, uint32_t, uint32_t, H4, H4, float32_minnum)
+GEN_VEXT_FRED(vfredmin_vs_d, uint64_t, uint64_t, H8, H8, float64_minnum)
=20
 /* Vector Widening Floating-Point Reduction Instructions */
 /* Unordered reduce 2*SEW =3D 2*SEW + sum(promote(SEW)) */
@@ -4421,7 +4291,6 @@ void HELPER(vfwredsum_vs_h)(void *vd, void *v0, voi=
d *vs1,
     uint32_t vm =3D vext_vm(desc);
     uint32_t vl =3D env->vl;
     uint32_t i;
-    uint32_t tot =3D env_archcpu(env)->cfg.vlen / 8;
     uint32_t s1 =3D  *((uint32_t *)vs1 + H4(0));
=20
     for (i =3D 0; i < vl; i++) {
@@ -4433,7 +4302,6 @@ void HELPER(vfwredsum_vs_h)(void *vd, void *v0, voi=
d *vs1,
                          &env->fp_status);
     }
     *((uint32_t *)vd + H4(0)) =3D s1;
-    clearl(vd, 1, sizeof(uint32_t), tot);
 }
=20
 void HELPER(vfwredsum_vs_w)(void *vd, void *v0, void *vs1,
@@ -4442,7 +4310,6 @@ void HELPER(vfwredsum_vs_w)(void *vd, void *v0, voi=
d *vs1,
     uint32_t vm =3D vext_vm(desc);
     uint32_t vl =3D env->vl;
     uint32_t i;
-    uint32_t tot =3D env_archcpu(env)->cfg.vlen / 8;
     uint64_t s1 =3D  *((uint64_t *)vs1);
=20
     for (i =3D 0; i < vl; i++) {
@@ -4454,7 +4321,6 @@ void HELPER(vfwredsum_vs_w)(void *vd, void *v0, voi=
d *vs1,
                          &env->fp_status);
     }
     *((uint64_t *)vd) =3D s1;
-    clearq(vd, 1, sizeof(uint64_t), tot);
 }
=20
 /*
@@ -4596,11 +4462,10 @@ void HELPER(vmsof_m)(void *vd, void *v0, void *vs=
2, CPURISCVState *env,
 }
=20
 /* Vector Iota Instruction */
-#define GEN_VEXT_VIOTA_M(NAME, ETYPE, H, CLEAR_FN)                      =
  \
+#define GEN_VEXT_VIOTA_M(NAME, ETYPE, H)                                =
  \
 void HELPER(NAME)(void *vd, void *v0, void *vs2, CPURISCVState *env,    =
  \
                   uint32_t desc)                                        =
  \
 {                                                                       =
  \
-    uint32_t vlmax =3D env_archcpu(env)->cfg.vlen;                      =
    \
     uint32_t vm =3D vext_vm(desc);                                      =
    \
     uint32_t vl =3D env->vl;                                            =
    \
     uint32_t sum =3D 0;                                                 =
    \
@@ -4615,19 +4480,17 @@ void HELPER(NAME)(void *vd, void *v0, void *vs2, =
CPURISCVState *env,      \
             sum++;                                                      =
  \
         }                                                               =
  \
     }                                                                   =
  \
-    CLEAR_FN(vd, vl, vl * sizeof(ETYPE), vlmax * sizeof(ETYPE));        =
  \
 }
=20
-GEN_VEXT_VIOTA_M(viota_m_b, uint8_t, H1, clearb)
-GEN_VEXT_VIOTA_M(viota_m_h, uint16_t, H2, clearh)
-GEN_VEXT_VIOTA_M(viota_m_w, uint32_t, H4, clearl)
-GEN_VEXT_VIOTA_M(viota_m_d, uint64_t, H8, clearq)
+GEN_VEXT_VIOTA_M(viota_m_b, uint8_t,  H1)
+GEN_VEXT_VIOTA_M(viota_m_h, uint16_t, H2)
+GEN_VEXT_VIOTA_M(viota_m_w, uint32_t, H4)
+GEN_VEXT_VIOTA_M(viota_m_d, uint64_t, H8)
=20
 /* Vector Element Index Instruction */
-#define GEN_VEXT_VID_V(NAME, ETYPE, H, CLEAR_FN)                        =
  \
+#define GEN_VEXT_VID_V(NAME, ETYPE, H)                                  =
  \
 void HELPER(NAME)(void *vd, void *v0, CPURISCVState *env, uint32_t desc)=
  \
 {                                                                       =
  \
-    uint32_t vlmax =3D env_archcpu(env)->cfg.vlen;                      =
    \
     uint32_t vm =3D vext_vm(desc);                                      =
    \
     uint32_t vl =3D env->vl;                                            =
    \
     int i;                                                              =
  \
@@ -4638,24 +4501,22 @@ void HELPER(NAME)(void *vd, void *v0, CPURISCVSta=
te *env, uint32_t desc)  \
         }                                                               =
  \
         *((ETYPE *)vd + H(i)) =3D i;                                    =
    \
     }                                                                   =
  \
-    CLEAR_FN(vd, vl, vl * sizeof(ETYPE), vlmax * sizeof(ETYPE));        =
  \
 }
=20
-GEN_VEXT_VID_V(vid_v_b, uint8_t, H1, clearb)
-GEN_VEXT_VID_V(vid_v_h, uint16_t, H2, clearh)
-GEN_VEXT_VID_V(vid_v_w, uint32_t, H4, clearl)
-GEN_VEXT_VID_V(vid_v_d, uint64_t, H8, clearq)
+GEN_VEXT_VID_V(vid_v_b, uint8_t,  H1)
+GEN_VEXT_VID_V(vid_v_h, uint16_t, H2)
+GEN_VEXT_VID_V(vid_v_w, uint32_t, H4)
+GEN_VEXT_VID_V(vid_v_d, uint64_t, H8)
=20
 /*
  *** Vector Permutation Instructions
  */
=20
 /* Vector Slide Instructions */
-#define GEN_VEXT_VSLIDEUP_VX(NAME, ETYPE, H, CLEAR_FN)                  =
  \
+#define GEN_VEXT_VSLIDEUP_VX(NAME, ETYPE, H)                            =
  \
 void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,       =
  \
                   CPURISCVState *env, uint32_t desc)                    =
  \
 {                                                                       =
  \
-    uint32_t vlmax =3D env_archcpu(env)->cfg.vlen;                      =
    \
     uint32_t vm =3D vext_vm(desc);                                      =
    \
     uint32_t vl =3D env->vl;                                            =
    \
     target_ulong offset =3D s1, i;                                      =
    \
@@ -4666,16 +4527,15 @@ void HELPER(NAME)(void *vd, void *v0, target_ulon=
g s1, void *vs2,         \
         }                                                               =
  \
         *((ETYPE *)vd + H(i)) =3D *((ETYPE *)vs2 + H(i - offset));      =
    \
     }                                                                   =
  \
-    CLEAR_FN(vd, vl, vl * sizeof(ETYPE), vlmax * sizeof(ETYPE));        =
  \
 }
=20
 /* vslideup.vx vd, vs2, rs1, vm # vd[i+rs1] =3D vs2[i] */
-GEN_VEXT_VSLIDEUP_VX(vslideup_vx_b, uint8_t, H1, clearb)
-GEN_VEXT_VSLIDEUP_VX(vslideup_vx_h, uint16_t, H2, clearh)
-GEN_VEXT_VSLIDEUP_VX(vslideup_vx_w, uint32_t, H4, clearl)
-GEN_VEXT_VSLIDEUP_VX(vslideup_vx_d, uint64_t, H8, clearq)
+GEN_VEXT_VSLIDEUP_VX(vslideup_vx_b, uint8_t,  H1)
+GEN_VEXT_VSLIDEUP_VX(vslideup_vx_h, uint16_t, H2)
+GEN_VEXT_VSLIDEUP_VX(vslideup_vx_w, uint32_t, H4)
+GEN_VEXT_VSLIDEUP_VX(vslideup_vx_d, uint64_t, H8)
=20
-#define GEN_VEXT_VSLIDEDOWN_VX(NAME, ETYPE, H, CLEAR_FN)                =
  \
+#define GEN_VEXT_VSLIDEDOWN_VX(NAME, ETYPE, H)                          =
  \
 void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,       =
  \
                   CPURISCVState *env, uint32_t desc)                    =
  \
 {                                                                       =
  \
@@ -4691,20 +4551,18 @@ void HELPER(NAME)(void *vd, void *v0, target_ulon=
g s1, void *vs2,         \
         }                                                               =
  \
         *((ETYPE *)vd + H(i)) =3D j >=3D vlmax ? 0 : *((ETYPE *)vs2 + H(=
j));  \
     }                                                                   =
  \
-    CLEAR_FN(vd, vl, vl * sizeof(ETYPE), vlmax * sizeof(ETYPE));        =
  \
 }
=20
 /* vslidedown.vx vd, vs2, rs1, vm # vd[i] =3D vs2[i+rs1] */
-GEN_VEXT_VSLIDEDOWN_VX(vslidedown_vx_b, uint8_t, H1, clearb)
-GEN_VEXT_VSLIDEDOWN_VX(vslidedown_vx_h, uint16_t, H2, clearh)
-GEN_VEXT_VSLIDEDOWN_VX(vslidedown_vx_w, uint32_t, H4, clearl)
-GEN_VEXT_VSLIDEDOWN_VX(vslidedown_vx_d, uint64_t, H8, clearq)
+GEN_VEXT_VSLIDEDOWN_VX(vslidedown_vx_b, uint8_t,  H1)
+GEN_VEXT_VSLIDEDOWN_VX(vslidedown_vx_h, uint16_t, H2)
+GEN_VEXT_VSLIDEDOWN_VX(vslidedown_vx_w, uint32_t, H4)
+GEN_VEXT_VSLIDEDOWN_VX(vslidedown_vx_d, uint64_t, H8)
=20
-#define GEN_VEXT_VSLIDE1UP_VX(NAME, ETYPE, H, CLEAR_FN)                 =
  \
+#define GEN_VEXT_VSLIDE1UP_VX(NAME, ETYPE, H)                           =
  \
 void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,       =
  \
                   CPURISCVState *env, uint32_t desc)                    =
  \
 {                                                                       =
  \
-    uint32_t vlmax =3D env_archcpu(env)->cfg.vlen;                      =
    \
     uint32_t vm =3D vext_vm(desc);                                      =
    \
     uint32_t vl =3D env->vl;                                            =
    \
     uint32_t i;                                                         =
  \
@@ -4719,20 +4577,18 @@ void HELPER(NAME)(void *vd, void *v0, target_ulon=
g s1, void *vs2,         \
             *((ETYPE *)vd + H(i)) =3D *((ETYPE *)vs2 + H(i - 1));       =
    \
         }                                                               =
  \
     }                                                                   =
  \
-    CLEAR_FN(vd, vl, vl * sizeof(ETYPE), vlmax * sizeof(ETYPE));        =
  \
 }
=20
 /* vslide1up.vx vd, vs2, rs1, vm # vd[0]=3Dx[rs1], vd[i+1] =3D vs2[i] */
-GEN_VEXT_VSLIDE1UP_VX(vslide1up_vx_b, uint8_t, H1, clearb)
-GEN_VEXT_VSLIDE1UP_VX(vslide1up_vx_h, uint16_t, H2, clearh)
-GEN_VEXT_VSLIDE1UP_VX(vslide1up_vx_w, uint32_t, H4, clearl)
-GEN_VEXT_VSLIDE1UP_VX(vslide1up_vx_d, uint64_t, H8, clearq)
+GEN_VEXT_VSLIDE1UP_VX(vslide1up_vx_b, uint8_t,  H1)
+GEN_VEXT_VSLIDE1UP_VX(vslide1up_vx_h, uint16_t, H2)
+GEN_VEXT_VSLIDE1UP_VX(vslide1up_vx_w, uint32_t, H4)
+GEN_VEXT_VSLIDE1UP_VX(vslide1up_vx_d, uint64_t, H8)
=20
-#define GEN_VEXT_VSLIDE1DOWN_VX(NAME, ETYPE, H, CLEAR_FN)               =
  \
+#define GEN_VEXT_VSLIDE1DOWN_VX(NAME, ETYPE, H)                         =
  \
 void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,       =
  \
                   CPURISCVState *env, uint32_t desc)                    =
  \
 {                                                                       =
  \
-    uint32_t vlmax =3D env_archcpu(env)->cfg.vlen;                      =
    \
     uint32_t vm =3D vext_vm(desc);                                      =
    \
     uint32_t vl =3D env->vl;                                            =
    \
     uint32_t i;                                                         =
  \
@@ -4747,17 +4603,16 @@ void HELPER(NAME)(void *vd, void *v0, target_ulon=
g s1, void *vs2,         \
             *((ETYPE *)vd + H(i)) =3D *((ETYPE *)vs2 + H(i + 1));       =
    \
         }                                                               =
  \
     }                                                                   =
  \
-    CLEAR_FN(vd, vl, vl * sizeof(ETYPE), vlmax * sizeof(ETYPE));        =
  \
 }
=20
 /* vslide1down.vx vd, vs2, rs1, vm # vd[i] =3D vs2[i+1], vd[vl-1]=3Dx[rs=
1] */
-GEN_VEXT_VSLIDE1DOWN_VX(vslide1down_vx_b, uint8_t, H1, clearb)
-GEN_VEXT_VSLIDE1DOWN_VX(vslide1down_vx_h, uint16_t, H2, clearh)
-GEN_VEXT_VSLIDE1DOWN_VX(vslide1down_vx_w, uint32_t, H4, clearl)
-GEN_VEXT_VSLIDE1DOWN_VX(vslide1down_vx_d, uint64_t, H8, clearq)
+GEN_VEXT_VSLIDE1DOWN_VX(vslide1down_vx_b, uint8_t,  H1)
+GEN_VEXT_VSLIDE1DOWN_VX(vslide1down_vx_h, uint16_t, H2)
+GEN_VEXT_VSLIDE1DOWN_VX(vslide1down_vx_w, uint32_t, H4)
+GEN_VEXT_VSLIDE1DOWN_VX(vslide1down_vx_d, uint64_t, H8)
=20
 /* Vector Register Gather Instruction */
-#define GEN_VEXT_VRGATHER_VV(NAME, ETYPE, H, CLEAR_FN)                  =
  \
+#define GEN_VEXT_VRGATHER_VV(NAME, ETYPE, H)                            =
  \
 void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,             =
  \
                   CPURISCVState *env, uint32_t desc)                    =
  \
 {                                                                       =
  \
@@ -4778,16 +4633,15 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, =
void *vs2,               \
             *((ETYPE *)vd + H(i)) =3D *((ETYPE *)vs2 + H(index));       =
    \
         }                                                               =
  \
     }                                                                   =
  \
-    CLEAR_FN(vd, vl, vl * sizeof(ETYPE), vlmax * sizeof(ETYPE));        =
  \
 }
=20
 /* vd[i] =3D (vs1[i] >=3D VLMAX) ? 0 : vs2[vs1[i]]; */
-GEN_VEXT_VRGATHER_VV(vrgather_vv_b, uint8_t, H1, clearb)
-GEN_VEXT_VRGATHER_VV(vrgather_vv_h, uint16_t, H2, clearh)
-GEN_VEXT_VRGATHER_VV(vrgather_vv_w, uint32_t, H4, clearl)
-GEN_VEXT_VRGATHER_VV(vrgather_vv_d, uint64_t, H8, clearq)
+GEN_VEXT_VRGATHER_VV(vrgather_vv_b, uint8_t,  H1)
+GEN_VEXT_VRGATHER_VV(vrgather_vv_h, uint16_t, H2)
+GEN_VEXT_VRGATHER_VV(vrgather_vv_w, uint32_t, H4)
+GEN_VEXT_VRGATHER_VV(vrgather_vv_d, uint64_t, H8)
=20
-#define GEN_VEXT_VRGATHER_VX(NAME, ETYPE, H, CLEAR_FN)                  =
  \
+#define GEN_VEXT_VRGATHER_VX(NAME, ETYPE, H)                            =
  \
 void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,       =
  \
                   CPURISCVState *env, uint32_t desc)                    =
  \
 {                                                                       =
  \
@@ -4807,21 +4661,19 @@ void HELPER(NAME)(void *vd, void *v0, target_ulon=
g s1, void *vs2,         \
             *((ETYPE *)vd + H(i)) =3D *((ETYPE *)vs2 + H(index));       =
    \
         }                                                               =
  \
     }                                                                   =
  \
-    CLEAR_FN(vd, vl, vl * sizeof(ETYPE), vlmax * sizeof(ETYPE));        =
  \
 }
=20
 /* vd[i] =3D (x[rs1] >=3D VLMAX) ? 0 : vs2[rs1] */
-GEN_VEXT_VRGATHER_VX(vrgather_vx_b, uint8_t, H1, clearb)
-GEN_VEXT_VRGATHER_VX(vrgather_vx_h, uint16_t, H2, clearh)
-GEN_VEXT_VRGATHER_VX(vrgather_vx_w, uint32_t, H4, clearl)
-GEN_VEXT_VRGATHER_VX(vrgather_vx_d, uint64_t, H8, clearq)
+GEN_VEXT_VRGATHER_VX(vrgather_vx_b, uint8_t,  H1)
+GEN_VEXT_VRGATHER_VX(vrgather_vx_h, uint16_t, H2)
+GEN_VEXT_VRGATHER_VX(vrgather_vx_w, uint32_t, H4)
+GEN_VEXT_VRGATHER_VX(vrgather_vx_d, uint64_t, H8)
=20
 /* Vector Compress Instruction */
-#define GEN_VEXT_VCOMPRESS_VM(NAME, ETYPE, H, CLEAR_FN)                 =
  \
+#define GEN_VEXT_VCOMPRESS_VM(NAME, ETYPE, H)                           =
  \
 void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,             =
  \
                   CPURISCVState *env, uint32_t desc)                    =
  \
 {                                                                       =
  \
-    uint32_t vlmax =3D env_archcpu(env)->cfg.vlen;                      =
    \
     uint32_t vl =3D env->vl;                                            =
    \
     uint32_t num =3D 0, i;                                              =
    \
                                                                         =
  \
@@ -4832,11 +4684,10 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, =
void *vs2,               \
         *((ETYPE *)vd + H(num)) =3D *((ETYPE *)vs2 + H(i));             =
    \
         num++;                                                          =
  \
     }                                                                   =
  \
-    CLEAR_FN(vd, num, num * sizeof(ETYPE), vlmax * sizeof(ETYPE));      =
  \
 }
=20
 /* Compress into vd elements of vs2 where vs1 is enabled */
-GEN_VEXT_VCOMPRESS_VM(vcompress_vm_b, uint8_t, H1, clearb)
-GEN_VEXT_VCOMPRESS_VM(vcompress_vm_h, uint16_t, H2, clearh)
-GEN_VEXT_VCOMPRESS_VM(vcompress_vm_w, uint32_t, H4, clearl)
-GEN_VEXT_VCOMPRESS_VM(vcompress_vm_d, uint64_t, H8, clearq)
+GEN_VEXT_VCOMPRESS_VM(vcompress_vm_b, uint8_t,  H1)
+GEN_VEXT_VCOMPRESS_VM(vcompress_vm_h, uint16_t, H2)
+GEN_VEXT_VCOMPRESS_VM(vcompress_vm_w, uint32_t, H4)
+GEN_VEXT_VCOMPRESS_VM(vcompress_vm_d, uint64_t, H8)
--=20
2.31.1


