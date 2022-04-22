Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D44050B6D5
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 14:07:04 +0200 (CEST)
Received: from localhost ([::1]:53242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhs3y-0007SI-8f
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 08:07:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1nhrhX-0004aZ-U8
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 07:43:51 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:39850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1nhrhW-0003dD-G9
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 07:43:51 -0400
Received: by mail-pl1-x633.google.com with SMTP id c12so10278273plr.6
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 04:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JZWc2u/OVUl5udL9UbqYo51Mkbz8NMP+iArUOYZRfro=;
 b=YeurPbegQP1QyCFW7JX4o4kpTJaLb10+zidCQVG7VHk17kj38hHRxtBz7uO2Q0AbaO
 Nkx389ZR+dfnzMZMO3ZirP5aXUxfSzXdsqtL7rohqohNSf6+0v3xqE2CUBUwYndKHDw2
 kMHaeRBRKz/mkiOaneVqK8n/ykF4yKJpjOTKIRMid+5sNIoApLqkWY0DuBXp0thdQJD5
 yjT+IFIHi15cPznwQD3zyVoMGd20iBtIl/BUjTdmFuVSa/VTfcznI9LY9YvTrLiBa7dW
 c1dd2wgWM3Xw1lWeSwyWA1uVRYDEts4SpUVkT5Wvl8fQOO5GXzKD+ISEW1YHBFhv0P7c
 HHbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JZWc2u/OVUl5udL9UbqYo51Mkbz8NMP+iArUOYZRfro=;
 b=ZcvPXFWPB4UFI6znyU5YSKKl33I8O69GGRvkWHKKhbQLPZrhLSAFt7N7/nuwVFAXY2
 w9iWyAXbJE+mB1KW7b8OR4tJRKEVdjcPLWFVqSjMbpbXzKyzom3OXgRh1N7+y7kueU8U
 kgmqnazuGNwz+UROUoYS3ZB/rzsZQwiLLaOpP6xfQRp4jEcIaaSLBz3Uk9jnhgQl775U
 f1HgA+eDKzrhIWanUaV0x5dqKzjaUZg06WjWBFFR9BM129K06/5yiNDOoWgxDlyRPv8N
 xskn9g3kc4m1cMvyskNlvoTOZEp459xasqzmy76qYUcBV8BomsQdzYltEV5VsrBc3h6j
 u+ww==
X-Gm-Message-State: AOAM5325A51ac/5BzcvsQjfSQ4hIJbuqzjjaepQJId1hxmnICj/ZyfpF
 vdNqs9wbb9LQPS0AYA8nR18kPH5HbOA=
X-Google-Smtp-Source: ABdhPJy9GLR7FK+s94jz/fsiUohsabT9uHKPFPQ3pdod8Lc2gZ5RgmanFAb2JvT6YYVZ30tVuVY8SA==
X-Received: by 2002:a17:90a:b797:b0:1d4:f7be:2eeb with SMTP id
 m23-20020a17090ab79700b001d4f7be2eebmr12504113pjr.217.1650627828896; 
 Fri, 22 Apr 2022 04:43:48 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net
 ([2601:641:401:1d20:4c40:4238:b597:4c1a])
 by smtp.gmail.com with ESMTPSA id
 d16-20020a056a00245000b004f7728a4346sm2706519pfj.79.2022.04.22.04.43.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 04:43:48 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/7] target/xtensa: use tcg_constant_* for exceptions
Date: Fri, 22 Apr 2022 04:43:28 -0700
Message-Id: <20220422114332.374472-4-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220422114332.374472-1-jcmvbkbc@gmail.com>
References: <20220422114332.374472-1-jcmvbkbc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Max Filippov <jcmvbkbc@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use tcg_contant_* for exception number, exception cause, debug cause
code and exception PC.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
Changes v1->v2:
- also use tcg_constant_* for PC

 target/xtensa/translate.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index 53f75f7586b2..e92cc6fbf8c6 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -318,18 +318,13 @@ static void gen_left_shift_sar(DisasContext *dc, TCGv_i32 sa)
 
 static void gen_exception(DisasContext *dc, int excp)
 {
-    TCGv_i32 tmp = tcg_const_i32(excp);
-    gen_helper_exception(cpu_env, tmp);
-    tcg_temp_free(tmp);
+    gen_helper_exception(cpu_env, tcg_constant_i32(excp));
 }
 
 static void gen_exception_cause(DisasContext *dc, uint32_t cause)
 {
-    TCGv_i32 tpc = tcg_const_i32(dc->pc);
-    TCGv_i32 tcause = tcg_const_i32(cause);
-    gen_helper_exception_cause(cpu_env, tpc, tcause);
-    tcg_temp_free(tpc);
-    tcg_temp_free(tcause);
+    TCGv_i32 pc = tcg_constant_i32(dc->pc);
+    gen_helper_exception_cause(cpu_env, pc, tcg_constant_i32(cause));
     if (cause == ILLEGAL_INSTRUCTION_CAUSE ||
             cause == SYSCALL_CAUSE) {
         dc->base.is_jmp = DISAS_NORETURN;
@@ -338,11 +333,8 @@ static void gen_exception_cause(DisasContext *dc, uint32_t cause)
 
 static void gen_debug_exception(DisasContext *dc, uint32_t cause)
 {
-    TCGv_i32 tpc = tcg_const_i32(dc->pc);
-    TCGv_i32 tcause = tcg_const_i32(cause);
-    gen_helper_debug_exception(cpu_env, tpc, tcause);
-    tcg_temp_free(tpc);
-    tcg_temp_free(tcause);
+    TCGv_i32 pc = tcg_constant_i32(dc->pc);
+    gen_helper_debug_exception(cpu_env, pc, tcg_constant_i32(cause));
     if (cause & (DEBUGCAUSE_IB | DEBUGCAUSE_BI | DEBUGCAUSE_BN)) {
         dc->base.is_jmp = DISAS_NORETURN;
     }
-- 
2.30.2


