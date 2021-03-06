Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 088BE32FD97
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Mar 2021 22:44:19 +0100 (CET)
Received: from localhost ([::1]:48130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIeig-000274-1H
	for lists+qemu-devel@lfdr.de; Sat, 06 Mar 2021 16:44:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lIebE-00070r-Fu
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 16:36:36 -0500
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:44607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lIeb9-0002yB-Tq
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 16:36:36 -0500
Received: by mail-pf1-x433.google.com with SMTP id t29so4532769pfg.11
 for <qemu-devel@nongnu.org>; Sat, 06 Mar 2021 13:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RiZhAqk94IR59YM6JHo6AIRSs7mF45dtttOIiGxjJYA=;
 b=y/1tpW/uUerCLzXplE1PCE1vZikLTfUkQdnZ/TVreJRyqv4Bbo9mwwuTCEqI9M8CMS
 oAvKagOz7l1VkwVk66yW5LShvXauSQYIFwXlMwrYqd3iAJTKaLOz5QcmvUkVupsV6nSZ
 LJvJG9g/cGxv6Jji4VJyPx8mOI2qkHIvXNFhDKwSFJYMmaMyhaasx5OxegH3KGqO/fhT
 4mB+ILKxIcBWN/M+BHBM5juBv7YNiVLcJ8VJ9miL4aS2ei7Myhhyb0JblLSH9VVyMj+L
 xQ+1isM+0uPsTsWwC0YMi96Fsqx9MBL87eCsE5jYl4q0gB+EQtFxSYJEGlQ1GxIs2vy5
 cOAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RiZhAqk94IR59YM6JHo6AIRSs7mF45dtttOIiGxjJYA=;
 b=fZP8O70Bocpxg07w8tdWrK6W7MAkf0VaSv8WTFmyqPR0JtwpwdZg3KNzQN8afewXUa
 gpWcOo4WS1XlxSOEacgRvILOk+4/8HccTTj20zHruV8hsxrlOJzodCmLQIOr3xZEUL5M
 Pf85fVwUmrhEUhH7TI/MPdjUiYwzG4V61sJv3FGANfSW/HXy9una57etrB+TDt/VXrVf
 TKfXY0xOryzIk/Hr1JpeSGW891naMwWProw/4q7HbO8ioOR1qT3JChy9VT1rn+g0aZ3e
 CHAoaTufp9GBiQttlrhxEJ2616ThqG/nVcFaISfqATN5fYbpnZiCxQNMUs9SMfNQRxAI
 SmBw==
X-Gm-Message-State: AOAM531A4qZUtdqkbO1eXlDPYl3xEOvuSpN3t1SY8jvVBl5PBFSYWiCS
 EjT9eHAoBQE5ww9FqE0sImKOS5qjH4kbXg==
X-Google-Smtp-Source: ABdhPJwkdHv3lKL8RlLS/NYRp52M+1jh1NrcJMmKD7hGIMSlL0gxI2MEdRuzPwQqBt0RSfgYfl6tvg==
X-Received: by 2002:a63:1d26:: with SMTP id d38mr14705633pgd.385.1615066590593; 
 Sat, 06 Mar 2021 13:36:30 -0800 (PST)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id r30sm6365616pgu.86.2021.03.06.13.36.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Mar 2021 13:36:30 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/27] tcg/tci: Remove tci_read_r16s
Date: Sat,  6 Mar 2021 13:36:01 -0800
Message-Id: <20210306213613.85168-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210306213613.85168-1-richard.henderson@linaro.org>
References: <20210306213613.85168-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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

Use explicit casts for ext16s opcodes.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 26 ++++----------------------
 1 file changed, 4 insertions(+), 22 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 2440da1746..8b91e6efc3 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -57,13 +57,6 @@ static tcg_target_ulong tci_read_reg(const tcg_target_ulong *regs, TCGReg index)
     return regs[index];
 }
 
-#if TCG_TARGET_HAS_ext16s_i32 || TCG_TARGET_HAS_ext16s_i64
-static int16_t tci_read_reg16s(const tcg_target_ulong *regs, TCGReg index)
-{
-    return (int16_t)tci_read_reg(regs, index);
-}
-#endif
-
 #if TCG_TARGET_REG_BITS == 64
 static int32_t tci_read_reg32s(const tcg_target_ulong *regs, TCGReg index)
 {
@@ -152,17 +145,6 @@ tci_read_r(const tcg_target_ulong *regs, const uint8_t **tb_ptr)
     return value;
 }
 
-#if TCG_TARGET_HAS_ext16s_i32 || TCG_TARGET_HAS_ext16s_i64
-/* Read indexed register (16 bit signed) from bytecode. */
-static int16_t tci_read_r16s(const tcg_target_ulong *regs,
-                             const uint8_t **tb_ptr)
-{
-    int16_t value = tci_read_reg16s(regs, **tb_ptr);
-    *tb_ptr += 1;
-    return value;
-}
-#endif
-
 /* Read indexed register (32 bit) from bytecode. */
 static uint32_t tci_read_r32(const tcg_target_ulong *regs,
                              const uint8_t **tb_ptr)
@@ -671,8 +653,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 #if TCG_TARGET_HAS_ext16s_i32
         case INDEX_op_ext16s_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_r16s(regs, &tb_ptr);
-            tci_write_reg(regs, t0, t1);
+            t1 = tci_read_r(regs, &tb_ptr);
+            tci_write_reg(regs, t0, (int16_t)t1);
             break;
 #endif
 #if TCG_TARGET_HAS_ext8u_i32
@@ -886,8 +868,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 #if TCG_TARGET_HAS_ext16s_i64
         case INDEX_op_ext16s_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r16s(regs, &tb_ptr);
-            tci_write_reg(regs, t0, t1);
+            t1 = tci_read_r(regs, &tb_ptr);
+            tci_write_reg(regs, t0, (int16_t)t1);
             break;
 #endif
 #if TCG_TARGET_HAS_ext16u_i64
-- 
2.25.1


