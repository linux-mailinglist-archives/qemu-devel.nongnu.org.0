Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFCC430439
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Oct 2021 20:36:51 +0200 (CEST)
Received: from localhost ([::1]:41682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mboY6-0006sk-As
	for lists+qemu-devel@lfdr.de; Sat, 16 Oct 2021 14:36:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mboDc-0008OF-A8
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 14:15:41 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:39716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mboDX-00025D-00
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 14:15:40 -0400
Received: by mail-pg1-x536.google.com with SMTP id g184so11779992pgc.6
 for <qemu-devel@nongnu.org>; Sat, 16 Oct 2021 11:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KY0rIMTsgGM7jXkVqVg+Ek/vwWO39kztj/ovOnDV29c=;
 b=xGgfLehbgA3QyljRRgsEFJC0b+/lY4eqMCh0nrIogj0j26DxcDficZswbP6OEMnblN
 O33h4kftHAQy0vG6lADTbdkdKPUz3oVW10RqVT3nP1xy5hNMYW9rjMt2v8sc6z+SJXjr
 WbCYiOzyVsdHLjm77jqbifpbjlwcNemYffJwbOwSQFdf/wB8sQjKBSoC7Bdy5Ef+wANu
 rfSxXcc4c1mwABqrZ7QpZLaYSdaaHn2nbyPatakjceTD9KXPklMziOsgMQSk30ChBri+
 +ju3QUhcmPnsUUeAGwo10QBOYBR8OyCc4MNuaH9ul8c5Alt2pzQ7qrb4hrq0aAayDobq
 r9zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KY0rIMTsgGM7jXkVqVg+Ek/vwWO39kztj/ovOnDV29c=;
 b=xiayje2p6n0gZeWdYu31PuAD6Zz9d2CApnHCakWju4xrLG8H7X3JxhW7ppdPrgtQMO
 cDpigc4YTlifFlq8fl5d9o9ttjhkEKphPL5V842dgHSU5MEuIvPRdC0b49AeEao41VV0
 o5i+a7eVO1En8xGgpc2JaypB/RlQ3uycU6nSDepu8D81p054KQoxcqVfNPbKn6iYP4lU
 QNgZtAgMetYJKzvSuxyNGh6yOt4CftzLFmM/pahZGYaN9W7GpqpZUYB62xilARO98Pqu
 ooz+Lk1KGzfjCrUlcRgRcTvd4HgM6vbN7z6x3JDy/07btIAMnk22fdVf5Z+tPIKKgIps
 7QdQ==
X-Gm-Message-State: AOAM531b51q8LhCYAfUGJhDmehwmHCJIVmTzKQNczmO6oYBtVkbQ4/Vp
 S0y3S3PF+Di9e1/tcj7NqSaF797kQu3IcA==
X-Google-Smtp-Source: ABdhPJzzrkh6gQgqiKedXWcG8vwB8rm9H1M16ugKS/WmIF1120iGgKjHP7QYAKD5t0MTj5O4ZLzI0w==
X-Received: by 2002:a63:7d0f:: with SMTP id y15mr14963752pgc.446.1634408131486; 
 Sat, 16 Oct 2021 11:15:31 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id ob5sm5075097pjb.2.2021.10.16.11.15.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Oct 2021 11:15:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/24] target/riscv: Remove dead code after exception
Date: Sat, 16 Oct 2021 11:15:07 -0700
Message-Id: <20211016181514.3165661-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211016181514.3165661-1-richard.henderson@linaro.org>
References: <20211016181514.3165661-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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
Cc: Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have already set DISAS_NORETURN in generate_exception,
which makes the exit_tb unreachable.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_privileged.c.inc | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/target/riscv/insn_trans/trans_privileged.c.inc b/target/riscv/insn_trans/trans_privileged.c.inc
index 32312be202..a7afcb15ce 100644
--- a/target/riscv/insn_trans/trans_privileged.c.inc
+++ b/target/riscv/insn_trans/trans_privileged.c.inc
@@ -22,8 +22,6 @@ static bool trans_ecall(DisasContext *ctx, arg_ecall *a)
 {
     /* always generates U-level ECALL, fixed in do_interrupt handler */
     generate_exception(ctx, RISCV_EXCP_U_ECALL);
-    exit_tb(ctx); /* no chaining */
-    ctx->base.is_jmp = DISAS_NORETURN;
     return true;
 }
 
@@ -60,13 +58,11 @@ static bool trans_ebreak(DisasContext *ctx, arg_ebreak *a)
         post   = opcode_at(&ctx->base, post_addr);
     }
 
-    if  (pre == 0x01f01013 && ebreak == 0x00100073 && post == 0x40705013) {
+    if (pre == 0x01f01013 && ebreak == 0x00100073 && post == 0x40705013) {
         generate_exception(ctx, RISCV_EXCP_SEMIHOST);
     } else {
         generate_exception(ctx, RISCV_EXCP_BREAKPOINT);
     }
-    exit_tb(ctx); /* no chaining */
-    ctx->base.is_jmp = DISAS_NORETURN;
     return true;
 }
 
-- 
2.25.1


