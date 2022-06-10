Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F004546A21
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 18:11:07 +0200 (CEST)
Received: from localhost ([::1]:57442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzhE1-0002kJ-2Y
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 12:11:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzhAx-0007Y7-FA
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 12:07:55 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:34766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzhAu-0007Fm-Ne
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 12:07:55 -0400
Received: by mail-wr1-x431.google.com with SMTP id c21so4035326wrb.1
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 09:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=sLa9foGRUVfBEBIuN7MaUwzgF2mANkypetSmb2ZTkzU=;
 b=EFEZT9ZPrNEdS6WRF2HQ0Espp0UJLoUS+oQv8PBAT1R0oqJms6VgF+ghjLU3tuMnMq
 uvKkmoZk/Ed7tTQHx2l8Nj3liXmOcSfESVO6vwXZNtWGS3vVLMhD8Lf+nGdfjOzjLznf
 edWd4lVCt73hqGJYrWiqPiJlayuQ8IyQlG+VtI6bJi0JlObaKKMGCqCRmcCbvPqXhtVW
 XWQ+OwppVHdsuEhb+16lq+XTedjecxaw0DgEkQidFqn766lRgEi+in3KeWz3R+wIPDV8
 HXhCSNoUt9HJCsNUY6i1SlaVB3J7ak2QTeEnEa4w+fQqKfl/z2e0WXb9adVZWUAvNU1S
 E0gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sLa9foGRUVfBEBIuN7MaUwzgF2mANkypetSmb2ZTkzU=;
 b=avrLqKmPjKVlF03ezY2gStbIk+pVEbzLKqMnVWP6NEvAAgz+kHGyzU+ZhxAW32XDmv
 13xBR1mwKvgUn8tsHQRbyuwk61gdF83ZG+QPxI22ft4CNQg4A2N81aDVpZSwX46RfBIC
 4JvlEm+Y4Ix9uQy4IhqZBFphv6Ngaa9vvpKRUoCoafLi6ubbAGXNnn+ds1ccuHKuK08M
 t1y25WrZSJPvYS5qwi/Dc+EgOm29Y+oH+FtUndFzXVRktxqVgM6q1RK4X+GNcDY6eXFo
 F636QFiMEx/Y86ek/tNlhscGIcrUXoi7RYm9u4MbSMB7EX45+kvy23lYojmkJNokTh2M
 s94Q==
X-Gm-Message-State: AOAM5327g7BFZsDXRweQjlsEcP9EcFNXQRKD+1+a3hvBBWCu35WngRjs
 t9QfpTdcNVOU7KabVhU9KqmuEFHYWUUkOg==
X-Google-Smtp-Source: ABdhPJwojlRH312ulVVzwQ8n9GTH41B1e6gcnkrPuSrwd/Cy8Qrtj/sDvUZ1vQztr8n90EQiAKFyfg==
X-Received: by 2002:a05:6000:1686:b0:219:b932:ffba with SMTP id
 y6-20020a056000168600b00219b932ffbamr8486112wrd.227.1654877269531; 
 Fri, 10 Jun 2022 09:07:49 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bp11-20020a5d5a8b000000b0020c5253d926sm14276053wrb.114.2022.06.10.09.07.48
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 09:07:49 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/28] target/arm: Rename helper_exception_with_syndrome
Date: Fri, 10 Jun 2022 17:07:19 +0100
Message-Id: <20220610160738.2230762-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220610160738.2230762-1-peter.maydell@linaro.org>
References: <20220610160738.2230762-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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

Rename to helper_exception_with_syndrome_el, to emphasize
that the target el is a parameter.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220609202901.1177572-10-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.h    | 2 +-
 target/arm/translate.h | 6 +++---
 target/arm/op_helper.c | 6 +++---
 target/arm/translate.c | 6 +++---
 4 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 5161cdf73dc..5a6802e3fac 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -45,7 +45,7 @@ DEF_HELPER_FLAGS_2(usad8, TCG_CALL_NO_RWG_SE, i32, i32, i32)
 DEF_HELPER_FLAGS_3(sel_flags, TCG_CALL_NO_RWG_SE,
                    i32, i32, i32, i32)
 DEF_HELPER_2(exception_internal, noreturn, env, i32)
-DEF_HELPER_4(exception_with_syndrome, noreturn, env, i32, i32, i32)
+DEF_HELPER_4(exception_with_syndrome_el, noreturn, env, i32, i32, i32)
 DEF_HELPER_2(exception_bkpt_insn, noreturn, env, i32)
 DEF_HELPER_2(exception_pc_alignment, noreturn, env, tl)
 DEF_HELPER_1(setend, void, env)
diff --git a/target/arm/translate.h b/target/arm/translate.h
index f473a21ed48..c57830126bd 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -332,9 +332,9 @@ static inline void gen_ss_advance(DisasContext *s)
 static inline void gen_exception(int excp, uint32_t syndrome,
                                  uint32_t target_el)
 {
-    gen_helper_exception_with_syndrome(cpu_env, tcg_constant_i32(excp),
-                                       tcg_constant_i32(syndrome),
-                                       tcg_constant_i32(target_el));
+    gen_helper_exception_with_syndrome_el(cpu_env, tcg_constant_i32(excp),
+                                          tcg_constant_i32(syndrome),
+                                          tcg_constant_i32(target_el));
 }
 
 /* Generate an architectural singlestep exception */
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index 2a8bdc2cbf0..8a6a3b85516 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -381,7 +381,7 @@ void HELPER(yield)(CPUARMState *env)
  * those EXCP values which are special cases for QEMU to interrupt
  * execution and not to be used for exceptions which are passed to
  * the guest (those must all have syndrome information and thus should
- * use exception_with_syndrome).
+ * use exception_with_syndrome*).
  */
 void HELPER(exception_internal)(CPUARMState *env, uint32_t excp)
 {
@@ -393,8 +393,8 @@ void HELPER(exception_internal)(CPUARMState *env, uint32_t excp)
 }
 
 /* Raise an exception with the specified syndrome register value */
-void HELPER(exception_with_syndrome)(CPUARMState *env, uint32_t excp,
-                                     uint32_t syndrome, uint32_t target_el)
+void HELPER(exception_with_syndrome_el)(CPUARMState *env, uint32_t excp,
+                                        uint32_t syndrome, uint32_t target_el)
 {
     raise_exception(env, excp, syndrome, target_el);
 }
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 87a899d6380..dc033600c0e 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1119,9 +1119,9 @@ static void gen_exception_el(DisasContext *s, int excp, uint32_t syn,
 {
     gen_set_condexec(s);
     gen_set_pc_im(s, s->pc_curr);
-    gen_helper_exception_with_syndrome(cpu_env,
-                                       tcg_constant_i32(excp),
-                                       tcg_constant_i32(syn), tcg_el);
+    gen_helper_exception_with_syndrome_el(cpu_env,
+                                          tcg_constant_i32(excp),
+                                          tcg_constant_i32(syn), tcg_el);
     s->base.is_jmp = DISAS_NORETURN;
 }
 
-- 
2.25.1


