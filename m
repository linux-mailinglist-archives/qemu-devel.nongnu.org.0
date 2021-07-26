Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3674A3D68F4
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 23:50:41 +0200 (CEST)
Received: from localhost ([::1]:52392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m88Ui-0000E6-8O
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 17:50:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m88Rq-0002Ww-0m
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 17:47:42 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:54051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m88Ro-00068p-CJ
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 17:47:41 -0400
Received: by mail-pj1-x1030.google.com with SMTP id j1so14828988pjv.3
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 14:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TPMzfyzPxQws2QFaU9LwgJDz9bd8a19l0TLsA22Vwpo=;
 b=zdogzrz2B1KexJnWRCoc7qHkTb7o1ZIXaTs6AtAhmzkLnOaIztIrRNU86keHgWCjoL
 3Ka3A3FsHufm7ptF2Z/Un0kR99972CQ5VwxJHpOo1oxRbKZGk18ICGYGG6Mdlvg4/dge
 /84aSZqlL2TCVopGAnQQAEKjsW4K0A67qfgI3Kgzk/pi0qQMcWyWVZXTRXq8kLqEy6ih
 3StSTxA1niy7NKL+dKoqok5lvNrggH46kWvePPzbz7b2WmXJn/CEkORNyvr4Z7BdtwKh
 Xo2hsOww73aaiAuaXW+Wh/BykgZqtlQvQAx/GQfKQBSpB1+ME33V7Y2Rwv/mF3Zj8VjN
 fBkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TPMzfyzPxQws2QFaU9LwgJDz9bd8a19l0TLsA22Vwpo=;
 b=JjlTJeWlSLGPTrH6fyUoY5IAGo/RevINjlsvBjnWunhE9BR82QSqsWLYpjeW0+9LnB
 gPSBl+GukCIiXsFmvlC75iGzUeKeRHAfvtVaGw2E4+s38ui/n+RuVx3JZpSJeLf2kyCF
 A4rQtkfaE3nfUb5REhb7zYY8xSOEtPRkyT8XzGh+PG+Ue3ZL0X5lncddvKBoI4VqL/+X
 aNKZSKtasoAfkZu5I4am631fo8xJRWl6CV3UzkpLNKraKSULodyRykMdBD32Fv+XQEty
 9rZhktsrEijFA3i1SwGKWop6vkqbdLRwkl/dLd/DkFwWQjcfbNiCZXbvHR/pr+d+KN4F
 2DJA==
X-Gm-Message-State: AOAM530Xaw25lrrTClsDVpjHXcLpzC1jB3WlABrV4BSF00tzRz32zM1m
 nXZtUqfRv/uI/H8z7Mkbv8bMxk+tQ3pyOw==
X-Google-Smtp-Source: ABdhPJzQ6rj6QKePNIN/+OlKbwioEE/vn/yEdVdkJ2jzOiANOQMn9XwQm7y0F+SlXI7WBbPADriZTw==
X-Received: by 2002:a17:902:ed95:b029:ee:aa46:547a with SMTP id
 e21-20020a170902ed95b02900eeaa46547amr16043130plj.27.1627336059113; 
 Mon, 26 Jul 2021 14:47:39 -0700 (PDT)
Received: from cloudburst.home
 (2603-800c-3202-ffa7-497b-6ae4-953c-7ad1.res6.spectrum.com.
 [2603:800c:3202:ffa7:497b:6ae4:953c:7ad1])
 by smtp.gmail.com with ESMTPSA id e8sm997679pfm.218.2021.07.26.14.47.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 14:47:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL for-6.1 05/12] accel/tcg: Remove unused variable in cpu_exec
Date: Mon, 26 Jul 2021 11:47:22 -1000
Message-Id: <20210726214729.2062862-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210726214729.2062862-1-richard.henderson@linaro.org>
References: <20210726214729.2062862-1-richard.henderson@linaro.org>
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From clang-13:
accel/tcg/cpu-exec.c:783:15: error: variable 'cc' set but not used \
    [-Werror,-Wunused-but-set-variable]

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cpu-exec.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 5aa42fbff3..e5c0ccd1a2 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -855,7 +855,6 @@ static inline void cpu_loop_exec_tb(CPUState *cpu, TranslationBlock *tb,
 
 int cpu_exec(CPUState *cpu)
 {
-    CPUClass *cc = CPU_GET_CLASS(cpu);
     int ret;
     SyncClocks sc = { 0 };
 
@@ -889,19 +888,14 @@ int cpu_exec(CPUState *cpu)
          * that we support, but is still unfixed in clang:
          *   https://bugs.llvm.org/show_bug.cgi?id=21183
          *
-         * Reload essential local variables here for those compilers.
+         * Reload an essential local variable here for those compilers.
          * Newer versions of gcc would complain about this code (-Wclobbered),
          * so we only perform the workaround for clang.
          */
         cpu = current_cpu;
-        cc = CPU_GET_CLASS(cpu);
 #else
-        /*
-         * Non-buggy compilers preserve these locals; assert that
-         * they have the correct value.
-         */
+        /* Non-buggy compilers preserve this; assert the correct value. */
         g_assert(cpu == current_cpu);
-        g_assert(cc == CPU_GET_CLASS(cpu));
 #endif
 
 #ifndef CONFIG_SOFTMMU
-- 
2.25.1


