Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 975F8570526
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 16:14:52 +0200 (CEST)
Received: from localhost ([::1]:45822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAuBX-00051C-IX
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 10:14:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oAtvW-0006aC-ID
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 09:58:19 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:36545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oAtvT-0002ri-J1
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 09:58:18 -0400
Received: by mail-wr1-x429.google.com with SMTP id o4so7143027wrh.3
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 06:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=JqTdKTDdhhvQtZZBygtrOEZ/plp0svP5Se/zJYrh/p8=;
 b=oGzAxBqlp+PfV1WkV+Lxl0Zc9usZ34rz+JWUZOABf472hmZf5GfiDWvbTT0cYF7TAt
 zz9na2cRDkZrJ0UXFMJmKZnHXJHg2Er5zj8kJ4bsnM78u6dEzsBvYEkVGmcmTC9Usklk
 j3aroRfgXeJiKGT8wXy0TcIEQ52FJTU2lOfnFQECoVJ21tUTEi65O7aIWYUQ9kNlJ6qr
 /DQdNWTCMvdGs2h4HDBg1ubuZBVkJ6q7Z/Y7S+Szcy31OrXJsChX/03fFPUgXOelsEx2
 byyWpHhH/H1KclCp6IZ5HFypwiiaeW55RWSPMDEL1IKpII4lLupy28MUheYndns2ETN7
 K2/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JqTdKTDdhhvQtZZBygtrOEZ/plp0svP5Se/zJYrh/p8=;
 b=vlY/6LVq7So1v0O/9jUyZ4nBOYXVjhT9cbXF4ZkW1kwQtl995LOXJAi5rtYpg0bzA3
 yrc5TG+67DrXU6zZcCe01VWeeuOfAsvQlJu7aMsxu8l40YxAw6wCHbVW+7ueriRrx4sK
 +WYd9kzDcGD8nz/vcfw6NdFSZtTrv/Ww4LYkL2PJHPSs8k3KfANafbTBaQNsmtbfYNYR
 nw9mv8jbhsdLYo0cr+h4Rs5iqImUmCWCMWtwFv9UiZD4pl7qTIu75EmF5tyv/2Uy7bWt
 aosueef5pA11vXUdhgwaBWXSx/QWdvtNpw9EYpcHVlDUgWjwxwFZYZvjNHOR+Q9tdAH2
 zOZQ==
X-Gm-Message-State: AJIora/an1Gq7tq2YU24pkNUOIM7/lgqtRg6aV4d07f4pFAV2zmoBcqa
 qVHlx3KpRfDB6fCZhQ03Y4D08cE3Bdnc/Q==
X-Google-Smtp-Source: AGRyM1sgbKr8/yOTHhVGBnu1y+gh/meuozpEq6dxwfaBGFoF4AOcs8oLS34Q+KMUZ3ZTDzetcOidXQ==
X-Received: by 2002:adf:b613:0:b0:21d:6da6:d541 with SMTP id
 f19-20020adfb613000000b0021d6da6d541mr16666040wre.485.1657547893284; 
 Mon, 11 Jul 2022 06:58:13 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 q123-20020a1c4381000000b00397402ae674sm7595596wma.11.2022.07.11.06.58.12
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jul 2022 06:58:12 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 25/45] target/arm: Implement BFMOPA, BFMOPS
Date: Mon, 11 Jul 2022 14:57:30 +0100
Message-Id: <20220711135750.765803-26-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220711135750.765803-1-peter.maydell@linaro.org>
References: <20220711135750.765803-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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
Message-id: 20220708151540.18136-26-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-sme.h    |  2 ++
 target/arm/sme.decode      |  2 ++
 target/arm/sme_helper.c    | 56 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sme.c | 30 ++++++++++++++++++++
 4 files changed, 90 insertions(+)

diff --git a/target/arm/helper-sme.h b/target/arm/helper-sme.h
index f50d0fe1d62..1d68fb8c74f 100644
--- a/target/arm/helper-sme.h
+++ b/target/arm/helper-sme.h
@@ -125,3 +125,5 @@ DEF_HELPER_FLAGS_7(sme_fmopa_s, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_7(sme_fmopa_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sme_bfmopa, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sme.decode b/target/arm/sme.decode
index ba4774d1746..afd9c0dffda 100644
--- a/target/arm/sme.decode
+++ b/target/arm/sme.decode
@@ -73,3 +73,5 @@ ADDVA_d         11000000 11 01000 1 ... ... ..... 00 ...        @adda_64
 
 FMOPA_s         10000000 100 ..... ... ... ..... . 00 ..        @op_32
 FMOPA_d         10000000 110 ..... ... ... ..... . 0 ...        @op_64
+
+BFMOPA          10000001 100 ..... ... ... ..... . 00 ..        @op_32
diff --git a/target/arm/sme_helper.c b/target/arm/sme_helper.c
index 7dc76b6a1c3..690a53eee2d 100644
--- a/target/arm/sme_helper.c
+++ b/target/arm/sme_helper.c
@@ -987,3 +987,59 @@ void HELPER(sme_fmopa_d)(void *vza, void *vzn, void *vzm, void *vpn,
         }
     }
 }
+
+/*
+ * Alter PAIR as needed for controlling predicates being false,
+ * and for NEG on an enabled row element.
+ */
+static inline uint32_t f16mop_adj_pair(uint32_t pair, uint32_t pg, uint32_t neg)
+{
+    /*
+     * The pseudocode uses a conditional negate after the conditional zero.
+     * It is simpler here to unconditionally negate before conditional zero.
+     */
+    pair ^= neg;
+    if (!(pg & 1)) {
+        pair &= 0xffff0000u;
+    }
+    if (!(pg & 4)) {
+        pair &= 0x0000ffffu;
+    }
+    return pair;
+}
+
+void HELPER(sme_bfmopa)(void *vza, void *vzn, void *vzm, void *vpn,
+                        void *vpm, uint32_t desc)
+{
+    intptr_t row, col, oprsz = simd_maxsz(desc);
+    uint32_t neg = simd_data(desc) * 0x80008000u;
+    uint16_t *pn = vpn, *pm = vpm;
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
+                        *a = bfdotadd(*a, n, m);
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
diff --git a/target/arm/translate-sme.c b/target/arm/translate-sme.c
index fa8f343a7d6..ecb7583c559 100644
--- a/target/arm/translate-sme.c
+++ b/target/arm/translate-sme.c
@@ -299,6 +299,33 @@ TRANS_FEAT(ADDVA_s, aa64_sme, do_adda, a, MO_32, gen_helper_sme_addva_s)
 TRANS_FEAT(ADDHA_d, aa64_sme_i16i64, do_adda, a, MO_64, gen_helper_sme_addha_d)
 TRANS_FEAT(ADDVA_d, aa64_sme_i16i64, do_adda, a, MO_64, gen_helper_sme_addva_d)
 
+static bool do_outprod(DisasContext *s, arg_op *a, MemOp esz,
+                       gen_helper_gvec_5 *fn)
+{
+    int svl = streaming_vec_reg_size(s);
+    uint32_t desc = simd_desc(svl, svl, a->sub);
+    TCGv_ptr za, zn, zm, pn, pm;
+
+    if (!sme_smza_enabled_check(s)) {
+        return true;
+    }
+
+    /* Sum XZR+zad to find ZAd. */
+    za = get_tile_rowcol(s, esz, 31, a->zad, false);
+    zn = vec_full_reg_ptr(s, a->zn);
+    zm = vec_full_reg_ptr(s, a->zm);
+    pn = pred_full_reg_ptr(s, a->pn);
+    pm = pred_full_reg_ptr(s, a->pm);
+
+    fn(za, zn, zm, pn, pm, tcg_constant_i32(desc));
+
+    tcg_temp_free_ptr(za);
+    tcg_temp_free_ptr(zn);
+    tcg_temp_free_ptr(pn);
+    tcg_temp_free_ptr(pm);
+    return true;
+}
+
 static bool do_outprod_fpst(DisasContext *s, arg_op *a, MemOp esz,
                             gen_helper_gvec_5_ptr *fn)
 {
@@ -330,3 +357,6 @@ static bool do_outprod_fpst(DisasContext *s, arg_op *a, MemOp esz,
 
 TRANS_FEAT(FMOPA_s, aa64_sme, do_outprod_fpst, a, MO_32, gen_helper_sme_fmopa_s)
 TRANS_FEAT(FMOPA_d, aa64_sme_f64f64, do_outprod_fpst, a, MO_64, gen_helper_sme_fmopa_d)
+
+/* TODO: FEAT_EBF16 */
+TRANS_FEAT(BFMOPA, aa64_sme, do_outprod, a, MO_32, gen_helper_sme_bfmopa)
-- 
2.25.1


