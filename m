Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6051A545B55
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 06:51:02 +0200 (CEST)
Received: from localhost ([::1]:36794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzWbt-0006vO-CH
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 00:51:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1538de18e=alistair.francis@opensource.wdc.com>)
 id 1nzWFo-0003ik-VH
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 00:28:13 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:5563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1538de18e=alistair.francis@opensource.wdc.com>)
 id 1nzWFl-000167-EF
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 00:28:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1654835289; x=1686371289;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PZp1t1zoSEouq7HW3C7iSGEoclejLp97nohkm1YrO3g=;
 b=FksUOos09mt+pRqysCfroE7hCrQ77BqJjX5COs3/A8kX2WqBMpVKU7En
 woWOc7ahgrHxocTw2wKl2bKKvb3/0Kdj1gREthKqnF7K38NoGLcNkLyVx
 pmT/6KQCxxmg2Wpob44Yr5CkM35xL8MpWMQq72TDCQuO2/IOADCHguRrY
 qeJyX9iS8bQm4cOQTFic+jM/qCPXWor33PwBidaGP/JCp/Oygz2yBXgJk
 aWhhA9zGZeCIdkZ8aS6yTIgYX8xyZSa6Svyk3kmxSwNP5Spt2zoLxX30p
 Y9WlDu2LL1/oum750fuLKhbXPcp8ZaYeeex2uL7fvjzuIWOBE1M9CvRb4 g==;
X-IronPort-AV: E=Sophos;i="5.91,288,1647273600"; d="scan'208";a="201489031"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 10 Jun 2022 12:28:06 +0800
IronPort-SDR: KRshftL6+FOQrgfTW8b9B2E0K8kvksSgi2ubIDfrxcinhdlwy3unw7AfC/vQm6qS98aRp2wIjc
 mCDi9lBXDYLo3temEUNs7Dy72vh1mFjqsLMc4ywK73n66vHcJ4yO5UGO9tQRSGX02Yx7o4gKhf
 Z673dySXQ+/PoA+whucwQIZODdJrpKsJ90nD8EvJNkFIGD563+FWg7pD7zsLnjSh9xbK0UkAbY
 lVJ3/LlMdoctMJpjxL3iaxALSvH0x5bVgx2GHI8OpcPaePpzUVBvMDnjC8vW8UdmXks/D+QB7I
 BkI/2CsedmnaYrS/2SejV0xG
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Jun 2022 20:51:14 -0700
IronPort-SDR: 77LFOXOjAVsNjkhF3c5NDQv4Q6F7m7mz720FjGDMfTA0/dSOcKvlBU9kcfh1OTI2p2ND3DuqEc
 uETQzSVWTMlbpozJdDRhmZMDxKf6oP3pSuG1VjFqB5TcJ1Z1u8ujz6NXHlZWf1cJR7JzkHZ2Hx
 fxpMrVSVTK+OO+uoLjUnb+7wcT4MwaVufafJG/gCVxcFYNkqCOCdDH3bKnRv2WzcVHXnG8ieTk
 CxtWhEQvBT9WDyhY5Tg8NhpNaW3RJn1TChRstYETCkKLDZ3Okt2uS2B4H3Fml5u4leuDOQbCC7
 W0k=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Jun 2022 21:28:06 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LK7HS63jcz1SHwl
 for <qemu-devel@nongnu.org>; Thu,  9 Jun 2022 21:28:04 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1654835283; x=1657427284; bh=PZp1t1zoSEouq7HW3C
 7iSGEoclejLp97nohkm1YrO3g=; b=kDdiOTTPDZREiky4SLNRVtq16ewPf2sWm/
 YxfGKwNMhubxp9gx2D0ARzuqix44034JOzGil/+oKR+GAJk/d13XWyg5rHlHbisw
 0GIwypW7BVxN9poXDVtWSIdarS1Rw/ooM9xS4Oa7y+tAgBwgsfDGf+idmVM0ELJa
 Uod+/hmAVWWnj50DlIVAX8kYi5TFkjqRz4QJY3mlmoCoseRqQ3aNkvFjU7HInQKJ
 vjCMO/4kcwvJUGJt2UA3pIMaaARET9K1yGsNT3DEJr0X5Sf7xVpxbOhbXI9ljm0t
 UpCCtxkrSqG+WPR9dsldNG6jxIkRNgD62REd25Dd/OORoDoX1Jww==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id CrFgFyx9GznP for <qemu-devel@nongnu.org>;
 Thu,  9 Jun 2022 21:28:03 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.12])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LK7HN2Kscz1Rvlx;
 Thu,  9 Jun 2022 21:27:59 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, eopXD <eop.chen@sifive.com>,
 Frank Chang <frank.chang@sifive.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 12/25] target/riscv: rvv: Add tail agnostic for vv instructions
Date: Fri, 10 Jun 2022 14:26:42 +1000
Message-Id: <20220610042655.2021686-13-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610042655.2021686-1-alistair.francis@opensource.wdc.com>
References: <20220610042655.2021686-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=1538de18e=alistair.francis@opensource.wdc.com;
 helo=esa4.hgst.iphmx.com
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

From: eopXD <eop.chen@sifive.com>

According to v-spec, tail agnostic behavior can be either kept as
undisturbed or set elements' bits to all 1s. To distinguish the
difference of tail policies, QEMU should be able to simulate the tail
agnostic behavior as "set tail elements' bits to all 1s".

There are multiple possibility for agnostic elements according to
v-spec. The main intent of this patch-set tries to add option that
can distinguish between tail policies. Setting agnostic elements to
all 1s allows QEMU to express this.

This is the first commit regarding the optional tail agnostic
behavior. Follow-up commits will add this optional behavior
for all rvv instructions.

Signed-off-by: eop Chen <eop.chen@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <165449614532.19704.7000832880482980398-5@git.sr.ht>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h                      |   2 +
 target/riscv/internals.h                |   5 +-
 target/riscv/cpu_helper.c               |   2 +
 target/riscv/translate.c                |   2 +
 target/riscv/vector_helper.c            | 296 +++++++++++++-----------
 target/riscv/insn_trans/trans_rvv.c.inc |   3 +-
 6 files changed, 178 insertions(+), 132 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 194a58d760..7d6397acdf 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -412,6 +412,7 @@ struct RISCVCPUConfig {
     bool ext_zve32f;
     bool ext_zve64f;
     bool ext_zmmul;
+    bool rvv_ta_all_1s;
=20
     uint32_t mvendorid;
     uint64_t marchid;
@@ -567,6 +568,7 @@ FIELD(TB_FLAGS, XL, 20, 2)
 /* If PointerMasking should be applied */
 FIELD(TB_FLAGS, PM_MASK_ENABLED, 22, 1)
 FIELD(TB_FLAGS, PM_BASE_ENABLED, 23, 1)
+FIELD(TB_FLAGS, VTA, 24, 1)
=20
 #ifdef TARGET_RISCV32
 #define riscv_cpu_mxl(env)  ((void)(env), MXL_RV32)
diff --git a/target/riscv/internals.h b/target/riscv/internals.h
index dbb322bfa7..512c6c30cf 100644
--- a/target/riscv/internals.h
+++ b/target/riscv/internals.h
@@ -24,8 +24,9 @@
 /* share data between vector helpers and decode code */
 FIELD(VDATA, VM, 0, 1)
 FIELD(VDATA, LMUL, 1, 3)
-FIELD(VDATA, NF, 4, 4)
-FIELD(VDATA, WD, 4, 1)
+FIELD(VDATA, VTA, 4, 1)
+FIELD(VDATA, NF, 5, 4)
+FIELD(VDATA, WD, 5, 1)
=20
 /* float point classify helpers */
 target_ulong fclass_h(uint64_t frs1);
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 16c6045459..4a6700c890 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -65,6 +65,8 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ul=
ong *pc,
         flags =3D FIELD_DP32(flags, TB_FLAGS, LMUL,
                     FIELD_EX64(env->vtype, VTYPE, VLMUL));
         flags =3D FIELD_DP32(flags, TB_FLAGS, VL_EQ_VLMAX, vl_eq_vlmax);
+        flags =3D FIELD_DP32(flags, TB_FLAGS, VTA,
+                    FIELD_EX64(env->vtype, VTYPE, VTA));
     } else {
         flags =3D FIELD_DP32(flags, TB_FLAGS, VILL, 1);
     }
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 55a4713af2..59f0ee9a50 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -94,6 +94,7 @@ typedef struct DisasContext {
      */
     int8_t lmul;
     uint8_t sew;
+    uint8_t vta;
     target_ulong vstart;
     bool vl_eq_vlmax;
     uint8_t ntemp;
@@ -1099,6 +1100,7 @@ static void riscv_tr_init_disas_context(DisasContex=
tBase *dcbase, CPUState *cs)
     ctx->vill =3D FIELD_EX32(tb_flags, TB_FLAGS, VILL);
     ctx->sew =3D FIELD_EX32(tb_flags, TB_FLAGS, SEW);
     ctx->lmul =3D sextract32(FIELD_EX32(tb_flags, TB_FLAGS, LMUL), 0, 3)=
;
+    ctx->vta =3D FIELD_EX32(tb_flags, TB_FLAGS, VTA) && cpu->cfg.rvv_ta_=
all_1s;
     ctx->vstart =3D env->vstart;
     ctx->vl_eq_vlmax =3D FIELD_EX32(tb_flags, TB_FLAGS, VL_EQ_VLMAX);
     ctx->misa_mxl_max =3D env->misa_mxl_max;
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 3b79b9cbc2..e2a2979bad 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -122,6 +122,11 @@ static inline int32_t vext_lmul(uint32_t desc)
     return sextract32(FIELD_EX32(simd_data(desc), VDATA, LMUL), 0, 3);
 }
=20
+static inline uint32_t vext_vta(uint32_t desc)
+{
+    return FIELD_EX32(simd_data(desc), VDATA, VTA);
+}
+
 /*
  * Get the maximum number of elements can be operated.
  *
@@ -140,6 +145,21 @@ static inline uint32_t vext_max_elems(uint32_t desc,=
 uint32_t log2_esz)
     return scale < 0 ? vlenb >> -scale : vlenb << scale;
 }
=20
+/*
+ * Get number of total elements, including prestart, body and tail eleme=
nts.
+ * Note that when LMUL < 1, the tail includes the elements past VLMAX th=
at
+ * are held in the same vector register.
+ */
+static inline uint32_t vext_get_total_elems(CPURISCVState *env, uint32_t=
 desc,
+                                            uint32_t esz)
+{
+    uint32_t vlenb =3D simd_maxsz(desc);
+    uint32_t sew =3D 1 << FIELD_EX64(env->vtype, VTYPE, VSEW);
+    int8_t emul =3D ctzl(esz) - ctzl(sew) + vext_lmul(desc) < 0 ? 0 :
+                  ctzl(esz) - ctzl(sew) + vext_lmul(desc);
+    return (vlenb << emul) / esz;
+}
+
 static inline target_ulong adjust_addr(CPURISCVState *env, target_ulong =
addr)
 {
     return (addr & env->cur_pmmask) | env->cur_pmbase;
@@ -172,6 +192,20 @@ static void probe_pages(CPURISCVState *env, target_u=
long addr,
     }
 }
=20
+/* set agnostic elements to 1s */
+static void vext_set_elems_1s(void *base, uint32_t is_agnostic, uint32_t=
 cnt,
+                              uint32_t tot)
+{
+    if (is_agnostic =3D=3D 0) {
+        /* policy undisturbed */
+        return;
+    }
+    if (tot - cnt =3D=3D 0) {
+        return ;
+    }
+    memset(base + cnt, -1, tot - cnt);
+}
+
 static inline void vext_set_elem_mask(void *v0, int index,
                                       uint8_t value)
 {
@@ -707,10 +741,12 @@ RVVCALL(OPIVV2, vsub_vv_d, OP_SSS_D, H8, H8, H8, DO=
_SUB)
=20
 static void do_vext_vv(void *vd, void *v0, void *vs1, void *vs2,
                        CPURISCVState *env, uint32_t desc,
-                       opivv2_fn *fn)
+                       opivv2_fn *fn, uint32_t esz)
 {
     uint32_t vm =3D vext_vm(desc);
     uint32_t vl =3D env->vl;
+    uint32_t total_elems =3D vext_get_total_elems(env, desc, esz);
+    uint32_t vta =3D vext_vta(desc);
     uint32_t i;
=20
     for (i =3D env->vstart; i < vl; i++) {
@@ -720,26 +756,28 @@ static void do_vext_vv(void *vd, void *v0, void *vs=
1, void *vs2,
         fn(vd, vs1, vs2, i);
     }
     env->vstart =3D 0;
+    /* set tail elements to 1s */
+    vext_set_elems_1s(vd, vta, vl * esz, total_elems * esz);
 }
=20
 /* generate the helpers for OPIVV */
-#define GEN_VEXT_VV(NAME)                                 \
+#define GEN_VEXT_VV(NAME, ESZ)                            \
 void HELPER(NAME)(void *vd, void *v0, void *vs1,          \
                   void *vs2, CPURISCVState *env,          \
                   uint32_t desc)                          \
 {                                                         \
     do_vext_vv(vd, v0, vs1, vs2, env, desc,               \
-               do_##NAME);                                \
+               do_##NAME, ESZ);                           \
 }
=20
-GEN_VEXT_VV(vadd_vv_b)
-GEN_VEXT_VV(vadd_vv_h)
-GEN_VEXT_VV(vadd_vv_w)
-GEN_VEXT_VV(vadd_vv_d)
-GEN_VEXT_VV(vsub_vv_b)
-GEN_VEXT_VV(vsub_vv_h)
-GEN_VEXT_VV(vsub_vv_w)
-GEN_VEXT_VV(vsub_vv_d)
+GEN_VEXT_VV(vadd_vv_b, 1)
+GEN_VEXT_VV(vadd_vv_h, 2)
+GEN_VEXT_VV(vadd_vv_w, 4)
+GEN_VEXT_VV(vadd_vv_d, 8)
+GEN_VEXT_VV(vsub_vv_b, 1)
+GEN_VEXT_VV(vsub_vv_h, 2)
+GEN_VEXT_VV(vsub_vv_w, 4)
+GEN_VEXT_VV(vsub_vv_d, 8)
=20
 typedef void opivx2_fn(void *vd, target_long s1, void *vs2, int i);
=20
@@ -884,30 +922,30 @@ RVVCALL(OPIVV2, vwadd_wv_w, WOP_WSSS_W, H8, H4, H4,=
 DO_ADD)
 RVVCALL(OPIVV2, vwsub_wv_b, WOP_WSSS_B, H2, H1, H1, DO_SUB)
 RVVCALL(OPIVV2, vwsub_wv_h, WOP_WSSS_H, H4, H2, H2, DO_SUB)
 RVVCALL(OPIVV2, vwsub_wv_w, WOP_WSSS_W, H8, H4, H4, DO_SUB)
-GEN_VEXT_VV(vwaddu_vv_b)
-GEN_VEXT_VV(vwaddu_vv_h)
-GEN_VEXT_VV(vwaddu_vv_w)
-GEN_VEXT_VV(vwsubu_vv_b)
-GEN_VEXT_VV(vwsubu_vv_h)
-GEN_VEXT_VV(vwsubu_vv_w)
-GEN_VEXT_VV(vwadd_vv_b)
-GEN_VEXT_VV(vwadd_vv_h)
-GEN_VEXT_VV(vwadd_vv_w)
-GEN_VEXT_VV(vwsub_vv_b)
-GEN_VEXT_VV(vwsub_vv_h)
-GEN_VEXT_VV(vwsub_vv_w)
-GEN_VEXT_VV(vwaddu_wv_b)
-GEN_VEXT_VV(vwaddu_wv_h)
-GEN_VEXT_VV(vwaddu_wv_w)
-GEN_VEXT_VV(vwsubu_wv_b)
-GEN_VEXT_VV(vwsubu_wv_h)
-GEN_VEXT_VV(vwsubu_wv_w)
-GEN_VEXT_VV(vwadd_wv_b)
-GEN_VEXT_VV(vwadd_wv_h)
-GEN_VEXT_VV(vwadd_wv_w)
-GEN_VEXT_VV(vwsub_wv_b)
-GEN_VEXT_VV(vwsub_wv_h)
-GEN_VEXT_VV(vwsub_wv_w)
+GEN_VEXT_VV(vwaddu_vv_b, 2)
+GEN_VEXT_VV(vwaddu_vv_h, 4)
+GEN_VEXT_VV(vwaddu_vv_w, 8)
+GEN_VEXT_VV(vwsubu_vv_b, 2)
+GEN_VEXT_VV(vwsubu_vv_h, 4)
+GEN_VEXT_VV(vwsubu_vv_w, 8)
+GEN_VEXT_VV(vwadd_vv_b, 2)
+GEN_VEXT_VV(vwadd_vv_h, 4)
+GEN_VEXT_VV(vwadd_vv_w, 8)
+GEN_VEXT_VV(vwsub_vv_b, 2)
+GEN_VEXT_VV(vwsub_vv_h, 4)
+GEN_VEXT_VV(vwsub_vv_w, 8)
+GEN_VEXT_VV(vwaddu_wv_b, 2)
+GEN_VEXT_VV(vwaddu_wv_h, 4)
+GEN_VEXT_VV(vwaddu_wv_w, 8)
+GEN_VEXT_VV(vwsubu_wv_b, 2)
+GEN_VEXT_VV(vwsubu_wv_h, 4)
+GEN_VEXT_VV(vwsubu_wv_w, 8)
+GEN_VEXT_VV(vwadd_wv_b, 2)
+GEN_VEXT_VV(vwadd_wv_h, 4)
+GEN_VEXT_VV(vwadd_wv_w, 8)
+GEN_VEXT_VV(vwsub_wv_b, 2)
+GEN_VEXT_VV(vwsub_wv_h, 4)
+GEN_VEXT_VV(vwsub_wv_w, 8)
=20
 RVVCALL(OPIVX2, vwaddu_vx_b, WOP_UUU_B, H2, H1, DO_ADD)
 RVVCALL(OPIVX2, vwaddu_vx_h, WOP_UUU_H, H4, H2, DO_ADD)
@@ -1086,18 +1124,18 @@ RVVCALL(OPIVV2, vxor_vv_b, OP_SSS_B, H1, H1, H1, =
DO_XOR)
 RVVCALL(OPIVV2, vxor_vv_h, OP_SSS_H, H2, H2, H2, DO_XOR)
 RVVCALL(OPIVV2, vxor_vv_w, OP_SSS_W, H4, H4, H4, DO_XOR)
 RVVCALL(OPIVV2, vxor_vv_d, OP_SSS_D, H8, H8, H8, DO_XOR)
-GEN_VEXT_VV(vand_vv_b)
-GEN_VEXT_VV(vand_vv_h)
-GEN_VEXT_VV(vand_vv_w)
-GEN_VEXT_VV(vand_vv_d)
-GEN_VEXT_VV(vor_vv_b)
-GEN_VEXT_VV(vor_vv_h)
-GEN_VEXT_VV(vor_vv_w)
-GEN_VEXT_VV(vor_vv_d)
-GEN_VEXT_VV(vxor_vv_b)
-GEN_VEXT_VV(vxor_vv_h)
-GEN_VEXT_VV(vxor_vv_w)
-GEN_VEXT_VV(vxor_vv_d)
+GEN_VEXT_VV(vand_vv_b, 1)
+GEN_VEXT_VV(vand_vv_h, 2)
+GEN_VEXT_VV(vand_vv_w, 4)
+GEN_VEXT_VV(vand_vv_d, 8)
+GEN_VEXT_VV(vor_vv_b, 1)
+GEN_VEXT_VV(vor_vv_h, 2)
+GEN_VEXT_VV(vor_vv_w, 4)
+GEN_VEXT_VV(vor_vv_d, 8)
+GEN_VEXT_VV(vxor_vv_b, 1)
+GEN_VEXT_VV(vxor_vv_h, 2)
+GEN_VEXT_VV(vxor_vv_w, 4)
+GEN_VEXT_VV(vxor_vv_d, 8)
=20
 RVVCALL(OPIVX2, vand_vx_b, OP_SSS_B, H1, H1, DO_AND)
 RVVCALL(OPIVX2, vand_vx_h, OP_SSS_H, H2, H2, DO_AND)
@@ -1343,22 +1381,22 @@ RVVCALL(OPIVV2, vmax_vv_b, OP_SSS_B, H1, H1, H1, =
DO_MAX)
 RVVCALL(OPIVV2, vmax_vv_h, OP_SSS_H, H2, H2, H2, DO_MAX)
 RVVCALL(OPIVV2, vmax_vv_w, OP_SSS_W, H4, H4, H4, DO_MAX)
 RVVCALL(OPIVV2, vmax_vv_d, OP_SSS_D, H8, H8, H8, DO_MAX)
-GEN_VEXT_VV(vminu_vv_b)
-GEN_VEXT_VV(vminu_vv_h)
-GEN_VEXT_VV(vminu_vv_w)
-GEN_VEXT_VV(vminu_vv_d)
-GEN_VEXT_VV(vmin_vv_b)
-GEN_VEXT_VV(vmin_vv_h)
-GEN_VEXT_VV(vmin_vv_w)
-GEN_VEXT_VV(vmin_vv_d)
-GEN_VEXT_VV(vmaxu_vv_b)
-GEN_VEXT_VV(vmaxu_vv_h)
-GEN_VEXT_VV(vmaxu_vv_w)
-GEN_VEXT_VV(vmaxu_vv_d)
-GEN_VEXT_VV(vmax_vv_b)
-GEN_VEXT_VV(vmax_vv_h)
-GEN_VEXT_VV(vmax_vv_w)
-GEN_VEXT_VV(vmax_vv_d)
+GEN_VEXT_VV(vminu_vv_b, 1)
+GEN_VEXT_VV(vminu_vv_h, 2)
+GEN_VEXT_VV(vminu_vv_w, 4)
+GEN_VEXT_VV(vminu_vv_d, 8)
+GEN_VEXT_VV(vmin_vv_b, 1)
+GEN_VEXT_VV(vmin_vv_h, 2)
+GEN_VEXT_VV(vmin_vv_w, 4)
+GEN_VEXT_VV(vmin_vv_d, 8)
+GEN_VEXT_VV(vmaxu_vv_b, 1)
+GEN_VEXT_VV(vmaxu_vv_h, 2)
+GEN_VEXT_VV(vmaxu_vv_w, 4)
+GEN_VEXT_VV(vmaxu_vv_d, 8)
+GEN_VEXT_VV(vmax_vv_b, 1)
+GEN_VEXT_VV(vmax_vv_h, 2)
+GEN_VEXT_VV(vmax_vv_w, 4)
+GEN_VEXT_VV(vmax_vv_d, 8)
=20
 RVVCALL(OPIVX2, vminu_vx_b, OP_UUU_B, H1, H1, DO_MIN)
 RVVCALL(OPIVX2, vminu_vx_h, OP_UUU_H, H2, H2, DO_MIN)
@@ -1399,10 +1437,10 @@ RVVCALL(OPIVV2, vmul_vv_b, OP_SSS_B, H1, H1, H1, =
DO_MUL)
 RVVCALL(OPIVV2, vmul_vv_h, OP_SSS_H, H2, H2, H2, DO_MUL)
 RVVCALL(OPIVV2, vmul_vv_w, OP_SSS_W, H4, H4, H4, DO_MUL)
 RVVCALL(OPIVV2, vmul_vv_d, OP_SSS_D, H8, H8, H8, DO_MUL)
-GEN_VEXT_VV(vmul_vv_b)
-GEN_VEXT_VV(vmul_vv_h)
-GEN_VEXT_VV(vmul_vv_w)
-GEN_VEXT_VV(vmul_vv_d)
+GEN_VEXT_VV(vmul_vv_b, 1)
+GEN_VEXT_VV(vmul_vv_h, 2)
+GEN_VEXT_VV(vmul_vv_w, 4)
+GEN_VEXT_VV(vmul_vv_d, 8)
=20
 static int8_t do_mulh_b(int8_t s2, int8_t s1)
 {
@@ -1506,18 +1544,18 @@ RVVCALL(OPIVV2, vmulhsu_vv_b, OP_SUS_B, H1, H1, H=
1, do_mulhsu_b)
 RVVCALL(OPIVV2, vmulhsu_vv_h, OP_SUS_H, H2, H2, H2, do_mulhsu_h)
 RVVCALL(OPIVV2, vmulhsu_vv_w, OP_SUS_W, H4, H4, H4, do_mulhsu_w)
 RVVCALL(OPIVV2, vmulhsu_vv_d, OP_SUS_D, H8, H8, H8, do_mulhsu_d)
-GEN_VEXT_VV(vmulh_vv_b)
-GEN_VEXT_VV(vmulh_vv_h)
-GEN_VEXT_VV(vmulh_vv_w)
-GEN_VEXT_VV(vmulh_vv_d)
-GEN_VEXT_VV(vmulhu_vv_b)
-GEN_VEXT_VV(vmulhu_vv_h)
-GEN_VEXT_VV(vmulhu_vv_w)
-GEN_VEXT_VV(vmulhu_vv_d)
-GEN_VEXT_VV(vmulhsu_vv_b)
-GEN_VEXT_VV(vmulhsu_vv_h)
-GEN_VEXT_VV(vmulhsu_vv_w)
-GEN_VEXT_VV(vmulhsu_vv_d)
+GEN_VEXT_VV(vmulh_vv_b, 1)
+GEN_VEXT_VV(vmulh_vv_h, 2)
+GEN_VEXT_VV(vmulh_vv_w, 4)
+GEN_VEXT_VV(vmulh_vv_d, 8)
+GEN_VEXT_VV(vmulhu_vv_b, 1)
+GEN_VEXT_VV(vmulhu_vv_h, 2)
+GEN_VEXT_VV(vmulhu_vv_w, 4)
+GEN_VEXT_VV(vmulhu_vv_d, 8)
+GEN_VEXT_VV(vmulhsu_vv_b, 1)
+GEN_VEXT_VV(vmulhsu_vv_h, 2)
+GEN_VEXT_VV(vmulhsu_vv_w, 4)
+GEN_VEXT_VV(vmulhsu_vv_d, 8)
=20
 RVVCALL(OPIVX2, vmul_vx_b, OP_SSS_B, H1, H1, DO_MUL)
 RVVCALL(OPIVX2, vmul_vx_h, OP_SSS_H, H2, H2, DO_MUL)
@@ -1576,22 +1614,22 @@ RVVCALL(OPIVV2, vrem_vv_b, OP_SSS_B, H1, H1, H1, =
DO_REM)
 RVVCALL(OPIVV2, vrem_vv_h, OP_SSS_H, H2, H2, H2, DO_REM)
 RVVCALL(OPIVV2, vrem_vv_w, OP_SSS_W, H4, H4, H4, DO_REM)
 RVVCALL(OPIVV2, vrem_vv_d, OP_SSS_D, H8, H8, H8, DO_REM)
-GEN_VEXT_VV(vdivu_vv_b)
-GEN_VEXT_VV(vdivu_vv_h)
-GEN_VEXT_VV(vdivu_vv_w)
-GEN_VEXT_VV(vdivu_vv_d)
-GEN_VEXT_VV(vdiv_vv_b)
-GEN_VEXT_VV(vdiv_vv_h)
-GEN_VEXT_VV(vdiv_vv_w)
-GEN_VEXT_VV(vdiv_vv_d)
-GEN_VEXT_VV(vremu_vv_b)
-GEN_VEXT_VV(vremu_vv_h)
-GEN_VEXT_VV(vremu_vv_w)
-GEN_VEXT_VV(vremu_vv_d)
-GEN_VEXT_VV(vrem_vv_b)
-GEN_VEXT_VV(vrem_vv_h)
-GEN_VEXT_VV(vrem_vv_w)
-GEN_VEXT_VV(vrem_vv_d)
+GEN_VEXT_VV(vdivu_vv_b, 1)
+GEN_VEXT_VV(vdivu_vv_h, 2)
+GEN_VEXT_VV(vdivu_vv_w, 4)
+GEN_VEXT_VV(vdivu_vv_d, 8)
+GEN_VEXT_VV(vdiv_vv_b, 1)
+GEN_VEXT_VV(vdiv_vv_h, 2)
+GEN_VEXT_VV(vdiv_vv_w, 4)
+GEN_VEXT_VV(vdiv_vv_d, 8)
+GEN_VEXT_VV(vremu_vv_b, 1)
+GEN_VEXT_VV(vremu_vv_h, 2)
+GEN_VEXT_VV(vremu_vv_w, 4)
+GEN_VEXT_VV(vremu_vv_d, 8)
+GEN_VEXT_VV(vrem_vv_b, 1)
+GEN_VEXT_VV(vrem_vv_h, 2)
+GEN_VEXT_VV(vrem_vv_w, 4)
+GEN_VEXT_VV(vrem_vv_d, 8)
=20
 RVVCALL(OPIVX2, vdivu_vx_b, OP_UUU_B, H1, H1, DO_DIVU)
 RVVCALL(OPIVX2, vdivu_vx_h, OP_UUU_H, H2, H2, DO_DIVU)
@@ -1636,15 +1674,15 @@ RVVCALL(OPIVV2, vwmulu_vv_w, WOP_UUU_W, H8, H4, H=
4, DO_MUL)
 RVVCALL(OPIVV2, vwmulsu_vv_b, WOP_SUS_B, H2, H1, H1, DO_MUL)
 RVVCALL(OPIVV2, vwmulsu_vv_h, WOP_SUS_H, H4, H2, H2, DO_MUL)
 RVVCALL(OPIVV2, vwmulsu_vv_w, WOP_SUS_W, H8, H4, H4, DO_MUL)
-GEN_VEXT_VV(vwmul_vv_b)
-GEN_VEXT_VV(vwmul_vv_h)
-GEN_VEXT_VV(vwmul_vv_w)
-GEN_VEXT_VV(vwmulu_vv_b)
-GEN_VEXT_VV(vwmulu_vv_h)
-GEN_VEXT_VV(vwmulu_vv_w)
-GEN_VEXT_VV(vwmulsu_vv_b)
-GEN_VEXT_VV(vwmulsu_vv_h)
-GEN_VEXT_VV(vwmulsu_vv_w)
+GEN_VEXT_VV(vwmul_vv_b, 2)
+GEN_VEXT_VV(vwmul_vv_h, 4)
+GEN_VEXT_VV(vwmul_vv_w, 8)
+GEN_VEXT_VV(vwmulu_vv_b, 2)
+GEN_VEXT_VV(vwmulu_vv_h, 4)
+GEN_VEXT_VV(vwmulu_vv_w, 8)
+GEN_VEXT_VV(vwmulsu_vv_b, 2)
+GEN_VEXT_VV(vwmulsu_vv_h, 4)
+GEN_VEXT_VV(vwmulsu_vv_w, 8)
=20
 RVVCALL(OPIVX2, vwmul_vx_b, WOP_SSS_B, H2, H1, DO_MUL)
 RVVCALL(OPIVX2, vwmul_vx_h, WOP_SSS_H, H4, H2, DO_MUL)
@@ -1695,22 +1733,22 @@ RVVCALL(OPIVV3, vnmsub_vv_b, OP_SSS_B, H1, H1, H1=
, DO_NMSUB)
 RVVCALL(OPIVV3, vnmsub_vv_h, OP_SSS_H, H2, H2, H2, DO_NMSUB)
 RVVCALL(OPIVV3, vnmsub_vv_w, OP_SSS_W, H4, H4, H4, DO_NMSUB)
 RVVCALL(OPIVV3, vnmsub_vv_d, OP_SSS_D, H8, H8, H8, DO_NMSUB)
-GEN_VEXT_VV(vmacc_vv_b)
-GEN_VEXT_VV(vmacc_vv_h)
-GEN_VEXT_VV(vmacc_vv_w)
-GEN_VEXT_VV(vmacc_vv_d)
-GEN_VEXT_VV(vnmsac_vv_b)
-GEN_VEXT_VV(vnmsac_vv_h)
-GEN_VEXT_VV(vnmsac_vv_w)
-GEN_VEXT_VV(vnmsac_vv_d)
-GEN_VEXT_VV(vmadd_vv_b)
-GEN_VEXT_VV(vmadd_vv_h)
-GEN_VEXT_VV(vmadd_vv_w)
-GEN_VEXT_VV(vmadd_vv_d)
-GEN_VEXT_VV(vnmsub_vv_b)
-GEN_VEXT_VV(vnmsub_vv_h)
-GEN_VEXT_VV(vnmsub_vv_w)
-GEN_VEXT_VV(vnmsub_vv_d)
+GEN_VEXT_VV(vmacc_vv_b, 1)
+GEN_VEXT_VV(vmacc_vv_h, 2)
+GEN_VEXT_VV(vmacc_vv_w, 4)
+GEN_VEXT_VV(vmacc_vv_d, 8)
+GEN_VEXT_VV(vnmsac_vv_b, 1)
+GEN_VEXT_VV(vnmsac_vv_h, 2)
+GEN_VEXT_VV(vnmsac_vv_w, 4)
+GEN_VEXT_VV(vnmsac_vv_d, 8)
+GEN_VEXT_VV(vmadd_vv_b, 1)
+GEN_VEXT_VV(vmadd_vv_h, 2)
+GEN_VEXT_VV(vmadd_vv_w, 4)
+GEN_VEXT_VV(vmadd_vv_d, 8)
+GEN_VEXT_VV(vnmsub_vv_b, 1)
+GEN_VEXT_VV(vnmsub_vv_h, 2)
+GEN_VEXT_VV(vnmsub_vv_w, 4)
+GEN_VEXT_VV(vnmsub_vv_d, 8)
=20
 #define OPIVX3(NAME, TD, T1, T2, TX1, TX2, HD, HS2, OP)             \
 static void do_##NAME(void *vd, target_long s1, void *vs2, int i)   \
@@ -1763,15 +1801,15 @@ RVVCALL(OPIVV3, vwmacc_vv_w, WOP_SSS_W, H8, H4, H=
4, DO_MACC)
 RVVCALL(OPIVV3, vwmaccsu_vv_b, WOP_SSU_B, H2, H1, H1, DO_MACC)
 RVVCALL(OPIVV3, vwmaccsu_vv_h, WOP_SSU_H, H4, H2, H2, DO_MACC)
 RVVCALL(OPIVV3, vwmaccsu_vv_w, WOP_SSU_W, H8, H4, H4, DO_MACC)
-GEN_VEXT_VV(vwmaccu_vv_b)
-GEN_VEXT_VV(vwmaccu_vv_h)
-GEN_VEXT_VV(vwmaccu_vv_w)
-GEN_VEXT_VV(vwmacc_vv_b)
-GEN_VEXT_VV(vwmacc_vv_h)
-GEN_VEXT_VV(vwmacc_vv_w)
-GEN_VEXT_VV(vwmaccsu_vv_b)
-GEN_VEXT_VV(vwmaccsu_vv_h)
-GEN_VEXT_VV(vwmaccsu_vv_w)
+GEN_VEXT_VV(vwmaccu_vv_b, 2)
+GEN_VEXT_VV(vwmaccu_vv_h, 4)
+GEN_VEXT_VV(vwmaccu_vv_w, 8)
+GEN_VEXT_VV(vwmacc_vv_b, 2)
+GEN_VEXT_VV(vwmacc_vv_h, 4)
+GEN_VEXT_VV(vwmacc_vv_w, 8)
+GEN_VEXT_VV(vwmaccsu_vv_b, 2)
+GEN_VEXT_VV(vwmaccsu_vv_h, 4)
+GEN_VEXT_VV(vwmaccsu_vv_w, 8)
=20
 RVVCALL(OPIVX3, vwmaccu_vx_b, WOP_UUU_B, H2, H1, DO_MACC)
 RVVCALL(OPIVX3, vwmaccu_vx_h, WOP_UUU_H, H4, H2, DO_MACC)
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
index 6750f5d04a..bf9886a93d 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -1231,7 +1231,7 @@ do_opivv_gvec(DisasContext *s, arg_rmrr *a, GVecGen=
3Fn *gvec_fn,
     tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
     tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
=20
-    if (a->vm && s->vl_eq_vlmax) {
+    if (a->vm && s->vl_eq_vlmax && !(s->vta && s->lmul < 0)) {
         gvec_fn(s->sew, vreg_ofs(s, a->rd),
                 vreg_ofs(s, a->rs2), vreg_ofs(s, a->rs1),
                 MAXSZ(s), MAXSZ(s));
@@ -1240,6 +1240,7 @@ do_opivv_gvec(DisasContext *s, arg_rmrr *a, GVecGen=
3Fn *gvec_fn,
=20
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);
+        data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
                            vreg_ofs(s, a->rs1), vreg_ofs(s, a->rs2),
                            cpu_env, s->cfg_ptr->vlen / 8,
--=20
2.36.1


