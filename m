Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72AE332FDA0
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Mar 2021 22:49:39 +0100 (CET)
Received: from localhost ([::1]:37034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIenq-0000ed-Eo
	for lists+qemu-devel@lfdr.de; Sat, 06 Mar 2021 16:49:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lIebF-00074U-Oa
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 16:36:37 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:41393)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lIebD-0002yo-BB
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 16:36:37 -0500
Received: by mail-pg1-x52c.google.com with SMTP id w34so2739598pga.8
 for <qemu-devel@nongnu.org>; Sat, 06 Mar 2021 13:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5opNq1HXc5ZvZ4ePdaKdxyOS1mjysh0i6AOuC6K4OYo=;
 b=gkNLQtmPh+VmJoWGFA4o6Fgl/lfKgWt80wpaXXaaZNSXSLQqWV5xy8JTzoxlIPlAOk
 Num8nkI1WhqinAc1O+EsWAiUrj/4PVQcdENWZQ8Ij/Y6oIicUgYVpwn0h5ObmGcc8q9Z
 LytNY13KX+bnvhLw0Bhk2B7rFg4vzWnt3RO6TKUUgmtEmdgdqXTX+ZKrpWvVskIW6GbS
 4X/88rb4K/e1M5+FUPPcIdjlvENI2L2Au4cIxmOe0/HlMAsAG2fwsB9QbV4xyj7zRLr6
 FChAiizvnxNfeuuM0lbS8mi2zYqKjA/mCS4vFpXOhhTfDxzrPK5prEmsT/E7wJpY8HPE
 rY2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5opNq1HXc5ZvZ4ePdaKdxyOS1mjysh0i6AOuC6K4OYo=;
 b=lA1zYcH0qnkBQFTTch8l2nRvFfcgyPOXgcdjpTz2WC4sp2TvOozWSBpsjIpXIHmVPy
 PT4t3xVJawnOid1vNUcRg8vKYWAa3YfDOknUtRYkYI2x7uWUaDGLDs+OGjV5uSf/t78S
 FVHWSsseqnWMkga4RnC9sbuXFf+XflL0YZfyrqiPSoiJjVYe8NaD3p8gXzz3CSVWHO7l
 SO/1drYzt+pOTRmEZ89ig95DDApaJVmNgg9y9guJ1tRAsWFatu918aFEn/iOkvm3b6/a
 tCTtavqolGivXFMCLTdwtAOwF09XPfDigPhmxzAehlpegJXrY+1k+s8c+yt8RBLpRcI0
 rVyA==
X-Gm-Message-State: AOAM53365ZAj/h6Wru1nqFmklSAyw8JOwydv4HUFePlLAOqDEO2BE3t1
 O3ZNx89Up49/lZmT7v1r6Zwt2aP0F4G9cw==
X-Google-Smtp-Source: ABdhPJzLigcA4Anjz5ukHs+/CRP+b22Sj5a6LxWN1IzsOfdJ9RuM2V+/pDi1zH6UrCGf5Wc1HgjWuw==
X-Received: by 2002:a63:d118:: with SMTP id k24mr14285070pgg.420.1615066594129; 
 Sat, 06 Mar 2021 13:36:34 -0800 (PST)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id r30sm6365616pgu.86.2021.03.06.13.36.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Mar 2021 13:36:33 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 19/27] tcg/tci: Merge basic arithmetic operations
Date: Sat,  6 Mar 2021 13:36:05 -0800
Message-Id: <20210306213613.85168-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210306213613.85168-1-richard.henderson@linaro.org>
References: <20210306213613.85168-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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

This includes add, sub, mul, and, or, xor.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 83 +++++++++++++++++--------------------------------------
 1 file changed, 25 insertions(+), 58 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 9efe69d05f..d0bf810781 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -451,26 +451,47 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             *(uint32_t *)(t1 + t2) = t0;
             break;
 
-            /* Arithmetic operations (32 bit). */
+            /* Arithmetic operations (mixed 32/64 bit). */
 
-        case INDEX_op_add_i32:
+        CASE_32_64(add)
             t0 = *tb_ptr++;
             t1 = tci_read_r(regs, &tb_ptr);
             t2 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1 + t2);
             break;
-        case INDEX_op_sub_i32:
+        CASE_32_64(sub)
             t0 = *tb_ptr++;
             t1 = tci_read_r(regs, &tb_ptr);
             t2 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1 - t2);
             break;
-        case INDEX_op_mul_i32:
+        CASE_32_64(mul)
             t0 = *tb_ptr++;
             t1 = tci_read_r(regs, &tb_ptr);
             t2 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1 * t2);
             break;
+        CASE_32_64(and)
+            t0 = *tb_ptr++;
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_r(regs, &tb_ptr);
+            tci_write_reg(regs, t0, t1 & t2);
+            break;
+        CASE_32_64(or)
+            t0 = *tb_ptr++;
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_r(regs, &tb_ptr);
+            tci_write_reg(regs, t0, t1 | t2);
+            break;
+        CASE_32_64(xor)
+            t0 = *tb_ptr++;
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_r(regs, &tb_ptr);
+            tci_write_reg(regs, t0, t1 ^ t2);
+            break;
+
+            /* Arithmetic operations (32 bit). */
+
         case INDEX_op_div_i32:
             t0 = *tb_ptr++;
             t1 = tci_read_r(regs, &tb_ptr);
@@ -495,24 +516,6 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             t2 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, (uint32_t)t1 % (uint32_t)t2);
             break;
-        case INDEX_op_and_i32:
-            t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
-            t2 = tci_read_r(regs, &tb_ptr);
-            tci_write_reg(regs, t0, t1 & t2);
-            break;
-        case INDEX_op_or_i32:
-            t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
-            t2 = tci_read_r(regs, &tb_ptr);
-            tci_write_reg(regs, t0, t1 | t2);
-            break;
-        case INDEX_op_xor_i32:
-            t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
-            t2 = tci_read_r(regs, &tb_ptr);
-            tci_write_reg(regs, t0, t1 ^ t2);
-            break;
 
             /* Shift/rotate operations (32 bit). */
 
@@ -695,24 +698,6 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 
             /* Arithmetic operations (64 bit). */
 
-        case INDEX_op_add_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
-            t2 = tci_read_r(regs, &tb_ptr);
-            tci_write_reg(regs, t0, t1 + t2);
-            break;
-        case INDEX_op_sub_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
-            t2 = tci_read_r(regs, &tb_ptr);
-            tci_write_reg(regs, t0, t1 - t2);
-            break;
-        case INDEX_op_mul_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
-            t2 = tci_read_r(regs, &tb_ptr);
-            tci_write_reg(regs, t0, t1 * t2);
-            break;
         case INDEX_op_div_i64:
             t0 = *tb_ptr++;
             t1 = tci_read_r(regs, &tb_ptr);
@@ -737,24 +722,6 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             t2 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, (uint64_t)t1 % (uint64_t)t2);
             break;
-        case INDEX_op_and_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
-            t2 = tci_read_r(regs, &tb_ptr);
-            tci_write_reg(regs, t0, t1 & t2);
-            break;
-        case INDEX_op_or_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
-            t2 = tci_read_r(regs, &tb_ptr);
-            tci_write_reg(regs, t0, t1 | t2);
-            break;
-        case INDEX_op_xor_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
-            t2 = tci_read_r(regs, &tb_ptr);
-            tci_write_reg(regs, t0, t1 ^ t2);
-            break;
 
             /* Shift/rotate operations (64 bit). */
 
-- 
2.25.1


