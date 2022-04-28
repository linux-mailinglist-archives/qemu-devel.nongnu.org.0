Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76FBC51379D
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 17:01:42 +0200 (CEST)
Received: from localhost ([::1]:58004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk5eH-00050b-JV
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 11:01:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5JS-00052w-EM
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:11 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:52102)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5JQ-0006DF-AZ
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:09 -0400
Received: by mail-wm1-x334.google.com with SMTP id q20so3083909wmq.1
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 07:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=9RjoC/6ifC6SIbRIZ4urh3GPCCjvlxW3K3359J7cS0U=;
 b=SpSLjkSSmElMZrtI/7GPmfXbQBXJ6aa/wSoOMiIGfBtnMaG6JIc23YjY5ns6JS787H
 z7kOE0gweHSXkuHrZH6/ZRwL2Hq0vF0VLaE7BEw1fgufrj5n55bd7oWEzDowBfAho+Pa
 4GRhXENo8Dhfw8eBTLC2LMN81ZbK2v2VcKjM60JPjh/MA617YXQDj9F/G1vmRXx1ErFs
 JPAO8gaAL0WbWWKAYj3/NZYk4tjaGN9EX5zLUYovnJ3kJsRx4hwtZVyRL2Vrqh6CERxA
 DOxKwBTg7b3qTsZC1S8rMawRjSIhRjgEBV/DhEJEQ1MSPLfLO4ZbK/1h3HSruKhAQ8UQ
 /6qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9RjoC/6ifC6SIbRIZ4urh3GPCCjvlxW3K3359J7cS0U=;
 b=owjNOHNcfmiT1aBsRyd22yOMZnhZII5qKotP6Rkzut4jotzlcVwQjAiLfa4szDakwB
 p1jvGB1psU2V3PJ0gGKt7yaHYkXCAUEft9fklNw5VWCfQC5YnE+44mQjgxf046/W0Sbn
 RGBNLUDdYWEzdquoKRcYUF6rfqbHzRUW80sDZKVwx+ZEH/ejbmtbxU1SjN+IMhqZEHYH
 d5j0mLWRa1xgEieWZqW8/VmZvQPbtMt7j7DgWQP3VduNxlEwXA9m1gxaqdd29k1S3xwL
 drT3//PjRTImvsPxCkY9N7s174PYAS8wmOxSFmhzMqLr7pLczhQbA+MUz3XsuXgAbkpY
 J2ug==
X-Gm-Message-State: AOAM530mB8w93YRKwHSt7wOAbkU6wLuZY37UnN//tmBcV+DkI7aXX5Fg
 8cicjry1U3CC8CtEtikhBAIw3Q/QHFPXkg==
X-Google-Smtp-Source: ABdhPJxcatvu4gZs1UGIBmJWda+CeX2WioRmRLKPFWTJkvP1ry0T3y3ov2zeMrQokYkpdn9zrj53fA==
X-Received: by 2002:a05:600c:348f:b0:393:dcff:f95b with SMTP id
 a15-20020a05600c348f00b00393dcfff95bmr28518376wmq.76.1651156806868; 
 Thu, 28 Apr 2022 07:40:06 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bh26-20020a05600c3d1a00b003928db85759sm130221wmb.15.2022.04.28.07.40.05
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 07:40:05 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/54] target/arm: Use tcg_constant in handle_msr_i
Date: Thu, 28 Apr 2022 15:39:09 +0100
Message-Id: <20220428143958.2451229-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220428143958.2451229-1-peter.maydell@linaro.org>
References: <20220428143958.2451229-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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
Message-id: 20220426163043.100432-6-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-a64.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 5c0fd897d6c..ec4765362bd 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1615,7 +1615,6 @@ static void gen_axflag(void)
 static void handle_msr_i(DisasContext *s, uint32_t insn,
                          unsigned int op1, unsigned int op2, unsigned int crm)
 {
-    TCGv_i32 t1;
     int op = op1 << 3 | op2;
 
     /* End the TB by default, chaining is ok.  */
@@ -1674,9 +1673,7 @@ static void handle_msr_i(DisasContext *s, uint32_t insn,
         if (s->current_el == 0) {
             goto do_unallocated;
         }
-        t1 = tcg_const_i32(crm & PSTATE_SP);
-        gen_helper_msr_i_spsel(cpu_env, t1);
-        tcg_temp_free_i32(t1);
+        gen_helper_msr_i_spsel(cpu_env, tcg_constant_i32(crm & PSTATE_SP));
         break;
 
     case 0x19: /* SSBS */
@@ -1704,15 +1701,11 @@ static void handle_msr_i(DisasContext *s, uint32_t insn,
         break;
 
     case 0x1e: /* DAIFSet */
-        t1 = tcg_const_i32(crm);
-        gen_helper_msr_i_daifset(cpu_env, t1);
-        tcg_temp_free_i32(t1);
+        gen_helper_msr_i_daifset(cpu_env, tcg_constant_i32(crm));
         break;
 
     case 0x1f: /* DAIFClear */
-        t1 = tcg_const_i32(crm);
-        gen_helper_msr_i_daifclear(cpu_env, t1);
-        tcg_temp_free_i32(t1);
+        gen_helper_msr_i_daifclear(cpu_env, tcg_constant_i32(crm));
         /* For DAIFClear, exit the cpu loop to re-evaluate pending IRQs.  */
         s->base.is_jmp = DISAS_UPDATE_EXIT;
         break;
-- 
2.25.1


