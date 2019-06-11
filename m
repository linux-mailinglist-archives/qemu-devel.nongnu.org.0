Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EDB23C9B1
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jun 2019 13:05:56 +0200 (CEST)
Received: from localhost ([::1]:56248 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1haebD-000880-Cj
	for lists+qemu-devel@lfdr.de; Tue, 11 Jun 2019 07:05:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39328)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1haeQ3-0007Mo-Mm
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 06:54:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1haePy-0007XY-13
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 06:54:23 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:51682)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1haePx-0007Un-LD
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 06:54:17 -0400
Received: by mail-wm1-x341.google.com with SMTP id 207so2438343wma.1
 for <qemu-devel@nongnu.org>; Tue, 11 Jun 2019 03:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CMrwrOJ95kW4T6/b8G/qtF8+mC0+yLfbGLY5ikylyb4=;
 b=j5WAFGK3YwuUVLpCXXs+wSIwwcaCGhtbd+umCM6gl/H5cR+dllX9OTNvTbHPyCUt09
 ZZbkd95C15o8hMp5JAxw8VQu99/KQuDwbSR9GBjKMruDwlLD318v0GmTeFcaiKYXGYtF
 tF6wgURuRvF5v4DkR/j6syJCIIekMjG9xTyL7mDHEDPjSxjcuR/6/UJhuYNciSbjE9hL
 cu0tAPmy5SklILvJWbySLEYXBZrX7bJr53DAvdFp+WnpKwo8A+H38mSOI0B3mWBQK82Q
 Stj00goUwio0MSSyc4ZDfg9oMbtAsdDMeQ3Tb3IfHxJojNnQhI2NmKyq/MLKDkaV9l7G
 pn9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CMrwrOJ95kW4T6/b8G/qtF8+mC0+yLfbGLY5ikylyb4=;
 b=gjc6ssZ9nHcY4Lc4/rxA4D1kWi/9jWlZoGCsw+CrdAUdWk6qf9gR8xcYucEylkltf0
 imAcGQhWKv9cOmsdDGW1cJOUprJr7+aPjQE5Jl4r0cYULYpL1+zt8bk7MdC6a/+xMYIe
 IlVrLz/l6mCHF8NREb54qcBFe6x9Zmb608lfO6VEHcwQxv8dvAOkpp/nX1iZYF6IlJvA
 BYHXI4y507O379/hSxvoOdcuZJrhbkzPuNwD2Fo5Pg7ZdPT5/m8lZlXOoKBGcbpoe6Dg
 KFXCrvKURxYxKkFVkC5gFzvi/y6i4kbNuK0ui1yDX6swSaJiMJeG9iJi9DFa6g6z7PUc
 nO3A==
X-Gm-Message-State: APjAAAVUu2exagX26eqCLGBPbKVOnpOHKvMnA8Pcr8K+R3VgAL2xGakG
 ps6NIYWPlITxDOcZpeE2IEEy5A==
X-Google-Smtp-Source: APXvYqy+GD0a4Na80BB6FZyHymlK6Bnj1lX41VMDlW5nxYuYbkUEcOiVlpE08qM6vax1irG3NPExkw==
X-Received: by 2002:a1c:a983:: with SMTP id s125mr16394297wme.18.1560250454758; 
 Tue, 11 Jun 2019 03:54:14 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id e17sm10785945wrt.95.2019.06.11.03.54.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Jun 2019 03:54:13 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 11 Jun 2019 11:53:28 +0100
Message-Id: <20190611105351.9871-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190611105351.9871-1-peter.maydell@linaro.org>
References: <20190611105351.9871-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
Subject: [Qemu-devel] [PATCH v2 19/42] target/arm: Convert VFP VMLS to
 decodetree
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

Convert the VFP VMLS instruction to decodetree.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-vfp.inc.c | 38 ++++++++++++++++++++++++++++++++++
 target/arm/translate.c         |  8 +------
 target/arm/vfp.decode          |  5 +++++
 3 files changed, 44 insertions(+), 7 deletions(-)

diff --git a/target/arm/translate-vfp.inc.c b/target/arm/translate-vfp.inc.c
index 4f922dc8405..00f64401dda 100644
--- a/target/arm/translate-vfp.inc.c
+++ b/target/arm/translate-vfp.inc.c
@@ -1303,3 +1303,41 @@ static bool trans_VMLA_dp(DisasContext *s, arg_VMLA_sp *a)
 {
     return do_vfp_3op_dp(s, gen_VMLA_dp, a->vd, a->vn, a->vm, true);
 }
+
+static void gen_VMLS_sp(TCGv_i32 vd, TCGv_i32 vn, TCGv_i32 vm, TCGv_ptr fpst)
+{
+    /*
+     * VMLS: vd = vd + -(vn * vm)
+     * Note that order of inputs to the add matters for NaNs.
+     */
+    TCGv_i32 tmp = tcg_temp_new_i32();
+
+    gen_helper_vfp_muls(tmp, vn, vm, fpst);
+    gen_helper_vfp_negs(tmp, tmp);
+    gen_helper_vfp_adds(vd, vd, tmp, fpst);
+    tcg_temp_free_i32(tmp);
+}
+
+static bool trans_VMLS_sp(DisasContext *s, arg_VMLS_sp *a)
+{
+    return do_vfp_3op_sp(s, gen_VMLS_sp, a->vd, a->vn, a->vm, true);
+}
+
+static void gen_VMLS_dp(TCGv_i64 vd, TCGv_i64 vn, TCGv_i64 vm, TCGv_ptr fpst)
+{
+    /*
+     * VMLS: vd = vd + -(vn * vm)
+     * Note that order of inputs to the add matters for NaNs.
+     */
+    TCGv_i64 tmp = tcg_temp_new_i64();
+
+    gen_helper_vfp_muld(tmp, vn, vm, fpst);
+    gen_helper_vfp_negd(tmp, tmp);
+    gen_helper_vfp_addd(vd, vd, tmp, fpst);
+    tcg_temp_free_i64(tmp);
+}
+
+static bool trans_VMLS_dp(DisasContext *s, arg_VMLS_sp *a)
+{
+    return do_vfp_3op_dp(s, gen_VMLS_dp, a->vd, a->vn, a->vm, true);
+}
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 4e40a8562c4..bddc0d20447 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -3134,7 +3134,7 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
             rn = VFP_SREG_N(insn);
 
             switch (op) {
-            case 0:
+            case 0 ... 1:
                 /* Already handled by decodetree */
                 return 1;
             default:
@@ -3320,12 +3320,6 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
             for (;;) {
                 /* Perform the calculation.  */
                 switch (op) {
-                case 1: /* VMLS: fd + -(fn * fm) */
-                    gen_vfp_mul(dp);
-                    gen_vfp_F1_neg(dp);
-                    gen_mov_F0_vreg(dp, rd);
-                    gen_vfp_add(dp);
-                    break;
                 case 2: /* VNMLS: -fd + (fn * fm) */
                     /* Note that it isn't valid to replace (-A + B) with (B - A)
                      * or similar plausible looking simplifications
diff --git a/target/arm/vfp.decode b/target/arm/vfp.decode
index 9530e17ae02..7bcf2260eec 100644
--- a/target/arm/vfp.decode
+++ b/target/arm/vfp.decode
@@ -102,3 +102,8 @@ VMLA_sp      ---- 1110 0.00 .... .... 1010 .0.0 .... \
              vm=%vm_sp vn=%vn_sp vd=%vd_sp
 VMLA_dp      ---- 1110 0.00 .... .... 1011 .0.0 .... \
              vm=%vm_dp vn=%vn_dp vd=%vd_dp
+
+VMLS_sp      ---- 1110 0.00 .... .... 1010 .1.0 .... \
+             vm=%vm_sp vn=%vn_sp vd=%vd_sp
+VMLS_dp      ---- 1110 0.00 .... .... 1011 .1.0 .... \
+             vm=%vm_dp vn=%vn_dp vd=%vd_dp
-- 
2.20.1


