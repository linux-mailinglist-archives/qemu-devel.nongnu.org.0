Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F2C407E6B
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 18:07:24 +0200 (CEST)
Received: from localhost ([::1]:60288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPS0p-0008AM-84
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 12:07:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPRs4-0002QE-Gm
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 11:58:21 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:36831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPRrz-0003wJ-T8
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 11:58:20 -0400
Received: by mail-pg1-x52d.google.com with SMTP id t1so7037044pgv.3
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 08:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mo8bAa/Ep14lrVyCCKLWc2/qVNIgW8fWICNcTlyJnEo=;
 b=yHyodcA8fcQjjJC1ke3hNEXdLnjKF7cvxhUXPAnlushiIKz2AKMdOluu4G6gRRae3P
 +aFTYaaK/MM9emNCy5ronvq/43H8RI5NEeMW6sM+gdtijCVXhXrdknFI1H6m1jokh4Yh
 7/nbReNmXqLwfIl4VI2rIHDcX0KoLSe4scVeHPdg3L5Q7zBbCczHFC2jjsk5RTIJCJVK
 Ffp4aGrhGhyZ5hoxl5SqNwG0v+EESNa5l0q+QxAan3TayEWp1W92+ACOXKCvJVqmLIkl
 0cKnreb3UcUuyxVth65jrK31/7/cn85vlWdrSyUwUb8aM6v2v4mM3pNVBv8aUL/KvdEC
 owAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mo8bAa/Ep14lrVyCCKLWc2/qVNIgW8fWICNcTlyJnEo=;
 b=16NoIC0OtTTW+sSbtDlaI4hKnuycjkhzPOHg9gl/+IYLo5yNcLXzMwrBKvDwNKtcyI
 wOlOqhloh3AMyqrwMh2ODGtmJZsgWff/B2voNGZ5ik9wu4/BxB9II6wSW7IrnKBnFa35
 PewGQeuESbEVdTz3ZzICds5sJMjUZzUEXdjBpvYGbfl9eZyfbMvpK4kjNLUiPb6PpkLD
 wKcohqpE43DksrIITvyW00QAQ/y3qG0F9aIKFb+KhZ/p4BdhxiY/NcU1lD5VBJeG+Ag0
 BDFf45wC/VDWQoV99+oI2+EgCCFladpFpXKAZ+ngmCh11WteP4/3MRvQIphLrBcisQ5d
 oIdA==
X-Gm-Message-State: AOAM5330YYUwi8ZO56/Dj6NBdE2wHAjKelvvUVYFAqMjEmE1jGvAt8zs
 yhE+uuwfbMyOpo3Etegw8dKFK/AYUIR+4g==
X-Google-Smtp-Source: ABdhPJyYzAbGWC+1XCInNDL4tbEBkLFEK0/lqBxH5QZaO2GYUOIbCL4Ya05HHkHa0QEiXYMVF7l1kg==
X-Received: by 2002:a63:e510:: with SMTP id r16mr7232349pgh.34.1631462294650; 
 Sun, 12 Sep 2021 08:58:14 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id v13sm4439415pfm.16.2021.09.12.08.58.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 08:58:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 5/9] tcg: Remove tcg_global_reg_new defines
Date: Sun, 12 Sep 2021 08:58:05 -0700
Message-Id: <20210912155809.196236-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210912155809.196236-1-richard.henderson@linaro.org>
References: <20210912155809.196236-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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


