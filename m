Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4017F25813D
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Aug 2020 20:41:46 +0200 (CEST)
Received: from localhost ([::1]:40286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kCokT-0003NA-9D
	for lists+qemu-devel@lfdr.de; Mon, 31 Aug 2020 14:41:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kCojD-0001gc-KF
 for qemu-devel@nongnu.org; Mon, 31 Aug 2020 14:40:27 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:39607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kCojA-0007Am-JZ
 for qemu-devel@nongnu.org; Mon, 31 Aug 2020 14:40:26 -0400
Received: by mail-pl1-x642.google.com with SMTP id x18so2289005pll.6
 for <qemu-devel@nongnu.org>; Mon, 31 Aug 2020 11:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eVnq7Yqrhmhc9cmYB+OfT/PWM85dgl9OXAW1Q23ktl8=;
 b=ctO+JnpJ3GZuuCMdFUWRv0ZBetNukWWimJT+SflftRg7Vj3OguFP4Xd27M8qTuyTui
 1VoeT8Vkru4Pv0xPtAHDKhDQ+/JW7cKHDLhjlNQNgSPsd+aK6TB9OMy0re3y02WeQ5ZF
 0v7Kc4sHXv95BPbHTI+oybBXzVrUR/nEWuJIPH95gZyRHAruQwjiTK+Ooeqc2LJN3YR5
 ETFN7DLhpDh7WN/9IjU0UWt6OXNp/DwRqSOw0MQgKExAtOyC1UfRjVYzoqa6by8yLqR/
 7rCQiBgNXScocOiW46aXEK5ijbc+3SXw8N6Jh30Iwilpp24jjhSZht0b+olNjkfaYL6Y
 ga2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eVnq7Yqrhmhc9cmYB+OfT/PWM85dgl9OXAW1Q23ktl8=;
 b=r04efKA7AYzvjLVXmjhKZ/eDQQ6RPsoPWbhde0ZijcupZIdZXyh5YWr8oQGMiZJ3vv
 pS0hyZy2l0upbfbcDELFcdL65cK/IhIkg87zY1fp+wrUtQHBL4d4Apqf0iFgg8Etw4AJ
 XEraFv9nMMLHZJzXPRcQuhQjd8/8X6jQZn7E97cnh5hIKaIcWomJR5jb98GlvvAOGHPo
 ClxMXVyGZVnA+SKt5hU5181xsVQ7taBFMiX8ksf6378dGgW/vHBTOp5CNschvCaUVU8k
 LEi54cC9I9naCZp3V3+d2wOzdqL1HPb6+OyCQaHeDpidSb/TtiFguWt92y77rFJbalCL
 /QbQ==
X-Gm-Message-State: AOAM532vyc4Lfk3DZl4jd4q533i2h3gh5X1UQyIV4JDO86N3pPqoesTp
 hTetebR7xZ8EYq0XvBemJM0nB6xiWbuXUA==
X-Google-Smtp-Source: ABdhPJz/fMJfk6YDJ9vq4IavPk07czYD0A8IG+tWnJt/uXjXmaEVzggtB1c4eAOUVv+HdhQD0sO/3Q==
X-Received: by 2002:a17:90a:fb52:: with SMTP id
 iq18mr575588pjb.207.1598899221934; 
 Mon, 31 Aug 2020 11:40:21 -0700 (PDT)
Received: from localhost.localdomain ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id y195sm5757580pfc.137.2020.08.31.11.40.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Aug 2020 11:40:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/6] target/microblaze: Rename DISAS_UPDATE to DISAS_EXIT
Date: Mon, 31 Aug 2020 11:40:13 -0700
Message-Id: <20200831184018.839906-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200831184018.839906-1-richard.henderson@linaro.org>
References: <20200831184018.839906-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::642;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x642.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: edgar.iglesias@xilinx.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The name "update" suggests that something needs updating, but
this is not the case.  Use "exit" to emphasize that nothing
needs doing except to exit.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/microblaze/translate.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
index a377818b5e..03fc653ce2 100644
--- a/target/microblaze/translate.c
+++ b/target/microblaze/translate.c
@@ -37,7 +37,7 @@
 
 /* is_jmp field values */
 #define DISAS_JUMP    DISAS_TARGET_0 /* only pc was modified dynamically */
-#define DISAS_UPDATE  DISAS_TARGET_1 /* cpu state was modified dynamically */
+#define DISAS_EXIT    DISAS_TARGET_1 /* all cpu state modified dynamically */
 
 static TCGv_i32 cpu_R[32];
 static TCGv_i32 cpu_pc;
@@ -1161,7 +1161,7 @@ static bool trans_brk(DisasContext *dc, arg_typea_br *arg)
     tcg_gen_ori_i32(cpu_msr, cpu_msr, MSR_BIP);
     tcg_gen_movi_tl(cpu_res_addr, -1);
 
-    dc->base.is_jmp = DISAS_UPDATE;
+    dc->base.is_jmp = DISAS_EXIT;
     return true;
 }
 
@@ -1202,7 +1202,7 @@ static bool trans_brki(DisasContext *dc, arg_typeb_br *arg)
                          ~(MSR_VMS | MSR_UMS | MSR_VM | MSR_UM));
     }
     tcg_gen_ori_i32(cpu_msr, cpu_msr, msr_to_set);
-    dc->base.is_jmp = DISAS_UPDATE;
+    dc->base.is_jmp = DISAS_EXIT;
 #endif
 
     return true;
@@ -1712,7 +1712,7 @@ static void mb_tr_translate_insn(DisasContextBase *dcb, CPUState *cs)
 
     /* Force an exit if the per-tb cpu state has changed.  */
     if (dc->base.is_jmp == DISAS_NEXT && dc->cpustate_changed) {
-        dc->base.is_jmp = DISAS_UPDATE;
+        dc->base.is_jmp = DISAS_EXIT;
         tcg_gen_movi_i32(cpu_pc, dc->base.pc_next);
     }
 }
@@ -1733,7 +1733,7 @@ static void mb_tr_tb_stop(DisasContextBase *dcb, CPUState *cs)
         gen_goto_tb(dc, 0, dc->base.pc_next);
         return;
 
-    case DISAS_UPDATE:
+    case DISAS_EXIT:
         if (unlikely(cs->singlestep_enabled)) {
             gen_raise_exception(dc, EXCP_DEBUG);
         } else {
-- 
2.25.1


