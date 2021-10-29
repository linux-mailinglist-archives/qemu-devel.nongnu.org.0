Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 452A443F675
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 07:08:30 +0200 (CEST)
Received: from localhost ([::1]:60634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgK7x-0004R6-CX
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 01:08:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJaZ-0004aH-9Y
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:33:59 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:34456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJaX-0007zB-CQ
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:33:58 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 q2-20020a17090a2e0200b001a0fd4efd49so6616933pjd.1
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 21:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OJWu7yUFUqO6SxASLIr2hIPwbeHCDr8GBSl6LyJ/KfE=;
 b=jO+/9isJq6dYfWURX+pnHUbSi0RnNmvqMczJZhrAhCzeRie279kgaAp4Q1/oQVZjvv
 8LlRAvKQNVUHNjB6dU/Us/sWqgZDI6u+K+vE3rlf5X48sfbl2RCL+kYZRyym4Pwe8FTm
 RKIK3BD+S53MW9NMSchq1wPI1yShg0P3mxG7TtgY1RT+1PH0jBuQXB0qiG6TvELbovf8
 nM7NFN2E0rA752v4OUTqyiTsAgtIUDrZDS1na9bxtrl4klb8UeJml4KQIHVTt1b4oOSb
 qa1UhduuodN7TFslRRV17tw6w830FwIH+48QESysLU1M226TTiIdaLivi/UNduP7g0or
 2wPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OJWu7yUFUqO6SxASLIr2hIPwbeHCDr8GBSl6LyJ/KfE=;
 b=r0gmAPlm7YzZSobIlv/IQg2IqJoFbl2xLYKtmh5o8ad91LPkcSPFxpLo8wLDHslrsp
 fdVY24XajiVKk3XgOFu3Ri4COxzEYvp3mRyi2Y+SM73eiInrKExtOR0IyQO1hq8/eC2E
 U32s37EwDg5uFV6rP0RpYe73tXcKcJz7LH81Cx9Nto1tcK/eO/ZYQeI5JQJeyvKk10/x
 Kn2V5U62u1WxPMY+VA68OBRhZjua8WOonDEqrL/HXMc05b5dFMDOKjtAqBGHxY3WLNNK
 Ov1RvtIf3ThkBN84J1J0oLTno/sFCZDtVbp3K+T5XEXz/aAuABQPzSI9Tm7DB0oKrFIc
 ajhw==
X-Gm-Message-State: AOAM532929DS9YEiewwMfQojbBPKFB+EjHoLl6pPwB8+3nnXIzJGC1L7
 9YYJOzfKvFGnx3Mu1joXbTkM3Sx/BDpSoA==
X-Google-Smtp-Source: ABdhPJys2qHUkU4yAmBxvBTmKyW/h5l3N9lvNmfs9eG2Mse/fG9JZfL1A9GLd58TxONo1U26H4macw==
X-Received: by 2002:a17:902:d395:b0:141:a913:1920 with SMTP id
 e21-20020a170902d39500b00141a9131920mr2390351pld.81.1635482036041; 
 Thu, 28 Oct 2021 21:33:56 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id i11sm4120257pgp.18.2021.10.28.21.33.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 21:33:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 30/60] tcg/optimize: Split out fold_deposit
Date: Thu, 28 Oct 2021 21:32:59 -0700
Message-Id: <20211029043329.1518029-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029043329.1518029-1-richard.henderson@linaro.org>
References: <20211029043329.1518029-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
Cc: Luis Pires <luis.pires@eldorado.org.br>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 3bd5f043c8..2c57d08760 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -878,6 +878,18 @@ static bool fold_ctpop(OptContext *ctx, TCGOp *op)
     return fold_const1(ctx, op);
 }
 
+static bool fold_deposit(OptContext *ctx, TCGOp *op)
+{
+    if (arg_is_const(op->args[1]) && arg_is_const(op->args[2])) {
+        uint64_t t1 = arg_info(op->args[1])->val;
+        uint64_t t2 = arg_info(op->args[2])->val;
+
+        t1 = deposit64(t1, op->args[3], op->args[4], t2);
+        return tcg_opt_gen_movi(ctx, op, op->args[0], t1);
+    }
+    return false;
+}
+
 static bool fold_divide(OptContext *ctx, TCGOp *op)
 {
     return fold_const2(ctx, op);
@@ -1741,16 +1753,6 @@ void tcg_optimize(TCGContext *s)
             }
             break;
 
-        CASE_OP_32_64(deposit):
-            if (arg_is_const(op->args[1]) && arg_is_const(op->args[2])) {
-                tmp = deposit64(arg_info(op->args[1])->val,
-                                op->args[3], op->args[4],
-                                arg_info(op->args[2])->val);
-                tcg_opt_gen_movi(&ctx, op, op->args[0], tmp);
-                continue;
-            }
-            break;
-
         default:
             break;
 
@@ -1778,6 +1780,9 @@ void tcg_optimize(TCGContext *s)
         CASE_OP_32_64(ctpop):
             done = fold_ctpop(&ctx, op);
             break;
+        CASE_OP_32_64(deposit):
+            done = fold_deposit(&ctx, op);
+            break;
         CASE_OP_32_64(div):
         CASE_OP_32_64(divu):
             done = fold_divide(&ctx, op);
-- 
2.25.1


