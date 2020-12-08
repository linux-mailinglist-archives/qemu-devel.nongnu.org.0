Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E772D1F56
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 01:49:39 +0100 (CET)
Received: from localhost ([::1]:42202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmRCE-0003hl-Ta
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 19:49:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmR0d-0003os-7j
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 19:37:39 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:40227)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmR0X-0001EL-8m
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 19:37:34 -0500
Received: by mail-ed1-x533.google.com with SMTP id h16so4458309edt.7
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 16:37:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p4PZklhHw+Sb6s6FhLRnOXfQjuCQxkl6HaSQzV1xL0k=;
 b=AocFYn/OeGLM5fAC++aIXp7BCu8C9tkHnnrVydtHXjs6E9fqhW56MWeIdDpPSowXnh
 PV2RQSHQNoMECkD1X3IqwzibgIBqV+DAiBg6Zvx/m9a469QWHABV5DRTGfuSLIzIxBxw
 6oYo4MT19IbFUB6nLNTVsDhOkyVhlOpk02GGZe1vSBalHyHsNHtC0HuERHzFR1OcxgKZ
 Et/5gZ3Ndh5LjkIk1UJF52eeNIglF6cICMxjpI2FhxmOPFRIS9Sxwjmt/vTEIms5IyYi
 gjNnLCiZwTvYOVfD35TXWZLz5qZttQdB/gh8SfUYZjLomSLZdLKcJfIpW0Q8irzgXpmi
 n0DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=p4PZklhHw+Sb6s6FhLRnOXfQjuCQxkl6HaSQzV1xL0k=;
 b=CEuEPXJSkkYKWDH7UAO0eDbcNERmtsyr8zdZCSF+g6b+GR8gqUnJ8UzZzbVJU6SGiz
 wCkaeJ5ZH1L5pgaCr/9rTKWiUbsWYPVPeoA+gklSX5Db87li4vkqFpxZ3+5r7pQ4K0jS
 MA81XYqMpFeXDsQQ6f8CPzlCHd6eecWa+9WBHuywZDMhkCoQci/5BIi2VVcsRS6prOqY
 BBN+7Itc0k6Dm3HKSWKIX5Jhcf4mZzGV/g0jqjJ86HiWgRORZG5NqS7LVP+Ov/nzDHyv
 h+cOBRoTW76p0P0dVB035uF5M8M83/Yh9sBvtpFoq025DgfAHmSUsod/6KpD95L5dopT
 c1ug==
X-Gm-Message-State: AOAM530K3bKXnegbF51XVi/XyCQF+tDDr1t2327KcxzEUHmfOegu1rFN
 IKymGT8BWjH+V7B+u9dpnBOIAlaoR90=
X-Google-Smtp-Source: ABdhPJwAnXIX7aszxc3Sf9KqxOLgCmeV/WG207FQq1EpZP60tAeQRn9j0oicEGIuDOZQOGynRjz0dw==
X-Received: by 2002:aa7:d6c9:: with SMTP id x9mr21868250edr.96.1607387851347; 
 Mon, 07 Dec 2020 16:37:31 -0800 (PST)
Received: from x1w.redhat.com (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id c12sm15438706edw.55.2020.12.07.16.37.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 16:37:30 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/17] target/mips: Remove now unused ASE_MSA definition
Date: Tue,  8 Dec 2020 01:36:50 +0100
Message-Id: <20201208003702.4088927-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201208003702.4088927-1-f4bug@amsat.org>
References: <20201208003702.4088927-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We don't use ASE_MSA anymore (replaced by ase_msa_available()
checking MSAP bit from CP0_Config3). Remove it.

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/mips-defs.h          | 1 -
 target/mips/translate_init.c.inc | 8 ++++----
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/target/mips/mips-defs.h b/target/mips/mips-defs.h
index ed6a7a9e545..805034b8956 100644
--- a/target/mips/mips-defs.h
+++ b/target/mips/mips-defs.h
@@ -45,7 +45,6 @@
 #define ASE_MT            0x0000000040000000ULL
 #define ASE_SMARTMIPS     0x0000000080000000ULL
 #define ASE_MICROMIPS     0x0000000100000000ULL
-#define ASE_MSA           0x0000000200000000ULL
 /*
  *   bits 40-51: vendor-specific base instruction sets
  */
diff --git a/target/mips/translate_init.c.inc b/target/mips/translate_init.c.inc
index 3c9ec7e940a..f6752d00afe 100644
--- a/target/mips/translate_init.c.inc
+++ b/target/mips/translate_init.c.inc
@@ -408,7 +408,7 @@ const mips_def_t mips_defs[] =
         .CP1_fcr31_rw_bitmask = 0xFF83FFFF,
         .SEGBITS = 32,
         .PABITS = 40,
-        .insn_flags = CPU_MIPS32R5 | ASE_MSA,
+        .insn_flags = CPU_MIPS32R5,
         .mmu_type = MMU_TYPE_R4000,
     },
     {
@@ -721,7 +721,7 @@ const mips_def_t mips_defs[] =
         .MSAIR = 0x03 << MSAIR_ProcID,
         .SEGBITS = 48,
         .PABITS = 48,
-        .insn_flags = CPU_MIPS64R6 | ASE_MSA,
+        .insn_flags = CPU_MIPS64R6,
         .mmu_type = MMU_TYPE_R4000,
     },
     {
@@ -761,7 +761,7 @@ const mips_def_t mips_defs[] =
         .MSAIR = 0x03 << MSAIR_ProcID,
         .SEGBITS = 48,
         .PABITS = 48,
-        .insn_flags = CPU_MIPS64R6 | ASE_MSA,
+        .insn_flags = CPU_MIPS64R6,
         .mmu_type = MMU_TYPE_R4000,
     },
     {
@@ -887,7 +887,7 @@ const mips_def_t mips_defs[] =
         .CP1_fcr31_rw_bitmask = 0xFF83FFFF,
         .SEGBITS = 48,
         .PABITS = 48,
-        .insn_flags = CPU_LOONGSON3A | ASE_MSA,
+        .insn_flags = CPU_LOONGSON3A,
         .mmu_type = MMU_TYPE_R4000,
     },
     {
-- 
2.26.2


