Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A92852F6684
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 17:58:38 +0100 (CET)
Received: from localhost ([::1]:58814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l05xF-0002ES-PA
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 11:58:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l05Nk-00048Q-3b
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 11:21:58 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:37661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l05Ng-0000hl-AL
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 11:21:55 -0500
Received: by mail-wr1-x431.google.com with SMTP id v15so2720799wrx.4
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 08:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EJ3L45pgCG48Ns6Yfj/WFfddDgK/y7/mrWeCE4StrsY=;
 b=cu8XerQpNiBpdPfdNgaL3dG3PksEjWFB0hxC7uRj35DqWqOdQNQTDzd3Eu3H69j4on
 X5jCbmT1DybRMK0a3x+qqK4vDzpPdcCARPu4okhV4GDFyVVc95BkkMUaNipQeJ9V4O91
 FHzKXU8hEK/kwvRPvCVQ6whMsy8ziKgS8wx29EMm8OQX6QIJ8+zhNUQukWGNkKoPwFK/
 hWzdAP+0qfOLKwz8LRGTNgL6ROEvE4ax6wbBmI91vV1HBu5Url6Xc1GdbddheuGX3FLx
 qIeNJtA95qe/YXl/G41VHQR5bVOz3tM81LQk1SSy5a2y4PiMIc37GwNrllsCs0SSuueo
 9Z+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=EJ3L45pgCG48Ns6Yfj/WFfddDgK/y7/mrWeCE4StrsY=;
 b=ppt5/dZar5zO0IzGE4ohyBDGpR5bGstu2Er1Pub8abdXVp29ql10DxMxblPed2YaaZ
 FxsvVP92VwQuu7XObn2GBSOtxrp17GCpVRjLfVt65XtqAa9cGSSITPMEMZmuNCyzWUDW
 MiaD7/w+t7rY6P/8P5fKgmysc6N1PWHtqOP/KRlzzlsUHVcfAPMGwvtdTIkfKsZget9U
 OkSA3fkWTaNgZhoobkb8JAHkr5a4AZKEd9nNu2CM4j9PSGqy4QPaY2OhcBPF8Ja01EG0
 HyCqAH/N1dNEUondF2d//QANq26yHm5UgsgCF9krlCwUU2ms6EUZGEh0usACzhsSkPol
 t2Rg==
X-Gm-Message-State: AOAM530cQdmB4q4n/8kAQwJVyM5h0chs/bbpjBK8TWB2+eif1IO/EHy6
 r4eBte9Y/MoqCUlOXFGjeByxwfvHOuw=
X-Google-Smtp-Source: ABdhPJx7epsNiJvgiT5IXENFLEkkE43BSTqIpias7K3Q71jdc4irslnXuCeReAwJAR0nCOEfMRAnNQ==
X-Received: by 2002:adf:d843:: with SMTP id k3mr8801191wrl.346.1610641310203; 
 Thu, 14 Jan 2021 08:21:50 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id g194sm9247219wme.39.2021.01.14.08.21.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 08:21:49 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: 
Subject: [PULL v2 68/69] target/mips: Remove vendor specific CPU definitions
Date: Thu, 14 Jan 2021 17:20:16 +0100
Message-Id: <20210114162016.2901557-18-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210114162016.2901557-1-f4bug@amsat.org>
References: <20210114162016.2901557-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
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
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Vendor specific CPU definitions are not very useful. Use the
ISA definitions instead, which are more helpful when looking
at the various CPU definitions.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210112210152.2072996-4-f4bug@amsat.org>
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


