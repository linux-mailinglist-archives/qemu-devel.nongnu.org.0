Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6F83D68ED
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 23:48:57 +0200 (CEST)
Received: from localhost ([::1]:45958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m88T2-0004Pi-BY
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 17:48:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m88Rl-0002Lx-Kg
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 17:47:37 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:36632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m88Rj-000655-Cw
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 17:47:37 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 ds11-20020a17090b08cbb0290172f971883bso1016578pjb.1
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 14:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=seot653Ng9+5CYOwzmZozwtUeX2yMDtfyc+Kr3qYmEI=;
 b=jEL055HzoTzc+JltEs90SVn6YBKfLkYZBMD6i7iwy1v9gCWtUcYjRh94mBdHySaHlf
 M37o8I7RqFSzrMgaKtgF6u+e8MSBxzRgfhcNFl4OwuSXupM87RBnEcPscRZobIQIEf+P
 AL5DzQOgDPqTZYZBwJPYeiuJcRBnHBky5rBf2tK5xzQxf/7nUwz0raP9RdDbnoTm1GZO
 o5ajOfG1hT/6N8zPtRA+LtHBDbJHioace64buNpr0nNt8AZUrF8JX6Iv4VfEQw9K9Y7h
 AedQK/pTbR7SSO6mtpoJRxVYKG3Pd0QIOeqQPXBS1ZZTCTwGI71emBUkuAB2PS+4r8ml
 OWjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=seot653Ng9+5CYOwzmZozwtUeX2yMDtfyc+Kr3qYmEI=;
 b=TgK9/m/QPd2mQHL25CJw4J9BbQ5WrVTtCzuxF4LjgJ6QmqXi3wnDVJuIK30zps1tiG
 O+K733tOnegCHZS3fBvtJkVPf0wP+K+ztevk7w3S9TGI0s4aRjVDE8tpH8TLaLYtBu6W
 gjolwTpzuG5Jq6xTeT/y1C3rAhjabedjV161LqaEKos92wx3lIDIDUcF8T9gProG1zBV
 LlB5hHg/TUg4D/6DVCk3KmgtHCkHbX9YbwUvZBdTWofxqapxtbV6sFLYfs7uNnTFd6Ii
 Dk8yzp3i3Y8YGErJFbmIYPUVnCn9aci/j+zv5Q0HRq2GINp/+XdMkGUucyHpc7JyJOsV
 howw==
X-Gm-Message-State: AOAM531oW7Y9V7MW4Oi0oOOrrYWytmzR+0I0DpuwTEy5aHXMyBccAcSg
 8YS+8blMDa6XQWB1bGa1B4+KhEHKqHyOiA==
X-Google-Smtp-Source: ABdhPJxFn+mINky9/7FohTDZ9Dcu5c9yLDShJeJR2+nZ5SgpqWSBB38HQJfvPnclNLD9EbJSTqXpDA==
X-Received: by 2002:a17:90b:3905:: with SMTP id
 ob5mr4901734pjb.211.1627336054108; 
 Mon, 26 Jul 2021 14:47:34 -0700 (PDT)
Received: from cloudburst.home
 (2603-800c-3202-ffa7-497b-6ae4-953c-7ad1.res6.spectrum.com.
 [2603:800c:3202:ffa7:497b:6ae4:953c:7ad1])
 by smtp.gmail.com with ESMTPSA id e8sm997679pfm.218.2021.07.26.14.47.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 14:47:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL for-6.1 01/12] accel/tcg: Don't use CF_COUNT_MASK as the max
 value of icount_decr.u16.low
Date: Mon, 26 Jul 2021 11:47:18 -1000
Message-Id: <20210726214729.2062862-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210726214729.2062862-1-richard.henderson@linaro.org>
References: <20210726214729.2062862-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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

From: Peter Maydell <peter.maydell@linaro.org>

In cpu_loop_exec_tb() we were bounding the number of insns we might
try to execute in a TB using CF_COUNT_MASK.  This is incorrect,
because we can validly put up to 0xffff into icount_decr.u16.low.  In
particular, since commit 78ff82bb1b67c0d7 reduced CF_COUNT_MASK to
511 this meant that we would incorrectly only try to execute 511
instructions in a 512-instruction TB, which could result in QEMU
hanging when in icount mode.

Use the actual maximum value, which is 0xffff. (This brings this code
in to line with the similar logic in icount_prepare_for_run() in
tcg-accel-ops-icount.c.)

Fixes: 78ff82bb1b67c0d7
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/499
Message-Id: <20210725174405.24568-2-peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cpu-exec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index fc895cf51e..6e8dc29119 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -834,7 +834,7 @@ static inline void cpu_loop_exec_tb(CPUState *cpu, TranslationBlock *tb,
     /* Ensure global icount has gone forward */
     icount_update(cpu);
     /* Refill decrementer and continue execution.  */
-    insns_left = MIN(CF_COUNT_MASK, cpu->icount_budget);
+    insns_left = MIN(0xffff, cpu->icount_budget);
     cpu_neg(cpu)->icount_decr.u16.low = insns_left;
     cpu->icount_extra = cpu->icount_budget - insns_left;
 
-- 
2.25.1


