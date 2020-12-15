Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1192DB6EE
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 00:11:02 +0100 (CET)
Received: from localhost ([::1]:38860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpJTA-0002MS-3o
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 18:11:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpJHS-0003tb-Az
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 17:58:54 -0500
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:36114)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpJHQ-0003mt-O9
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 17:58:53 -0500
Received: by mail-ej1-x642.google.com with SMTP id lt17so30057622ejb.3
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 14:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kJqpgT5cCXxYnWxKZzDjzqN8ClALR+aWkwE4xRgW0a0=;
 b=gTO8VbKJ+idG2rHsFWBqs6EjX1k4dH114g1aphDFM3hLMNDb/c/bqfhzs1q4fu1A6U
 QSUJQQ6CFv/N4acZmCNDJAwZ+Wl2IXvvTU5/Sgws6RvECY3y8X3EUFjrHZGVSOPGuvzh
 CdTcqTuGtjy1lhsBqiaWfj23F0E1jCQHjQQcuO+3VVgS0GZ/6MhHuNFSXZVNlCxcgOqQ
 MRF22jmEa6JnjddJrcDSW00rYOY1mUjoN4Dp8sHLiKNQ+V8GviQ1i0Kcfbjvwo3SAjpX
 sYp2tadnX+jkOmRCQuBlF9syseKhN8B52YsnTgHdvY1mVbq+6g3JYJ9LzkwzdMjY+GiK
 6yCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=kJqpgT5cCXxYnWxKZzDjzqN8ClALR+aWkwE4xRgW0a0=;
 b=BQ6eufVX1Gl6zxdYB4ooxkX9qIXl/uvywBoLjdXOPsstclHlkP5iGrawb+Yg07mgYs
 7l8Dta+mpRWTHr/zW6jLfJ2tr04TPe5xL/uCH5HRhZMUsX3peQeF0Gm4BSEjxi6cO/UF
 /1e2TMmS2StJmPUvpHK42hHw3vMopOBts6nXzG9BcgV9qXXLQC8AlScVqGMB2CRd4bH9
 PGvnj0bqNV/V2jeOfEWNcP2XgbJLDFMvl6TnM4LBJ0xy93T5O8LzZ+1bFUQ+KSXra4Iq
 g/ZRQ4jfr5tcWtcIXJW2ipjdHPhWYcuvYr5n8VkiyINHZQOcR/HtVXYosatMj4TzTOa2
 EHjQ==
X-Gm-Message-State: AOAM531pbcq3v3KWLbGKX8MflfzdPwqRQwvoZWD/EisEscqpQeSs9kbu
 mAwjDzJQb1ipU0/P8nr/GFo=
X-Google-Smtp-Source: ABdhPJw6mJBdcLNfKfj0SBcmVGdXRaRrc1mUEGLeCBa59IbS65+5glqmmr1YxvxsTtTDqdGRw3btTQ==
X-Received: by 2002:a17:906:3a84:: with SMTP id
 y4mr28571019ejd.425.1608073131484; 
 Tue, 15 Dec 2020 14:58:51 -0800 (PST)
Received: from x1w.redhat.com (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id bo20sm19594936edb.1.2020.12.15.14.58.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 14:58:50 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Richard Henderson <richard.henderson@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PATCH v2 09/24] target/mips: Alias MSA vector registers on FPU
 scalar registers
Date: Tue, 15 Dec 2020 23:57:42 +0100
Message-Id: <20201215225757.764263-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201215225757.764263-1-f4bug@amsat.org>
References: <20201215225757.764263-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x642.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commits 863f264d10f ("add msa_reset(), global msa register") and
cb269f273fd ("fix multiple TCG registers covering same data")
removed the FPU scalar registers and replaced them by aliases to
the MSA vector registers.

It is not very clear to have FPU registers displayed with MSA
register names, even if MSA ASE is not present.

Instead of aliasing FPU registers to the MSA ones (even when MSA
is absent), we now alias the MSA ones to the FPU ones (only when
MSA is present).

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index 02ea184f9a3..9b5b551b616 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -31560,16 +31560,20 @@ void mips_tcg_init(void)
                                         offsetof(CPUMIPSState,
                                                  active_tc.gpr[i]),
                                         regnames[i]);
-
     for (i = 0; i < 32; i++) {
         int off = offsetof(CPUMIPSState, active_fpu.fpr[i].wr.d[0]);
-        msa_wr_d[i * 2] =
-                tcg_global_mem_new_i64(cpu_env, off, msaregnames[i * 2]);
+
+        fpu_f64[i] = tcg_global_mem_new_i64(cpu_env, off, fregnames[i]);
+    }
+    /* MSA */
+    for (i = 0; i < 32; i++) {
+        int off = offsetof(CPUMIPSState, active_fpu.fpr[i].wr.d[0]);
+
         /*
-         * The scalar floating-point unit (FPU) registers are mapped on
-         * the MSA vector registers.
+         * The MSA vector registers are mapped on the
+         * scalar floating-point unit (FPU) registers.
          */
-        fpu_f64[i] = msa_wr_d[i * 2];
+        msa_wr_d[i * 2] = fpu_f64[i];
         off = offsetof(CPUMIPSState, active_fpu.fpr[i].wr.d[1]);
         msa_wr_d[i * 2 + 1] =
                 tcg_global_mem_new_i64(cpu_env, off, msaregnames[i * 2 + 1]);
-- 
2.26.2


