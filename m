Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC2C47A4C8
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 06:58:33 +0100 (CET)
Received: from localhost ([::1]:41172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzBgu-0000mt-5t
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 00:58:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAlx-0003Hf-5C
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 23:59:41 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:13353)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAlu-0008Ey-5W
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 23:59:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639976378; x=1671512378;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nB28/IbWhdYqUL7+PfC3Bpt/+WI9IfV5DYrAfUSLvZI=;
 b=CfroNNXcmtGavpX//WPJ4Ust4p0xorft5QpRxCshlGcGflA2m720b93o
 xE7n4ckO69w8IqID+GOpLPY8Yau09W80OtgAKcJFsI0T3j5MtTyM+vxYr
 kH7ALIj/UQTP3r20Iju1XutwERqMAerdFSJBCLM7jWMbDGyPYa0C90A0I
 TbZhWcUqyYXvzb4tj0tL/Tik4PbuHxq8WV2dZaurQTECAw29T9eLt0Zsb
 W3sP5UkwwkgQC0h1a98VqtAOwtR2uEdXCqlYDitJbs93Qp2PanrSeFM71
 U2YTeuwKGZUQ8pi39ippgtQM53NQHbWv0NBxUp3WVV+Ry8fM8SXHVhS1X Q==;
X-IronPort-AV: E=Sophos;i="5.88,219,1635177600"; d="scan'208";a="189680052"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2021 12:59:37 +0800
IronPort-SDR: KsNB4A7iPvSD5DRn1c9O9GxRe9k9TY25AF6c2r5IwIT+zbS1FvtAlI/n8fqi2awTe6U6B2uBUK
 tDJZToomFA+4Wwp3f5j+o/Jn2P1Z3MH9fTEh3pnjuT6gfOU9z9GMvJtq0TTJLDaWKDZfos5nsX
 3tW3B0BRdGQRqwVTdFc32x3j2mKz2K+tzoXKjkI99rSmnjEKAfPGJ3T+Wlco9L1t06O5+qf1QZ
 T6v1a0TxUNMk5cnP3p0r5RVo27OQ7P6nU9gQOodum+WiehFODHPvA/T5yhw+GMPJKCprAxLz5Z
 g+zQ1YsGHNiVavbmOb/VlPO/
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:32:26 -0800
IronPort-SDR: 5rfco3ifsfm6/AuvPAUgzP7wD4T4lvOHfp9Gn9FBXB4ec62hJiDGsrvY4+fqUBzIS2r+kbdngM
 Ud0yDve5uikoRQCBgbo8UgCCytzlVUkUlBeRS8yRDuSbHgy77JChusEi4Gcg6G65sDslqS5AU8
 9q+uL8h7/5A90C7ZTiPlW0CnbAA4IBc8PudA0K10g0a0LdcrWW1k5bbmwPxWxLarMUZvm6pJ8L
 DpnlZ/NKLen28iTD2HAN9bqN5gXoJeP80UXeuTBrZh2JkHwPxlZb0Tm8a8Js6QmwfUtHFZwZho
 DYg=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:59:38 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JHS7D4gYyz1RwFN
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 20:59:36 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639976375; x=1642568376; bh=nB28/IbWhdYqUL7+Pf
 C3Bpt/+WI9IfV5DYrAfUSLvZI=; b=gb3iB8f6IzF5lDdIqIiiXGXLc37ma+aQgG
 E0sOVC+vSC1OTI3AaxoQXIbQp4ppcJGojhagpd6lnHrfdQVYFadx1iAO9Dz+Q8+f
 m7oTul8JX2TIYK6+qVRuLVhzdDnh/SXvdp+cIWAxw1CeXUeMwxz8oAdpJdsZ+Xk8
 Apz9CiJMIkd9ncJaxSGvSKIsSM55AaQoDO3EXeOzAejmKUw+MTrAkx8iYQJvLZpS
 Or3MT0oysgL11luxxSRTgVBmjkfONbyIA8TweoT86csvGs87NJ9hHmIh0KRJvwaQ
 Lo14YoC2cFLRj+AK448wd0agzaRWM89MofO3AH9jdyJb2J6Y0FPQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id Tz29DkVw4t7V for <qemu-devel@nongnu.org>;
 Sun, 19 Dec 2021 20:59:35 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.68])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JHS791T87z1RtVG;
 Sun, 19 Dec 2021 20:59:32 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 33/88] target/riscv: rvv-1.0: update vext_max_elems() for
 load/store insns
Date: Mon, 20 Dec 2021 14:56:10 +1000
Message-Id: <20211220045705.62174-34-alistair.francis@opensource.wdc.com>
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
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20211210075704.23951-26-frank.chang@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/vector_helper.c            | 99 ++++++++++++++-----------
 target/riscv/insn_trans/trans_rvv.c.inc | 32 ++++++--
 2 files changed, 80 insertions(+), 51 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 9a39a0e2d2..f9919273dc 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -17,6 +17,7 @@
  */
=20
 #include "qemu/osdep.h"
+#include "qemu/host-utils.h"
 #include "cpu.h"
 #include "exec/memop.h"
 #include "exec/exec-all.h"
@@ -116,14 +117,21 @@ static inline int32_t vext_lmul(uint32_t desc)
 }
=20
 /*
- * Get vector group length in bytes. Its range is [64, 2048].
+ * Get the maximum number of elements can be operated.
  *
- * As simd_desc support at most 256, the max vlen is 512 bits.
- * So vlen in bytes is encoded as maxsz.
+ * esz: log2 of element size in bytes.
  */
-static inline uint32_t vext_maxsz(uint32_t desc)
+static inline uint32_t vext_max_elems(uint32_t desc, uint32_t esz)
 {
-    return simd_maxsz(desc) << vext_lmul(desc);
+    /*
+     * As simd_desc support at most 256 bytes, the max vlen is 256 bits.
+     * so vlen in bytes (vlenb) is encoded as maxsz.
+     */
+    uint32_t vlenb =3D simd_maxsz(desc);
+
+    /* Return VLMAX */
+    int scale =3D vext_lmul(desc) - esz;
+    return scale < 0 ? vlenb >> -scale : vlenb << scale;
 }
=20
 /*
@@ -216,14 +224,14 @@ vext_ldst_stride(void *vd, void *v0, target_ulong b=
ase,
 {
     uint32_t i, k;
     uint32_t nf =3D vext_nf(desc);
-    uint32_t vlmax =3D vext_maxsz(desc) / esz;
+    uint32_t max_elems =3D vext_max_elems(desc, esz);
=20
     /* probe every access*/
     for (i =3D 0; i < env->vl; i++) {
         if (!vm && !vext_elem_mask(v0, i)) {
             continue;
         }
-        probe_pages(env, base + stride * i, nf * esz, ra, access_type);
+        probe_pages(env, base + stride * i, nf << esz, ra, access_type);
     }
     /* do real access */
     for (i =3D 0; i < env->vl; i++) {
@@ -232,8 +240,8 @@ vext_ldst_stride(void *vd, void *v0, target_ulong bas=
e,
             continue;
         }
         while (k < nf) {
-            target_ulong addr =3D base + stride * i + k * esz;
-            ldst_elem(env, addr, i + k * vlmax, vd, ra);
+            target_ulong addr =3D base + stride * i + (k << esz);
+            ldst_elem(env, addr, i + k * max_elems, vd, ra);
             k++;
         }
     }
@@ -246,7 +254,7 @@ void HELPER(NAME)(void *vd, void * v0, target_ulong b=
ase,               \
 {                                                                       =
\
     uint32_t vm =3D vext_vm(desc);                                      =
  \
     vext_ldst_stride(vd, v0, base, stride, env, desc, vm, LOAD_FN,      =
\
-                     sizeof(ETYPE), GETPC(), MMU_DATA_LOAD);            =
\
+                     ctzl(sizeof(ETYPE)), GETPC(), MMU_DATA_LOAD);      =
\
 }
=20
 GEN_VEXT_LD_STRIDE(vlse8_v,  int8_t,  lde_b)
@@ -261,7 +269,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong ba=
se,                \
 {                                                                       =
\
     uint32_t vm =3D vext_vm(desc);                                      =
  \
     vext_ldst_stride(vd, v0, base, stride, env, desc, vm, STORE_FN,     =
\
-                     sizeof(ETYPE), GETPC(), MMU_DATA_STORE);           =
\
+                     ctzl(sizeof(ETYPE)), GETPC(), MMU_DATA_STORE);     =
\
 }
=20
 GEN_VEXT_ST_STRIDE(vsse8_v,  int8_t,  ste_b)
@@ -281,16 +289,16 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVS=
tate *env, uint32_t desc,
 {
     uint32_t i, k;
     uint32_t nf =3D vext_nf(desc);
-    uint32_t vlmax =3D vext_maxsz(desc) / esz;
+    uint32_t max_elems =3D vext_max_elems(desc, esz);
=20
     /* probe every access */
-    probe_pages(env, base, env->vl * nf * esz, ra, access_type);
+    probe_pages(env, base, env->vl * (nf << esz), ra, access_type);
     /* load bytes from guest memory */
     for (i =3D 0; i < env->vl; i++) {
         k =3D 0;
         while (k < nf) {
-            target_ulong addr =3D base + (i * nf + k) * esz;
-            ldst_elem(env, addr, i + k * vlmax, vd, ra);
+            target_ulong addr =3D base + ((i * nf + k) << esz);
+            ldst_elem(env, addr, i + k * max_elems, vd, ra);
             k++;
         }
     }
@@ -305,16 +313,16 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVS=
tate *env, uint32_t desc,
 void HELPER(NAME##_mask)(void *vd, void *v0, target_ulong base,         =
\
                          CPURISCVState *env, uint32_t desc)             =
\
 {                                                                       =
\
-    uint32_t stride =3D vext_nf(desc) * sizeof(ETYPE);                  =
  \
+    uint32_t stride =3D vext_nf(desc) << ctzl(sizeof(ETYPE));           =
  \
     vext_ldst_stride(vd, v0, base, stride, env, desc, false, LOAD_FN,   =
\
-                     sizeof(ETYPE), GETPC(), MMU_DATA_LOAD);            =
\
+                     ctzl(sizeof(ETYPE)), GETPC(), MMU_DATA_LOAD);      =
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
     vext_ldst_us(vd, base, env, desc, LOAD_FN,                          =
\
-                 sizeof(ETYPE), GETPC(), MMU_DATA_LOAD);                =
\
+                 ctzl(sizeof(ETYPE)), GETPC(), MMU_DATA_LOAD);          =
\
 }
=20
 GEN_VEXT_LD_US(vle8_v,  int8_t,  lde_b)
@@ -326,16 +334,16 @@ GEN_VEXT_LD_US(vle64_v, int64_t, lde_d)
 void HELPER(NAME##_mask)(void *vd, void *v0, target_ulong base,         =
\
                          CPURISCVState *env, uint32_t desc)             =
\
 {                                                                       =
\
-    uint32_t stride =3D vext_nf(desc) * sizeof(ETYPE);                  =
  \
+    uint32_t stride =3D vext_nf(desc) << ctzl(sizeof(ETYPE));           =
  \
     vext_ldst_stride(vd, v0, base, stride, env, desc, false, STORE_FN,  =
\
-                     sizeof(ETYPE), GETPC(), MMU_DATA_STORE);           =
\
+                     ctzl(sizeof(ETYPE)), GETPC(), MMU_DATA_STORE);     =
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
     vext_ldst_us(vd, base, env, desc, STORE_FN,                         =
\
-                 sizeof(ETYPE), GETPC(), MMU_DATA_STORE);               =
\
+                 ctzl(sizeof(ETYPE)), GETPC(), MMU_DATA_STORE);         =
\
 }
=20
 GEN_VEXT_ST_US(vse8_v,  int8_t,  ste_b)
@@ -371,14 +379,14 @@ vext_ldst_index(void *vd, void *v0, target_ulong ba=
se,
     uint32_t i, k;
     uint32_t nf =3D vext_nf(desc);
     uint32_t vm =3D vext_vm(desc);
-    uint32_t vlmax =3D vext_maxsz(desc) / esz;
+    uint32_t max_elems =3D vext_max_elems(desc, esz);
=20
     /* probe every access*/
     for (i =3D 0; i < env->vl; i++) {
         if (!vm && !vext_elem_mask(v0, i)) {
             continue;
         }
-        probe_pages(env, get_index_addr(base, i, vs2), nf * esz, ra,
+        probe_pages(env, get_index_addr(base, i, vs2), nf << esz, ra,
                     access_type);
     }
     /* load bytes from guest memory */
@@ -388,8 +396,8 @@ vext_ldst_index(void *vd, void *v0, target_ulong base=
,
             continue;
         }
         while (k < nf) {
-            abi_ptr addr =3D get_index_addr(base, i, vs2) + k * esz;
-            ldst_elem(env, addr, i + k * vlmax, vd, ra);
+            abi_ptr addr =3D get_index_addr(base, i, vs2) + (k << esz);
+            ldst_elem(env, addr, i + k * max_elems, vd, ra);
             k++;
         }
     }
@@ -400,7 +408,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong ba=
se,                   \
                   void *vs2, CPURISCVState *env, uint32_t desc)         =
   \
 {                                                                       =
   \
     vext_ldst_index(vd, v0, base, vs2, env, desc, INDEX_FN,             =
   \
-                    LOAD_FN, sizeof(ETYPE), GETPC(), MMU_DATA_LOAD);    =
   \
+                    LOAD_FN, ctzl(sizeof(ETYPE)), GETPC(), MMU_DATA_LOAD=
); \
 }
=20
 GEN_VEXT_LD_INDEX(vlxei8_8_v,   int8_t,  idx_b, lde_b)
@@ -425,7 +433,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong ba=
se,         \
                   void *vs2, CPURISCVState *env, uint32_t desc)  \
 {                                                                \
     vext_ldst_index(vd, v0, base, vs2, env, desc, INDEX_FN,      \
-                    STORE_FN, sizeof(ETYPE),                     \
+                    STORE_FN, ctzl(sizeof(ETYPE)),               \
                     GETPC(), MMU_DATA_STORE);                    \
 }
=20
@@ -459,7 +467,7 @@ vext_ldff(void *vd, void *v0, target_ulong base,
     uint32_t i, k, vl =3D 0;
     uint32_t nf =3D vext_nf(desc);
     uint32_t vm =3D vext_vm(desc);
-    uint32_t vlmax =3D vext_maxsz(desc) / esz;
+    uint32_t max_elems =3D vext_max_elems(desc, esz);
     target_ulong addr, offset, remain;
=20
     /* probe every access*/
@@ -467,24 +475,24 @@ vext_ldff(void *vd, void *v0, target_ulong base,
         if (!vm && !vext_elem_mask(v0, i)) {
             continue;
         }
-        addr =3D base + nf * i * esz;
+        addr =3D base + i * (nf << esz);
         if (i =3D=3D 0) {
-            probe_pages(env, addr, nf * esz, ra, MMU_DATA_LOAD);
+            probe_pages(env, addr, nf << esz, ra, MMU_DATA_LOAD);
         } else {
             /* if it triggers an exception, no need to check watchpoint =
*/
-            remain =3D nf * esz;
+            remain =3D nf << esz;
             while (remain > 0) {
                 offset =3D -(addr | TARGET_PAGE_MASK);
                 host =3D tlb_vaddr_to_host(env, addr, MMU_DATA_LOAD,
                                          cpu_mmu_index(env, false));
                 if (host) {
 #ifdef CONFIG_USER_ONLY
-                    if (page_check_range(addr, nf * esz, PAGE_READ) < 0)=
 {
+                    if (page_check_range(addr, nf << esz, PAGE_READ) < 0=
) {
                         vl =3D i;
                         goto ProbeSuccess;
                     }
 #else
-                    probe_pages(env, addr, nf * esz, ra, MMU_DATA_LOAD);
+                    probe_pages(env, addr, nf << esz, ra, MMU_DATA_LOAD)=
;
 #endif
                 } else {
                     vl =3D i;
@@ -509,8 +517,8 @@ ProbeSuccess:
             continue;
         }
         while (k < nf) {
-            target_ulong addr =3D base + (i * nf + k) * esz;
-            ldst_elem(env, addr, i + k * vlmax, vd, ra);
+            target_ulong addr =3D base + ((i * nf + k) << esz);
+            ldst_elem(env, addr, i + k * max_elems, vd, ra);
             k++;
         }
     }
@@ -521,7 +529,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong ba=
se,  \
                   CPURISCVState *env, uint32_t desc)      \
 {                                                         \
     vext_ldff(vd, v0, base, env, desc, LOAD_FN,           \
-              sizeof(ETYPE), GETPC());                    \
+              ctzl(sizeof(ETYPE)), GETPC());              \
 }
=20
 GEN_VEXT_LDFF(vle8ff_v,  int8_t,  lde_b)
@@ -986,7 +994,8 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void=
 *vs2,   \
                   CPURISCVState *env, uint32_t desc)          \
 {                                                             \
     uint32_t vl =3D env->vl;                                    \
-    uint32_t vlmax =3D vext_maxsz(desc) / sizeof(ETYPE);        \
+    uint32_t vlmax =3D vext_max_elems(desc,                     \
+                                    ctzl(sizeof(ETYPE)));     \
     uint32_t i;                                               \
                                                               \
     for (i =3D 0; i < vl; i++) {                                \
@@ -1016,7 +1025,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong =
s1,          \
                   void *vs2, CPURISCVState *env, uint32_t desc) \
 {                                                               \
     uint32_t vl =3D env->vl;                                      \
-    uint32_t vlmax =3D vext_maxsz(desc) / sizeof(ETYPE);          \
+    uint32_t vlmax =3D vext_max_elems(desc, ctzl(sizeof(ETYPE))); \
     uint32_t i;                                                 \
                                                                 \
     for (i =3D 0; i < vl; i++) {                                  \
@@ -1190,7 +1199,8 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, vo=
id *vs2,   \
 {                                                             \
     uint32_t vm =3D vext_vm(desc);                              \
     uint32_t vl =3D env->vl;                                    \
-    uint32_t vlmax =3D vext_maxsz(desc) / sizeof(ETYPE);        \
+    uint32_t vlmax =3D vext_max_elems(desc,                     \
+                                    ctzl(sizeof(ETYPE)));     \
     uint32_t i;                                               \
                                                               \
     for (i =3D 0; i < vl; i++) {                                \
@@ -1242,7 +1252,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong =
s1, void *vs2,   \
 {                                                                   \
     uint32_t vm =3D vext_vm(desc);                                    \
     uint32_t vl =3D env->vl;                                          \
-    uint32_t vlmax =3D vext_maxsz(desc) / sizeof(ETYPE);              \
+    uint32_t vlmax =3D vext_max_elems(desc, ctzl(sizeof(ETYPE)));     \
     uint32_t i;                                                     \
                                                                     \
     for (i =3D 0; i < vl; i++) {                                      \
@@ -3644,7 +3654,8 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, vo=
id *vs2,   \
 {                                                             \
     uint32_t vm =3D vext_vm(desc);                              \
     uint32_t vl =3D env->vl;                                    \
-    uint32_t vlmax =3D vext_maxsz(desc) / sizeof(ETYPE);        \
+    uint32_t vlmax =3D vext_max_elems(desc,                     \
+                                    ctzl(sizeof(ETYPE)));     \
     uint32_t i;                                               \
                                                               \
     for (i =3D 0; i < vl; i++) {                                \
@@ -3671,7 +3682,7 @@ void HELPER(NAME)(void *vd, void *v0, uint64_t s1, =
void *vs2,       \
 {                                                                   \
     uint32_t vm =3D vext_vm(desc);                                    \
     uint32_t vl =3D env->vl;                                          \
-    uint32_t vlmax =3D vext_maxsz(desc) / sizeof(ETYPE);              \
+    uint32_t vlmax =3D vext_max_elems(desc, ctzl(sizeof(ETYPE)));     \
     uint32_t i;                                                     \
                                                                     \
     for (i =3D 0; i < vl; i++) {                                      \
@@ -4457,7 +4468,7 @@ GEN_VEXT_VSLIDE1DOWN_VX(vslide1down_vx_d, uint64_t,=
 H8)
 void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,             =
  \
                   CPURISCVState *env, uint32_t desc)                    =
  \
 {                                                                       =
  \
-    uint32_t vlmax =3D env_archcpu(env)->cfg.vlen;                      =
    \
+    uint32_t vlmax =3D vext_max_elems(desc, ctzl(sizeof(ETYPE)));       =
    \
     uint32_t vm =3D vext_vm(desc);                                      =
    \
     uint32_t vl =3D env->vl;                                            =
    \
     uint64_t index;                                                     =
  \
@@ -4486,7 +4497,7 @@ GEN_VEXT_VRGATHER_VV(vrgather_vv_d, uint64_t, H8)
 void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,       =
  \
                   CPURISCVState *env, uint32_t desc)                    =
  \
 {                                                                       =
  \
-    uint32_t vlmax =3D env_archcpu(env)->cfg.vlen;                      =
    \
+    uint32_t vlmax =3D vext_max_elems(desc, ctzl(sizeof(ETYPE)));       =
    \
     uint32_t vm =3D vext_vm(desc);                                      =
    \
     uint32_t vl =3D env->vl;                                            =
    \
     uint64_t index =3D s1;                                              =
    \
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
index 5e8e49d43f..e12db9aae8 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -540,6 +540,12 @@ static bool trans_##NAME(DisasContext *s, arg_##ARGT=
YPE * a) \
     return false;                                            \
 }
=20
+static uint8_t vext_get_emul(DisasContext *s, uint8_t eew)
+{
+    int8_t emul =3D eew - s->sew + s->lmul;
+    return emul < 0 ? 0 : emul;
+}
+
 /*
  *** unit stride load and store
  */
@@ -604,8 +610,14 @@ static bool ld_us_op(DisasContext *s, arg_r2nfvm *a,=
 uint8_t eew)
         return false;
     }
=20
+    /*
+     * Vector load/store instructions have the EEW encoded
+     * directly in the instructions. The maximum vector size is
+     * calculated with EMUL rather than LMUL.
+     */
+    uint8_t emul =3D vext_get_emul(s, eew);
     data =3D FIELD_DP32(data, VDATA, VM, a->vm);
-    data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);
+    data =3D FIELD_DP32(data, VDATA, LMUL, emul);
     data =3D FIELD_DP32(data, VDATA, NF, a->nf);
     return ldst_us_trans(a->rd, a->rs1, data, fn, s, false);
 }
@@ -640,8 +652,9 @@ static bool st_us_op(DisasContext *s, arg_r2nfvm *a, =
uint8_t eew)
         return false;
     }
=20
+    uint8_t emul =3D vext_get_emul(s, eew);
     data =3D FIELD_DP32(data, VDATA, VM, a->vm);
-    data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);
+    data =3D FIELD_DP32(data, VDATA, LMUL, emul);
     data =3D FIELD_DP32(data, VDATA, NF, a->nf);
     return ldst_us_trans(a->rd, a->rs1, data, fn, s, true);
 }
@@ -711,8 +724,9 @@ static bool ld_stride_op(DisasContext *s, arg_rnfvm *=
a, uint8_t eew)
         return false;
     }
=20
+    uint8_t emul =3D vext_get_emul(s, eew);
     data =3D FIELD_DP32(data, VDATA, VM, a->vm);
-    data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);
+    data =3D FIELD_DP32(data, VDATA, LMUL, emul);
     data =3D FIELD_DP32(data, VDATA, NF, a->nf);
     return ldst_stride_trans(a->rd, a->rs1, a->rs2, data, fn, s, false);
 }
@@ -739,8 +753,9 @@ static bool st_stride_op(DisasContext *s, arg_rnfvm *=
a, uint8_t eew)
         gen_helper_vsse32_v,  gen_helper_vsse64_v
     };
=20
+    uint8_t emul =3D vext_get_emul(s, eew);
     data =3D FIELD_DP32(data, VDATA, VM, a->vm);
-    data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);
+    data =3D FIELD_DP32(data, VDATA, LMUL, emul);
     data =3D FIELD_DP32(data, VDATA, NF, a->nf);
     fn =3D fns[eew];
     if (fn =3D=3D NULL) {
@@ -836,8 +851,9 @@ static bool ld_index_op(DisasContext *s, arg_rnfvm *a=
, uint8_t eew)
=20
     fn =3D fns[eew][s->sew];
=20
+    uint8_t emul =3D vext_get_emul(s, s->sew);
     data =3D FIELD_DP32(data, VDATA, VM, a->vm);
-    data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);
+    data =3D FIELD_DP32(data, VDATA, LMUL, emul);
     data =3D FIELD_DP32(data, VDATA, NF, a->nf);
     return ldst_index_trans(a->rd, a->rs1, a->rs2, data, fn, s, false);
 }
@@ -887,8 +903,9 @@ static bool st_index_op(DisasContext *s, arg_rnfvm *a=
, uint8_t eew)
=20
     fn =3D fns[eew][s->sew];
=20
+    uint8_t emul =3D vext_get_emul(s, s->sew);
     data =3D FIELD_DP32(data, VDATA, VM, a->vm);
-    data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);
+    data =3D FIELD_DP32(data, VDATA, LMUL, emul);
     data =3D FIELD_DP32(data, VDATA, NF, a->nf);
     return ldst_index_trans(a->rd, a->rs1, a->rs2, data, fn, s, true);
 }
@@ -949,8 +966,9 @@ static bool ldff_op(DisasContext *s, arg_r2nfvm *a, u=
int8_t eew)
         return false;
     }
=20
+    uint8_t emul =3D vext_get_emul(s, eew);
     data =3D FIELD_DP32(data, VDATA, VM, a->vm);
-    data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);
+    data =3D FIELD_DP32(data, VDATA, LMUL, emul);
     data =3D FIELD_DP32(data, VDATA, NF, a->nf);
     return ldff_trans(a->rd, a->rs1, data, fn, s);
 }
--=20
2.31.1


