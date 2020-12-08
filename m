Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA872D3583
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 22:45:20 +0100 (CET)
Received: from localhost ([::1]:33030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmknP-00048s-Rk
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 16:45:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmjjb-0004A4-E3
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 15:37:19 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:46273)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmjjX-0008Db-6V
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 15:37:18 -0500
Received: by mail-ej1-x631.google.com with SMTP id bo9so26452306ejb.13
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 12:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=neFYhcQMdHuG2sfFjuVPNAoEvhuCNcKd6HTd7z8KqTU=;
 b=qv7l17mMhHNe/XReIKS0+pjGYq0hD2w0JeltHma0huUW5X6K9+9IL2yF7J6HsSPHNQ
 8YIAtBQ9uXJ0FlQfRrA4QmkolOCp7rtwQQFO4YGkLW+C4NqDxE3yjGFYS+OH3s0ZUxrx
 U91DdRi/UzJ1RCpQ1f/lmvqzXyZT936l3EWY/Y8hm5EAl1sJX/9Uqw1Qo1Gyf4QSCxmY
 XTJQA23wTwJ3H0pw7bQ58zFyUAS8nc1Rte5i29dsbfHPik0XV3hNNDClM6xa+OIQdjVr
 nt+SJyXMcXc3gZ+ngHDxqfh2ayhf+J/n9AulhKF2/hd8pnEMyRWqBymme1FZXysL/Iku
 w2ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=neFYhcQMdHuG2sfFjuVPNAoEvhuCNcKd6HTd7z8KqTU=;
 b=g0Po6pn7RC4aliDOQMJtyr6/MY6Yk0qoKTVtkejh6uAeAj923bKG/AP5Q8+P9DZgEF
 ihgc6lAx+YavGC2RoIXdYuoY2gOhGBH/uhC+QQN7pC/+pLW8BNMt1jBCq3wAX0pvXvz1
 J8cHvL66X6ImKMeitz419/XVJXBmhvbje+cmMaMIF72xsuDT/DOt9BjqO7SQbybHKQsi
 bJjDBor8/NEJy13VLo8xuqnyxkFGn6j3eDiKjO/gmWv5Co+UGQ+uUZqE02VLLslYdkBU
 uHuuAnOOKs4kQsIWAW8PUnoe20kdKDHXXPbZ39upOZpYiLqJ1UWMhco3hp0ZhfACznme
 Xkrg==
X-Gm-Message-State: AOAM531rGEJ/LghpB0MHsii6RuSNWASX0MYRf0LE4yK+FbYW4dHz+Wy0
 74UAH+/E9XWwfHeOj+4Ur2zHNDxqfnI=
X-Google-Smtp-Source: ABdhPJyh48NdSItkeC+w0zzRvT9CO8jwaalakyYIAbH33A9K8dU4fY6O/aE3IKON5Sko6OUVcpXTcQ==
X-Received: by 2002:a17:906:94d4:: with SMTP id
 d20mr24535027ejy.475.1607459832383; 
 Tue, 08 Dec 2020 12:37:12 -0800 (PST)
Received: from x1w.redhat.com (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id pk19sm16810515ejb.32.2020.12.08.12.37.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 12:37:11 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/13] !fixup "target/mips/translate: Add declarations for
 generic code"
Date: Tue,  8 Dec 2020 21:36:52 +0100
Message-Id: <20201208203704.243704-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201208203704.243704-1-f4bug@amsat.org>
References: <20201208203704.243704-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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

Missed in previous "Convert MSA to decodetree" series.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.h | 8 +++++++-
 target/mips/translate.c | 4 ++--
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/target/mips/translate.h b/target/mips/translate.h
index cba28f49753..da88387418c 100644
--- a/target/mips/translate.h
+++ b/target/mips/translate.h
@@ -55,11 +55,15 @@ typedef struct DisasContext {
 void generate_exception_end(DisasContext *ctx, int excp);
 void gen_reserved_instruction(DisasContext *ctx);
 void check_insn(DisasContext *ctx, uint64_t flags);
-void gen_base_offset_addr(DisasContext *ctx, TCGv addr, int base, int offset);
+#ifdef TARGET_MIPS64
+void check_mips_64(DisasContext *ctx);
+#endif
 
+void gen_base_offset_addr(DisasContext *ctx, TCGv addr, int base, int offset);
 void gen_load_gpr(TCGv t, int reg);
 void gen_store_gpr(TCGv t, int reg);
 
+extern TCGv cpu_gpr[32], cpu_PC;
 extern TCGv bcond;
 
 #define LOG_DISAS(...)                                                        \
@@ -82,6 +86,8 @@ extern TCGv bcond;
 
 /* MSA */
 void msa_translate_init(void);
+
+/* decodetree generated */
 bool decode_msa32(DisasContext *ctx, uint32_t insn);
 
 #endif
diff --git a/target/mips/translate.c b/target/mips/translate.c
index 41c0b59a473..3c7307233c9 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -2187,7 +2187,7 @@ enum {
 };
 
 /* global register indices */
-static TCGv cpu_gpr[32], cpu_PC;
+TCGv cpu_gpr[32], cpu_PC;
 static TCGv cpu_HI[MIPS_DSP_ACC], cpu_LO[MIPS_DSP_ACC];
 static TCGv cpu_dspctrl, btarget;
 TCGv bcond;
@@ -2728,7 +2728,7 @@ static inline void check_ps(DisasContext *ctx)
  * This code generates a "reserved instruction" exception if 64-bit
  * instructions are not enabled.
  */
-static inline void check_mips_64(DisasContext *ctx)
+void check_mips_64(DisasContext *ctx)
 {
     if (unlikely(!(ctx->hflags & MIPS_HFLAG_64))) {
         generate_exception_end(ctx, EXCP_RI);
-- 
2.26.2


