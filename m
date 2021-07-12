Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 073613C65C8
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 23:58:15 +0200 (CEST)
Received: from localhost ([::1]:33368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m33wL-0003cu-WF
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 17:58:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m33tx-0000ef-5o
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 17:55:45 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:40863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m33ts-0006rR-17
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 17:55:44 -0400
Received: by mail-pg1-x52d.google.com with SMTP id k20so12753076pgg.7
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 14:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=n7azBHG1Zdt3CLAZ/Yfkcusz8F8rGG4wxLGpc9H30Hs=;
 b=bHdT5PyuJuFouAn1ILNmqVFroA5wUfabYvvtb9QZM0WCe4mG87PAeBEPbIXA1NqSoB
 ySmjAMQeVmqsFYkaE9XMTr7GyaSfI1gU6li11+Wczt0Hnx7HkXo8STFtImlNWsECNLyn
 07lPK/EWlMXy7rKlcG6VHlj7tyo/qnSW2tKA4bD0ZP5xG5E6pgA0ph9o1ZI5uHMNtgmA
 c+/W3rp6sO7meTI9JzRUlZX6ydW4kkc/f84fsUHU7YVyawFvqYHWil/vbC+q7BB5g4Dw
 IBNDfLZEoQjOW9Skj0juOa9OVt2PvF6vorQJyaX+xaMJpfwFb8ldOiPlQyasVQuXSWws
 eD1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n7azBHG1Zdt3CLAZ/Yfkcusz8F8rGG4wxLGpc9H30Hs=;
 b=rnGQwoviVU+0oKXlCq/IF3s8Czea9JFu1BBFpcT+r08LnzIhEdwAlLdJw2YhDfIT1O
 +YtMOoDJB6WnLkuCYG2lRSGIv63v7WrHOIcCF3O8fS69LydPHN7XUbEy0pjCzjZFj6in
 w4N/thZ/4hSYgmAYRIqFmQJ3CJs6S0A7/F2qiOJGNg8KSnBrP8pjlm0R96ZbLLaxhtZ9
 moagMM4O/BO6x7v7GNXSuwGmHllF6gLPNWjeFBFbT/4gaCfByzFsVj41+gUMEbsxYH7f
 0sAeMgtfpLUZ3TctS2M9EThO4bY4FqBy/B6CQ8W4szCVQWkeYfJyRiv+WHMApcJJGTEm
 zEtw==
X-Gm-Message-State: AOAM533aS2RxaKDoEW//tUaXtG6NxMF0cPooEeuoE/ceDYp/UD/1h2it
 DKT0v+e4TG+/cGDWvhgXaW8lJtRK6gBLxw==
X-Google-Smtp-Source: ABdhPJwVJ83KbTdjwvWIm4r4ksQXRTv0JzyZkGf2RqYD7OwA9bDl61+qnatntvgujeFU93Ms3gDSGA==
X-Received: by 2002:a62:3344:0:b029:28c:6f0f:cb90 with SMTP id
 z65-20020a6233440000b029028c6f0fcb90mr1294429pfz.58.1626126938562; 
 Mon, 12 Jul 2021 14:55:38 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id d2sm376932pjo.50.2021.07.12.14.55.38
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 14:55:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/11] accel/tcg: Remove unused variable in cpu_exec
Date: Mon, 12 Jul 2021 14:55:26 -0700
Message-Id: <20210712215535.1471256-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210712215535.1471256-1-richard.henderson@linaro.org>
References: <20210712215535.1471256-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From clang-13:
accel/tcg/cpu-exec.c:783:15: error: variable 'cc' set but not used \
    [-Werror,-Wunused-but-set-variable]

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cpu-exec.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index e22bcb99f7..a8d8cea586 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -780,7 +780,6 @@ static inline void cpu_loop_exec_tb(CPUState *cpu, TranslationBlock *tb,
 
 int cpu_exec(CPUState *cpu)
 {
-    CPUClass *cc = CPU_GET_CLASS(cpu);
     int ret;
     SyncClocks sc = { 0 };
 
@@ -819,14 +818,12 @@ int cpu_exec(CPUState *cpu)
          * so we only perform the workaround for clang.
          */
         cpu = current_cpu;
-        cc = CPU_GET_CLASS(cpu);
 #else
         /*
          * Non-buggy compilers preserve these locals; assert that
          * they have the correct value.
          */
         g_assert(cpu == current_cpu);
-        g_assert(cc == CPU_GET_CLASS(cpu));
 #endif
 
 #ifndef CONFIG_SOFTMMU
-- 
2.25.1


