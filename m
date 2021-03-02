Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F01232A8BB
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 19:04:53 +0100 (CET)
Received: from localhost ([::1]:49460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH9O8-0004Pa-5m
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 13:04:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lH9Hb-0003Aj-Nx
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 12:58:07 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:40359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lH9Ha-0007cF-3o
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 12:58:07 -0500
Received: by mail-pg1-x52b.google.com with SMTP id b21so14349467pgk.7
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 09:58:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rDTef7VWE7fxk2i0+V52DytmGBNiPfjpzsN2oBg9LYg=;
 b=R9XqPa+Hd5FSBHWbwXU6eOpqFaUZmwTbA8KdNewankvuiv7ZGgOrP4KQ4CENGqz30g
 B36mCWYxAGEmwXs06vtFgnUSlCvWvSzeRd0Uee7m/w1stPjG+5BRybKEEfCZjmvNxybD
 fUZOhDvIP0GyqgpFYaKzJFlrNVBL1R4sQXLjwC5KWcyOGidZPY4iHSxpUp6yVdLKch9J
 pPNirimYC69A+vBkvutrRem4sXB/Cw6HwmRqpUvd86CsOehA40Zic2/kVkFISEk2Ns2Y
 NuZS3F5Af7v6bri6Y+FzW8lnpnJ3aZsN6WhnYLGlLYW6QJE4UO/QuweFLPvq6LQWmPfR
 +iLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rDTef7VWE7fxk2i0+V52DytmGBNiPfjpzsN2oBg9LYg=;
 b=UiJDvsowtNe29T5AydOtungS9UqxT9J/4A4e8yInuhL9ejIn3/TQOCf6n4EkCiPFEQ
 bFV/rKF1B4Onnu0Kjie4avldPYGKXsaoYMp0JtvsrS3m2yL9vJDj1BUgPn5MywGLoh9q
 Qyc+ZPGZ6PFkpQ34Dzt62lg4mCyb8LCg4gzb25v8SHZtPe4GHkJusJhAcdm7eEOZuZ/g
 Hbi01Q3Mjz76Qn9tdUlhXjYL9XpISn46dPiOejOyG14GAn6DooKA0GBrVktdxnu8GAzK
 zs+B7l9EWSkAr/CQ5XjRpLd8vsVUHxmDZApf586T4+SXlKOfR2QfsWt76Q2q2PWTl5Ry
 7qBQ==
X-Gm-Message-State: AOAM533dJJ9Oq2AEDRdzQacgnF38EaT4V7hrIcdhtCRWnP8Mw38IzLPu
 4ezA+o2HEzawHjYk4HYOUmIjawviuGEqhQ==
X-Google-Smtp-Source: ABdhPJzQYYw/BRBPkAFqj61jxNV0T9wzvGvcdPhAKzgzOkoy4OwhSS6yrZhw8ghmqYYS0NwmTleRIw==
X-Received: by 2002:a05:6a00:22d6:b029:1cb:35ac:d8e0 with SMTP id
 f22-20020a056a0022d6b02901cb35acd8e0mr4150833pfj.17.1614707884877; 
 Tue, 02 Mar 2021 09:58:04 -0800 (PST)
Received: from localhost.localdomain (174-21-84-25.tukw.qwest.net.
 [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id gf20sm4232234pjb.39.2021.03.02.09.58.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 09:58:04 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 20/27] tcg/tci: Merge extension operations
Date: Tue,  2 Mar 2021 09:57:34 -0800
Message-Id: <20210302175741.1079851-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210302175741.1079851-1-richard.henderson@linaro.org>
References: <20210302175741.1079851-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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
Cc: alex.bennee@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This includes ext8s, ext8u, ext16s, ext16u.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 44 ++++++++------------------------------------
 1 file changed, 8 insertions(+), 36 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index d0bf810781..73f639d23a 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -607,29 +607,29 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             tci_write_reg64(regs, t1, t0, (uint32_t)t2 * tmp64);
             break;
 #endif /* TCG_TARGET_REG_BITS == 32 */
-#if TCG_TARGET_HAS_ext8s_i32
-        case INDEX_op_ext8s_i32:
+#if TCG_TARGET_HAS_ext8s_i32 || TCG_TARGET_HAS_ext8s_i64
+        CASE_32_64(ext8s)
             t0 = *tb_ptr++;
             t1 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, (int8_t)t1);
             break;
 #endif
-#if TCG_TARGET_HAS_ext16s_i32
-        case INDEX_op_ext16s_i32:
+#if TCG_TARGET_HAS_ext16s_i32 || TCG_TARGET_HAS_ext16s_i64
+        CASE_32_64(ext16s)
             t0 = *tb_ptr++;
             t1 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, (int16_t)t1);
             break;
 #endif
-#if TCG_TARGET_HAS_ext8u_i32
-        case INDEX_op_ext8u_i32:
+#if TCG_TARGET_HAS_ext8u_i32 || TCG_TARGET_HAS_ext8u_i64
+        CASE_32_64(ext8u)
             t0 = *tb_ptr++;
             t1 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, (uint8_t)t1);
             break;
 #endif
-#if TCG_TARGET_HAS_ext16u_i32
-        case INDEX_op_ext16u_i32:
+#if TCG_TARGET_HAS_ext16u_i32 || TCG_TARGET_HAS_ext16u_i64
+        CASE_32_64(ext16u)
             t0 = *tb_ptr++;
             t1 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, (uint16_t)t1);
@@ -779,34 +779,6 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
                 continue;
             }
             break;
-#if TCG_TARGET_HAS_ext8u_i64
-        case INDEX_op_ext8u_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
-            tci_write_reg(regs, t0, (uint8_t)t1);
-            break;
-#endif
-#if TCG_TARGET_HAS_ext8s_i64
-        case INDEX_op_ext8s_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
-            tci_write_reg(regs, t0, (int8_t)t1);
-            break;
-#endif
-#if TCG_TARGET_HAS_ext16s_i64
-        case INDEX_op_ext16s_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
-            tci_write_reg(regs, t0, (int16_t)t1);
-            break;
-#endif
-#if TCG_TARGET_HAS_ext16u_i64
-        case INDEX_op_ext16u_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
-            tci_write_reg(regs, t0, (uint16_t)t1);
-            break;
-#endif
 #if TCG_TARGET_HAS_ext32s_i64
         case INDEX_op_ext32s_i64:
 #endif
-- 
2.25.1


