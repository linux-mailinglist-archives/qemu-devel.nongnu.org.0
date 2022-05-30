Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BAD2538619
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 18:25:51 +0200 (CEST)
Received: from localhost ([::1]:48490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nviDG-0002mJ-98
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 12:25:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvS-0002qc-FE
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:26 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:51161)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvQ-0007Dx-P4
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:26 -0400
Received: by mail-wm1-x329.google.com with SMTP id o9so6671204wmd.0
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=7AqONkXRndtLTY/Cz7hw6z5A8ywsRInfoZHs3HnpjSk=;
 b=RnL12axAgdgeF8rg3cKmJc3PtqtB6EzbNEkpnK9a6yD8mDDG+kvGgM52SF6mGU7xem
 ZjS/kfvuLgwLm6zOn1dvNHYmI2CbYVySXg7m6K3hXWDRmYNduQUS1Xi0rvbWuF9Ntw6N
 ljq++eJZf6Erstq6wCST+bj1G77bz9hvrsi32GU447nhTvYeqo8elhlcIgouvRKIUE83
 SqZF8poSWiJw6GknrwqQCgmkmWPXkHeDv9KGY9tryLhBNmAPhWR8yL60fTab/qyXP/x9
 nOzEGd7uKL+Ur8TnghqnV+P26oraZ3NLTqAATQRYfC21ClcejorO+Tay2OgtLUVaYWRj
 VK6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7AqONkXRndtLTY/Cz7hw6z5A8ywsRInfoZHs3HnpjSk=;
 b=T6M2mU+M23ZUVa9n3sQ1pMQWPmB+FUHZRH8bbHhC7t3kkPqkKadlaIrE0P5/wAfTDf
 rgQ5bPrctn8Ds7f1YGmrRgKFKnZYXz26z1jlCsPpUp4JuWg74XVQeFY6AAErcxCXdPN8
 0E9DDZcIQ+1KgFRNN28Jf062C5IzApuJLb5bQOB09eMR3IbyFIYNpNpOyWo0LpUPBePA
 2tUaYzG37y3vjm0SNG1mj+NoPYoa2k67hH+LGCfm9AKMDF8MpYMv3pi4rvkJ+Z+6Ns5L
 19xKOp/86mRl3u8pH+E1xATUXplXBE6Aq6XySmUz5z7f/NKcIo39QqJr+6fNAvda1OLR
 M8vA==
X-Gm-Message-State: AOAM533i99CiskaVYdAlUsKCoto0v2aFmvL9q06x2dzjKI88wIn8oWQp
 s1snJaQP0om2CUS8gGAZKtNN0699y5DkHA==
X-Google-Smtp-Source: ABdhPJwukSP7KFCg2UBKTr0TUnA1fEfZ8aVLTEe4Ty/KIrTgGkQ9jNBXVZoZpJio3B09r840o1/k0w==
X-Received: by 2002:a05:600c:4fd2:b0:39b:893e:ff79 with SMTP id
 o18-20020a05600c4fd200b0039b893eff79mr7178734wmq.73.1653926843287; 
 Mon, 30 May 2022 09:07:23 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.07.22
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:07:22 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 016/117] target/arm: Rename do_zzxz_ool to gen_gvec_ool_arg_zzxz
Date: Mon, 30 May 2022 17:05:27 +0100
Message-Id: <20220530160708.726466-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220530160708.726466-1-peter.maydell@linaro.org>
References: <20220530160708.726466-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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

Rename the function to match gen_gvec_ool_arg_zzzz,
and move to be adjacent.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220527181907.189259-14-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index f7367a4f62c..b42df76c697 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -199,6 +199,12 @@ static bool gen_gvec_ool_arg_zzzz(DisasContext *s, gen_helper_gvec_4 *fn,
     return gen_gvec_ool_zzzz(s, fn, a->rd, a->rn, a->rm, a->ra, data);
 }
 
+static bool gen_gvec_ool_arg_zzxz(DisasContext *s, gen_helper_gvec_4 *fn,
+                                  arg_rrxr_esz *a)
+{
+    return gen_gvec_ool_zzzz(s, fn, a->rd, a->rn, a->rm, a->ra, a->index);
+}
+
 /* Invoke an out-of-line helper on 2 Zregs and a predicate. */
 static void gen_gvec_ool_zzp(DisasContext *s, gen_helper_gvec_3 *fn,
                              int rd, int rn, int pg, int data)
@@ -3820,15 +3826,9 @@ TRANS_FEAT(DOT_zzzz, aa64_sve, gen_gvec_ool_zzzz,
  * SVE Multiply - Indexed
  */
 
-static bool do_zzxz_ool(DisasContext *s, arg_rrxr_esz *a,
-                        gen_helper_gvec_4 *fn)
-{
-    return gen_gvec_ool_zzzz(s, fn, a->rd, a->rn, a->rm, a->ra, a->index);
-}
-
 #define DO_RRXR(NAME, FUNC) \
     static bool NAME(DisasContext *s, arg_rrxr_esz *a)  \
-    { return do_zzxz_ool(s, a, FUNC); }
+    { return gen_gvec_ool_arg_zzxz(s, FUNC, a); }
 
 DO_RRXR(trans_SDOT_zzxw_s, gen_helper_gvec_sdot_idx_b)
 DO_RRXR(trans_SDOT_zzxw_d, gen_helper_gvec_sdot_idx_h)
@@ -3840,7 +3840,7 @@ static bool trans_SUDOT_zzxw_s(DisasContext *s, arg_rrxr_esz *a)
     if (!dc_isar_feature(aa64_sve_i8mm, s)) {
         return false;
     }
-    return do_zzxz_ool(s, a, gen_helper_gvec_sudot_idx_b);
+    return gen_gvec_ool_arg_zzxz(s, gen_helper_gvec_sudot_idx_b, a);
 }
 
 static bool trans_USDOT_zzxw_s(DisasContext *s, arg_rrxr_esz *a)
@@ -3848,7 +3848,7 @@ static bool trans_USDOT_zzxw_s(DisasContext *s, arg_rrxr_esz *a)
     if (!dc_isar_feature(aa64_sve_i8mm, s)) {
         return false;
     }
-    return do_zzxz_ool(s, a, gen_helper_gvec_usdot_idx_b);
+    return gen_gvec_ool_arg_zzxz(s, gen_helper_gvec_usdot_idx_b, a);
 }
 
 #undef DO_RRXR
-- 
2.25.1


