Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9EF5386B6
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 19:22:13 +0200 (CEST)
Received: from localhost ([::1]:38588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvj5o-0002Js-R8
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 13:22:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvx-0003fY-83
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:57 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:35640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvs-0007KA-8q
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:56 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 c5-20020a1c3505000000b0038e37907b5bso8727882wma.0
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=fVKZfwcoeJPyXn1w5X+7uQCN+3aL75LkdQVHhPvOLoM=;
 b=niqIJi/9U1cu6KXKuP/xPx+xrfqgAbdBFvdAotJJ8zh54VmcRpIk34887D/8MJM78C
 5kshkY5VBXJHOeKKGaAqKp8m1acWhKuOZSN/BN0Vfok9EO9j2fv4peIy11APJDlnBb0T
 e4MYqHqAFkT3ofF+mMlXt4VY+EVE6UdYjN/+A+U8b9quGJEqJiy4aL/XI4FlZxKRvKLJ
 qy5ofwzuoaoDrbwouaGe4uR7AURLYWQ0yxbwZgpgM+xpMsyq2qs75DfhzMKELGewwPTk
 Aiv2O1gsU3ZDhJo5xZl3GkKserWiMuz66Qtc/B1cv06HcVuC91JoQbTcsm4uXmSgfnSn
 +xSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fVKZfwcoeJPyXn1w5X+7uQCN+3aL75LkdQVHhPvOLoM=;
 b=NpOMuEfgRE2Z9DvQLEu0V7tVHeN+3qa2I7AWWTbtGKbWtUU5aXcoa4bXR2e1OryMPZ
 OnKyIHgbK/E5l4alIZrIIU/rR8+PUHPxL6ATQPwSRVP5Wn++7JYxqk8mxMIQ1ak2eEvI
 dR4EPKUKwIloxQgHMvfpiJRKAfhVDxA0i630sdGIxqXcHF6kmy9Un4cqc5O6bXQraU1o
 VBPfr9x9EmZ+mZa34uHWu9DBE4n3UHUQ0489rfg1VKospnN19PEyP3UwwA4DyLHlS/zF
 XOxwEBc9rwGIaouumVnhcsLX1QpIusBrqDo6SDT6NtbFnF8qIwZrtAqT23iGN2DS9PxB
 NLcQ==
X-Gm-Message-State: AOAM53324AgnKkBC/2Ubj+L4RHyToCjNK+CKWq0WVi5Skg7FrH0ENlL1
 yXe28ccMV2EU+Qx/fka0mkMfQJjjsf24Fg==
X-Google-Smtp-Source: ABdhPJxhb78stg2VnMslJ3wHaG8EsPzr5Eszr9Vm+TumBh46btlYA+hp0JpdXJEpz1JlszchGWU35g==
X-Received: by 2002:a05:600c:3d10:b0:397:835e:bf64 with SMTP id
 bh16-20020a05600c3d1000b00397835ebf64mr18209279wmb.167.1653926869953; 
 Mon, 30 May 2022 09:07:49 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.07.49
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:07:49 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 050/117] target/arm: Use TRANS_FEAT for do_zpzzz_ool
Date: Mon, 30 May 2022 17:06:01 +0100
Message-Id: <20220530160708.726466-51-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220530160708.726466-1-peter.maydell@linaro.org>
References: <20220530160708.726466-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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

Remove the DO_ZPZZZ macro, as it had just the two uses.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220527181907.189259-48-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 98f9cfa86c9..52bbd1a4faa 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -1071,20 +1071,17 @@ static bool do_zpzzz_ool(DisasContext *s, arg_rprrr_esz *a,
     return true;
 }
 
-#define DO_ZPZZZ(NAME, name) \
-static bool trans_##NAME(DisasContext *s, arg_rprrr_esz *a)          \
-{                                                                    \
-    static gen_helper_gvec_5 * const fns[4] = {                      \
-        gen_helper_sve_##name##_b, gen_helper_sve_##name##_h,        \
-        gen_helper_sve_##name##_s, gen_helper_sve_##name##_d,        \
-    };                                                               \
-    return do_zpzzz_ool(s, a, fns[a->esz]);                          \
-}
+static gen_helper_gvec_5 * const mla_fns[4] = {
+    gen_helper_sve_mla_b, gen_helper_sve_mla_h,
+    gen_helper_sve_mla_s, gen_helper_sve_mla_d,
+};
+TRANS_FEAT(MLA, aa64_sve, do_zpzzz_ool, a, mla_fns[a->esz])
 
-DO_ZPZZZ(MLA, mla)
-DO_ZPZZZ(MLS, mls)
-
-#undef DO_ZPZZZ
+static gen_helper_gvec_5 * const mls_fns[4] = {
+    gen_helper_sve_mls_b, gen_helper_sve_mls_h,
+    gen_helper_sve_mls_s, gen_helper_sve_mls_d,
+};
+TRANS_FEAT(MLS, aa64_sve, do_zpzzz_ool, a, mls_fns[a->esz])
 
 /*
  *** SVE Index Generation Group
-- 
2.25.1


