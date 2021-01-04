Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 367072E9FDC
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jan 2021 23:14:55 +0100 (CET)
Received: from localhost ([::1]:51082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwY7q-0008LI-5L
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 17:14:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwY5I-0006Xp-To
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 17:12:22 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:43708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwY5H-0007pW-Bz
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 17:12:16 -0500
Received: by mail-wr1-x42f.google.com with SMTP id y17so33638013wrr.10
 for <qemu-devel@nongnu.org>; Mon, 04 Jan 2021 14:12:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Mf1NXGoh/iaVlyRR50VUiVMtSin249waJuI6gSQgqVE=;
 b=DM7inBfD0ZeQVZvEtUgTlMRGd524a1scT+jy3CY95rtTR+sX3H5MvOPXYYuZ3lfdsg
 pK3UoqFyp72AQ7gaZjbGmlcHBEadM+KTStVmalT8PVdfHqQHfpv3/KAZLMatKwK29G74
 WDswOMqefSDOeuV1H274rc8W4aalI3OWjjNZpPDmN3mK7SJzEWgQsiYISEF2p5tenKlr
 5WsD8tBDAtdBefnF7AUh1rNEqO+ET0ly2EtMAxW2gwgehQAYoEnDAOl5XhwqI3bCb/TL
 /G44rN+SqhI+lV0ME66aA5ome6xNLC/9gCElU+xB+FyXcf4eIAMllbdgF1P9hQGdBkL1
 oIdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Mf1NXGoh/iaVlyRR50VUiVMtSin249waJuI6gSQgqVE=;
 b=VAvIEU6Bi5lNfzAIBN4SkLoi3Fpukw0JoA0xYgsBjOYW1zAyNYnq82F74jkcR3ik0V
 GyJKcVSSB0F7BReFzP5JTIcIq4ndw1bYfKhHypRLq6NrL8AuYiQgKSLJxZaU49MG1Q+y
 dZGM3R+dAnxk99ug8NdZZrjCdxrP75I0TlPRAtewPz5SOB1poDgQ48zkl8YcSNAeQ6LA
 ytNfBxsyE2bIzw+t0C60ob2eh4t3elw8s65I8xa9GfyMiX3j2Wk26FQNWPyv+jih6/bO
 FB4hRPdJcpt4hM8Nu87vRm2hiqL1KFVrw1yj+8e8TOwuX2BRfe5LbLHPHlbWJXaDXZqJ
 a0EQ==
X-Gm-Message-State: AOAM5311BhTqQpUYCQFr7bbelXxfuz+2kEBRaAexBwnvvIwPEWo1N1Dx
 EKD3lzUSsgP2uT5nB7/3HkGVkjU5HJI=
X-Google-Smtp-Source: ABdhPJxwmS9rZkEH6IGUSP5JK/jfE1ZrxdgxLd2vFraY1LTgj81LEL+G79Ud2mLAmUtclbKVmrYP9Q==
X-Received: by 2002:a5d:4a44:: with SMTP id v4mr84457957wrs.106.1609798333853; 
 Mon, 04 Jan 2021 14:12:13 -0800 (PST)
Received: from x1w.redhat.com (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id k10sm87981974wrq.38.2021.01.04.14.12.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jan 2021 14:12:13 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 03/15] target/mips/mips-defs: Rename CPU_MIPSxx Release 1
 as CPU_MIPSxxR1
Date: Mon,  4 Jan 2021 23:11:42 +0100
Message-Id: <20210104221154.3127610-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210104221154.3127610-1-f4bug@amsat.org>
References: <20210104221154.3127610-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
 Paul Burton <paulburton@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

'CPU_MIPS32' and 'CPU_MIPS64' definitions concern CPUs implementing
the "Release 1" ISA. Rename it with the 'R1' suffix, as the other
CPU definitions do.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/mips-defs.h          |  8 ++++----
 target/mips/translate_init.c.inc | 14 +++++++-------
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/target/mips/mips-defs.h b/target/mips/mips-defs.h
index 48544ba73b4..1630ae20d59 100644
--- a/target/mips/mips-defs.h
+++ b/target/mips/mips-defs.h
@@ -72,12 +72,12 @@
 #define CPU_LOONGSON2F  (CPU_MIPS3 | INSN_LOONGSON2F | ASE_LMMI)
 
 /* MIPS Technologies "Release 1" */
-#define CPU_MIPS32      (CPU_MIPS2 | ISA_MIPS32)
-#define CPU_MIPS64      (CPU_MIPS5 | CPU_MIPS32 | ISA_MIPS64)
+#define CPU_MIPS32R1    (CPU_MIPS2 | ISA_MIPS32)
+#define CPU_MIPS64R1    (CPU_MIPS5 | CPU_MIPS32R1 | ISA_MIPS64)
 
 /* MIPS Technologies "Release 2" */
-#define CPU_MIPS32R2    (CPU_MIPS32 | ISA_MIPS32R2)
-#define CPU_MIPS64R2    (CPU_MIPS64 | CPU_MIPS32R2 | ISA_MIPS64R2)
+#define CPU_MIPS32R2    (CPU_MIPS32R1 | ISA_MIPS32R2)
+#define CPU_MIPS64R2    (CPU_MIPS64R1 | CPU_MIPS32R2 | ISA_MIPS64R2)
 
 /* MIPS Technologies "Release 3" */
 #define CPU_MIPS32R3    (CPU_MIPS32R2 | ISA_MIPS32R3)
diff --git a/target/mips/translate_init.c.inc b/target/mips/translate_init.c.inc
index f72fee3b40a..427da84768b 100644
--- a/target/mips/translate_init.c.inc
+++ b/target/mips/translate_init.c.inc
@@ -72,7 +72,7 @@ const mips_def_t mips_defs[] =
         .CP0_Status_rw_bitmask = 0x1278FF17,
         .SEGBITS = 32,
         .PABITS = 32,
-        .insn_flags = CPU_MIPS32,
+        .insn_flags = CPU_MIPS32R1,
         .mmu_type = MMU_TYPE_R4000,
     },
     {
@@ -94,7 +94,7 @@ const mips_def_t mips_defs[] =
         .CP0_Status_rw_bitmask = 0x1258FF17,
         .SEGBITS = 32,
         .PABITS = 32,
-        .insn_flags = CPU_MIPS32 | ASE_MIPS16,
+        .insn_flags = CPU_MIPS32R1 | ASE_MIPS16,
         .mmu_type = MMU_TYPE_FMT,
     },
     {
@@ -114,7 +114,7 @@ const mips_def_t mips_defs[] =
         .CP0_Status_rw_bitmask = 0x1278FF17,
         .SEGBITS = 32,
         .PABITS = 32,
-        .insn_flags = CPU_MIPS32,
+        .insn_flags = CPU_MIPS32R1,
         .mmu_type = MMU_TYPE_R4000,
     },
     {
@@ -134,7 +134,7 @@ const mips_def_t mips_defs[] =
         .CP0_Status_rw_bitmask = 0x1258FF17,
         .SEGBITS = 32,
         .PABITS = 32,
-        .insn_flags = CPU_MIPS32 | ASE_MIPS16,
+        .insn_flags = CPU_MIPS32R1 | ASE_MIPS16,
         .mmu_type = MMU_TYPE_FMT,
     },
     {
@@ -550,7 +550,7 @@ const mips_def_t mips_defs[] =
         .CP0_Status_rw_bitmask = 0x12F8FFFF,
         .SEGBITS = 42,
         .PABITS = 36,
-        .insn_flags = CPU_MIPS64,
+        .insn_flags = CPU_MIPS64R1,
         .mmu_type = MMU_TYPE_R4000,
     },
     {
@@ -576,7 +576,7 @@ const mips_def_t mips_defs[] =
         .CP1_fcr31_rw_bitmask = 0xFF83FFFF,
         .SEGBITS = 42,
         .PABITS = 36,
-        .insn_flags = CPU_MIPS64,
+        .insn_flags = CPU_MIPS64R1,
         .mmu_type = MMU_TYPE_R4000,
     },
     {
@@ -605,7 +605,7 @@ const mips_def_t mips_defs[] =
         .CP1_fcr31_rw_bitmask = 0xFF83FFFF,
         .SEGBITS = 40,
         .PABITS = 36,
-        .insn_flags = CPU_MIPS64 | ASE_MIPS3D,
+        .insn_flags = CPU_MIPS64R1 | ASE_MIPS3D,
         .mmu_type = MMU_TYPE_R4000,
     },
     {
-- 
2.26.2


