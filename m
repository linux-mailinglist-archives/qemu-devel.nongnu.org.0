Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBE941FEA9
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 01:35:49 +0200 (CEST)
Received: from localhost ([::1]:33492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWoXk-0004Sc-8S
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 19:35:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mWoTK-0007Cm-Tx
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 19:31:14 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:40717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mWoTJ-0003ci-H0
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 19:31:14 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 t16-20020a1c7710000000b003049690d882so14620959wmi.5
 for <qemu-devel@nongnu.org>; Sat, 02 Oct 2021 16:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aFYM/inBHisvSnXbNaPlmy32jEjWhuzsWvA4aDuEOJA=;
 b=CdtV4P439R6n2GbBwOve5l8pYJSvxcnFI6F5xoM82iwqauw9TR0d/Cx5zjJ/NSQQ0Z
 f3F7RTGkcEkTpcH8N9m53/FEWWn18FfstG1yLIyjfFN3nu/zVz42QniyxA4EdxItnY/B
 fUgs/Ph/w2+12D9OXg8VwSKUs93c5waDmt4KSdiC68C4h+vidmPd6rEig2cw4s0TJl5x
 k5UZZIzLkrBQUzlvHDEWhDuFFyDH0nhTcdMP3FNsIdV95WWu7nc3K3wMeu5UjiqrEJcf
 RiKe6omvJyNh4JneQMa6mjf22mlaFZMbj18VAMWc/qi4o1NcxQMSFDyYGqSgPo4kYeSp
 Ypzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=aFYM/inBHisvSnXbNaPlmy32jEjWhuzsWvA4aDuEOJA=;
 b=DCNzirv5ZuZhPX7KlyxGE9iQYuu+0Cyie5j73ZP1uqM+y6GC1QYYjnQuxNJjB/nIto
 Isn0Ll1vx33bUbIKfEvo97bA5wZsoxyvJ/rrVqToW9FqccHv9Ebjj2vJEock2QNBFJ7X
 YgWIzCkiLp1n/UZ7UHqbELNajvJX5+AKK4Lcg4VuNtLRzLwxEZt3hbNF7500niyRxjMh
 10CShARufyy2uW4+09Np7aKLAejxtdp4UF+LdW2aTmkDKEvPfJXTfCC05S1vU4e5CQKC
 is8n6Jz4I1izhlYKsn1C3RUNJx2fNqAFOdR+3QQrJKc43W+OsVzSCaCvD9Gf3MtfwqFx
 9/Mg==
X-Gm-Message-State: AOAM5323bWJJ8ua/axN6f4TDCk5dM8nHVAeBdF5beo04cbm6bGGD3OZs
 /3zeHd91NUB67Ss8Mc21AHQ+sEz2SRo=
X-Google-Smtp-Source: ABdhPJw0qkurYcEWwpbnX9IKHfgXpHGbjONUd3BNzvs/OtlhX030gc9Y7S+w72ANXL7Lm5sSDLxFeg==
X-Received: by 2002:a05:600c:ac2:: with SMTP id
 c2mr11126457wmr.118.1633217471020; 
 Sat, 02 Oct 2021 16:31:11 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 g2sm9845083wrq.62.2021.10.02.16.31.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Oct 2021 16:31:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] target/nios2: Use tcg_constant_*
Date: Sun,  3 Oct 2021 01:30:54 +0200
Message-Id: <20211002233054.3575646-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211002233054.3575646-1-f4bug@amsat.org>
References: <20211002233054.3575646-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Marek Vasut <marex@denx.de>, Chris Wulff <crwulff@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace uses of tcg_const_* with the allocate and free close together.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/nios2/translate.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 8524a2f6dd8..8d4a376ea84 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -134,11 +134,8 @@ static TCGv load_gpr(DisasContext *dc, uint8_t reg)
 static void t_gen_helper_raise_exception(DisasContext *dc,
                                          uint32_t index)
 {
-    TCGv_i32 tmp = tcg_const_i32(index);
-
     tcg_gen_movi_tl(cpu_R[R_PC], dc->pc);
-    gen_helper_raise_exception(cpu_env, tmp);
-    tcg_temp_free_i32(tmp);
+    gen_helper_raise_exception(cpu_env, tcg_constant_i32(index));
     dc->base.is_jmp = DISAS_NORETURN;
 }
 
@@ -448,9 +445,8 @@ static void rdctl(DisasContext *dc, uint32_t code, uint32_t flags)
         if (likely(instr.c != R_ZERO)) {
             tcg_gen_mov_tl(cpu_R[instr.c], cpu_R[instr.imm5 + CR_BASE]);
 #ifdef DEBUG_MMU
-            TCGv_i32 tmp = tcg_const_i32(instr.imm5 + CR_BASE);
-            gen_helper_mmu_read_debug(cpu_R[instr.c], cpu_env, tmp);
-            tcg_temp_free_i32(tmp);
+            gen_helper_mmu_read_debug(cpu_R[instr.c], cpu_env,
+                                      tcg_constant_i32(instr.imm5 + CR_BASE));
 #endif
         }
 #endif
@@ -613,15 +609,13 @@ static void divu(DisasContext *dc, uint32_t code, uint32_t flags)
 
     TCGv t0 = tcg_temp_new();
     TCGv t1 = tcg_temp_new();
-    TCGv t3 = tcg_const_tl(1);
 
     tcg_gen_ext32u_tl(t0, load_gpr(dc, instr.a));
     tcg_gen_ext32u_tl(t1, load_gpr(dc, instr.b));
-    tcg_gen_movcond_tl(TCG_COND_EQ, t1, t1, dc->zero, t3, t1);
+    tcg_gen_movcond_tl(TCG_COND_EQ, t1, t1, dc->zero, tcg_constant_tl(1), t1);
     tcg_gen_divu_tl(cpu_R[instr.c], t0, t1);
     tcg_gen_ext32s_tl(cpu_R[instr.c], cpu_R[instr.c]);
 
-    tcg_temp_free(t3);
     tcg_temp_free(t1);
     tcg_temp_free(t0);
 }
-- 
2.31.1


