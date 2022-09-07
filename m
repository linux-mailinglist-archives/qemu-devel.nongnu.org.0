Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B58A5AFF6C
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 10:43:32 +0200 (CEST)
Received: from localhost ([::1]:37134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVqeg-0007PE-Uc
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 04:43:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=242877ce7=alistair.francis@wdc.com>)
 id 1oVq4E-0004S7-Ql
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 04:05:50 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:1923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=242877ce7=alistair.francis@wdc.com>)
 id 1oVq47-0004Ud-75
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 04:05:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1662537941; x=1694073941;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oHhfJ9U4lJgcvrJoDC/l3noJeeejGDI52ne8RIJadi4=;
 b=Gk/DKfWeJk1n7JmhC+khsxnWZAggzMkhzpzsdNp7hx5XHzBQcqOCefoD
 bZRNdgQ/wIpg8LhBgiTxXAvGdukb4gvMZ9DU24ITGsxweyEsYG/Km/4q+
 pJzJkjHAizMfIxV+BEnUHMvMEHH9KorAg3gJaT8xWV/7uj3M77Edn/DAl
 LJr963REVMnPCk9NhrNn8su6309e+u9pwqNprfWkgvD99qkk8g54SRUqF
 Wkj0Yq8mKZ5S7U/vpDJCGzt5RHXQpgKrJXcz9AsBrMLrxJUSaKUKsRzS0
 xKIEuBVI2YYGmfm/Ui0twWom4zEy1kdIAaPa7ioUzYyppgSIfBLLmOK8W g==;
X-IronPort-AV: E=Sophos;i="5.93,296,1654531200"; d="scan'208";a="210715036"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 07 Sep 2022 16:04:54 +0800
IronPort-SDR: V8e7ed/5iO9ha4dDdjB3q15jI6qrVtS4UvXu+QZl+IrmseDwt7zRww4IoUv+x3aq++WQS1OGYc
 B9NsQ3QN+8HR89O8fsE9nX2pHSWsrgNqTDRXyUhQnZgA/fstp64wl+JwBTaLdCrEmpvVPCHhFt
 Mul61+YXMRJ7CyrAQoIvyW4XhJ4XEMh4+ycUWuODO91uYbIFnFZnkSGd7dZARai+AesFJj1+75
 Ijzopm/ItYbYChgukQM3mnqLwh7rh5ibJZYpJRQQ2eaSRDhVVN2J5IhlSmAlYOimziyQPgD9S3
 BQ/0LNUbb0SwnHYFpYnzWlYv
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Sep 2022 00:19:52 -0700
IronPort-SDR: ld8FR29VoLGgAr/wbaawebMO6AVgI6l4uhwMBwAcgggELqdp7rImcHyroWEQzKlWsdavOTcK6d
 0u2qd5wmLSFz5TJJ1YA/OUReukHahCqXzL4IZZ5h6vCzxqUShCMIWPorOtDSsYFdm0rBiQ2JmP
 QqnoVzKeRD8IElgO6sk7NbdzbUqtzfwE+r4a7PlfZKqdHVjEmVYIOSZ6ldeTlTmthf1fchiOqm
 nBGdm9HPPsrbCdQn62fdJ7aK+/d6IbHopQJuAQtpq4Ti+zDePB7AXcdfEBSlakjfOANRhd4i0G
 rwU=
WDCIronportException: Internal
Received: from unknown (HELO toolbox.wdc.com) ([10.225.167.94])
 by uls-op-cesaip01.wdc.com with ESMTP; 07 Sep 2022 01:04:54 -0700
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, "Yueh-Ting (eop) Chen" <eop.chen@sifive.com>,
 Frank Chang <frank.chang@sifive.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 22/44] target/riscv: rvv: Add mask agnostic for vector mask
 instructions
Date: Wed,  7 Sep 2022 10:03:31 +0200
Message-Id: <20220907080353.111926-23-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220907080353.111926-1-alistair.francis@wdc.com>
References: <20220907080353.111926-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=242877ce7=alistair.francis@wdc.com;
 helo=esa5.hgst.iphmx.com
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
Reply-to:  Alistair Francis <alistair.francis@wdc.com>
From:  Alistair Francis via <qemu-devel@nongnu.org>

From: "Yueh-Ting (eop) Chen" <eop.chen@sifive.com>

Signed-off-by: eop Chen <eop.chen@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <165570784143.17634.35095816584573691-8@git.sr.ht>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/vector_helper.c            | 11 +++++++++++
 target/riscv/insn_trans/trans_rvv.c.inc |  3 +++
 2 files changed, 14 insertions(+)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 315742c6b8..52518648bb 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4879,11 +4879,16 @@ static void vmsetm(void *vd, void *v0, void *vs2, CPURISCVState *env,
     uint32_t vl = env->vl;
     uint32_t total_elems = env_archcpu(env)->cfg.vlen;
     uint32_t vta_all_1s = vext_vta_all_1s(desc);
+    uint32_t vma = vext_vma(desc);
     int i;
     bool first_mask_bit = false;
 
     for (i = env->vstart; i < vl; i++) {
         if (!vm && !vext_elem_mask(v0, i)) {
+            /* set masked-off elements to 1s */
+            if (vma) {
+                vext_set_elem_mask(vd, i, 1);
+            }
             continue;
         }
         /* write a zero to all following active elements */
@@ -4944,11 +4949,14 @@ void HELPER(NAME)(void *vd, void *v0, void *vs2, CPURISCVState *env,      \
     uint32_t esz = sizeof(ETYPE);                                         \
     uint32_t total_elems = vext_get_total_elems(env, desc, esz);          \
     uint32_t vta = vext_vta(desc);                                        \
+    uint32_t vma = vext_vma(desc);                                        \
     uint32_t sum = 0;                                                     \
     int i;                                                                \
                                                                           \
     for (i = env->vstart; i < vl; i++) {                                  \
         if (!vm && !vext_elem_mask(v0, i)) {                              \
+            /* set masked-off elements to 1s */                           \
+            vext_set_elems_1s(vd, vma, i * esz, (i + 1) * esz);           \
             continue;                                                     \
         }                                                                 \
         *((ETYPE *)vd + H(i)) = sum;                                      \
@@ -4975,10 +4983,13 @@ void HELPER(NAME)(void *vd, void *v0, CPURISCVState *env, uint32_t desc)  \
     uint32_t esz = sizeof(ETYPE);                                         \
     uint32_t total_elems = vext_get_total_elems(env, desc, esz);          \
     uint32_t vta = vext_vta(desc);                                        \
+    uint32_t vma = vext_vma(desc);                                        \
     int i;                                                                \
                                                                           \
     for (i = env->vstart; i < vl; i++) {                                  \
         if (!vm && !vext_elem_mask(v0, i)) {                              \
+            /* set masked-off elements to 1s */                           \
+            vext_set_elems_1s(vd, vma, i * esz, (i + 1) * esz);           \
             continue;                                                     \
         }                                                                 \
         *((ETYPE *)vd + H(i)) = i;                                        \
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 8ce3d28603..c1bd29329e 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -3275,6 +3275,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
         data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
         data =                                                     \
             FIELD_DP32(data, VDATA, VTA_ALL_1S, s->cfg_vta_all_1s);\
+        data = FIELD_DP32(data, VDATA, VMA, s->vma);               \
         tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd),                     \
                            vreg_ofs(s, 0), vreg_ofs(s, a->rs2),    \
                            cpu_env, s->cfg_ptr->vlen / 8,          \
@@ -3313,6 +3314,7 @@ static bool trans_viota_m(DisasContext *s, arg_viota_m *a)
         data = FIELD_DP32(data, VDATA, VM, a->vm);
         data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
         data = FIELD_DP32(data, VDATA, VTA, s->vta);
+        data = FIELD_DP32(data, VDATA, VMA, s->vma);
         static gen_helper_gvec_3_ptr * const fns[4] = {
             gen_helper_viota_m_b, gen_helper_viota_m_h,
             gen_helper_viota_m_w, gen_helper_viota_m_d,
@@ -3343,6 +3345,7 @@ static bool trans_vid_v(DisasContext *s, arg_vid_v *a)
         data = FIELD_DP32(data, VDATA, VM, a->vm);
         data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
         data = FIELD_DP32(data, VDATA, VTA, s->vta);
+        data = FIELD_DP32(data, VDATA, VMA, s->vma);
         static gen_helper_gvec_2_ptr * const fns[4] = {
             gen_helper_vid_v_b, gen_helper_vid_v_h,
             gen_helper_vid_v_w, gen_helper_vid_v_d,
-- 
2.37.2


