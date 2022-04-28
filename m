Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A6251376C
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 16:53:33 +0200 (CEST)
Received: from localhost ([::1]:40656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk5WO-0001Eu-IM
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 10:53:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5JP-00050d-4L
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:07 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:34634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5JN-0006Bm-Ej
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:06 -0400
Received: by mail-wr1-x433.google.com with SMTP id q23so7096306wra.1
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 07:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=69T5o0Z+GUrRns8GQ4srHGCFM7q9mGRAvjMg8W0UQoU=;
 b=nmFbmiVY8I47M4PUYaH3PjondOrTJOMFLGjnL6vomxW9SuIRUozXGouxmgJ6TDxySN
 tnZa1JuUWITpFvvM6HjzBnwwtNcshdb9O7YuRZa9SvF86Y9KgFfcJIVr+7KCTBgwAkhD
 dWIvJuQlmjMSQCC0wb+SmF8URzv4KoR7gGfeGAOm0jvGWDZpKWTyI349N3G9A/KnW8qd
 oyp+hG18ozZeUKySFWDmYk2UJ9ZCXdZGsey4JU2NqQD07Yxq1U+WJwNHsLXtRYSRLslJ
 oK+Se+eS7YLDfRmielRnE1mE5s40n+YI+0LznmTCfABcKk11W7/VsjB6MlfrIcjZacl6
 9gzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=69T5o0Z+GUrRns8GQ4srHGCFM7q9mGRAvjMg8W0UQoU=;
 b=D0R2xThkR7lopEwpMpO07OgVDwd9VLmyFSU9uh/fcCcEieKIXI/hZGyrm1QSM6LdoF
 4e3bbBw8LQ6v/gy9OzdjEHcAFxF2T7vvPpMgy5YHNP34HP5vXwGS3PO4ivqMrOjTSPFA
 euMtng7s2fS1/Stj398FSceqRkL+4sBwH6OWVasNJWgVtHfdn0KSWDgqcoJ6uvSS23h5
 iK0/h9sooGjj0HSTq1UOt3bqSbS+rZAsnCRysLD6g6Xo3l6TfS2vKKRdnjdJMWVYTBCf
 o6Cw8EIqivNddD0rZgQB29f8EMI0EVQsKy1JVBD1FOHBPKzkcRtkYKtcWQnkbKBojLMT
 0npA==
X-Gm-Message-State: AOAM532uSAUhdVD7L6Gsi1u7kOSN+c6jqpLKkK1EXqC1cNjKyoSi4LNr
 E1JweClZ7QRRLjl0Nvjdmin/w54k6ab/uw==
X-Google-Smtp-Source: ABdhPJwrzyQV4wn+l4+wWAMhwpyt/1omfS5nLE/nace3h1nAUu4QuN6rjlge4O6hlP6JutgcZ1iBRg==
X-Received: by 2002:a05:6000:1369:b0:20a:c68b:7275 with SMTP id
 q9-20020a056000136900b0020ac68b7275mr27590697wrz.158.1651156803931; 
 Thu, 28 Apr 2022 07:40:03 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bh26-20020a05600c3d1a00b003928db85759sm130221wmb.15.2022.04.28.07.40.03
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 07:40:03 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/54] target/arm: Use tcg_constant in gen_exception*
Date: Thu, 28 Apr 2022 15:39:07 +0100
Message-Id: <20220428143958.2451229-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220428143958.2451229-1-peter.maydell@linaro.org>
References: <20220428143958.2451229-1-peter.maydell@linaro.org>
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
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20220426163043.100432-4-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-a64.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 7b5bfb08893..b0b5e8b26d2 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -338,11 +338,8 @@ static void gen_rebuild_hflags(DisasContext *s)
 
 static void gen_exception_internal(int excp)
 {
-    TCGv_i32 tcg_excp = tcg_const_i32(excp);
-
     assert(excp_is_internal(excp));
-    gen_helper_exception_internal(cpu_env, tcg_excp);
-    tcg_temp_free_i32(tcg_excp);
+    gen_helper_exception_internal(cpu_env, tcg_constant_i32(excp));
 }
 
 static void gen_exception_internal_insn(DisasContext *s, uint64_t pc, int excp)
@@ -354,12 +351,8 @@ static void gen_exception_internal_insn(DisasContext *s, uint64_t pc, int excp)
 
 static void gen_exception_bkpt_insn(DisasContext *s, uint32_t syndrome)
 {
-    TCGv_i32 tcg_syn;
-
     gen_a64_set_pc_im(s->pc_curr);
-    tcg_syn = tcg_const_i32(syndrome);
-    gen_helper_exception_bkpt_insn(cpu_env, tcg_syn);
-    tcg_temp_free_i32(tcg_syn);
+    gen_helper_exception_bkpt_insn(cpu_env, tcg_constant_i32(syndrome));
     s->base.is_jmp = DISAS_NORETURN;
 }
 
-- 
2.25.1


