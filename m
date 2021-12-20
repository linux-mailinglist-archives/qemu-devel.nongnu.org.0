Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B8C47B076
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 16:39:09 +0100 (CET)
Received: from localhost ([::1]:60656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzKkl-0002gi-V2
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 10:39:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAoj-0004cx-1p
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 00:03:20 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:6199)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAob-0000Ck-HO
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 00:02:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639976545; x=1671512545;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cReEofIpXtxcSOOejH5kD9lreBrJ1iRwHrK+H4Jarm4=;
 b=NrN8/yiTjKeAIpZwcePGK1L7qlT56snmIw975JxaSpDCgUVRD6MhIL16
 ny+SaNsPiPzys/6zBapKbOVCaxGZR294hR1JS/lbKxINnKG1Tn4Xmh5ke
 KXKBrmTOZyGJ907b4/QqY7QDuGZcsHEQv/Vb7St6k3mQe3XiOz9eI/y3U
 HHQxfetjKVjcHnpVsYIumMK2rQjr7XK+r2p6B/78bDptmaXfpS8BZJBLU
 JGv36gdUN+vx5ze8H5t6eSBz7zvlaz33nuAGLJn87uwYTM0L7RAkpUt6m
 3weihh3khjriWf2hh6xAj6ysmlDtQWiEHVqK85Ex4XHmIdU58o/j1mV+6 w==;
X-IronPort-AV: E=Sophos;i="5.88,219,1635177600"; d="scan'208";a="300503530"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2021 13:02:14 +0800
IronPort-SDR: /+yL3gQR+8mUDW0ixKmY6uWBk2qwXDmBju8Bv+E6HNrY1e7m9Samf0MTXVCMqyeIn1dxUQ9E/Z
 yJ2L5r5UsUiudcgAhMpVcfKTzWj5s3XwNljaJZ+QTRN0RnutkrC+OUbSqupyFU2Mqf1EApEucx
 z5M9TBfftZq356/lgl7axG9Y5RkehO8BvYXq1QBk5i+4ymH4zDWN0fmEig7SmNgZu1mJwTmd29
 Mt9BdhraJFknxwyPtwtXohFN57j5jtxU8Ise2drH/yo4MynBIezqreXrODMeEelY6VoURjMDjo
 3DycUPLnSkk/iHN69xRVqRhb
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:36:31 -0800
IronPort-SDR: EA+M7i1ipYg09Kv0roaZG9U1f+uP4pksd14pTEZjYZDcvbPCEpPYoD1EhsmtcEIGipMj8R20Dp
 K9BefCCBVPDg+UrjM50BQU3VFYPa6KqNlHPLTi2C+yZS3DjuUr4t317ls1QfIJzpW2EHZ0PLjh
 ViVHO84WrIHie4EcLjaaW+SrG5dvimv8sGxep9b/nZTJKEs+wXEnk0pL37+cvxEYs6JN6JysZW
 ARnB9O30UXhbAalBnPubZrHLI3GkDgDVucCYyMMr4z9vBVyo3JlvSrzjbB3MajZw0YC5QXJ3y6
 7y0=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 21:02:14 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JHSBG4Dcyz1RwFN
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 21:02:14 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639976532; x=1642568533; bh=cReEofIpXtxcSOOejH
 5kD9lreBrJ1iRwHrK+H4Jarm4=; b=LBBjpMScw2CEvWM/BvHsqU5J3wN/ZDKZVb
 HciwRxfjfjO6wVKL7QB0Uglmou6fjtVkXBrXz7ZGnJgfq2NQCMmEJvE0efJyeH2v
 JY6Xcf1lcFzIJ7MktI4fpH3AGsfPpN4v9HJs9oF4x2qpU09farWAQWmAaUeB6I2F
 Hg8xkd5geGvYRtpo9YfejnBSk1mT0qTeiT0E1UXgDElLxgjpWI8VwIjh02RHWavh
 FlvJT1SJwqWZTYGdA5WXhrd2Tq3QL2mrhqPmZJXtMmjEOq2pCiC0ODTXWwjuzQ0C
 kWLcrBMJg78lr/pywPnwKLn/CP62E8k7dVBVeWeVIcIMceNoukpw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id Iz69qcw_Gayh for <qemu-devel@nongnu.org>;
 Sun, 19 Dec 2021 21:02:12 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.68])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JHSB94nmnz1RtVG;
 Sun, 19 Dec 2021 21:02:09 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 74/88] target/riscv: rvv-1.0: implement vstart CSR
Date: Mon, 20 Dec 2021 14:56:51 +1000
Message-Id: <20211220045705.62174-75-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
References: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=9816edf2f=alistair.francis@opensource.wdc.com;
 helo=esa1.hgst.iphmx.com
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

* Update and check vstart value for vector instructions.
* Add whole register move instruction helper functions as we have to
  call helper function for case where vstart is not zero.
* Remove probe_pages() calls in vector load/store instructions
  (except fault-only-first loads) to raise the memory access exception
  at the exact processed vector element.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20211210075704.23951-67-frank.chang@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/helper.h                   |   5 +
 target/riscv/csr.c                      |   6 +-
 target/riscv/translate.c                |   6 +-
 target/riscv/vector_helper.c            | 210 +++++++++++++++---------
 target/riscv/insn_trans/trans_rvv.c.inc |  75 ++++++---
 5 files changed, 199 insertions(+), 103 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 1a0d817f0f..a717a87a0e 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1073,6 +1073,11 @@ DEF_HELPER_6(vcompress_vm_h, void, ptr, ptr, ptr, =
ptr, env, i32)
 DEF_HELPER_6(vcompress_vm_w, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vcompress_vm_d, void, ptr, ptr, ptr, ptr, env, i32)
=20
+DEF_HELPER_4(vmv1r_v, void, ptr, ptr, env, i32)
+DEF_HELPER_4(vmv2r_v, void, ptr, ptr, env, i32)
+DEF_HELPER_4(vmv4r_v, void, ptr, ptr, env, i32)
+DEF_HELPER_4(vmv8r_v, void, ptr, ptr, env, i32)
+
 DEF_HELPER_5(vzext_vf2_h, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vzext_vf2_w, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vzext_vf2_d, void, ptr, ptr, ptr, env, i32)
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 3dfbc17738..146447eac5 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -343,7 +343,11 @@ static RISCVException write_vstart(CPURISCVState *en=
v, int csrno,
 #if !defined(CONFIG_USER_ONLY)
     env->mstatus |=3D MSTATUS_VS;
 #endif
-    env->vstart =3D val;
+    /*
+     * The vstart CSR is defined to have only enough writable bits
+     * to hold the largest element index, i.e. lg2(VLEN) bits.
+     */
+    env->vstart =3D val & ~(~0ULL << ctzl(env_archcpu(env)->cfg.vlen));
     return RISCV_EXCP_NONE;
 }
=20
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index b4df21bda3..68edaaf6ac 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -33,7 +33,7 @@
 #include "internals.h"
=20
 /* global register indices */
-static TCGv cpu_gpr[32], cpu_pc, cpu_vl;
+static TCGv cpu_gpr[32], cpu_pc, cpu_vl, cpu_vstart;
 static TCGv_i64 cpu_fpr[32]; /* assume F and D extensions */
 static TCGv load_res;
 static TCGv load_val;
@@ -96,6 +96,7 @@ typedef struct DisasContext {
     int8_t lmul;
     uint8_t sew;
     uint16_t vlen;
+    target_ulong vstart;
     bool vl_eq_vlmax;
     uint8_t ntemp;
     CPUState *cs;
@@ -710,6 +711,7 @@ static void riscv_tr_init_disas_context(DisasContextB=
ase *dcbase, CPUState *cs)
     ctx->vill =3D FIELD_EX32(tb_flags, TB_FLAGS, VILL);
     ctx->sew =3D FIELD_EX32(tb_flags, TB_FLAGS, SEW);
     ctx->lmul =3D sextract32(FIELD_EX32(tb_flags, TB_FLAGS, LMUL), 0, 3)=
;
+    ctx->vstart =3D env->vstart;
     ctx->vl_eq_vlmax =3D FIELD_EX32(tb_flags, TB_FLAGS, VL_EQ_VLMAX);
     ctx->xl =3D FIELD_EX32(tb_flags, TB_FLAGS, XL);
     ctx->cs =3D cs;
@@ -828,6 +830,8 @@ void riscv_translate_init(void)
=20
     cpu_pc =3D tcg_global_mem_new(cpu_env, offsetof(CPURISCVState, pc), =
"pc");
     cpu_vl =3D tcg_global_mem_new(cpu_env, offsetof(CPURISCVState, vl), =
"vl");
+    cpu_vstart =3D tcg_global_mem_new(cpu_env, offsetof(CPURISCVState, v=
start),
+                            "vstart");
     load_res =3D tcg_global_mem_new(cpu_env, offsetof(CPURISCVState, loa=
d_res),
                              "load_res");
     load_val =3D tcg_global_mem_new(cpu_env, offsetof(CPURISCVState, loa=
d_val),
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index e61c873142..22848d6b68 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -226,25 +226,19 @@ vext_ldst_stride(void *vd, void *v0, target_ulong b=
ase,
     uint32_t nf =3D vext_nf(desc);
     uint32_t max_elems =3D vext_max_elems(desc, esz);
=20
-    /* probe every access*/
-    for (i =3D 0; i < env->vl; i++) {
+    for (i =3D env->vstart; i < env->vl; i++, env->vstart++) {
         if (!vm && !vext_elem_mask(v0, i)) {
             continue;
         }
-        probe_pages(env, base + stride * i, nf << esz, ra, access_type);
-    }
-    /* do real access */
-    for (i =3D 0; i < env->vl; i++) {
+
         k =3D 0;
-        if (!vm && !vext_elem_mask(v0, i)) {
-            continue;
-        }
         while (k < nf) {
             target_ulong addr =3D base + stride * i + (k << esz);
             ldst_elem(env, addr, i + k * max_elems, vd, ra);
             k++;
         }
     }
+    env->vstart =3D 0;
 }
=20
 #define GEN_VEXT_LD_STRIDE(NAME, ETYPE, LOAD_FN)                        =
\
@@ -291,10 +285,8 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVSt=
ate *env, uint32_t desc,
     uint32_t nf =3D vext_nf(desc);
     uint32_t max_elems =3D vext_max_elems(desc, esz);
=20
-    /* probe every access */
-    probe_pages(env, base, env->vl * (nf << esz), ra, access_type);
     /* load bytes from guest memory */
-    for (i =3D 0; i < env->vl; i++) {
+    for (i =3D env->vstart; i < env->vl; i++, env->vstart++) {
         k =3D 0;
         while (k < nf) {
             target_ulong addr =3D base + ((i * nf + k) << esz);
@@ -302,6 +294,7 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVSta=
te *env, uint32_t desc,
             k++;
         }
     }
+    env->vstart =3D 0;
 }
=20
 /*
@@ -381,26 +374,20 @@ vext_ldst_index(void *vd, void *v0, target_ulong ba=
se,
     uint32_t vm =3D vext_vm(desc);
     uint32_t max_elems =3D vext_max_elems(desc, esz);
=20
-    /* probe every access*/
-    for (i =3D 0; i < env->vl; i++) {
-        if (!vm && !vext_elem_mask(v0, i)) {
-            continue;
-        }
-        probe_pages(env, get_index_addr(base, i, vs2), nf << esz, ra,
-                    access_type);
-    }
     /* load bytes from guest memory */
-    for (i =3D 0; i < env->vl; i++) {
-        k =3D 0;
+    for (i =3D env->vstart; i < env->vl; i++, env->vstart++) {
         if (!vm && !vext_elem_mask(v0, i)) {
             continue;
         }
+
+        k =3D 0;
         while (k < nf) {
             abi_ptr addr =3D get_index_addr(base, i, vs2) + (k << esz);
             ldst_elem(env, addr, i + k * max_elems, vd, ra);
             k++;
         }
     }
+    env->vstart =3D 0;
 }
=20
 #define GEN_VEXT_LD_INDEX(NAME, ETYPE, INDEX_FN, LOAD_FN)               =
   \
@@ -471,7 +458,7 @@ vext_ldff(void *vd, void *v0, target_ulong base,
     target_ulong addr, offset, remain;
=20
     /* probe every access*/
-    for (i =3D 0; i < env->vl; i++) {
+    for (i =3D env->vstart; i < env->vl; i++) {
         if (!vm && !vext_elem_mask(v0, i)) {
             continue;
         }
@@ -511,7 +498,7 @@ ProbeSuccess:
     if (vl !=3D 0) {
         env->vl =3D vl;
     }
-    for (i =3D 0; i < env->vl; i++) {
+    for (i =3D env->vstart; i < env->vl; i++) {
         k =3D 0;
         if (!vm && !vext_elem_mask(v0, i)) {
             continue;
@@ -522,6 +509,7 @@ ProbeSuccess:
             k++;
         }
     }
+    env->vstart =3D 0;
 }
=20
 #define GEN_VEXT_LDFF(NAME, ETYPE, LOAD_FN)               \
@@ -559,21 +547,32 @@ vext_ldst_whole(void *vd, target_ulong base, CPURIS=
CVState *env, uint32_t desc,
                 vext_ldst_elem_fn *ldst_elem, uint32_t esz, uintptr_t ra=
,
                 MMUAccessType access_type)
 {
-    uint32_t i, k;
+    uint32_t i, k, off, pos;
     uint32_t nf =3D vext_nf(desc);
     uint32_t vlenb =3D env_archcpu(env)->cfg.vlen >> 3;
     uint32_t max_elems =3D vlenb >> esz;
=20
-    /* probe every access */
-    probe_pages(env, base, vlenb * nf, ra, access_type);
+    k =3D env->vstart / max_elems;
+    off =3D env->vstart % max_elems;
=20
-    /* load bytes from guest memory */
-    for (k =3D 0; k < nf; k++) {
-        for (i =3D 0; i < max_elems; i++) {
+    if (off) {
+        /* load/store rest of elements of current segment pointed by vst=
art */
+        for (pos =3D off; pos < max_elems; pos++, env->vstart++) {
+            target_ulong addr =3D base + ((pos + k * max_elems) << esz);
+            ldst_elem(env, addr, pos + k * max_elems, vd, ra);
+        }
+        k++;
+    }
+
+    /* load/store elements for rest of segments */
+    for (; k < nf; k++) {
+        for (i =3D 0; i < max_elems; i++, env->vstart++) {
             target_ulong addr =3D base + ((i + k * max_elems) << esz);
             ldst_elem(env, addr, i + k * max_elems, vd, ra);
         }
     }
+
+    env->vstart =3D 0;
 }
=20
 #define GEN_VEXT_LD_WHOLE(NAME, ETYPE, LOAD_FN)      \
@@ -686,12 +685,13 @@ static void do_vext_vv(void *vd, void *v0, void *vs=
1, void *vs2,
     uint32_t vl =3D env->vl;
     uint32_t i;
=20
-    for (i =3D 0; i < vl; i++) {
+    for (i =3D env->vstart; i < vl; i++) {
         if (!vm && !vext_elem_mask(v0, i)) {
             continue;
         }
         fn(vd, vs1, vs2, i);
     }
+    env->vstart =3D 0;
 }
=20
 /* generate the helpers for OPIVV */
@@ -748,12 +748,13 @@ static void do_vext_vx(void *vd, void *v0, target_l=
ong s1, void *vs2,
     uint32_t vl =3D env->vl;
     uint32_t i;
=20
-    for (i =3D 0; i < vl; i++) {
+    for (i =3D env->vstart; i < vl; i++) {
         if (!vm && !vext_elem_mask(v0, i)) {
             continue;
         }
         fn(vd, s1, vs2, i);
     }
+    env->vstart =3D 0;
 }
=20
 /* generate the helpers for OPIVX */
@@ -941,13 +942,14 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, vo=
id *vs2,   \
     uint32_t vl =3D env->vl;                                    \
     uint32_t i;                                               \
                                                               \
-    for (i =3D 0; i < vl; i++) {                                \
+    for (i =3D env->vstart; i < vl; i++) {                      \
         ETYPE s1 =3D *((ETYPE *)vs1 + H(i));                    \
         ETYPE s2 =3D *((ETYPE *)vs2 + H(i));                    \
         ETYPE carry =3D vext_elem_mask(v0, i);                  \
                                                               \
         *((ETYPE *)vd + H(i)) =3D DO_OP(s2, s1, carry);         \
     }                                                         \
+    env->vstart =3D 0;                                          \
 }
=20
 GEN_VEXT_VADC_VVM(vadc_vvm_b, uint8_t,  H1, DO_VADC)
@@ -967,12 +969,13 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong =
s1, void *vs2,        \
     uint32_t vl =3D env->vl;                                            =
   \
     uint32_t i;                                                         =
 \
                                                                         =
 \
-    for (i =3D 0; i < vl; i++) {                                        =
   \
+    for (i =3D env->vstart; i < vl; i++) {                              =
   \
         ETYPE s2 =3D *((ETYPE *)vs2 + H(i));                            =
   \
         ETYPE carry =3D vext_elem_mask(v0, i);                          =
   \
                                                                         =
 \
         *((ETYPE *)vd + H(i)) =3D DO_OP(s2, (ETYPE)(target_long)s1, carr=
y);\
     }                                                                   =
 \
+    env->vstart =3D 0;                                          \
 }
=20
 GEN_VEXT_VADC_VXM(vadc_vxm_b, uint8_t,  H1, DO_VADC)
@@ -997,12 +1000,13 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, v=
oid *vs2,   \
     uint32_t vm =3D vext_vm(desc);                              \
     uint32_t i;                                               \
                                                               \
-    for (i =3D 0; i < vl; i++) {                                \
+    for (i =3D env->vstart; i < vl; i++) {                      \
         ETYPE s1 =3D *((ETYPE *)vs1 + H(i));                    \
         ETYPE s2 =3D *((ETYPE *)vs2 + H(i));                    \
         ETYPE carry =3D !vm && vext_elem_mask(v0, i);           \
         vext_set_elem_mask(vd, i, DO_OP(s2, s1, carry));      \
     }                                                         \
+    env->vstart =3D 0;                                          \
 }
=20
 GEN_VEXT_VMADC_VVM(vmadc_vvm_b, uint8_t,  H1, DO_MADC)
@@ -1023,12 +1027,13 @@ void HELPER(NAME)(void *vd, void *v0, target_ulon=
g s1,          \
     uint32_t vm =3D vext_vm(desc);                                \
     uint32_t i;                                                 \
                                                                 \
-    for (i =3D 0; i < vl; i++) {                                  \
+    for (i =3D env->vstart; i < vl; i++) {                        \
         ETYPE s2 =3D *((ETYPE *)vs2 + H(i));                      \
         ETYPE carry =3D !vm && vext_elem_mask(v0, i);             \
         vext_set_elem_mask(vd, i,                               \
                 DO_OP(s2, (ETYPE)(target_long)s1, carry));      \
     }                                                           \
+    env->vstart =3D 0;                                            \
 }
=20
 GEN_VEXT_VMADC_VXM(vmadc_vxm_b, uint8_t,  H1, DO_MADC)
@@ -1105,7 +1110,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,   =
                       \
     uint32_t vl =3D env->vl;                                            =
    \
     uint32_t i;                                                         =
  \
                                                                         =
  \
-    for (i =3D 0; i < vl; i++) {                                        =
    \
+    for (i =3D env->vstart; i < vl; i++) {                              =
    \
         if (!vm && !vext_elem_mask(v0, i)) {                            =
  \
             continue;                                                   =
  \
         }                                                               =
  \
@@ -1113,6 +1118,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,   =
                       \
         TS2 s2 =3D *((TS2 *)vs2 + HS2(i));                              =
    \
         *((TS1 *)vd + HS1(i)) =3D OP(s2, s1 & MASK);                    =
    \
     }                                                                   =
  \
+    env->vstart =3D 0;                                                  =
    \
 }
=20
 GEN_VEXT_SHIFT_VV(vsll_vv_b, uint8_t,  uint8_t, H1, H1, DO_SLL, 0x7)
@@ -1139,13 +1145,14 @@ void HELPER(NAME)(void *vd, void *v0, target_ulon=
g s1,      \
     uint32_t vl =3D env->vl;                                  \
     uint32_t i;                                             \
                                                             \
-    for (i =3D 0; i < vl; i++) {                              \
+    for (i =3D env->vstart; i < vl; i++) {                    \
         if (!vm && !vext_elem_mask(v0, i)) {                \
             continue;                                       \
         }                                                   \
         TS2 s2 =3D *((TS2 *)vs2 + HS2(i));                    \
         *((TD *)vd + HD(i)) =3D OP(s2, s1 & MASK);            \
     }                                                       \
+    env->vstart =3D 0;                                        \
 }
=20
 GEN_VEXT_SHIFT_VX(vsll_vx_b, uint8_t, int8_t, H1, H1, DO_SLL, 0x7)
@@ -1192,7 +1199,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, vo=
id *vs2,   \
     uint32_t vl =3D env->vl;                                    \
     uint32_t i;                                               \
                                                               \
-    for (i =3D 0; i < vl; i++) {                                \
+    for (i =3D env->vstart; i < vl; i++) {                      \
         ETYPE s1 =3D *((ETYPE *)vs1 + H(i));                    \
         ETYPE s2 =3D *((ETYPE *)vs2 + H(i));                    \
         if (!vm && !vext_elem_mask(v0, i)) {                  \
@@ -1200,6 +1207,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, vo=
id *vs2,   \
         }                                                     \
         vext_set_elem_mask(vd, i, DO_OP(s2, s1));             \
     }                                                         \
+    env->vstart =3D 0;                                          \
 }
=20
 GEN_VEXT_CMP_VV(vmseq_vv_b, uint8_t,  H1, DO_MSEQ)
@@ -1240,7 +1248,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong =
s1, void *vs2,   \
     uint32_t vl =3D env->vl;                                          \
     uint32_t i;                                                     \
                                                                     \
-    for (i =3D 0; i < vl; i++) {                                      \
+    for (i =3D env->vstart; i < vl; i++) {                            \
         ETYPE s2 =3D *((ETYPE *)vs2 + H(i));                          \
         if (!vm && !vext_elem_mask(v0, i)) {                        \
             continue;                                               \
@@ -1248,6 +1256,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong =
s1, void *vs2,   \
         vext_set_elem_mask(vd, i,                                   \
                 DO_OP(s2, (ETYPE)(target_long)s1));                 \
     }                                                               \
+    env->vstart =3D 0;                                                \
 }
=20
 GEN_VEXT_CMP_VX(vmseq_vx_b, uint8_t,  H1, DO_MSEQ)
@@ -1770,10 +1779,11 @@ void HELPER(NAME)(void *vd, void *vs1, CPURISCVSt=
ate *env,           \
     uint32_t vl =3D env->vl;                                           \
     uint32_t i;                                                      \
                                                                      \
-    for (i =3D 0; i < vl; i++) {                                       \
+    for (i =3D env->vstart; i < vl; i++) {                             \
         ETYPE s1 =3D *((ETYPE *)vs1 + H(i));                           \
         *((ETYPE *)vd + H(i)) =3D s1;                                  \
     }                                                                \
+    env->vstart =3D 0;                                                 \
 }
=20
 GEN_VEXT_VMV_VV(vmv_v_v_b, int8_t,  H1)
@@ -1788,9 +1798,10 @@ void HELPER(NAME)(void *vd, uint64_t s1, CPURISCVS=
tate *env,         \
     uint32_t vl =3D env->vl;                                           \
     uint32_t i;                                                      \
                                                                      \
-    for (i =3D 0; i < vl; i++) {                                       \
+    for (i =3D env->vstart; i < vl; i++) {                             \
         *((ETYPE *)vd + H(i)) =3D (ETYPE)s1;                           \
     }                                                                \
+    env->vstart =3D 0;                                                 \
 }
=20
 GEN_VEXT_VMV_VX(vmv_v_x_b, int8_t,  H1)
@@ -1805,10 +1816,11 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, =
void *vs2,          \
     uint32_t vl =3D env->vl;                                           \
     uint32_t i;                                                      \
                                                                      \
-    for (i =3D 0; i < vl; i++) {                                       \
+    for (i =3D env->vstart; i < vl; i++) {                             \
         ETYPE *vt =3D (!vext_elem_mask(v0, i) ? vs2 : vs1);            \
         *((ETYPE *)vd + H(i)) =3D *(vt + H(i));                        \
     }                                                                \
+    env->vstart =3D 0;                                                 \
 }
=20
 GEN_VEXT_VMERGE_VV(vmerge_vvm_b, int8_t,  H1)
@@ -1823,12 +1835,13 @@ void HELPER(NAME)(void *vd, void *v0, target_ulon=
g s1,               \
     uint32_t vl =3D env->vl;                                           \
     uint32_t i;                                                      \
                                                                      \
-    for (i =3D 0; i < vl; i++) {                                       \
+    for (i =3D env->vstart; i < vl; i++) {                             \
         ETYPE s2 =3D *((ETYPE *)vs2 + H(i));                           \
         ETYPE d =3D (!vext_elem_mask(v0, i) ? s2 :                     \
                    (ETYPE)(target_long)s1);                          \
         *((ETYPE *)vd + H(i)) =3D d;                                   \
     }                                                                \
+    env->vstart =3D 0;                                                 \
 }
=20
 GEN_VEXT_VMERGE_VX(vmerge_vxm_b, int8_t,  H1)
@@ -1865,12 +1878,13 @@ vext_vv_rm_1(void *vd, void *v0, void *vs1, void =
*vs2,
              uint32_t vl, uint32_t vm, int vxrm,
              opivv2_rm_fn *fn)
 {
-    for (uint32_t i =3D 0; i < vl; i++) {
+    for (uint32_t i =3D env->vstart; i < vl; i++) {
         if (!vm && !vext_elem_mask(v0, i)) {
             continue;
         }
         fn(vd, vs1, vs2, i, env, vxrm);
     }
+    env->vstart =3D 0;
 }
=20
 static inline void
@@ -1981,12 +1995,13 @@ vext_vx_rm_1(void *vd, void *v0, target_long s1, =
void *vs2,
              uint32_t vl, uint32_t vm, int vxrm,
              opivx2_rm_fn *fn)
 {
-    for (uint32_t i =3D 0; i < vl; i++) {
+    for (uint32_t i =3D env->vstart; i < vl; i++) {
         if (!vm && !vext_elem_mask(v0, i)) {
             continue;
         }
         fn(vd, s1, vs2, i, env, vxrm);
     }
+    env->vstart =3D 0;
 }
=20
 static inline void
@@ -2768,12 +2783,13 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, =
         \
     uint32_t vl =3D env->vl;                                \
     uint32_t i;                                           \
                                                           \
-    for (i =3D 0; i < vl; i++) {                            \
+    for (i =3D env->vstart; i < vl; i++) {                  \
         if (!vm && !vext_elem_mask(v0, i)) {              \
             continue;                                     \
         }                                                 \
         do_##NAME(vd, vs1, vs2, i, env);                  \
     }                                                     \
+    env->vstart =3D 0;                                      \
 }
=20
 RVVCALL(OPFVV2, vfadd_vv_h, OP_UUU_H, H2, H2, H2, float16_add)
@@ -2800,12 +2816,13 @@ void HELPER(NAME)(void *vd, void *v0, uint64_t s1=
,        \
     uint32_t vl =3D env->vl;                                \
     uint32_t i;                                           \
                                                           \
-    for (i =3D 0; i < vl; i++) {                            \
+    for (i =3D env->vstart; i < vl; i++) {                  \
         if (!vm && !vext_elem_mask(v0, i)) {              \
             continue;                                     \
         }                                                 \
         do_##NAME(vd, s1, vs2, i, env);                   \
     }                                                     \
+    env->vstart =3D 0;                                      \
 }
=20
 RVVCALL(OPFVF2, vfadd_vf_h, OP_UUU_H, H2, H2, float16_add)
@@ -3371,12 +3388,13 @@ void HELPER(NAME)(void *vd, void *v0, void *vs2, =
      \
     if (vl =3D=3D 0) {                                     \
         return;                                        \
     }                                                  \
-    for (i =3D 0; i < vl; i++) {                         \
+    for (i =3D env->vstart; i < vl; i++) {               \
         if (!vm && !vext_elem_mask(v0, i)) {           \
             continue;                                  \
         }                                              \
         do_##NAME(vd, vs2, i, env);                    \
     }                                                  \
+    env->vstart =3D 0;                                   \
 }
=20
 RVVCALL(OPFVV1, vfsqrt_v_h, OP_UU_H, H2, H2, float16_sqrt)
@@ -3507,7 +3525,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, vo=
id *vs2,   \
     uint32_t vl =3D env->vl;                                    \
     uint32_t i;                                               \
                                                               \
-    for (i =3D 0; i < vl; i++) {                                \
+    for (i =3D env->vstart; i < vl; i++) {                      \
         ETYPE s1 =3D *((ETYPE *)vs1 + H(i));                    \
         ETYPE s2 =3D *((ETYPE *)vs2 + H(i));                    \
         if (!vm && !vext_elem_mask(v0, i)) {                  \
@@ -3516,6 +3534,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, vo=
id *vs2,   \
         vext_set_elem_mask(vd, i,                             \
                            DO_OP(s2, s1, &env->fp_status));   \
     }                                                         \
+    env->vstart =3D 0;                                          \
 }
=20
 GEN_VEXT_CMP_VV_ENV(vmfeq_vv_h, uint16_t, H2, float16_eq_quiet)
@@ -3530,7 +3549,7 @@ void HELPER(NAME)(void *vd, void *v0, uint64_t s1, =
void *vs2,       \
     uint32_t vl =3D env->vl;                                          \
     uint32_t i;                                                     \
                                                                     \
-    for (i =3D 0; i < vl; i++) {                                      \
+    for (i =3D env->vstart; i < vl; i++) {                            \
         ETYPE s2 =3D *((ETYPE *)vs2 + H(i));                          \
         if (!vm && !vext_elem_mask(v0, i)) {                        \
             continue;                                               \
@@ -3538,6 +3557,7 @@ void HELPER(NAME)(void *vd, void *v0, uint64_t s1, =
void *vs2,       \
         vext_set_elem_mask(vd, i,                                   \
                            DO_OP(s2, (ETYPE)s1, &env->fp_status));  \
     }                                                               \
+    env->vstart =3D 0;                                                \
 }
=20
 GEN_VEXT_CMP_VF(vmfeq_vf_h, uint16_t, H2, float16_eq_quiet)
@@ -3646,12 +3666,13 @@ void HELPER(NAME)(void *vd, void *v0, void *vs2, =
      \
     uint32_t vl =3D env->vl;                             \
     uint32_t i;                                        \
                                                        \
-    for (i =3D 0; i < vl; i++) {                         \
+    for (i =3D env->vstart; i < vl; i++) {               \
         if (!vm && !vext_elem_mask(v0, i)) {           \
             continue;                                  \
         }                                              \
         do_##NAME(vd, vs2, i);                         \
     }                                                  \
+    env->vstart =3D 0;                                   \
 }
=20
 target_ulong fclass_h(uint64_t frs1)
@@ -3727,11 +3748,12 @@ void HELPER(NAME)(void *vd, void *v0, uint64_t s1=
, void *vs2, \
     uint32_t vl =3D env->vl;                                    \
     uint32_t i;                                               \
                                                               \
-    for (i =3D 0; i < vl; i++) {                                \
+    for (i =3D env->vstart; i < vl; i++) {                      \
         ETYPE s2 =3D *((ETYPE *)vs2 + H(i));                    \
         *((ETYPE *)vd + H(i))                                 \
           =3D (!vm && !vext_elem_mask(v0, i) ? s2 : s1);        \
     }                                                         \
+    env->vstart =3D 0;                                          \
 }
=20
 GEN_VFMERGE_VF(vfmerge_vfm_h, int16_t, H2)
@@ -3875,7 +3897,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,   =
       \
     uint32_t i;                                           \
     TD s1 =3D  *((TD *)vs1 + HD(0));                        \
                                                           \
-    for (i =3D 0; i < vl; i++) {                            \
+    for (i =3D env->vstart; i < vl; i++) {                  \
         TS2 s2 =3D *((TS2 *)vs2 + HS2(i));                  \
         if (!vm && !vext_elem_mask(v0, i)) {              \
             continue;                                     \
@@ -3883,6 +3905,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,   =
       \
         s1 =3D OP(s1, (TD)s2);                              \
     }                                                     \
     *((TD *)vd + HD(0)) =3D s1;                             \
+    env->vstart =3D 0;                                      \
 }
=20
 /* vd[0] =3D sum(vs1[0], vs2[*]) */
@@ -3955,7 +3978,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,   =
        \
     uint32_t i;                                            \
     TD s1 =3D  *((TD *)vs1 + HD(0));                         \
                                                            \
-    for (i =3D 0; i < vl; i++) {                             \
+    for (i =3D env->vstart; i < vl; i++) {                   \
         TS2 s2 =3D *((TS2 *)vs2 + HS2(i));                   \
         if (!vm && !vext_elem_mask(v0, i)) {               \
             continue;                                      \
@@ -3963,6 +3986,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,   =
        \
         s1 =3D OP(s1, (TD)s2, &env->fp_status);              \
     }                                                      \
     *((TD *)vd + HD(0)) =3D s1;                              \
+    env->vstart =3D 0;                                       \
 }
=20
 /* Unordered sum */
@@ -3990,7 +4014,7 @@ void HELPER(vfwredsum_vs_h)(void *vd, void *v0, voi=
d *vs1,
     uint32_t i;
     uint32_t s1 =3D  *((uint32_t *)vs1 + H4(0));
=20
-    for (i =3D 0; i < vl; i++) {
+    for (i =3D env->vstart; i < vl; i++) {
         uint16_t s2 =3D *((uint16_t *)vs2 + H2(i));
         if (!vm && !vext_elem_mask(v0, i)) {
             continue;
@@ -3999,6 +4023,7 @@ void HELPER(vfwredsum_vs_h)(void *vd, void *v0, voi=
d *vs1,
                          &env->fp_status);
     }
     *((uint32_t *)vd + H4(0)) =3D s1;
+    env->vstart =3D 0;
 }
=20
 void HELPER(vfwredsum_vs_w)(void *vd, void *v0, void *vs1,
@@ -4009,7 +4034,7 @@ void HELPER(vfwredsum_vs_w)(void *vd, void *v0, voi=
d *vs1,
     uint32_t i;
     uint64_t s1 =3D  *((uint64_t *)vs1);
=20
-    for (i =3D 0; i < vl; i++) {
+    for (i =3D env->vstart; i < vl; i++) {
         uint32_t s2 =3D *((uint32_t *)vs2 + H4(i));
         if (!vm && !vext_elem_mask(v0, i)) {
             continue;
@@ -4018,6 +4043,7 @@ void HELPER(vfwredsum_vs_w)(void *vd, void *v0, voi=
d *vs1,
                          &env->fp_status);
     }
     *((uint64_t *)vd) =3D s1;
+    env->vstart =3D 0;
 }
=20
 /*
@@ -4033,11 +4059,12 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, =
         \
     uint32_t i;                                           \
     int a, b;                                             \
                                                           \
-    for (i =3D 0; i < vl; i++) {                            \
+    for (i =3D env->vstart; i < vl; i++) {                  \
         a =3D vext_elem_mask(vs1, i);                       \
         b =3D vext_elem_mask(vs2, i);                       \
         vext_set_elem_mask(vd, i, OP(b, a));              \
     }                                                     \
+    env->vstart =3D 0;                                      \
 }
=20
 #define DO_NAND(N, M)  (!(N & M))
@@ -4064,13 +4091,14 @@ target_ulong HELPER(vcpop_m)(void *v0, void *vs2,=
 CPURISCVState *env,
     uint32_t vl =3D env->vl;
     int i;
=20
-    for (i =3D 0; i < vl; i++) {
+    for (i =3D env->vstart; i < vl; i++) {
         if (vm || vext_elem_mask(v0, i)) {
             if (vext_elem_mask(vs2, i)) {
                 cnt++;
             }
         }
     }
+    env->vstart =3D 0;
     return cnt;
 }
=20
@@ -4082,13 +4110,14 @@ target_ulong HELPER(vfirst_m)(void *v0, void *vs2=
, CPURISCVState *env,
     uint32_t vl =3D env->vl;
     int i;
=20
-    for (i =3D 0; i < vl; i++) {
+    for (i =3D env->vstart; i < vl; i++) {
         if (vm || vext_elem_mask(v0, i)) {
             if (vext_elem_mask(vs2, i)) {
                 return i;
             }
         }
     }
+    env->vstart =3D 0;
     return -1LL;
 }
=20
@@ -4106,7 +4135,7 @@ static void vmsetm(void *vd, void *v0, void *vs2, C=
PURISCVState *env,
     int i;
     bool first_mask_bit =3D false;
=20
-    for (i =3D 0; i < vl; i++) {
+    for (i =3D env->vstart; i < vl; i++) {
         if (!vm && !vext_elem_mask(v0, i)) {
             continue;
         }
@@ -4130,6 +4159,7 @@ static void vmsetm(void *vd, void *v0, void *vs2, C=
PURISCVState *env,
             }
         }
     }
+    env->vstart =3D 0;
 }
=20
 void HELPER(vmsbf_m)(void *vd, void *v0, void *vs2, CPURISCVState *env,
@@ -4160,7 +4190,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs2, CP=
URISCVState *env,      \
     uint32_t sum =3D 0;                                                 =
    \
     int i;                                                              =
  \
                                                                         =
  \
-    for (i =3D 0; i < vl; i++) {                                        =
    \
+    for (i =3D env->vstart; i < vl; i++) {                              =
    \
         if (!vm && !vext_elem_mask(v0, i)) {                            =
  \
             continue;                                                   =
  \
         }                                                               =
  \
@@ -4169,6 +4199,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs2, CP=
URISCVState *env,      \
             sum++;                                                      =
  \
         }                                                               =
  \
     }                                                                   =
  \
+    env->vstart =3D 0;                                                  =
    \
 }
=20
 GEN_VEXT_VIOTA_M(viota_m_b, uint8_t,  H1)
@@ -4184,12 +4215,13 @@ void HELPER(NAME)(void *vd, void *v0, CPURISCVSta=
te *env, uint32_t desc)  \
     uint32_t vl =3D env->vl;                                            =
    \
     int i;                                                              =
  \
                                                                         =
  \
-    for (i =3D 0; i < vl; i++) {                                        =
    \
+    for (i =3D env->vstart; i < vl; i++) {                              =
    \
         if (!vm && !vext_elem_mask(v0, i)) {                            =
  \
             continue;                                                   =
  \
         }                                                               =
  \
         *((ETYPE *)vd + H(i)) =3D i;                                    =
    \
     }                                                                   =
  \
+    env->vstart =3D 0;                                                  =
    \
 }
=20
 GEN_VEXT_VID_V(vid_v_b, uint8_t,  H1)
@@ -4208,9 +4240,10 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong=
 s1, void *vs2,         \
 {                                                                       =
  \
     uint32_t vm =3D vext_vm(desc);                                      =
    \
     uint32_t vl =3D env->vl;                                            =
    \
-    target_ulong offset =3D s1, i;                                      =
    \
+    target_ulong offset =3D s1, i_min, i;                               =
    \
                                                                         =
  \
-    for (i =3D offset; i < vl; i++) {                                   =
    \
+    i_min =3D MAX(env->vstart, offset);                                 =
    \
+    for (i =3D i_min; i < vl; i++) {                                    =
    \
         if (!vm && !vext_elem_mask(v0, i)) {                            =
  \
             continue;                                                   =
  \
         }                                                               =
  \
@@ -4233,8 +4266,8 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong =
s1, void *vs2,         \
     uint32_t vl =3D env->vl;                                            =
    \
     target_ulong i_max, i;                                              =
  \
                                                                         =
  \
-    i_max =3D MIN(s1 < vlmax ? vlmax - s1 : 0, vl);                     =
    \
-    for (i =3D 0; i < i_max; ++i) {                                     =
    \
+    i_max =3D MAX(MIN(s1 < vlmax ? vlmax - s1 : 0, vl), env->vstart);   =
    \
+    for (i =3D env->vstart; i < i_max; ++i) {                           =
    \
         if (vm || vext_elem_mask(v0, i)) {                              =
  \
             *((ETYPE *)vd + H(i)) =3D *((ETYPE *)vs2 + H(i + s1));      =
    \
         }                                                               =
  \
@@ -4245,6 +4278,8 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong =
s1, void *vs2,         \
             *((ETYPE *)vd + H(i)) =3D 0;                                =
    \
         }                                                               =
  \
     }                                                                   =
  \
+                                                                        =
  \
+    env->vstart =3D 0;                                                  =
    \
 }
=20
 /* vslidedown.vx vd, vs2, rs1, vm # vd[i] =3D vs2[i+rs1] */
@@ -4262,7 +4297,7 @@ static void vslide1up_##ESZ(void *vd, void *v0, tar=
get_ulong s1, void *vs2, \
     uint32_t vl =3D env->vl;                                            =
      \
     uint32_t i;                                                         =
    \
                                                                         =
    \
-    for (i =3D 0; i < vl; i++) {                                        =
      \
+    for (i =3D env->vstart; i < vl; i++) {                              =
      \
         if (!vm && !vext_elem_mask(v0, i)) {                            =
    \
             continue;                                                   =
    \
         }                                                               =
    \
@@ -4272,6 +4307,7 @@ static void vslide1up_##ESZ(void *vd, void *v0, tar=
get_ulong s1, void *vs2, \
             *((ETYPE *)vd + H(i)) =3D *((ETYPE *)vs2 + H(i - 1));       =
      \
         }                                                               =
    \
     }                                                                   =
    \
+    env->vstart =3D 0;                                                  =
      \
 }
=20
 GEN_VEXT_VSLIE1UP(8,  H1)
@@ -4301,7 +4337,7 @@ static void vslide1down_##ESZ(void *vd, void *v0, t=
arget_ulong s1, void *vs2, \
     uint32_t vl =3D env->vl;                                            =
        \
     uint32_t i;                                                         =
      \
                                                                         =
      \
-    for (i =3D 0; i < vl; i++) {                                        =
        \
+    for (i =3D env->vstart; i < vl; i++) {                              =
        \
         if (!vm && !vext_elem_mask(v0, i)) {                            =
      \
             continue;                                                   =
      \
         }                                                               =
      \
@@ -4311,6 +4347,7 @@ static void vslide1down_##ESZ(void *vd, void *v0, t=
arget_ulong s1, void *vs2, \
             *((ETYPE *)vd + H(i)) =3D *((ETYPE *)vs2 + H(i + 1));       =
        \
         }                                                               =
      \
     }                                                                   =
      \
+    env->vstart =3D 0;                                                  =
        \
 }
=20
 GEN_VEXT_VSLIDE1DOWN(8,  H1)
@@ -4361,13 +4398,13 @@ GEN_VEXT_VFSLIDE1DOWN_VF(vfslide1down_vf_d, 64)
 void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,             =
  \
                   CPURISCVState *env, uint32_t desc)                    =
  \
 {                                                                       =
  \
-    uint32_t vlmax =3D vext_max_elems(desc, ctzl(sizeof(TS1)));         =
    \
+    uint32_t vlmax =3D vext_max_elems(desc, ctzl(sizeof(TS2)));         =
    \
     uint32_t vm =3D vext_vm(desc);                                      =
    \
     uint32_t vl =3D env->vl;                                            =
    \
     uint64_t index;                                                     =
  \
     uint32_t i;                                                         =
  \
                                                                         =
  \
-    for (i =3D 0; i < vl; i++) {                                        =
    \
+    for (i =3D env->vstart; i < vl; i++) {                              =
    \
         if (!vm && !vext_elem_mask(v0, i)) {                            =
  \
             continue;                                                   =
  \
         }                                                               =
  \
@@ -4378,6 +4415,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, vo=
id *vs2,               \
             *((TS2 *)vd + HS2(i)) =3D *((TS2 *)vs2 + HS2(index));       =
    \
         }                                                               =
  \
     }                                                                   =
  \
+    env->vstart =3D 0;                                                  =
    \
 }
=20
 /* vd[i] =3D (vs1[i] >=3D VLMAX) ? 0 : vs2[vs1[i]]; */
@@ -4401,7 +4439,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong =
s1, void *vs2,         \
     uint64_t index =3D s1;                                              =
    \
     uint32_t i;                                                         =
  \
                                                                         =
  \
-    for (i =3D 0; i < vl; i++) {                                        =
    \
+    for (i =3D env->vstart; i < vl; i++) {                              =
    \
         if (!vm && !vext_elem_mask(v0, i)) {                            =
  \
             continue;                                                   =
  \
         }                                                               =
  \
@@ -4411,6 +4449,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong =
s1, void *vs2,         \
             *((ETYPE *)vd + H(i)) =3D *((ETYPE *)vs2 + H(index));       =
    \
         }                                                               =
  \
     }                                                                   =
  \
+    env->vstart =3D 0;                                                  =
    \
 }
=20
 /* vd[i] =3D (x[rs1] >=3D VLMAX) ? 0 : vs2[rs1] */
@@ -4427,13 +4466,14 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, =
void *vs2,               \
     uint32_t vl =3D env->vl;                                            =
    \
     uint32_t num =3D 0, i;                                              =
    \
                                                                         =
  \
-    for (i =3D 0; i < vl; i++) {                                        =
    \
+    for (i =3D env->vstart; i < vl; i++) {                              =
    \
         if (!vext_elem_mask(vs1, i)) {                                  =
  \
             continue;                                                   =
  \
         }                                                               =
  \
         *((ETYPE *)vd + H(num)) =3D *((ETYPE *)vs2 + H(i));             =
    \
         num++;                                                          =
  \
     }                                                                   =
  \
+    env->vstart =3D 0;                                                  =
    \
 }
=20
 /* Compress into vd elements of vs2 where vs1 is enabled */
@@ -4442,6 +4482,27 @@ GEN_VEXT_VCOMPRESS_VM(vcompress_vm_h, uint16_t, H2=
)
 GEN_VEXT_VCOMPRESS_VM(vcompress_vm_w, uint32_t, H4)
 GEN_VEXT_VCOMPRESS_VM(vcompress_vm_d, uint64_t, H8)
=20
+/* Vector Whole Register Move */
+#define GEN_VEXT_VMV_WHOLE(NAME, LEN)                      \
+void HELPER(NAME)(void *vd, void *vs2, CPURISCVState *env, \
+                  uint32_t desc)                           \
+{                                                          \
+    /* EEW =3D 8 */                                          \
+    uint32_t maxsz =3D simd_maxsz(desc);                     \
+    uint32_t i =3D env->vstart;                              \
+                                                           \
+    memcpy((uint8_t *)vd + H1(i),                          \
+           (uint8_t *)vs2 + H1(i),                         \
+           maxsz - env->vstart);                           \
+                                                           \
+    env->vstart =3D 0;                                       \
+}
+
+GEN_VEXT_VMV_WHOLE(vmv1r_v, 1)
+GEN_VEXT_VMV_WHOLE(vmv2r_v, 2)
+GEN_VEXT_VMV_WHOLE(vmv4r_v, 4)
+GEN_VEXT_VMV_WHOLE(vmv8r_v, 8)
+
 /* Vector Integer Extension */
 #define GEN_VEXT_INT_EXT(NAME, ETYPE, DTYPE, HD, HS1)            \
 void HELPER(NAME)(void *vd, void *v0, void *vs2,                 \
@@ -4451,12 +4512,13 @@ void HELPER(NAME)(void *vd, void *v0, void *vs2, =
                \
     uint32_t vm =3D vext_vm(desc);                                 \
     uint32_t i;                                                  \
                                                                  \
-    for (i =3D 0; i < vl; i++) {                                   \
+    for (i =3D env->vstart; i < vl; i++) {                         \
         if (!vm && !vext_elem_mask(v0, i)) {                     \
             continue;                                            \
         }                                                        \
         *((ETYPE *)vd + HD(i)) =3D *((DTYPE *)vs2 + HS1(i));       \
     }                                                            \
+    env->vstart =3D 0;                                             \
 }
=20
 GEN_VEXT_INT_EXT(vzext_vf2_h, uint16_t, uint8_t,  H2, H1)
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
index be3f9f1327..7589c8ce32 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -490,7 +490,7 @@ static bool vext_check_sds(DisasContext *s, int vd, i=
nt vs1, int vs2, int vm)
  */
 static bool vext_check_reduction(DisasContext *s, int vs2)
 {
-    return require_align(vs2, s->lmul);
+    return require_align(vs2, s->lmul) && (s->vstart =3D=3D 0);
 }
=20
 /*
@@ -2786,7 +2786,8 @@ GEN_MM_TRANS(vmxnor_mm)
 static bool trans_vcpop_m(DisasContext *s, arg_rmr *a)
 {
     if (require_rvv(s) &&
-        vext_check_isa_ill(s)) {
+        vext_check_isa_ill(s) &&
+        s->vstart =3D=3D 0) {
         TCGv_ptr src2, mask;
         TCGv dst;
         TCGv_i32 desc;
@@ -2817,7 +2818,8 @@ static bool trans_vcpop_m(DisasContext *s, arg_rmr =
*a)
 static bool trans_vfirst_m(DisasContext *s, arg_rmr *a)
 {
     if (require_rvv(s) &&
-        vext_check_isa_ill(s)) {
+        vext_check_isa_ill(s) &&
+        s->vstart =3D=3D 0) {
         TCGv_ptr src2, mask;
         TCGv dst;
         TCGv_i32 desc;
@@ -2852,7 +2854,8 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *=
a)              \
     if (require_rvv(s) &&                                          \
         vext_check_isa_ill(s) &&                                   \
         require_vm(a->vm, a->rd) &&                                \
-        (a->rd !=3D a->rs2)) {                                       \
+        (a->rd !=3D a->rs2) &&                                       \
+        (s->vstart =3D=3D 0)) {                                        \
         uint32_t data =3D 0;                                         \
         gen_helper_gvec_3_ptr *fn =3D gen_helper_##NAME;             \
         TCGLabel *over =3D gen_new_label();                          \
@@ -2888,7 +2891,8 @@ static bool trans_viota_m(DisasContext *s, arg_viot=
a_m *a)
         vext_check_isa_ill(s) &&
         !is_overlapped(a->rd, 1 << MAX(s->lmul, 0), a->rs2, 1) &&
         require_vm(a->vm, a->rd) &&
-        require_align(a->rd, s->lmul)) {
+        require_align(a->rd, s->lmul) &&
+        (s->vstart =3D=3D 0)) {
         uint32_t data =3D 0;
         TCGLabel *over =3D gen_new_label();
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
@@ -3109,6 +3113,7 @@ static bool trans_vmv_s_x(DisasContext *s, arg_vmv_=
s_x *a)
         TCGLabel *over =3D gen_new_label();
=20
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
+        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
=20
         t1 =3D tcg_temp_new_i64();
=20
@@ -3161,8 +3166,9 @@ static bool trans_vfmv_s_f(DisasContext *s, arg_vfm=
v_s_f *a)
         TCGv_i64 t1;
         TCGLabel *over =3D gen_new_label();
=20
-        /* if vl =3D=3D 0, skip vector register write back */
+        /* if vl =3D=3D 0 or vstart >=3D vl, skip vector register write =
back */
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
+        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
=20
         /* NaN-box f[rs1] */
         t1 =3D tcg_temp_new_i64();
@@ -3333,7 +3339,8 @@ static bool vcompress_vm_check(DisasContext *s, arg=
_r *a)
            require_align(a->rd, s->lmul) &&
            require_align(a->rs2, s->lmul) &&
            (a->rd !=3D a->rs2) &&
-           !is_overlapped(a->rd, 1 << MAX(s->lmul, 0), a->rs1, 1);
+           !is_overlapped(a->rd, 1 << MAX(s->lmul, 0), a->rs1, 1) &&
+           (s->vstart =3D=3D 0);
 }
=20
 static bool trans_vcompress_vm(DisasContext *s, arg_r *a)
@@ -3363,26 +3370,40 @@ static bool trans_vcompress_vm(DisasContext *s, a=
rg_r *a)
  * Whole Vector Register Move Instructions ignore vtype and vl setting.
  * Thus, we don't need to check vill bit. (Section 16.6)
  */
-#define GEN_VMV_WHOLE_TRANS(NAME, LEN)                          \
-static bool trans_##NAME(DisasContext *s, arg_##NAME * a)       \
-{                                                               \
-    if (require_rvv(s) &&                                       \
-        QEMU_IS_ALIGNED(a->rd, LEN) &&                          \
-        QEMU_IS_ALIGNED(a->rs2, LEN)) {                         \
-        /* EEW =3D 8 */                                           \
-        tcg_gen_gvec_mov(MO_8, vreg_ofs(s, a->rd),              \
-                         vreg_ofs(s, a->rs2),                   \
-                         s->vlen / 8 * LEN, s->vlen / 8 * LEN); \
-        mark_vs_dirty(s);                                       \
-        return true;                                            \
-    }                                                           \
-    return false;                                               \
-}
-
-GEN_VMV_WHOLE_TRANS(vmv1r_v, 1)
-GEN_VMV_WHOLE_TRANS(vmv2r_v, 2)
-GEN_VMV_WHOLE_TRANS(vmv4r_v, 4)
-GEN_VMV_WHOLE_TRANS(vmv8r_v, 8)
+#define GEN_VMV_WHOLE_TRANS(NAME, LEN, SEQ)                             =
\
+static bool trans_##NAME(DisasContext *s, arg_##NAME * a)               =
\
+{                                                                       =
\
+    if (require_rvv(s) &&                                               =
\
+        QEMU_IS_ALIGNED(a->rd, LEN) &&                                  =
\
+        QEMU_IS_ALIGNED(a->rs2, LEN)) {                                 =
\
+        uint32_t maxsz =3D (s->vlen >> 3) * LEN;                        =
  \
+        if (s->vstart =3D=3D 0) {                                       =
    \
+            /* EEW =3D 8 */                                             =
  \
+            tcg_gen_gvec_mov(MO_8, vreg_ofs(s, a->rd),                  =
\
+                             vreg_ofs(s, a->rs2), maxsz, maxsz);        =
\
+            mark_vs_dirty(s);                                           =
\
+        } else {                                                        =
\
+            TCGLabel *over =3D gen_new_label();                         =
  \
+            tcg_gen_brcondi_tl(TCG_COND_GEU, cpu_vstart, maxsz, over);  =
\
+                                                                        =
\
+            static gen_helper_gvec_2_ptr * const fns[4] =3D {           =
  \
+                gen_helper_vmv1r_v, gen_helper_vmv2r_v,                 =
\
+                gen_helper_vmv4r_v, gen_helper_vmv8r_v,                 =
\
+            };                                                          =
\
+            tcg_gen_gvec_2_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, a->rs2), =
\
+                               cpu_env, maxsz, maxsz, 0, fns[SEQ]);     =
\
+            mark_vs_dirty(s);                                           =
\
+            gen_set_label(over);                                        =
\
+        }                                                               =
\
+        return true;                                                    =
\
+    }                                                                   =
\
+    return false;                                                       =
\
+}
+
+GEN_VMV_WHOLE_TRANS(vmv1r_v, 1, 0)
+GEN_VMV_WHOLE_TRANS(vmv2r_v, 2, 1)
+GEN_VMV_WHOLE_TRANS(vmv4r_v, 4, 2)
+GEN_VMV_WHOLE_TRANS(vmv8r_v, 8, 3)
=20
 static bool int_ext_check(DisasContext *s, arg_rmr *a, uint8_t div)
 {
--=20
2.31.1


