Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA950536760
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 21:14:07 +0200 (CEST)
Received: from localhost ([::1]:54218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nufPS-0007Qp-Pd
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 15:14:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYp-0007lA-V1
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:19:43 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:33373)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYm-0003g5-3u
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:19:43 -0400
Received: by mail-pg1-x534.google.com with SMTP id r71so4626316pgr.0
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SNjPspaVjmF/Q6dYljY5Ro4UYIofrJ0cK2s2o/saVww=;
 b=cfc6pY8ucbUvNBdOuTTJaH8u9sIahCaJKieYJLhh34CxQMbD/HDR65WXLduBSlXHa4
 IOfkaFN40C8LXKSsmBdA4POxcf5WW/edcfUE9WvDkAsGov0Zg3bdUUKYQtWiW4cNEGgJ
 xkvPFuUm+WZM5DCJZLZutLUQycNHXon3JM1LFnGK/ngbMtdE8Oj0wadAbQvxOOF3JSLe
 r0zEC9OEAVdl0iUkRj7O2MpHZhxetQkOWODc8/O7R1H2IFpG+SodEM1GrswPHujF4Lpm
 d7D5T7KyUWdM/RXl3hEFOESUEYYUjFoo787kDT6Kgqk0jR8YJJIAIwmNj5gts9OOYm9T
 iAMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SNjPspaVjmF/Q6dYljY5Ro4UYIofrJ0cK2s2o/saVww=;
 b=WZSSNHJFoGCNzIbfw7y3wQwQi63OEpTR6vs2GsEDdVKIsboVXSFo53IbmJ/j0KyPNn
 iAwb3AXcnHaQHnvY3QWy6HbHEV01jau+JGHIGX8f5CDkzN1Vt0lzUlAPWCpikDckcTEW
 bqAWSJUjxhFyTW+cXmsykKNuZspx2vwbqB/jfsZFgvkKJS0tZApvXvMU8+Hdkv9XKlqo
 TYAMYuHnBhsDxWXEsHJ4Im/ernCJpmhwgLRhMUL3ZImhfmyZA8oiUPdVsi857F0nYXNc
 iLWUrzcPaykw11FkRnJYoLMByEuztIbrbcQ4WfSVXimIhP5dce0CMiXKznSfXyF7mT7e
 0o8g==
X-Gm-Message-State: AOAM532Qj5WMpQdpFtYicrTejFh5Qf03vWiKMYhwhTRYHiqKGyfh9nkS
 gN1KEuvSnsgMY9mAS9kck06vXjCrAhRV5Q==
X-Google-Smtp-Source: ABdhPJyiANCjRFYDVVj3vm+ug1GQogQwtK3hsuuZ1F0JMpQrFuiUxuxIMFchRT1Cd/L8FdlZjEjAug==
X-Received: by 2002:a63:2107:0:b0:3fb:ac79:50ed with SMTP id
 h7-20020a632107000000b003fbac7950edmr3483186pgh.105.1653675578851; 
 Fri, 27 May 2022 11:19:38 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a17090ae50500b001deb3cbd8f1sm1911612pjy.27.2022.05.27.11.19.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:19:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 032/114] target/arm: More use of gen_gvec_fn_arg_zzz
Date: Fri, 27 May 2022 11:17:45 -0700
Message-Id: <20220527181907.189259-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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

Two uses of gen_gvec_fn_zzz can pass on arg_rrr_esz instead.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 1b3afcc24c..2dbf296128 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6425,7 +6425,7 @@ static bool trans_MUL_zzz(DisasContext *s, arg_rrr_esz *a)
     if (!dc_isar_feature(aa64_sve2, s)) {
         return false;
     }
-    return gen_gvec_fn_zzz(s, tcg_gen_gvec_mul, a->esz, a->rd, a->rn, a->rm);
+    return gen_gvec_fn_arg_zzz(s, tcg_gen_gvec_mul, a);
 }
 
 static gen_helper_gvec_3 * const smulh_zzz_fns[4] = {
@@ -6946,7 +6946,7 @@ static bool do_sve2_fn_zzz(DisasContext *s, arg_rrr_esz *a, GVecGen3Fn *fn)
     if (!dc_isar_feature(aa64_sve2, s)) {
         return false;
     }
-    return gen_gvec_fn_zzz(s, fn, a->esz, a->rd, a->rn, a->rm);
+    return gen_gvec_fn_arg_zzz(s, fn, a);
 }
 
 static bool trans_SABA(DisasContext *s, arg_rrr_esz *a)
-- 
2.34.1


