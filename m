Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B9F545B3F
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 06:44:25 +0200 (CEST)
Received: from localhost ([::1]:51446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzWVU-0005hy-2S
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 00:44:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1538de18e=alistair.francis@opensource.wdc.com>)
 id 1nzWFd-0003gp-IX
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 00:28:02 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:22630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1538de18e=alistair.francis@opensource.wdc.com>)
 id 1nzWFb-00013d-E1
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 00:28:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1654835279; x=1686371279;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=28T0JQufDNptLWY4KPRZWHe/N4cnikNTV+WmSm6BotE=;
 b=ACedI3kNwTJU7Rhk3lAV2WiMXiUzqTL+aQTnEEWTObHzujjO/SLJ1cQf
 8V6mETKJarZfy7y2/AaVWz8CaVXk8whsTZ+Og+AD7KwlRjD00y7Dgp/E+
 3ICzrQMj4xUVBgSYEBiqGLsz1odhdmVNVoLWF9Fj4T+fU8arL+j+8A4CQ
 aqZ8qvtPUecxy9kp34WXW1nNfhO6enTdsCtlvHCqFrc+v0wUPANWHzrZV
 eAmZGwrW6EX6r9gIF2al0zUiKKPmHnyGW+XGSm7sZOpUUEUrQEflSUCJC
 rhwqypeEHpG4XCb4nSnN2GmZtXDb0XLKTKiJ5ij8nYDAJX2f81xZZVaec g==;
X-IronPort-AV: E=Sophos;i="5.91,288,1647273600"; d="scan'208";a="307046456"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 10 Jun 2022 12:27:56 +0800
IronPort-SDR: MbPTEHUtHxXe0DS7b9Bq9YPMiuIHBV3RNPwrMARIrzcJ5erm0Vv9DaDCJ/4NWp9NDZs5TNhyx4
 ZcK5En3pEP70+fU4CVfImVtT7/37A/MvilNcR8bQ7yjAWtcOqDBAl3+Ju0lj6H1nDAna7vucpX
 8rrhhP/NtvU1nnqJp+x7XksV7easoLsGI4QZlkrvn0jdorSh77dtRICxnRAMmvwdvhcDNxK2P3
 mBB0SfenWTrKspy+1qMrBPbULJQLpHW3x2Vffgzl8D3xqQP2nlHXcUQ+j5Uig8wJwFHVcMe7KM
 /2iKmV4qjmEeXhYsOaqOAH6g
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Jun 2022 20:51:05 -0700
IronPort-SDR: De4guLtECF6ZRvSveS7spCcLoz2rVeOujZ1Quqcj3WmGR5OJdULOjOb5WmBRpe9CXG2xyHc/yk
 IwfIlY+N2JPHdA3W5qCX/FAC10TxLkCYklOLKJb8O20rZzhi7md4p0AaejJc5E6Xg99t2tpvRg
 6gAD+FPz1oJpljCThsEKzU0GizkllJ/pB2PEmy5S+qllMcnX7es+cjc2Tzm09c5zf9o4KujP0k
 rwEwjMl2m1TDnrIb6YHvZuBE/+3j51/u2f2BoXXnBQvuGYkqF7FUMrv+3atu2SUX4eKmkEeHvQ
 6rY=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Jun 2022 21:27:56 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LK7HJ3qx9z1SVp5
 for <qemu-devel@nongnu.org>; Thu,  9 Jun 2022 21:27:56 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1654835275; x=1657427276; bh=28T0JQufDNptLWY4KP
 RZWHe/N4cnikNTV+WmSm6BotE=; b=epG5ADLNt7wflr4v+5/0xjewid3zxKCvFl
 Si+GHVTwB88ujGz8Fwv3B3RALnXiZ87UMkWO4fb+v46Mb0bbtljnLiz1OlJSoqNg
 3j9fjQn8s5Ii0mxR6CMgHbIw+ISEY3EEbqQKdhz0LubxJSR9zZ4JcvRwkbCJzbEx
 sHD5oeQcRQdoHER7V8QOtEexNnhmiM3Rt9EkzlDij2zzW3Vn0h/hoS0UyHjvADrA
 qlK7wJnOnG5ktKct7mcsccx65psA6Bsu4zTPlq6FK5h1Fgb9dSWacjbBz770DNSB
 JCdFVmsYIf12lUmqs0FMlNdC8nT8pyhlHwgNpMZpaR73/yZVGMnQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 9X6TfBBdobOu for <qemu-devel@nongnu.org>;
 Thu,  9 Jun 2022 21:27:55 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.12])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LK7HC5LcSz1SVp2;
 Thu,  9 Jun 2022 21:27:51 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, eopXD <yueh.ting.chen@gmail.com>,
 eop Chen <eop.chen@sifive.com>, Frank Chang <frank.chang@sifive.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 10/25] target/riscv: rvv: Rename ambiguous esz
Date: Fri, 10 Jun 2022 14:26:40 +1000
Message-Id: <20220610042655.2021686-11-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610042655.2021686-1-alistair.francis@opensource.wdc.com>
References: <20220610042655.2021686-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=1538de18e=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
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

From: eopXD <yueh.ting.chen@gmail.com>

No functional change intended in this commit.

Signed-off-by: eop Chen <eop.chen@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <165449614532.19704.7000832880482980398-3@git.sr.ht>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/vector_helper.c | 76 ++++++++++++++++++------------------
 1 file changed, 38 insertions(+), 38 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 60840325c4..3b79b9cbc2 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -125,9 +125,9 @@ static inline int32_t vext_lmul(uint32_t desc)
 /*
  * Get the maximum number of elements can be operated.
  *
- * esz: log2 of element size in bytes.
+ * log2_esz: log2 of element size in bytes.
  */
-static inline uint32_t vext_max_elems(uint32_t desc, uint32_t esz)
+static inline uint32_t vext_max_elems(uint32_t desc, uint32_t log2_esz)
 {
     /*
      * As simd_desc support at most 2048 bytes, the max vlen is 1024 bit=
s.
@@ -136,7 +136,7 @@ static inline uint32_t vext_max_elems(uint32_t desc, =
uint32_t esz)
     uint32_t vlenb =3D simd_maxsz(desc);
=20
     /* Return VLMAX */
-    int scale =3D vext_lmul(desc) - esz;
+    int scale =3D vext_lmul(desc) - log2_esz;
     return scale < 0 ? vlenb >> -scale : vlenb << scale;
 }
=20
@@ -231,11 +231,11 @@ vext_ldst_stride(void *vd, void *v0, target_ulong b=
ase,
                  target_ulong stride, CPURISCVState *env,
                  uint32_t desc, uint32_t vm,
                  vext_ldst_elem_fn *ldst_elem,
-                 uint32_t esz, uintptr_t ra)
+                 uint32_t log2_esz, uintptr_t ra)
 {
     uint32_t i, k;
     uint32_t nf =3D vext_nf(desc);
-    uint32_t max_elems =3D vext_max_elems(desc, esz);
+    uint32_t max_elems =3D vext_max_elems(desc, log2_esz);
=20
     for (i =3D env->vstart; i < env->vl; i++, env->vstart++) {
         if (!vm && !vext_elem_mask(v0, i)) {
@@ -244,7 +244,7 @@ vext_ldst_stride(void *vd, void *v0, target_ulong bas=
e,
=20
         k =3D 0;
         while (k < nf) {
-            target_ulong addr =3D base + stride * i + (k << esz);
+            target_ulong addr =3D base + stride * i + (k << log2_esz);
             ldst_elem(env, adjust_addr(env, addr), i + k * max_elems, vd=
, ra);
             k++;
         }
@@ -289,18 +289,18 @@ GEN_VEXT_ST_STRIDE(vsse64_v, int64_t, ste_d)
 /* unmasked unit-stride load and store operation*/
 static void
 vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t d=
esc,
-             vext_ldst_elem_fn *ldst_elem, uint32_t esz, uint32_t evl,
+             vext_ldst_elem_fn *ldst_elem, uint32_t log2_esz, uint32_t e=
vl,
              uintptr_t ra)
 {
     uint32_t i, k;
     uint32_t nf =3D vext_nf(desc);
-    uint32_t max_elems =3D vext_max_elems(desc, esz);
+    uint32_t max_elems =3D vext_max_elems(desc, log2_esz);
=20
     /* load bytes from guest memory */
     for (i =3D env->vstart; i < evl; i++, env->vstart++) {
         k =3D 0;
         while (k < nf) {
-            target_ulong addr =3D base + ((i * nf + k) << esz);
+            target_ulong addr =3D base + ((i * nf + k) << log2_esz);
             ldst_elem(env, adjust_addr(env, addr), i + k * max_elems, vd=
, ra);
             k++;
         }
@@ -399,12 +399,12 @@ vext_ldst_index(void *vd, void *v0, target_ulong ba=
se,
                 void *vs2, CPURISCVState *env, uint32_t desc,
                 vext_get_index_addr get_index_addr,
                 vext_ldst_elem_fn *ldst_elem,
-                uint32_t esz, uintptr_t ra)
+                uint32_t log2_esz, uintptr_t ra)
 {
     uint32_t i, k;
     uint32_t nf =3D vext_nf(desc);
     uint32_t vm =3D vext_vm(desc);
-    uint32_t max_elems =3D vext_max_elems(desc, esz);
+    uint32_t max_elems =3D vext_max_elems(desc, log2_esz);
=20
     /* load bytes from guest memory */
     for (i =3D env->vstart; i < env->vl; i++, env->vstart++) {
@@ -414,7 +414,7 @@ vext_ldst_index(void *vd, void *v0, target_ulong base=
,
=20
         k =3D 0;
         while (k < nf) {
-            abi_ptr addr =3D get_index_addr(base, i, vs2) + (k << esz);
+            abi_ptr addr =3D get_index_addr(base, i, vs2) + (k << log2_e=
sz);
             ldst_elem(env, adjust_addr(env, addr), i + k * max_elems, vd=
, ra);
             k++;
         }
@@ -480,13 +480,13 @@ static inline void
 vext_ldff(void *vd, void *v0, target_ulong base,
           CPURISCVState *env, uint32_t desc,
           vext_ldst_elem_fn *ldst_elem,
-          uint32_t esz, uintptr_t ra)
+          uint32_t log2_esz, uintptr_t ra)
 {
     void *host;
     uint32_t i, k, vl =3D 0;
     uint32_t nf =3D vext_nf(desc);
     uint32_t vm =3D vext_vm(desc);
-    uint32_t max_elems =3D vext_max_elems(desc, esz);
+    uint32_t max_elems =3D vext_max_elems(desc, log2_esz);
     target_ulong addr, offset, remain;
=20
     /* probe every access*/
@@ -494,12 +494,12 @@ vext_ldff(void *vd, void *v0, target_ulong base,
         if (!vm && !vext_elem_mask(v0, i)) {
             continue;
         }
-        addr =3D adjust_addr(env, base + i * (nf << esz));
+        addr =3D adjust_addr(env, base + i * (nf << log2_esz));
         if (i =3D=3D 0) {
-            probe_pages(env, addr, nf << esz, ra, MMU_DATA_LOAD);
+            probe_pages(env, addr, nf << log2_esz, ra, MMU_DATA_LOAD);
         } else {
             /* if it triggers an exception, no need to check watchpoint =
*/
-            remain =3D nf << esz;
+            remain =3D nf << log2_esz;
             while (remain > 0) {
                 offset =3D -(addr | TARGET_PAGE_MASK);
                 host =3D tlb_vaddr_to_host(env, addr, MMU_DATA_LOAD,
@@ -536,7 +536,7 @@ ProbeSuccess:
             continue;
         }
         while (k < nf) {
-            target_ulong addr =3D base + ((i * nf + k) << esz);
+            target_ulong addr =3D base + ((i * nf + k) << log2_esz);
             ldst_elem(env, adjust_addr(env, addr), i + k * max_elems, vd=
, ra);
             k++;
         }
@@ -576,12 +576,12 @@ GEN_VEXT_LDFF(vle64ff_v, int64_t, lde_d)
  */
 static void
 vext_ldst_whole(void *vd, target_ulong base, CPURISCVState *env, uint32_=
t desc,
-                vext_ldst_elem_fn *ldst_elem, uint32_t esz, uintptr_t ra=
)
+                vext_ldst_elem_fn *ldst_elem, uint32_t log2_esz, uintptr=
_t ra)
 {
     uint32_t i, k, off, pos;
     uint32_t nf =3D vext_nf(desc);
     uint32_t vlenb =3D env_archcpu(env)->cfg.vlen >> 3;
-    uint32_t max_elems =3D vlenb >> esz;
+    uint32_t max_elems =3D vlenb >> log2_esz;
=20
     k =3D env->vstart / max_elems;
     off =3D env->vstart % max_elems;
@@ -589,7 +589,7 @@ vext_ldst_whole(void *vd, target_ulong base, CPURISCV=
State *env, uint32_t desc,
     if (off) {
         /* load/store rest of elements of current segment pointed by vst=
art */
         for (pos =3D off; pos < max_elems; pos++, env->vstart++) {
-            target_ulong addr =3D base + ((pos + k * max_elems) << esz);
+            target_ulong addr =3D base + ((pos + k * max_elems) << log2_=
esz);
             ldst_elem(env, adjust_addr(env, addr), pos + k * max_elems, =
vd, ra);
         }
         k++;
@@ -598,7 +598,7 @@ vext_ldst_whole(void *vd, target_ulong base, CPURISCV=
State *env, uint32_t desc,
     /* load/store elements for rest of segments */
     for (; k < nf; k++) {
         for (i =3D 0; i < max_elems; i++, env->vstart++) {
-            target_ulong addr =3D base + ((i + k * max_elems) << esz);
+            target_ulong addr =3D base + ((i + k * max_elems) << log2_es=
z);
             ldst_elem(env, adjust_addr(env, addr), i + k * max_elems, vd=
, ra);
         }
     }
@@ -4688,11 +4688,11 @@ GEN_VEXT_VSLIDEDOWN_VX(vslidedown_vx_h, uint16_t,=
 H2)
 GEN_VEXT_VSLIDEDOWN_VX(vslidedown_vx_w, uint32_t, H4)
 GEN_VEXT_VSLIDEDOWN_VX(vslidedown_vx_d, uint64_t, H8)
=20
-#define GEN_VEXT_VSLIE1UP(ESZ, H)                                       =
    \
-static void vslide1up_##ESZ(void *vd, void *v0, target_ulong s1, void *v=
s2, \
-                     CPURISCVState *env, uint32_t desc)                 =
    \
+#define GEN_VEXT_VSLIE1UP(BITWIDTH, H)                                  =
    \
+static void vslide1up_##BITWIDTH(void *vd, void *v0, target_ulong s1,   =
    \
+                     void *vs2, CPURISCVState *env, uint32_t desc)      =
    \
 {                                                                       =
    \
-    typedef uint##ESZ##_t ETYPE;                                        =
    \
+    typedef uint##BITWIDTH##_t ETYPE;                                   =
    \
     uint32_t vm =3D vext_vm(desc);                                      =
      \
     uint32_t vl =3D env->vl;                                            =
      \
     uint32_t i;                                                         =
    \
@@ -4715,11 +4715,11 @@ GEN_VEXT_VSLIE1UP(16, H2)
 GEN_VEXT_VSLIE1UP(32, H4)
 GEN_VEXT_VSLIE1UP(64, H8)
=20
-#define GEN_VEXT_VSLIDE1UP_VX(NAME, ESZ)                          \
+#define GEN_VEXT_VSLIDE1UP_VX(NAME, BITWIDTH)                     \
 void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2, \
                   CPURISCVState *env, uint32_t desc)              \
 {                                                                 \
-    vslide1up_##ESZ(vd, v0, s1, vs2, env, desc);                  \
+    vslide1up_##BITWIDTH(vd, v0, s1, vs2, env, desc);             \
 }
=20
 /* vslide1up.vx vd, vs2, rs1, vm # vd[0]=3Dx[rs1], vd[i+1] =3D vs2[i] */
@@ -4728,11 +4728,11 @@ GEN_VEXT_VSLIDE1UP_VX(vslide1up_vx_h, 16)
 GEN_VEXT_VSLIDE1UP_VX(vslide1up_vx_w, 32)
 GEN_VEXT_VSLIDE1UP_VX(vslide1up_vx_d, 64)
=20
-#define GEN_VEXT_VSLIDE1DOWN(ESZ, H)                                    =
      \
-static void vslide1down_##ESZ(void *vd, void *v0, target_ulong s1, void =
*vs2, \
-                       CPURISCVState *env, uint32_t desc)               =
      \
+#define GEN_VEXT_VSLIDE1DOWN(BITWIDTH, H)                               =
      \
+static void vslide1down_##BITWIDTH(void *vd, void *v0, target_ulong s1, =
      \
+                       void *vs2, CPURISCVState *env, uint32_t desc)    =
      \
 {                                                                       =
      \
-    typedef uint##ESZ##_t ETYPE;                                        =
      \
+    typedef uint##BITWIDTH##_t ETYPE;                                   =
      \
     uint32_t vm =3D vext_vm(desc);                                      =
        \
     uint32_t vl =3D env->vl;                                            =
        \
     uint32_t i;                                                         =
      \
@@ -4755,11 +4755,11 @@ GEN_VEXT_VSLIDE1DOWN(16, H2)
 GEN_VEXT_VSLIDE1DOWN(32, H4)
 GEN_VEXT_VSLIDE1DOWN(64, H8)
=20
-#define GEN_VEXT_VSLIDE1DOWN_VX(NAME, ESZ)                        \
+#define GEN_VEXT_VSLIDE1DOWN_VX(NAME, BITWIDTH)                   \
 void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2, \
                   CPURISCVState *env, uint32_t desc)              \
 {                                                                 \
-    vslide1down_##ESZ(vd, v0, s1, vs2, env, desc);                \
+    vslide1down_##BITWIDTH(vd, v0, s1, vs2, env, desc);           \
 }
=20
 /* vslide1down.vx vd, vs2, rs1, vm # vd[i] =3D vs2[i+1], vd[vl-1]=3Dx[rs=
1] */
@@ -4769,11 +4769,11 @@ GEN_VEXT_VSLIDE1DOWN_VX(vslide1down_vx_w, 32)
 GEN_VEXT_VSLIDE1DOWN_VX(vslide1down_vx_d, 64)
=20
 /* Vector Floating-Point Slide Instructions */
-#define GEN_VEXT_VFSLIDE1UP_VF(NAME, ESZ)                     \
+#define GEN_VEXT_VFSLIDE1UP_VF(NAME, BITWIDTH)                \
 void HELPER(NAME)(void *vd, void *v0, uint64_t s1, void *vs2, \
                   CPURISCVState *env, uint32_t desc)          \
 {                                                             \
-    vslide1up_##ESZ(vd, v0, s1, vs2, env, desc);              \
+    vslide1up_##BITWIDTH(vd, v0, s1, vs2, env, desc);         \
 }
=20
 /* vfslide1up.vf vd, vs2, rs1, vm # vd[0]=3Df[rs1], vd[i+1] =3D vs2[i] *=
/
@@ -4781,11 +4781,11 @@ GEN_VEXT_VFSLIDE1UP_VF(vfslide1up_vf_h, 16)
 GEN_VEXT_VFSLIDE1UP_VF(vfslide1up_vf_w, 32)
 GEN_VEXT_VFSLIDE1UP_VF(vfslide1up_vf_d, 64)
=20
-#define GEN_VEXT_VFSLIDE1DOWN_VF(NAME, ESZ)                   \
+#define GEN_VEXT_VFSLIDE1DOWN_VF(NAME, BITWIDTH)              \
 void HELPER(NAME)(void *vd, void *v0, uint64_t s1, void *vs2, \
                   CPURISCVState *env, uint32_t desc)          \
 {                                                             \
-    vslide1down_##ESZ(vd, v0, s1, vs2, env, desc);            \
+    vslide1down_##BITWIDTH(vd, v0, s1, vs2, env, desc);       \
 }
=20
 /* vfslide1down.vf vd, vs2, rs1, vm # vd[i] =3D vs2[i+1], vd[vl-1]=3Df[r=
s1] */
--=20
2.36.1


