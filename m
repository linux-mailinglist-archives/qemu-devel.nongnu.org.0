Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F235538693
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 19:08:35 +0200 (CEST)
Received: from localhost ([::1]:60726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvisc-0003JQ-Pl
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 13:08:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhwK-0003rI-47
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:08:26 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:43844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhwI-0007Mz-2P
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:08:19 -0400
Received: by mail-wr1-x433.google.com with SMTP id s24so7959084wrb.10
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=jX1VY9irDKukPw2ECyFXaYeY/8d01HGtejc7usmp6pQ=;
 b=g51UPmF8j8ul83kQrNHNfiW5w+PaDj4DFD6AHafvA7sQvUyinFCAjjeSnNNuQCrFSL
 oXyXS1oAKaIAzj1ahnnjkxg08OaRnxgDdz9K3vRc4diRj0FPNMv5YpuYdqt5uiAgMiLK
 8zPBcgtEbhiiZ3aWHf0I+wUnqGCHqPlCtsLfTBUqtKodfI/SBRrG8V2E7gZz1pIxNNk/
 xyFcIkns8tcHsKiHIZvrWWqVGkYmNusmtN0l1gA0FGbKOG2IqLV/r68EzvUIJ3tQXaap
 x5gR+GL62IldrBpzlwJ475wwj/83vzYGnUdGKspEfLWfMpCuPlma+dQOR4eaOlxHLtM6
 Fkow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jX1VY9irDKukPw2ECyFXaYeY/8d01HGtejc7usmp6pQ=;
 b=ZC3iU5EryjSWnREvJJxYQhnf6ya4snE5ErIUG8JJjCiivEXhzNqYkVa+UpuQQplS1y
 ZHjx/W9nC65dt/4yl+arNqtJ6jnCxAagDtxbnHHzGvzDsgKVzuVRyuTr4lK/XKcKxecp
 qL3XpC5JASix9GZNp+jHM43YDMzp00s7t9Gt16fYVjF4LmwIvoDnSN4MuKLByMDyVcnD
 M8fCib9kHYiI1CXrM5m8M/krwEEMpLopygRq0HJ5la34pqNi5j9ujnqob1Gea3AbMAyt
 Cw4Zq0bQwBlUz1+J4hPKKpGZ4w4fPbcKzfjlEhuPq5yG1iemjXTsCSgUVZlr36xZOc1s
 V/8Q==
X-Gm-Message-State: AOAM533f4NXkYMN3US7foznrWU6QneueyCwfS2Lek0iwYQfmJFiZc9oD
 298mxI6W0vhkt6B8yx7dNQYtIrXJ+YAjew==
X-Google-Smtp-Source: ABdhPJwr8zDTdDkUN0e561l2Oktu/5DOGmKQmN1ybxEBFXdAkbVBcmayVX1x48xwHMk6ks4Ye/ADrg==
X-Received: by 2002:a5d:6c66:0:b0:20f:86f3:ea05 with SMTP id
 r6-20020a5d6c66000000b0020f86f3ea05mr40694488wrz.154.1653926895434; 
 Mon, 30 May 2022 09:08:15 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.08.14
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:08:15 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 069/117] target/arm: Use TRANS_FEAT for do_ppzz_flags
Date: Mon, 30 May 2022 17:06:20 +0100
Message-Id: <20220530160708.726466-70-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220530160708.726466-1-peter.maydell@linaro.org>
References: <20220530160708.726466-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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
Message-id: 20220527181907.189259-67-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 28 ++++++++++++----------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 8eb70fd56f3..73b5b67c250 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2708,14 +2708,12 @@ static bool do_ppzz_flags(DisasContext *s, arg_rprr_esz *a,
 }
 
 #define DO_PPZZ(NAME, name) \
-static bool trans_##NAME##_ppzz(DisasContext *s, arg_rprr_esz *a)         \
-{                                                                         \
-    static gen_helper_gvec_flags_4 * const fns[4] = {                     \
-        gen_helper_sve_##name##_ppzz_b, gen_helper_sve_##name##_ppzz_h,   \
-        gen_helper_sve_##name##_ppzz_s, gen_helper_sve_##name##_ppzz_d,   \
-    };                                                                    \
-    return do_ppzz_flags(s, a, fns[a->esz]);                              \
-}
+    static gen_helper_gvec_flags_4 * const name##_ppzz_fns[4] = {       \
+        gen_helper_sve_##name##_ppzz_b, gen_helper_sve_##name##_ppzz_h, \
+        gen_helper_sve_##name##_ppzz_s, gen_helper_sve_##name##_ppzz_d, \
+    };                                                                  \
+    TRANS_FEAT(NAME##_ppzz, aa64_sve, do_ppzz_flags,                    \
+               a, name##_ppzz_fns[a->esz])
 
 DO_PPZZ(CMPEQ, cmpeq)
 DO_PPZZ(CMPNE, cmpne)
@@ -2727,14 +2725,12 @@ DO_PPZZ(CMPHS, cmphs)
 #undef DO_PPZZ
 
 #define DO_PPZW(NAME, name) \
-static bool trans_##NAME##_ppzw(DisasContext *s, arg_rprr_esz *a)         \
-{                                                                         \
-    static gen_helper_gvec_flags_4 * const fns[4] = {                     \
-        gen_helper_sve_##name##_ppzw_b, gen_helper_sve_##name##_ppzw_h,   \
-        gen_helper_sve_##name##_ppzw_s, NULL                              \
-    };                                                                    \
-    return do_ppzz_flags(s, a, fns[a->esz]);                              \
-}
+    static gen_helper_gvec_flags_4 * const name##_ppzw_fns[4] = {       \
+        gen_helper_sve_##name##_ppzw_b, gen_helper_sve_##name##_ppzw_h, \
+        gen_helper_sve_##name##_ppzw_s, NULL                            \
+    };                                                                  \
+    TRANS_FEAT(NAME##_ppzw, aa64_sve, do_ppzz_flags,                    \
+               a, name##_ppzw_fns[a->esz])
 
 DO_PPZW(CMPEQ, cmpeq)
 DO_PPZW(CMPNE, cmpne)
-- 
2.25.1


