Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 426CE5AFF49
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 10:38:41 +0200 (CEST)
Received: from localhost ([::1]:41108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVqZv-0001KI-BM
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 04:38:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=242877ce7=alistair.francis@wdc.com>)
 id 1oVq43-0004LQ-MU
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 04:05:39 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:1896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=242877ce7=alistair.francis@wdc.com>)
 id 1oVq3v-0004Ol-MV
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 04:05:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1662537931; x=1694073931;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hs9ddUuFl1mqRpq+W4opYa12SvBJvfvNTRomv/0Wveo=;
 b=ArVJhWnKth5sQaxGlBk5dXCHr6S3O/EMO1L5o3bfDvRuA+lSfOyAOUgR
 B9qEb8sSDrw5KzC15BNjHOYWDm16zCaOSW45vIbEBmvOdVmyZI53ejkbA
 p6iPXrRpKB7T7tSufGd5cvarJXS4Vq8TaC1rbb2/Uok7/RkSrk3saU34P
 AuuHjxwNtayoOjDMqIR+8nwfSsc+Oz2q5pEeAQ1BFN/ipxcKB1sbGgz0B
 7CZSTnFxbK07Wl0sXgNi98s5+pahzqzV4nrwqjgTtoq1voh4MaCwP4We1
 Y7Ukxs1SegdivaVl1YHS4xq2kNgv/+ghF2eQ5OeGH49lv0QgodxqaS1BO w==;
X-IronPort-AV: E=Sophos;i="5.93,296,1654531200"; d="scan'208";a="210715023"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 07 Sep 2022 16:04:50 +0800
IronPort-SDR: MXSVokooS48Voy7JsHmS4QO99p3ypl9iYeFVL3PkswObtRXHxNPXs26ucnweudnq/dMO4F7Gqn
 bBul7L7YWzOMaB43vQXmYc94FmVkMLvgzFikWTRp2ag469gXDMa/1W3fkTpxr4ELvD1RCFrlWN
 CQL2k5vrPmktiEzE8on42ofXRqkAh/R3e51VxshOQtpBTzL+dv3N3jSf4KeyK/wC1u2WYsLeNk
 k247oEUyeqA52VWmjH5p3NkaN5uwN1HuoDMTIWSv+sFpo9xWNTOJj9uwqiVPNAS8P0WYllAD66
 DcH2ju0ScR8mhd3NpQXfB1Mt
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Sep 2022 00:19:48 -0700
IronPort-SDR: 1L1Gig29IVFmGsScq09hpkoEZxpRtJRqex1U3kyzhpcGp4hSVmderE8mWmslyPIp/wZhQo2AHr
 GY3U/ZwDQu/wx1TDSckwIU3v3uQpuff0GfpOONO+nVkge51O5pU3skE/SP4tMEmGZQ1H2HR3ye
 D2HpwvORS4B3Ey6/ofcWRBCDwpFOCnuQ2SlM+pfxs5IfxkaSSLPc/vgpopNsbC/dGnlwRGFezB
 m9+PWVcGGNLCWsZAp7zvEYBCQ0L9fKkS2G85w8dn8qczUXHWoRYMrocgykFMxsiopcJomkB4Mv
 Upc=
WDCIronportException: Internal
Received: from unknown (HELO toolbox.wdc.com) ([10.225.167.94])
 by uls-op-cesaip01.wdc.com with ESMTP; 07 Sep 2022 01:04:49 -0700
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, "Yueh-Ting (eop) Chen" <eop.chen@sifive.com>,
 Frank Chang <frank.chang@sifive.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 20/44] target/riscv: rvv: Add mask agnostic for vector
 fix-point arithmetic instructions
Date: Wed,  7 Sep 2022 10:03:29 +0200
Message-Id: <20220907080353.111926-21-alistair.francis@wdc.com>
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
Message-Id: <165570784143.17634.35095816584573691-6@git.sr.ht>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/vector_helper.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 07ce671879..597fa9c752 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -2129,10 +2129,12 @@ static inline void
 vext_vv_rm_1(void *vd, void *v0, void *vs1, void *vs2,
              CPURISCVState *env,
              uint32_t vl, uint32_t vm, int vxrm,
-             opivv2_rm_fn *fn)
+             opivv2_rm_fn *fn, uint32_t vma, uint32_t esz)
 {
     for (uint32_t i = env->vstart; i < vl; i++) {
         if (!vm && !vext_elem_mask(v0, i)) {
+            /* set masked-off elements to 1s */
+            vext_set_elems_1s(vd, vma, i * esz, (i + 1) * esz);
             continue;
         }
         fn(vd, vs1, vs2, i, env, vxrm);
@@ -2150,23 +2152,24 @@ vext_vv_rm_2(void *vd, void *v0, void *vs1, void *vs2,
     uint32_t vl = env->vl;
     uint32_t total_elems = vext_get_total_elems(env, desc, esz);
     uint32_t vta = vext_vta(desc);
+    uint32_t vma = vext_vma(desc);
 
     switch (env->vxrm) {
     case 0: /* rnu */
         vext_vv_rm_1(vd, v0, vs1, vs2,
-                     env, vl, vm, 0, fn);
+                     env, vl, vm, 0, fn, vma, esz);
         break;
     case 1: /* rne */
         vext_vv_rm_1(vd, v0, vs1, vs2,
-                     env, vl, vm, 1, fn);
+                     env, vl, vm, 1, fn, vma, esz);
         break;
     case 2: /* rdn */
         vext_vv_rm_1(vd, v0, vs1, vs2,
-                     env, vl, vm, 2, fn);
+                     env, vl, vm, 2, fn, vma, esz);
         break;
     default: /* rod */
         vext_vv_rm_1(vd, v0, vs1, vs2,
-                     env, vl, vm, 3, fn);
+                     env, vl, vm, 3, fn, vma, esz);
         break;
     }
     /* set tail elements to 1s */
@@ -2250,10 +2253,12 @@ static inline void
 vext_vx_rm_1(void *vd, void *v0, target_long s1, void *vs2,
              CPURISCVState *env,
              uint32_t vl, uint32_t vm, int vxrm,
-             opivx2_rm_fn *fn)
+             opivx2_rm_fn *fn, uint32_t vma, uint32_t esz)
 {
     for (uint32_t i = env->vstart; i < vl; i++) {
         if (!vm && !vext_elem_mask(v0, i)) {
+            /* set masked-off elements to 1s */
+            vext_set_elems_1s(vd, vma, i * esz, (i + 1) * esz);
             continue;
         }
         fn(vd, s1, vs2, i, env, vxrm);
@@ -2271,23 +2276,24 @@ vext_vx_rm_2(void *vd, void *v0, target_long s1, void *vs2,
     uint32_t vl = env->vl;
     uint32_t total_elems = vext_get_total_elems(env, desc, esz);
     uint32_t vta = vext_vta(desc);
+    uint32_t vma = vext_vma(desc);
 
     switch (env->vxrm) {
     case 0: /* rnu */
         vext_vx_rm_1(vd, v0, s1, vs2,
-                     env, vl, vm, 0, fn);
+                     env, vl, vm, 0, fn, vma, esz);
         break;
     case 1: /* rne */
         vext_vx_rm_1(vd, v0, s1, vs2,
-                     env, vl, vm, 1, fn);
+                     env, vl, vm, 1, fn, vma, esz);
         break;
     case 2: /* rdn */
         vext_vx_rm_1(vd, v0, s1, vs2,
-                     env, vl, vm, 2, fn);
+                     env, vl, vm, 2, fn, vma, esz);
         break;
     default: /* rod */
         vext_vx_rm_1(vd, v0, s1, vs2,
-                     env, vl, vm, 3, fn);
+                     env, vl, vm, 3, fn, vma, esz);
         break;
     }
     /* set tail elements to 1s */
-- 
2.37.2


