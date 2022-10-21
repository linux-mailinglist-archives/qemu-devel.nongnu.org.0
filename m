Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E2D6071FF
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 10:20:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olnGt-0002AL-En
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 04:20:51 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olmH3-00038x-So
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 03:16:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olmGt-00030p-HW
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 03:16:47 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olmGr-0005ex-Nl
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 03:16:47 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 a6-20020a17090abe0600b0020d7c0c6650so5895325pjs.0
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 00:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6W8q5KR3SkNfvwFl20KCGR9C9fb12M8X2VM4t5Cdh0w=;
 b=tS0xUprr9gCTyINl1r37qzNjSF4Ye/NyA3opYBLeDgoXjKX6PWh0XDgshZNl7ERhZD
 /5MAWSc1cNR1wrJbEC562gm6jT2IExdbKbBs2sBNFcRkuk1rrLBkZyxlNQ+GFiFt0oZO
 0KV9JF5Db0P4LWn79ZzlOVPiItyRpMuma5uHOCKY98hb1N97gLS7ha4udhET1HorC5Z1
 2L+HcO07UwP6hGBbXtKDGXnohmlU2zkiyQuwKW2Ft5syjkn2xp6v/wVkXNkFcKHV5yCP
 L66bFjIlXbAxYzvdcvqq9LFZYJRuTqGYdEet+ov3dpNmcseKfUeEbRTCavP8ydRjfjUh
 aRbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6W8q5KR3SkNfvwFl20KCGR9C9fb12M8X2VM4t5Cdh0w=;
 b=ZKPiKPQFu/rmgsMco0JoFzczIlFXRkxaGN9BJlq9zw5Q3fE5Yy1Wqj7I4/1IZMTgAa
 5KL47irnSuJqXnJp/L/FzgdEY1cFy0y2tulMYlCNXTbOkljRX561+MmYmY38cJLWZ0D5
 OBRQ6WllIdGEXiQo0ECOITJJQvDaDYGLSK5sqAGeA/+60d4yfPWQwC5XFr8We9CgsWXp
 YllfMsmElrNI7jh03EzLydpt/ku4GQfWRpguzLcjbU7gAw24pdhtcK5nnqitoZm6LKZf
 89Gk3+NzfkNgdc2Z0OY7idYFsHfyMvEncvdDG8TzxeA4XqjM5ZEQqLQAumv/bSLc1hHN
 0XCg==
X-Gm-Message-State: ACrzQf1DMFFmvmnwY7MNgvfDr65wWtezueJQ08ecstNBi8Y1ElCB06ZB
 drNGd+K6Bcdj3CI1LJeIiTHeGzxSgZGb+ldO
X-Google-Smtp-Source: AMsMyM4m1L6mKKfmpqvepu6ExqTTrlcfQehywqK7spmOz7nAl1l/hessk7ZPPjmJaRrlC7rLphA/Uw==
X-Received: by 2002:a17:90b:4d07:b0:1ef:521c:f051 with SMTP id
 mw7-20020a17090b4d0700b001ef521cf051mr57566644pjb.164.1666336604368; 
 Fri, 21 Oct 2022 00:16:44 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 q9-20020a638c49000000b0041cd5ddde6fsm13003327pgn.76.2022.10.21.00.16.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 00:16:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 07/36] tcg: Remove TCG_TARGET_STACK_GROWSUP
Date: Fri, 21 Oct 2022 17:15:20 +1000
Message-Id: <20221021071549.2398137-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221021071549.2398137-1-richard.henderson@linaro.org>
References: <20221021071549.2398137-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The hppa host code has been removed since 2013; this
should have been deleted at the same time.

Fixes: 802b5081233a ("tcg-hppa: Remove tcg backend")
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.h |  1 -
 tcg/arm/tcg-target.h     |  1 -
 tcg/tcg.c                | 32 ++------------------------------
 3 files changed, 2 insertions(+), 32 deletions(-)

diff --git a/tcg/aarch64/tcg-target.h b/tcg/aarch64/tcg-target.h
index 485f685bd2..e145d50fef 100644
--- a/tcg/aarch64/tcg-target.h
+++ b/tcg/aarch64/tcg-target.h
@@ -16,7 +16,6 @@
 #define TCG_TARGET_INSN_UNIT_SIZE  4
 #define TCG_TARGET_TLB_DISPLACEMENT_BITS 24
 #define MAX_CODE_GEN_BUFFER_SIZE  (2 * GiB)
-#undef TCG_TARGET_STACK_GROWSUP
 
 typedef enum {
     TCG_REG_X0, TCG_REG_X1, TCG_REG_X2, TCG_REG_X3,
diff --git a/tcg/arm/tcg-target.h b/tcg/arm/tcg-target.h
index 7e96495392..56c1ac4586 100644
--- a/tcg/arm/tcg-target.h
+++ b/tcg/arm/tcg-target.h
@@ -30,7 +30,6 @@ extern int arm_arch;
 
 #define use_armv7_instructions  (__ARM_ARCH >= 7 || arm_arch >= 7)
 
-#undef TCG_TARGET_STACK_GROWSUP
 #define TCG_TARGET_INSN_UNIT_SIZE 4
 #define TCG_TARGET_TLB_DISPLACEMENT_BITS 16
 #define MAX_CODE_GEN_BUFFER_SIZE  UINT32_MAX
diff --git a/tcg/tcg.c b/tcg/tcg.c
index e9ff3c92e5..6c4f949c85 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1551,25 +1551,8 @@ void tcg_gen_callN(void *func, TCGTemp *ret, int nargs, TCGTemp **args)
         }
 
         if (TCG_TARGET_REG_BITS < 64 && is_64bit) {
-            /*
-             * If stack grows up, then we will be placing successive
-             * arguments at lower addresses, which means we need to
-             * reverse the order compared to how we would normally
-             * treat either big or little-endian.  For those arguments
-             * that will wind up in registers, this still works for
-             * HPPA (the only current STACK_GROWSUP target) since the
-             * argument registers are *also* allocated in decreasing
-             * order.  If another such target is added, this logic may
-             * have to get more complicated to differentiate between
-             * stack arguments and register arguments.
-             */
-#if HOST_BIG_ENDIAN != defined(TCG_TARGET_STACK_GROWSUP)
-            op->args[pi++] = temp_arg(args[i] + 1);
-            op->args[pi++] = temp_arg(args[i]);
-#else
-            op->args[pi++] = temp_arg(args[i]);
-            op->args[pi++] = temp_arg(args[i] + 1);
-#endif
+            op->args[pi++] = temp_arg(args[i] + HOST_BIG_ENDIAN);
+            op->args[pi++] = temp_arg(args[i] + !HOST_BIG_ENDIAN);
             real_args += 2;
             continue;
         }
@@ -4166,12 +4149,6 @@ static bool tcg_reg_alloc_dup2(TCGContext *s, const TCGOp *op)
     return true;
 }
 
-#ifdef TCG_TARGET_STACK_GROWSUP
-#define STACK_DIR(x) (-(x))
-#else
-#define STACK_DIR(x) (x)
-#endif
-
 static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
 {
     const int nb_oargs = TCGOP_CALLO(op);
@@ -4211,18 +4188,13 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
     stack_offset = TCG_TARGET_CALL_STACK_OFFSET;
     for (i = nb_regs; i < nb_iargs; i++) {
         arg = op->args[nb_oargs + i];
-#ifdef TCG_TARGET_STACK_GROWSUP
-        stack_offset -= sizeof(tcg_target_long);
-#endif
         if (arg != TCG_CALL_DUMMY_ARG) {
             ts = arg_temp(arg);
             temp_load(s, ts, tcg_target_available_regs[ts->type],
                       s->reserved_regs, 0);
             tcg_out_st(s, ts->type, ts->reg, TCG_REG_CALL_STACK, stack_offset);
         }
-#ifndef TCG_TARGET_STACK_GROWSUP
         stack_offset += sizeof(tcg_target_long);
-#endif
     }
     
     /* assign input registers */
-- 
2.34.1


