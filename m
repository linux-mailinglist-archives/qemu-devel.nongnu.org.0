Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D8D2F3BB4
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 22:05:31 +0100 (CET)
Received: from localhost ([::1]:36188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzQr4-0007gh-9b
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 16:05:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzQnu-00043P-IE
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 16:02:14 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:44590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzQns-0007sR-P7
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 16:02:14 -0500
Received: by mail-wr1-x430.google.com with SMTP id w5so3921881wrm.11
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 13:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+QdnWeeWowM8n1JNeLbHcjqIuTxoeMtPbLfQb8+zPm8=;
 b=TLQ1/h3rE8KxzNHZBPmQ/fnOOISfg8okPY4C1+X+ah17vHkdW2A4LeqEcZhNSbAI+G
 yHN7G+MbJDgjSTBLd4D0bcMsIQr3+fWHGskSYJWwjfhJmckgTtCTwcGEqNfma0R+FoHF
 ZPQjT3+dXDglfYkivVCGvtpX6vTyFlhLD7UnjZLsZPVMdVebnMzKnfxnYRmn5UgfrWF1
 1BiQ9CoVHIx2KuD29Jx8YU5WkPoluzk1f84p6HsZFRIs7oCkWKAfGcaEr9YIOgCbGUe6
 uR1bYzRLSnMqjZqmlSCqrbqW9k2SitXWvdHjj70hV8HxzWs8AH/ojTbksB9vaU7H1rnO
 UoFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=+QdnWeeWowM8n1JNeLbHcjqIuTxoeMtPbLfQb8+zPm8=;
 b=V8JUs+eDcdmNKGGowlXDvSLw5yK3Sbg4DsUDasW2JDZfzVLpZTlJ0rpas06Jvhid02
 0ofmg98SaE7RSHbS1lk92pn+OE7Jex4neVLujyI89fFUz4w0yUBhSNGvZiqHmDFCd6f0
 VEzbXn0pALhkVIfbtoXOnIS60G4B4CQKbNRe6fORvZ0652+9G/aBGyxJPAynUULED2oD
 X0v82CkDD6kLMcHl7rgjKRR3VaR4j6+g/dgp7jWnhoLrFqUp/rM0eB2npuUztadpO5ye
 jj+XfRY0eHPoK5MvDVTbwAbRTo2YPaxWDwH1LmYM3VRnpHa8OVCTSwiJzRAJEkkLL9VZ
 ritg==
X-Gm-Message-State: AOAM532AUWjrRXFy7gatAucRF6t1NL4F4PfwdN3DvD/7HNJ7bWAY1lAA
 slFDLg2z7JXTYZEhuOtoOUZAJZyK+8A=
X-Google-Smtp-Source: ABdhPJzBCBdhNkxg15ZYGTmNJD9EM95DNfukzwBx9e/11Ij+KNE0H71hqG/AzpuT04ZQ7cUwY/JwFQ==
X-Received: by 2002:a5d:60ca:: with SMTP id x10mr693195wrt.242.1610485331204; 
 Tue, 12 Jan 2021 13:02:11 -0800 (PST)
Received: from x1w.redhat.com (190.red-83-57-173.dynamicip.rima-tde.net.
 [83.57.173.190])
 by smtp.gmail.com with ESMTPSA id m82sm5648226wmf.29.2021.01.12.13.02.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 13:02:10 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] target/mips: Remove vendor specific CPU definitions
Date: Tue, 12 Jan 2021 22:01:52 +0100
Message-Id: <20210112210152.2072996-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210112210152.2072996-1-f4bug@amsat.org>
References: <20210112210152.2072996-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
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
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Vendor specific CPU definitions are not very useful. Use the
ISA definitions instead, which are more helpful when looking
at the various CPU definitions.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/mips-defs.h    |  5 -----
 target/mips/cpu-defs.c.inc | 12 +++++++-----
 2 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/target/mips/mips-defs.h b/target/mips/mips-defs.h
index 3704db85532..0a12d982a72 100644
--- a/target/mips/mips-defs.h
+++ b/target/mips/mips-defs.h
@@ -60,9 +60,6 @@
 #define CPU_MIPS3       (CPU_MIPS2 | ISA_MIPS3)
 #define CPU_MIPS4       (CPU_MIPS3 | ISA_MIPS4)
 #define CPU_MIPS5       (CPU_MIPS4 | ISA_MIPS5)
-#define CPU_VR54XX      (CPU_MIPS4 | INSN_VR54XX)
-#define CPU_LOONGSON2E  (CPU_MIPS3 | INSN_LOONGSON2E)
-#define CPU_LOONGSON2F  (CPU_MIPS3 | INSN_LOONGSON2F | ASE_LMMI)
 
 #define CPU_MIPS64      (ISA_MIPS3)
 
@@ -86,8 +83,6 @@
 #define CPU_MIPS32R6    (CPU_MIPS32R5 | ISA_MIPS_R6)
 #define CPU_MIPS64R6    (CPU_MIPS64R5 | CPU_MIPS32R6)
 
-#define CPU_LOONGSON3A  (CPU_MIPS64R2 | INSN_LOONGSON3A | ASE_LMMI | ASE_LEXT)
-
 /*
  * Strictly follow the architecture standard:
  * - Disallow "special" instruction handling for PMON/SPIM.
diff --git a/target/mips/cpu-defs.c.inc b/target/mips/cpu-defs.c.inc
index 9f7bac87932..e03b2a998cd 100644
--- a/target/mips/cpu-defs.c.inc
+++ b/target/mips/cpu-defs.c.inc
@@ -531,7 +531,7 @@ const mips_def_t mips_defs[] =
         .CP1_fcr31_rw_bitmask = 0xFF83FFFF,
         .SEGBITS = 40,
         .PABITS = 32,
-        .insn_flags = CPU_VR54XX,
+        .insn_flags = CPU_MIPS4 | INSN_VR54XX,
         .mmu_type = MMU_TYPE_R4000,
     },
     {
@@ -781,7 +781,7 @@ const mips_def_t mips_defs[] =
         .CP1_fcr31_rw_bitmask = 0xFF83FFFF,
         .SEGBITS = 40,
         .PABITS = 40,
-        .insn_flags = CPU_LOONGSON2E,
+        .insn_flags = CPU_MIPS3 | INSN_LOONGSON2E,
         .mmu_type = MMU_TYPE_R4000,
     },
     {
@@ -801,7 +801,7 @@ const mips_def_t mips_defs[] =
         .CP1_fcr31_rw_bitmask = 0xFF83FFFF,
         .SEGBITS = 40,
         .PABITS = 40,
-        .insn_flags = CPU_LOONGSON2F,
+        .insn_flags = CPU_MIPS3 | INSN_LOONGSON2F | ASE_LMMI,
         .mmu_type = MMU_TYPE_R4000,
     },
     {
@@ -830,7 +830,8 @@ const mips_def_t mips_defs[] =
         .CP1_fcr31_rw_bitmask = 0xFF83FFFF,
         .SEGBITS = 42,
         .PABITS = 48,
-        .insn_flags = CPU_LOONGSON3A,
+        .insn_flags = CPU_MIPS64R2 | INSN_LOONGSON3A |
+                      ASE_LMMI | ASE_LEXT,
         .mmu_type = MMU_TYPE_R4000,
     },
     {
@@ -887,7 +888,8 @@ const mips_def_t mips_defs[] =
         .CP1_fcr31_rw_bitmask = 0xFF83FFFF,
         .SEGBITS = 48,
         .PABITS = 48,
-        .insn_flags = CPU_LOONGSON3A,
+        .insn_flags = CPU_MIPS64R2 | INSN_LOONGSON3A |
+                      ASE_LMMI | ASE_LEXT,
         .mmu_type = MMU_TYPE_R4000,
     },
     {
-- 
2.26.2


