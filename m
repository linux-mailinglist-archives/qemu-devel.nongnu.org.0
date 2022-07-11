Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 706BD570582
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 16:26:24 +0200 (CEST)
Received: from localhost ([::1]:38556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAuMh-0003vr-Ga
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 10:26:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oAtve-0006cc-FA
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 09:58:26 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:54929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oAtvT-0002oE-RW
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 09:58:25 -0400
Received: by mail-wm1-x331.google.com with SMTP id n185so3088970wmn.4
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 06:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=rdPq6uSChyhiVf54BW91Z5hNyR78/N5QUsEASqtPQEU=;
 b=YzbXPtF1TvUA9ew7yBXawqoZTg4RXJ1kjCc/f8l7mUrlChfZbu6VRuOL8mvfVBkWfA
 JVJ5uQvkAk8jKFn8mmnG9gj7VjmwrgnfTYww8l/fwI94E8edEo9qjI2eztw5TkNfSF/3
 TPoD/lapfdm9lWGc7jKy5WuU+0Z9D1TJUV59S8V994OU5EnkI2hdkdxCH6Ht5HoKh48M
 a8dijUOKZjGnqLC78gITYP4qcl0uabPWubmgtGlWd+svImLB5zDcxUdJ+cRy5yN1FaGe
 LBvAip8Ub5vhO8OiqqYZ5IR7aFvAxCq52E2TZyYM7ZRSfFa1vYETibORqhpftW9kVhm6
 b4MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rdPq6uSChyhiVf54BW91Z5hNyR78/N5QUsEASqtPQEU=;
 b=hvryrXBYSiNRnDSoXxzU6oJNbxL9R6kf/jQTUrUJGPZNRawBijtDPKG9Wp4JFRi27R
 ZoS8HcUNB5QDmu5SAdJoPrhUdxFMVAO0v2CMXl9oorbkD6w0RFkLepN/SBMsBO/d6IL6
 kO9ttMDkD5NZ37w/157J1AP6g799cbRz4HC7nY4YoCzDYwWt0BL4+eb4h5kc8fCV5yth
 iQ/2v1T6fovZP3Qvn/Qf0oJTTniN23OXmVeL9YsqF4RLpFG1DP0pGz14G560u6MQ5ori
 Pqg37sEHSvdrrNfnaTQvX5OP+fb4+b9dvMP6Yi3Ilt4J1fsMcgxNpwGWG3h8RjVHm+DB
 HKTA==
X-Gm-Message-State: AJIora+LW6W/4giSnRIYwd6tzpofCHI2HSWQTsWa1L2NvUVYSqf3Qulo
 DKW6+48cW+nJYuvhsrzTSzfSK6fT679nhA==
X-Google-Smtp-Source: AGRyM1sElvFC/i0hZPWOm0CS+JWUaED1gEoTx12BKDaHTeX2NEMjP2/39o3N7r18bOohSqVg0YJH5A==
X-Received: by 2002:a05:600c:c2:b0:3a2:e51a:78aa with SMTP id
 u2-20020a05600c00c200b003a2e51a78aamr9164467wmm.48.1657547894086; 
 Mon, 11 Jul 2022 06:58:14 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 q123-20020a1c4381000000b00397402ae674sm7595596wma.11.2022.07.11.06.58.13
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jul 2022 06:58:13 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 26/45] target/arm: Implement FMOPA, FMOPS (widening)
Date: Mon, 11 Jul 2022 14:57:31 +0100
Message-Id: <20220711135750.765803-27-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220711135750.765803-1-peter.maydell@linaro.org>
References: <20220711135750.765803-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Richard Henderson <richard.henderson@linaro.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220708151540.18136-27-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-sme.h    |  2 ++
 target/arm/sme.decode      |  1 +
 target/arm/sme_helper.c    | 74 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sme.c |  1 +
 4 files changed, 78 insertions(+)

diff --git a/target/arm/helper-sme.h b/target/arm/helper-sme.h
index 1d68fb8c74f..4d5d05db3a0 100644
--- a/target/arm/helper-sme.h
+++ b/target/arm/helper-sme.h
@@ -121,6 +121,8 @@ DEF_HELPER_FLAGS_5(sme_addva_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sme_addha_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sme_addva_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_7(sme_fmopa_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_7(sme_fmopa_s, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_7(sme_fmopa_d, TCG_CALL_NO_RWG,
diff --git a/target/arm/sme.decode b/target/arm/sme.decode
index afd9c0dffda..e8d27fd8a0e 100644
--- a/target/arm/sme.decode
+++ b/target/arm/sme.decode
@@ -75,3 +75,4 @@ FMOPA_s         10000000 100 ..... ... ... ..... . 00 ..        @op_32
 FMOPA_d         10000000 110 ..... ... ... ..... . 0 ...        @op_64
 
 BFMOPA          10000001 100 ..... ... ... ..... . 00 ..        @op_32
+FMOPA_h         10000001 101 ..... ... ... ..... . 00 ..        @op_32
diff --git a/target/arm/sme_helper.c b/target/arm/sme_helper.c
index 690a53eee2d..302f89c30b3 100644
--- a/target/arm/sme_helper.c
+++ b/target/arm/sme_helper.c
@@ -1008,6 +1008,80 @@ static inline uint32_t f16mop_adj_pair(uint32_t pair, uint32_t pg, uint32_t neg)
     return pair;
 }
 
+static float32 f16_dotadd(float32 sum, uint32_t e1, uint32_t e2,
+                          float_status *s_std, float_status *s_odd)
+{
+    float64 e1r = float16_to_float64(e1 & 0xffff, true, s_std);
+    float64 e1c = float16_to_float64(e1 >> 16, true, s_std);
+    float64 e2r = float16_to_float64(e2 & 0xffff, true, s_std);
+    float64 e2c = float16_to_float64(e2 >> 16, true, s_std);
+    float64 t64;
+    float32 t32;
+
+    /*
+     * The ARM pseudocode function FPDot performs both multiplies
+     * and the add with a single rounding operation.  Emulate this
+     * by performing the first multiply in round-to-odd, then doing
+     * the second multiply as fused multiply-add, and rounding to
+     * float32 all in one step.
+     */
+    t64 = float64_mul(e1r, e2r, s_odd);
+    t64 = float64r32_muladd(e1c, e2c, t64, 0, s_std);
+
+    /* This conversion is exact, because we've already rounded. */
+    t32 = float64_to_float32(t64, s_std);
+
+    /* The final accumulation step is not fused. */
+    return float32_add(sum, t32, s_std);
+}
+
+void HELPER(sme_fmopa_h)(void *vza, void *vzn, void *vzm, void *vpn,
+                         void *vpm, void *vst, uint32_t desc)
+{
+    intptr_t row, col, oprsz = simd_maxsz(desc);
+    uint32_t neg = simd_data(desc) * 0x80008000u;
+    uint16_t *pn = vpn, *pm = vpm;
+    float_status fpst_odd, fpst_std;
+
+    /*
+     * Make a copy of float_status because this operation does not
+     * update the cumulative fp exception status.  It also produces
+     * default nans.  Make a second copy with round-to-odd -- see above.
+     */
+    fpst_std = *(float_status *)vst;
+    set_default_nan_mode(true, &fpst_std);
+    fpst_odd = fpst_std;
+    set_float_rounding_mode(float_round_to_odd, &fpst_odd);
+
+    for (row = 0; row < oprsz; ) {
+        uint16_t prow = pn[H2(row >> 4)];
+        do {
+            void *vza_row = vza + tile_vslice_offset(row);
+            uint32_t n = *(uint32_t *)(vzn + H1_4(row));
+
+            n = f16mop_adj_pair(n, prow, neg);
+
+            for (col = 0; col < oprsz; ) {
+                uint16_t pcol = pm[H2(col >> 4)];
+                do {
+                    if (prow & pcol & 0b0101) {
+                        uint32_t *a = vza_row + H1_4(col);
+                        uint32_t m = *(uint32_t *)(vzm + H1_4(col));
+
+                        m = f16mop_adj_pair(m, pcol, 0);
+                        *a = f16_dotadd(*a, n, m, &fpst_std, &fpst_odd);
+
+                        col += 4;
+                        pcol >>= 4;
+                    }
+                } while (col & 15);
+            }
+            row += 4;
+            prow >>= 4;
+        } while (row & 15);
+    }
+}
+
 void HELPER(sme_bfmopa)(void *vza, void *vzn, void *vzm, void *vpn,
                         void *vpm, uint32_t desc)
 {
diff --git a/target/arm/translate-sme.c b/target/arm/translate-sme.c
index ecb7583c559..c2953b22ce3 100644
--- a/target/arm/translate-sme.c
+++ b/target/arm/translate-sme.c
@@ -355,6 +355,7 @@ static bool do_outprod_fpst(DisasContext *s, arg_op *a, MemOp esz,
     return true;
 }
 
+TRANS_FEAT(FMOPA_h, aa64_sme, do_outprod_fpst, a, MO_32, gen_helper_sme_fmopa_h)
 TRANS_FEAT(FMOPA_s, aa64_sme, do_outprod_fpst, a, MO_32, gen_helper_sme_fmopa_s)
 TRANS_FEAT(FMOPA_d, aa64_sme_f64f64, do_outprod_fpst, a, MO_64, gen_helper_sme_fmopa_d)
 
-- 
2.25.1


