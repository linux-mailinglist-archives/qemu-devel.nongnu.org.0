Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 067B75137C2
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 17:07:44 +0200 (CEST)
Received: from localhost ([::1]:47126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk5k7-0008Sr-4B
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 11:07:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5Jk-0005QT-Fy
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:28 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:40493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5Ji-0006KC-Au
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:27 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 v64-20020a1cac43000000b0038cfd1b3a6dso5405930wme.5
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 07:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=HRbwDy6Q6hksqOkngYAIR/Vtoaw1OQUbVqM0Naa19gk=;
 b=VEpxCons+UNbfg8fEtSiuok2L7fN10/0wlFeT87opT/RGgx+1I8VP/08h/Hk1m6VgB
 PlOYLw+146C2smFbbMTASNJZV84yl4LpDTzlDQVUJ7UzOY19ecLpzxY+f7BgEN7HgqPy
 4/3l0A6akl2OPpqIfOioEjxM1+wk1Hl1EMDVJm21gilR9pCRvGQUxZgqwHQCSXHSfgl+
 uXOwef5ReJ98WRrdP7vjl89pBCAwz7yGULHA18NbqP1TDQ0HWORe/3CF8qf6QVGxRi66
 JJcRmlvXEL1g51z2WRaLUnZdwcZJlljJvtmYVhKfr7n/sPwZUnUUf4L0WTxCyacb8FE1
 37yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HRbwDy6Q6hksqOkngYAIR/Vtoaw1OQUbVqM0Naa19gk=;
 b=dWufS0QQHPAHRzFluZLZc26JUgCqmLm3mZgriWCdVFIGxAJhTF33wY1gD/9usENYpU
 M7lGm8Uld0yzldG40xMcZK/OEb+bLqV66ibeeZkb+1+wAs3i8uTJUZ7bhNRqTbEnELuM
 UNpZOf+ndcTSNzyIrRGx0OFrm6OToLRhRO0V/YGEITQkLQBm10/F6Ko2rPaNCkCLw4BR
 gQ2ONGPuLsfg1bSPTB4GuVuP5/7jVdTLbEJv1D+gWpkJpgXRKSIOnh4C/Sj0xEq+8CCx
 M8K0NlIJwJSu9Y+/zhc4LC5oRycPF5IWIbwgnQJZvGJl2mg4hHMLiw/WHMgV4Idjl5OY
 /wqg==
X-Gm-Message-State: AOAM531kRE0zMI0q9WVk6H0jPUM2khlBofpKybso15f3w/7+5lSm+tRx
 3OrtjheU4rIF2oa1LiPwGyddNQLPbyF8Pw==
X-Google-Smtp-Source: ABdhPJyNlwemx7AppRcatjZbPVXWE5f/DAc+Fdvgo8zs8bmqNDR6qS4dx++ivumXiR7a1i4zrbLifw==
X-Received: by 2002:a05:600c:4ecd:b0:393:ec8b:8b0a with SMTP id
 g13-20020a05600c4ecd00b00393ec8b8b0amr18217443wmq.25.1651156824355; 
 Thu, 28 Apr 2022 07:40:24 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bh26-20020a05600c3d1a00b003928db85759sm130221wmb.15.2022.04.28.07.40.23
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 07:40:23 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 23/54] target/arm: Use tcg_constant for disas_iwmmxt_insn
Date: Thu, 28 Apr 2022 15:39:27 +0100
Message-Id: <20220428143958.2451229-24-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220428143958.2451229-1-peter.maydell@linaro.org>
References: <20220428143958.2451229-1-peter.maydell@linaro.org>
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20220426163043.100432-24-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.c | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 9bd1b46a520..501192ed55f 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1845,24 +1845,21 @@ static int disas_iwmmxt_insn(DisasContext *s, uint32_t insn)
         gen_op_iwmmxt_movq_M0_wRn(wrd);
         switch ((insn >> 6) & 3) {
         case 0:
-            tmp2 = tcg_const_i32(0xff);
-            tmp3 = tcg_const_i32((insn & 7) << 3);
+            tmp2 = tcg_constant_i32(0xff);
+            tmp3 = tcg_constant_i32((insn & 7) << 3);
             break;
         case 1:
-            tmp2 = tcg_const_i32(0xffff);
-            tmp3 = tcg_const_i32((insn & 3) << 4);
+            tmp2 = tcg_constant_i32(0xffff);
+            tmp3 = tcg_constant_i32((insn & 3) << 4);
             break;
         case 2:
-            tmp2 = tcg_const_i32(0xffffffff);
-            tmp3 = tcg_const_i32((insn & 1) << 5);
+            tmp2 = tcg_constant_i32(0xffffffff);
+            tmp3 = tcg_constant_i32((insn & 1) << 5);
             break;
         default:
-            tmp2 = NULL;
-            tmp3 = NULL;
+            g_assert_not_reached();
         }
         gen_helper_iwmmxt_insr(cpu_M0, cpu_M0, tmp, tmp2, tmp3);
-        tcg_temp_free_i32(tmp3);
-        tcg_temp_free_i32(tmp2);
         tcg_temp_free_i32(tmp);
         gen_op_iwmmxt_movq_wRn_M0(wrd);
         gen_op_iwmmxt_set_mup();
@@ -2318,10 +2315,9 @@ static int disas_iwmmxt_insn(DisasContext *s, uint32_t insn)
         rd0 = (insn >> 16) & 0xf;
         rd1 = (insn >> 0) & 0xf;
         gen_op_iwmmxt_movq_M0_wRn(rd0);
-        tmp = tcg_const_i32((insn >> 20) & 3);
         iwmmxt_load_reg(cpu_V1, rd1);
-        gen_helper_iwmmxt_align(cpu_M0, cpu_M0, cpu_V1, tmp);
-        tcg_temp_free_i32(tmp);
+        gen_helper_iwmmxt_align(cpu_M0, cpu_M0, cpu_V1,
+                                tcg_constant_i32((insn >> 20) & 3));
         gen_op_iwmmxt_movq_wRn_M0(wrd);
         gen_op_iwmmxt_set_mup();
         break;
@@ -2375,9 +2371,8 @@ static int disas_iwmmxt_insn(DisasContext *s, uint32_t insn)
         wrd = (insn >> 12) & 0xf;
         rd0 = (insn >> 16) & 0xf;
         gen_op_iwmmxt_movq_M0_wRn(rd0);
-        tmp = tcg_const_i32(((insn >> 16) & 0xf0) | (insn & 0x0f));
+        tmp = tcg_constant_i32(((insn >> 16) & 0xf0) | (insn & 0x0f));
         gen_helper_iwmmxt_shufh(cpu_M0, cpu_env, cpu_M0, tmp);
-        tcg_temp_free_i32(tmp);
         gen_op_iwmmxt_movq_wRn_M0(wrd);
         gen_op_iwmmxt_set_mup();
         gen_op_iwmmxt_set_cup();
-- 
2.25.1


