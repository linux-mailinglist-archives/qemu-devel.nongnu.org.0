Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5751C3C9DA
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jun 2019 13:18:08 +0200 (CEST)
Received: from localhost ([::1]:56330 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1haen1-0001uL-Fo
	for lists+qemu-devel@lfdr.de; Tue, 11 Jun 2019 07:18:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39108)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1haePu-0007DT-I5
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 06:54:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1haePr-0007PS-St
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 06:54:14 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:43062)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1haePr-0007Ly-IL
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 06:54:11 -0400
Received: by mail-wr1-x441.google.com with SMTP id p13so2387665wru.10
 for <qemu-devel@nongnu.org>; Tue, 11 Jun 2019 03:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JD4GO8F9aylwZA/zvoGNYNDsDGK74aumUd+PDKM7Pbc=;
 b=CWuiyj6vGqzaoYGguLMq8hLrRJ+JSgRtxxOhh5fbGudlG4+ClHm2Kx8ozTRh4WQIi2
 +MBuTf0nEhwxNPqQeLsywME5mAXax8XWrvelYVVeF2rDAQXQg+BAlfCfDQkhXoEJYNSP
 zeorXa8sb56AItT79QilDjmvU2ecs0Wj8dIKdV/YOBbDPpsVUtwNLrqb4yq9IcuiQeX+
 kgZXvqGplT+I598216NBuR7rkiY566TfTrs87d77xb6Ob39+tR9PkvrLaEXLvffo10ks
 JcHVkWBLyL2SjD7ZperMwKNYX4CZorHVM7Usu8yXElBktxPdn2xhvGUSGdCTFynnef5d
 pHZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JD4GO8F9aylwZA/zvoGNYNDsDGK74aumUd+PDKM7Pbc=;
 b=Yw2i0PWlsa1sedX5NxR0jC7E/w9IWmGeKj0CoTqXQuwLOak77plpKmmu28131sjyu/
 678aw2vPg9lrmywrYugwqOTi6up/6W0riJdbz/kqZB3qf6/NW8RNqFa7NxXFM/crD7ZU
 l1CiM2BU7grOAYYX09R6c0tUhNnaIMnRnf/Cv6GtO75eNcd9TBbRwG+0tJOVnixokkxF
 LitmGOaa1HH2KCr2yurLlMEdPzYY6Xq7YEd+Fg6BrYGrXwZTYXYYxmvtgp6oD0KhAZBw
 IuWmABRMEzRDQeR9+ShwdMeAp+iuNh1yrs4kJ8L9cAJLhJEtPy6OMMJb9U9Eo9OWtCqu
 6rHg==
X-Gm-Message-State: APjAAAWJC/fAVBLA1JZSkJO85JAc/73glwwB5FLtAoYXnJatLscXpKfR
 +dWdXDiYnugK/sHnR56xPpMCGg==
X-Google-Smtp-Source: APXvYqxuAZMG0JQqzn71QKEPyCZZJ7btLNT/TeEwYv8uHEXUDhzBEAK38XkcU1cRB2ZCl1mPq/8nkQ==
X-Received: by 2002:adf:9dcc:: with SMTP id q12mr24218921wre.93.1560250448751; 
 Tue, 11 Jun 2019 03:54:08 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id e17sm10785945wrt.95.2019.06.11.03.54.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Jun 2019 03:54:08 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 11 Jun 2019 11:53:23 +0100
Message-Id: <20190611105351.9871-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190611105351.9871-1-peter.maydell@linaro.org>
References: <20190611105351.9871-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
Subject: [Qemu-devel] [PATCH v2 14/42] target/arm: Convert VFP two-register
 transfer insns to decodetree
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Convert the VFP two-register transfer instructions to decodetree
(in the v8 Arm ARM these are the "Advanced SIMD and floating-point
64-bit move" encoding group).

Again, we expand out the sequences involving gen_vfp_msr() and
gen_msr_vfp().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-vfp.inc.c | 70 ++++++++++++++++++++++++++++++++++
 target/arm/translate.c         | 46 +---------------------
 target/arm/vfp.decode          |  5 +++
 3 files changed, 77 insertions(+), 44 deletions(-)

diff --git a/target/arm/translate-vfp.inc.c b/target/arm/translate-vfp.inc.c
index 74c10f9024b..5f081221b83 100644
--- a/target/arm/translate-vfp.inc.c
+++ b/target/arm/translate-vfp.inc.c
@@ -783,3 +783,73 @@ static bool trans_VMOV_single(DisasContext *s, arg_VMOV_single *a)
 
     return true;
 }
+
+static bool trans_VMOV_64_sp(DisasContext *s, arg_VMOV_64_sp *a)
+{
+    TCGv_i32 tmp;
+
+    /*
+     * VMOV between two general-purpose registers and two single precision
+     * floating point registers
+     */
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    if (a->op) {
+        /* fpreg to gpreg */
+        tmp = tcg_temp_new_i32();
+        neon_load_reg32(tmp, a->vm);
+        store_reg(s, a->rt, tmp);
+        tmp = tcg_temp_new_i32();
+        neon_load_reg32(tmp, a->vm + 1);
+        store_reg(s, a->rt2, tmp);
+    } else {
+        /* gpreg to fpreg */
+        tmp = load_reg(s, a->rt);
+        neon_store_reg32(tmp, a->vm);
+        tmp = load_reg(s, a->rt2);
+        neon_store_reg32(tmp, a->vm + 1);
+    }
+
+    return true;
+}
+
+static bool trans_VMOV_64_dp(DisasContext *s, arg_VMOV_64_sp *a)
+{
+    TCGv_i32 tmp;
+
+    /*
+     * VMOV between two general-purpose registers and one double precision
+     * floating point register
+     */
+
+    /* UNDEF accesses to D16-D31 if they don't exist */
+    if (!dc_isar_feature(aa32_fp_d32, s) && (a->vm & 0x10)) {
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    if (a->op) {
+        /* fpreg to gpreg */
+        tmp = tcg_temp_new_i32();
+        neon_load_reg32(tmp, a->vm * 2);
+        store_reg(s, a->rt, tmp);
+        tmp = tcg_temp_new_i32();
+        neon_load_reg32(tmp, a->vm * 2 + 1);
+        store_reg(s, a->rt2, tmp);
+    } else {
+        /* gpreg to fpreg */
+        tmp = load_reg(s, a->rt);
+        neon_store_reg32(tmp, a->vm * 2);
+        tcg_temp_free_i32(tmp);
+        tmp = load_reg(s, a->rt2);
+        neon_store_reg32(tmp, a->vm * 2 + 1);
+        tcg_temp_free_i32(tmp);
+    }
+
+    return true;
+}
diff --git a/target/arm/translate.c b/target/arm/translate.c
index cbb86a49213..d2dced7c45a 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -3703,50 +3703,8 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
     case 0xc:
     case 0xd:
         if ((insn & 0x03e00000) == 0x00400000) {
-            /* two-register transfer */
-            rn = (insn >> 16) & 0xf;
-            rd = (insn >> 12) & 0xf;
-            if (dp) {
-                VFP_DREG_M(rm, insn);
-            } else {
-                rm = VFP_SREG_M(insn);
-            }
-
-            if (insn & ARM_CP_RW_BIT) {
-                /* vfp->arm */
-                if (dp) {
-                    gen_mov_F0_vreg(0, rm * 2);
-                    tmp = gen_vfp_mrs();
-                    store_reg(s, rd, tmp);
-                    gen_mov_F0_vreg(0, rm * 2 + 1);
-                    tmp = gen_vfp_mrs();
-                    store_reg(s, rn, tmp);
-                } else {
-                    gen_mov_F0_vreg(0, rm);
-                    tmp = gen_vfp_mrs();
-                    store_reg(s, rd, tmp);
-                    gen_mov_F0_vreg(0, rm + 1);
-                    tmp = gen_vfp_mrs();
-                    store_reg(s, rn, tmp);
-                }
-            } else {
-                /* arm->vfp */
-                if (dp) {
-                    tmp = load_reg(s, rd);
-                    gen_vfp_msr(tmp);
-                    gen_mov_vreg_F0(0, rm * 2);
-                    tmp = load_reg(s, rn);
-                    gen_vfp_msr(tmp);
-                    gen_mov_vreg_F0(0, rm * 2 + 1);
-                } else {
-                    tmp = load_reg(s, rd);
-                    gen_vfp_msr(tmp);
-                    gen_mov_vreg_F0(0, rm);
-                    tmp = load_reg(s, rn);
-                    gen_vfp_msr(tmp);
-                    gen_mov_vreg_F0(0, rm + 1);
-                }
-            }
+            /* Already handled by decodetree */
+            return 1;
         } else {
             /* Load/store */
             rn = (insn >> 16) & 0xf;
diff --git a/target/arm/vfp.decode b/target/arm/vfp.decode
index bb7de403df3..134f1c9ef58 100644
--- a/target/arm/vfp.decode
+++ b/target/arm/vfp.decode
@@ -66,3 +66,8 @@ VDUP         ---- 1110 1 b:1 q:1 0 .... rt:4 1011 . 0 e:1 1 0000 \
 VMSR_VMRS    ---- 1110 111 l:1 reg:4 rt:4 1010 0001 0000
 VMOV_single  ---- 1110 000 l:1 .... rt:4 1010 . 001 0000 \
              vn=%vn_sp
+
+VMOV_64_sp   ---- 1100 010 op:1 rt2:4 rt:4 1010 00.1 .... \
+             vm=%vm_sp
+VMOV_64_dp   ---- 1100 010 op:1 rt2:4 rt:4 1011 00.1 .... \
+             vm=%vm_dp
-- 
2.20.1


