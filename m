Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2688140A212
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 02:35:02 +0200 (CEST)
Received: from localhost ([::1]:34334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPwPd-0006Bq-26
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 20:35:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPw6O-0001hJ-Ih
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 20:15:08 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:43721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPw6J-0007b7-5J
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 20:15:08 -0400
Received: by mail-pg1-x533.google.com with SMTP id r2so10990191pgl.10
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 17:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mo8bAa/Ep14lrVyCCKLWc2/qVNIgW8fWICNcTlyJnEo=;
 b=uP6x0+mCUWfxCNiYKQeB1e6QrHgfrwa+7/o7Tt49tsrTC2c72HDb4TSiXjjrhgxkgN
 MClhDkwaRVUu6QNaS95YKfeD7UnesWiwL1OoHCfKcQZr5AXsIF11KTdDDeVUVVWA5LMG
 J009lSPeC+OF4zT0nhglcfUZI+dqYG9R4k1kdxlvfCcSEU5HRgwvLCuP8kkiMihLoqFH
 lKc8fXbkvrSxsKhi57Q0f4X7w7JqinE0t+bQCxH9welLgwEDvSkU31CbIw8pQtfnRaY8
 vSHbAoU/wTrSPawZNYZR7ZHd0Te0f4RCVGgVTaHameeU87shR3O1EWTIxkoXGa7UwSPU
 y9CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mo8bAa/Ep14lrVyCCKLWc2/qVNIgW8fWICNcTlyJnEo=;
 b=Od04dJaN4ceN3LkhHygzFmTl0TPRGiLIc0evd2/VcOKWgaWioQaZ5DPVwzpGwgh6rs
 Iu7NFX087WbpfRGrGQZkNFLQj0w1Fyu6hvVQD8RmVTkETV8c+Inpuw+qkEDMO8xrwJMN
 VcKO2mDsR0WAYetpSRCClRiangL8bWkiL3lCb0Tzz4iQyX+AnyRnI+q9w9dlNzCmkAUv
 FHfWGCsQq+iSZujm0qiQELSKgv3wu9sQoPliN2KFa57zPsjdN7B9BVSFQ4+JYb88neYS
 zGnHI7RsLV46mhQez5Wy4kL2ELpUyiZLGyIM/T78VrWPoveonu64FXJA4M+QiTy6qgnf
 1Rrw==
X-Gm-Message-State: AOAM5304PbohPQxr7DW2EMYW5fClTd3awTx4l6+8Fn3kZp6bboeUM2Oi
 AVW57uGKGE5whoneKdo4rdl34/5ZiLTN4g==
X-Google-Smtp-Source: ABdhPJy6omasF8MpjrSG4BFTC3Y/G8EJyhhii6GPukhKfxTetMDN/k+DB3HN2BJca9GbXb7JpwNaZA==
X-Received: by 2002:a63:8f4a:: with SMTP id r10mr13183394pgn.337.1631578501839; 
 Mon, 13 Sep 2021 17:15:01 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id m7sm9334179pgn.32.2021.09.13.17.15.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 17:15:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/44] tcg: Remove tcg_global_reg_new defines
Date: Mon, 13 Sep 2021 17:14:17 -0700
Message-Id: <20210914001456.793490-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210914001456.793490-1-richard.henderson@linaro.org>
References: <20210914001456.793490-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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
Cc: peter.maydell@linaro.org, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bmeng.cn@gmail.com>

Since commit 1c2adb958fc0 ("tcg: Initialize cpu_env generically"),
these tcg_global_reg_new_ macros are not used anywhere.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210816143507.11200-1-bmeng.cn@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg-op.h    | 2 --
 target/hppa/translate.c | 3 ---
 2 files changed, 5 deletions(-)

diff --git a/include/tcg/tcg-op.h b/include/tcg/tcg-op.h
index 2a654f350c..0545a6224c 100644
--- a/include/tcg/tcg-op.h
+++ b/include/tcg/tcg-op.h
@@ -843,7 +843,6 @@ static inline void tcg_gen_plugin_cb_end(void)
 
 #if TARGET_LONG_BITS == 32
 #define tcg_temp_new() tcg_temp_new_i32()
-#define tcg_global_reg_new tcg_global_reg_new_i32
 #define tcg_global_mem_new tcg_global_mem_new_i32
 #define tcg_temp_local_new() tcg_temp_local_new_i32()
 #define tcg_temp_free tcg_temp_free_i32
@@ -851,7 +850,6 @@ static inline void tcg_gen_plugin_cb_end(void)
 #define tcg_gen_qemu_st_tl tcg_gen_qemu_st_i32
 #else
 #define tcg_temp_new() tcg_temp_new_i64()
-#define tcg_global_reg_new tcg_global_reg_new_i64
 #define tcg_global_mem_new tcg_global_mem_new_i64
 #define tcg_temp_local_new() tcg_temp_local_new_i64()
 #define tcg_temp_free tcg_temp_free_i64
diff --git a/target/hppa/translate.c b/target/hppa/translate.c
index 3ce22cdd09..c3698cf067 100644
--- a/target/hppa/translate.c
+++ b/target/hppa/translate.c
@@ -34,7 +34,6 @@
 
 #undef TCGv
 #undef tcg_temp_new
-#undef tcg_global_reg_new
 #undef tcg_global_mem_new
 #undef tcg_temp_local_new
 #undef tcg_temp_free
@@ -59,7 +58,6 @@
 #define TCGv_reg             TCGv_i64
 
 #define tcg_temp_new         tcg_temp_new_i64
-#define tcg_global_reg_new   tcg_global_reg_new_i64
 #define tcg_global_mem_new   tcg_global_mem_new_i64
 #define tcg_temp_local_new   tcg_temp_local_new_i64
 #define tcg_temp_free        tcg_temp_free_i64
@@ -155,7 +153,6 @@
 #else
 #define TCGv_reg             TCGv_i32
 #define tcg_temp_new         tcg_temp_new_i32
-#define tcg_global_reg_new   tcg_global_reg_new_i32
 #define tcg_global_mem_new   tcg_global_mem_new_i32
 #define tcg_temp_local_new   tcg_temp_local_new_i32
 #define tcg_temp_free        tcg_temp_free_i32
-- 
2.25.1


