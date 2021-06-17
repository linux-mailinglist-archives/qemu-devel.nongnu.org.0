Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8E33ABAFA
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 19:56:31 +0200 (CEST)
Received: from localhost ([::1]:41120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltwFi-0006jj-LK
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 13:56:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltw8x-0001pB-FQ
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 13:49:31 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:43888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltw8v-0004Ry-Pw
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 13:49:31 -0400
Received: by mail-wr1-x431.google.com with SMTP id r9so7710824wrz.10
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 10:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3cJHVP7PCPcnG9dBbz0rAw/mtV+g+hts+a+OLq73puU=;
 b=MNGqGwHoW/vP+zUZlny2AdixPoU5jkX2uqj7dg2S8MbGCPLjhwB1oGl4/r+t7nmGz4
 2R2B4ekeBliFsDBNGhCsl7PpciPvCbT7+VyyzPtu0NEkRLS3Xxih2XjdR+ph5fRBLJS9
 1j1xVbz61G7ZXe3Rwc6NfyXvmRgCCuyeGY8S/vdfw0tYmOn7a0pyw/9fvwCopK8QbNMJ
 XOjPNfJqimxhfhkUpuptJcuMTj96br67D9+7gEWuRY3PB1RNr1iC5lOvgFSsoHUajuQs
 G8dJtgTIBEw4K2f+RHCz2WWyKPVk3gCbV3pA+fRXwvzFWz165k/54QRktXiaqEweropI
 ZbZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=3cJHVP7PCPcnG9dBbz0rAw/mtV+g+hts+a+OLq73puU=;
 b=P2OOBuYDwSkB+Ax0eqLqwSWZ6YRqQgW/1gyllyRZFd4Jm8x/78swaFailCv08f0kuK
 9PmPn0n3TAGiOTiY8JYb49YusoLk9EGOsyWvYjCAdAkQ0dDahYi2wDBI3vwrq2QMcWMP
 ybWaye+4Z4aJnIozPk/l1m00JlqwqkDbw1mz5GLW6xXU752LjWPTIBquMhLa+O+Oj0JW
 5Qa+bdlkaYdSjSVe06x+VAXsOoDNqlXzGbKw5dlSuW94rQxHE1tkw/6Xv7xFZr8smWSh
 +k6yFInHaQH9spfNKGjGryb2c3YMnCKs9UUzCpM/C/ryOCFPvMECO84WAOH5QenRKJSO
 d29Q==
X-Gm-Message-State: AOAM5300xNdroHA6CyIuqjD+VqBybBdbKAZSS4rh7hUNfgoLzb2fw2rZ
 QAjaNkwm+JSEOPhYDmzxwQlTnasQ1g8+jQ==
X-Google-Smtp-Source: ABdhPJzWelY9HMhfn643SsMvxAX4n9qDHz2Mbx7qkmJty595B5lkPhsXEnnXRIVku4YDaSLaIYhtng==
X-Received: by 2002:a5d:6882:: with SMTP id h2mr6080999wru.243.1623952168323; 
 Thu, 17 Jun 2021 10:49:28 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id e17sm6947404wre.79.2021.06.17.10.49.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 10:49:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/4] target/mips: Add declarations for generic DSP TCG helpers
Date: Thu, 17 Jun 2021 19:49:07 +0200
Message-Id: <20210617174907.2904067-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617174907.2904067-1-f4bug@amsat.org>
References: <20210617174907.2904067-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To be able to extract the DSP ASE translation routines to
different source file, declare few TCG helpers, MASK_SPECIAL3
and a DSP register in "translate.h".

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/translate.h |  7 +++++++
 target/mips/tcg/translate.c | 10 +++++-----
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/target/mips/tcg/translate.h b/target/mips/tcg/translate.h
index c25fad597d5..c6f57de7e0d 100644
--- a/target/mips/tcg/translate.h
+++ b/target/mips/tcg/translate.h
@@ -52,6 +52,8 @@ typedef struct DisasContext {
 /* MIPS major opcodes */
 #define MASK_OP_MAJOR(op)   (op & (0x3F << 26))
 
+#define MASK_SPECIAL3(op)   (MASK_OP_MAJOR(op) | (op & 0x3F))
+
 #define OPC_CP1 (0x11 << 26)
 
 /* Coprocessor 1 (rs field) */
@@ -131,6 +133,10 @@ void check_cp1_64bitmode(DisasContext *ctx);
 void check_cp1_registers(DisasContext *ctx, int regs);
 void check_cop1x(DisasContext *ctx);
 
+void check_dsp(DisasContext *ctx);
+void check_dsp_r2(DisasContext *ctx);
+void check_dsp_r3(DisasContext *ctx);
+
 void gen_base_offset_addr(DisasContext *ctx, TCGv addr, int base, int offset);
 void gen_move_low32(TCGv ret, TCGv_i64 arg);
 void gen_move_high32(TCGv ret, TCGv_i64 arg);
@@ -168,6 +174,7 @@ extern TCGv cpu_HI[MIPS_DSP_ACC], cpu_LO[MIPS_DSP_ACC];
 extern TCGv_i32 fpu_fcr0, fpu_fcr31;
 extern TCGv_i64 fpu_f64[32];
 extern TCGv bcond;
+extern TCGv cpu_dspctrl;
 
 #define LOG_DISAS(...)                                                        \
     do {                                                                      \
diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 7b173e2bd2f..97ef816e95f 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -374,7 +374,6 @@ enum {
 };
 
 /* Special3 opcodes */
-#define MASK_SPECIAL3(op)           (MASK_OP_MAJOR(op) | (op & 0x3F))
 
 enum {
     OPC_EXT      = 0x00 | OPC_SPECIAL3,
@@ -1227,8 +1226,9 @@ TCGv cpu_gpr[32], cpu_PC;
  */
 TCGv_i64 cpu_gpr_hi[32];
 TCGv cpu_HI[MIPS_DSP_ACC], cpu_LO[MIPS_DSP_ACC];
-static TCGv cpu_dspctrl, btarget;
+static TCGv btarget;
 TCGv bcond;
+TCGv cpu_dspctrl;
 static TCGv cpu_lladdr, cpu_llval;
 static TCGv_i32 hflags;
 TCGv_i32 fpu_fcr0, fpu_fcr31;
@@ -1633,7 +1633,7 @@ void check_cp1_registers(DisasContext *ctx, int regs)
  * Verify that the processor is running with DSP instructions enabled.
  * This is enabled by CP0 Status register MX(24) bit.
  */
-static inline void check_dsp(DisasContext *ctx)
+void check_dsp(DisasContext *ctx)
 {
     if (unlikely(!(ctx->hflags & MIPS_HFLAG_DSP))) {
         if (ctx->insn_flags & ASE_DSP) {
@@ -1644,7 +1644,7 @@ static inline void check_dsp(DisasContext *ctx)
     }
 }
 
-static inline void check_dsp_r2(DisasContext *ctx)
+void check_dsp_r2(DisasContext *ctx)
 {
     if (unlikely(!(ctx->hflags & MIPS_HFLAG_DSP_R2))) {
         if (ctx->insn_flags & ASE_DSP) {
@@ -1655,7 +1655,7 @@ static inline void check_dsp_r2(DisasContext *ctx)
     }
 }
 
-static inline void check_dsp_r3(DisasContext *ctx)
+void check_dsp_r3(DisasContext *ctx)
 {
     if (unlikely(!(ctx->hflags & MIPS_HFLAG_DSP_R3))) {
         if (ctx->insn_flags & ASE_DSP) {
-- 
2.31.1


