Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7895059CCDF
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 02:09:19 +0200 (CEST)
Received: from localhost ([::1]:45378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQHTq-0002nM-JH
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 20:09:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQGvZ-0006AF-2m
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 19:33:56 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:46075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQGvW-0007HX-8h
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 19:33:52 -0400
Received: by mail-pl1-x62c.google.com with SMTP id u22so11293485plq.12
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 16:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc;
 bh=jF8bW2hxoYDJVrtP30w9zGlMhhg9saC7gHcaAbgRXww=;
 b=F09LuDWPN5WbOOxj7uB84B+JXsxH+ZKODwjR8NtzTro1G5kl3kIy4TZscr+kA8m4fp
 y1Pn/nu6BqDXT8ueeadyM6bJxHdQ5FhPQZ2XXGj+vLve0+eRL6xxqmndU0JqZOGb5Icl
 r7gxaIlToR2dypbFrZPB+2nKxI2AeaFSP99eyLTuP0MRYoWMqcOwQMKBgl5WYTKWiO4G
 nuMaDZDC9xQOGTPSH+CLZrKwj2nMvjLp7LlOSs/9sREUD3rwGI3XNIR+gwwI5Ab4S4Mg
 sgujslZXJ9V6WQaTILuWKJ0IVAlPauu+EKl7bzokIIa/u3tsSsAxwUSRpe5vmPUSwUgO
 8A4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
 bh=jF8bW2hxoYDJVrtP30w9zGlMhhg9saC7gHcaAbgRXww=;
 b=LSq3R1IHmXsRgnT7B2+zmVEkgSGODLiFE1/MRaxm0Eb0HsW5nWaFj3eAZ68HIUvND4
 pv5Wu3FOmqGRIIuKplAmK6PnVAbVYKQDTW0T4sasMuhAdDiAgjcXKCmesO6lMcj9Yj5E
 oPXluqQc3pm2wcX6IVlGECiwgQWIdzzuACgGRLMKCrbc7/3LfXkH2oqxv+gGA7P//YkS
 24+CNGgjBrvL6wMTq3dJACtTwCVV6sCVN82xjFLqjkaW+MaGBZgGldoCV65EQnx5MQOz
 UQxMfYPj6Z4vS9udj7jjgY4yYGiYsaUEeeMRljouyAv4nvc8qu5B1mfgs/L/0tDFww7l
 hT9A==
X-Gm-Message-State: ACgBeo32r8o8VEoA9GIOL2HuBFf4Mk5pattsxkPT8ltPJrnsNEXeOqhk
 Ty4i0faQu6KnJG+/Gj9Qi7AaI+lOnhmE9Q==
X-Google-Smtp-Source: AA6agR7SS+u522yo2Rp4Rhz94t8teVLxS5hBTzlVTfN7NbJFY63R3vWyytm+9GOS0jW3DYyM0dlzrA==
X-Received: by 2002:a17:902:b090:b0:172:dacb:5732 with SMTP id
 p16-20020a170902b09000b00172dacb5732mr10862843plr.5.1661211223044; 
 Mon, 22 Aug 2022 16:33:43 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:c3f1:b74f:5edd:63af])
 by smtp.gmail.com with ESMTPSA id
 82-20020a621555000000b0053655af14easm5133124pfv.45.2022.08.22.16.33.41
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 16:33:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 17/22] target/i386: Use gen_jmp_rel for loop and jecxz insns
Date: Mon, 22 Aug 2022 16:33:13 -0700
Message-Id: <20220822233318.1728621-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822233318.1728621-1-richard.henderson@linaro.org>
References: <20220822233318.1728621-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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

With gen_jmp_rel, we may chain to the next tb
instead of merely writing to eip and exiting.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 0a2ec85972..59e7596629 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -7242,24 +7242,18 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
     case 0xe2: /* loop */
     case 0xe3: /* jecxz */
         {
-            TCGLabel *l1, *l2, *l3;
-
-            tval = (int8_t)insn_get(env, s, MO_8);
-            tval += s->pc - s->cs_base;
-            if (dflag == MO_16) {
-                tval &= 0xffff;
-            }
+            TCGLabel *l1, *l2;
+            int diff = (int8_t)insn_get(env, s, MO_8);
 
             l1 = gen_new_label();
             l2 = gen_new_label();
-            l3 = gen_new_label();
             gen_update_cc_op(s);
             b &= 3;
             switch(b) {
             case 0: /* loopnz */
             case 1: /* loopz */
                 gen_op_add_reg_im(s, s->aflag, R_ECX, -1);
-                gen_op_jz_ecx(s, s->aflag, l3);
+                gen_op_jz_ecx(s, s->aflag, l2);
                 gen_jcc1(s, (JCC_Z << 1) | (b ^ 1), l1);
                 break;
             case 2: /* loop */
@@ -7272,14 +7266,11 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 break;
             }
 
-            gen_set_label(l3);
-            gen_update_eip_next(s);
-            tcg_gen_br(l2);
+            gen_set_label(l2);
+            gen_jmp_rel(s, MO_32, 0, 1);
 
             gen_set_label(l1);
-            gen_jmp_im(s, tval);
-            gen_set_label(l2);
-            s->base.is_jmp = DISAS_EOB_ONLY;
+            gen_jmp_rel(s, dflag, diff, 0);
         }
         break;
     case 0x130: /* wrmsr */
-- 
2.34.1


