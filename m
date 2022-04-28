Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5617E513749
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 16:49:43 +0200 (CEST)
Received: from localhost ([::1]:60226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk5Sg-0003ZZ-CF
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 10:49:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5JO-00050V-5q
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:07 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:40499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5JM-00063V-F0
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:05 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 v64-20020a1cac43000000b0038cfd1b3a6dso5405160wme.5
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 07:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=yb+iuq8ARbvLTMWVY5FiuT21nEEV2wmzA7WlkC92EOM=;
 b=DXOdPuEDnSGqth8/sSyxBmfJq/SVLOlSJzHYkOEcXk0k5jhoB1dNhvUNfps3WY3Tb4
 FWzQWt8arLaz5Qeu/VpxeUZgReohZwL2EuO3miV5tZ/4NTuOJ10OHiRR+qYIZP6tFX0H
 UeqcH55+519kYtAVKGYMNgD9p8fVSi8gsF6brGEXUCZavMVooxopZKWAsk4pW8ktP+Xl
 rzy809p5QtxQL3GACVWfuIOlOhgO3V4RHTotlgF9lILZtXDu4AEzpSwKP+9tYwoEQHuK
 lZfFkOf5+WxNdyOsWyjr2TWz8mvsLo03jJWWeRzoOHKXlarRdVbUz6yyfjIbFuNphkiH
 PS5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yb+iuq8ARbvLTMWVY5FiuT21nEEV2wmzA7WlkC92EOM=;
 b=FU4BpxM2KtbNLp2QqR5Nc5D+HTKcSrJHi/P/p5mNFEVsTJo0x1rtv4NZMdXid7F/bS
 3vYV5kg3+RrzOVM3LD2S0H/fBx1CTrxtskbZgl3BEmJLpqxwY6sazUMatpPl0U8xE3MR
 GhICtA9OfTVNfIUn37H5nYrqTAC7eUg8/n46qmT5i/wyGO0N7tJ3dRgX1UBzittJj++n
 sKJD3zFLi2KifQBHN2pN5t3h/z97XAntqKOwT3am1h3wSMDgiXiPJXTGVGQTM4eMPZS/
 ZrQpH6PWpOKqBMOSE1JWRiz8zFxGPeLZSsvO6RqT4BNEAp+5FWPR2wbEXOncQkKeDKQd
 DR5Q==
X-Gm-Message-State: AOAM532VVayxNj+ETpu2lrNgONV5NdVn2GIB0soLVHwwotskKkzz03GV
 r7KpRGlVMrv4yYdr5CmbqaRenV7OnllPuw==
X-Google-Smtp-Source: ABdhPJw7/kaCXJNqKk6nbQUWN8e6n6TQtfmlCZWPnpJe4XDf8a3YwgrgliOLl6ewd7PYMfKIiN4FEA==
X-Received: by 2002:a05:600c:1993:b0:392:90f1:66ec with SMTP id
 t19-20020a05600c199300b0039290f166ecmr31426925wmq.146.1651156802282; 
 Thu, 28 Apr 2022 07:40:02 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bh26-20020a05600c3d1a00b003928db85759sm130221wmb.15.2022.04.28.07.40.01
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 07:40:01 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/54] target/arm: Use tcg_constant in gen_probe_access
Date: Thu, 28 Apr 2022 15:39:05 +0100
Message-Id: <20220428143958.2451229-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220428143958.2451229-1-peter.maydell@linaro.org>
References: <20220428143958.2451229-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20220426163043.100432-2-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-a64.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index adbcd999415..c6ab0433af1 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -240,14 +240,10 @@ static void gen_address_with_allocation_tag0(TCGv_i64 dst, TCGv_i64 src)
 static void gen_probe_access(DisasContext *s, TCGv_i64 ptr,
                              MMUAccessType acc, int log2_size)
 {
-    TCGv_i32 t_acc = tcg_const_i32(acc);
-    TCGv_i32 t_idx = tcg_const_i32(get_mem_index(s));
-    TCGv_i32 t_size = tcg_const_i32(1 << log2_size);
-
-    gen_helper_probe_access(cpu_env, ptr, t_acc, t_idx, t_size);
-    tcg_temp_free_i32(t_acc);
-    tcg_temp_free_i32(t_idx);
-    tcg_temp_free_i32(t_size);
+    gen_helper_probe_access(cpu_env, ptr,
+                            tcg_constant_i32(acc),
+                            tcg_constant_i32(get_mem_index(s)),
+                            tcg_constant_i32(1 << log2_size));
 }
 
 /*
-- 
2.25.1


