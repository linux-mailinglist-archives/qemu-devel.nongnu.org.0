Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A212EE8AB
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 23:29:32 +0100 (CET)
Received: from localhost ([::1]:36948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxdmd-0006va-7N
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 17:29:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdgp-00076L-K8
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:23:36 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:37571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdgn-0004mA-HE
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:23:31 -0500
Received: by mail-wm1-x32a.google.com with SMTP id q75so6837625wme.2
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 14:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CCcScCerij69CQ6oZxOAaSELOgitQBqHQwR1Q8IbG/E=;
 b=Gh1Hsp51UHuTegHxXpED3GcTcd9CTxlel1n8ImSOclnsGAX/HRzESqbamlHxeNmmHB
 gaEDPEqoOCVUJBCa3QkTdiYiVZUfwysSUvJ+BRur0iiPySyeMh3ZRRhsaLucT0PQhDGx
 5ec4RWI8RUw0dXZhqpHAM69kVjDWwGiCMx8mG6YxtIlbQFN3Sd0ArfN8O1k3AaynPgh/
 Y3Vs+tXzvW4LFM7iGQKBDiBFe2bnADHhdFTjzBpX6D+q4wuk9f8P6t3WGtV97Plgb5s1
 9XnjK927XYUa1zGPHqN0IQiAuD8L48E82yWwwkN3nIZgl9L2wqh/xfqDY7WRTYA5C22N
 dJTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=CCcScCerij69CQ6oZxOAaSELOgitQBqHQwR1Q8IbG/E=;
 b=jiHDNY8Se7nQ05b4PSmC4egcgVHredR/sjVJnbGrp/IcsFo4q3NPQ7grZgLPmpUwbE
 VjyZmkOl+qEJ1aOtenAgYyW7z8WAz84GNbm7305KDHpxmMkuo1Fs2tNSnYF6GExobn5K
 /0BwQ8PpT6PM8vtTXGEDKEL+08Z8amyv8odYQ6Ik6AsSzlfW3JWgw8AXjAjgnV39XD1N
 i/I887h9nIZQPtdcMr05fHoAjsRCWZs4W4w5hkljNhOHVOD1vNfc31QN9xyPx6c5tBmW
 zrEsQHT+CMeaTLlkm1SmzN4+UXAqEE8aMBlT+09t8O03qViHVkTn5WN9SgBAuYJOfIiS
 k4XA==
X-Gm-Message-State: AOAM531oqPNxWw0eq8/hvDMPqqMso1jyzPOKI/6uDsgraVV11ir/19zm
 LzcBtQKbo4oRsrLx3aDdc+zmAH+5xiQ=
X-Google-Smtp-Source: ABdhPJy/gw9y0iLygnNYCRbNVdeUgo3SJN/NH5crn6wIfiA04NxP/S7hfoDf86Rn9ZrhmLpdiaeK+g==
X-Received: by 2002:a7b:cb4f:: with SMTP id v15mr489712wmj.123.1610058207316; 
 Thu, 07 Jan 2021 14:23:27 -0800 (PST)
Received: from x1w.redhat.com (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id c7sm11506623wro.16.2021.01.07.14.23.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 14:23:26 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/66] target/mips/mips-defs: Rename CPU_MIPSxx Release 1 as
 CPU_MIPSxxR1
Date: Thu,  7 Jan 2021 23:21:53 +0100
Message-Id: <20210107222253.20382-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210107222253.20382-1-f4bug@amsat.org>
References: <20210107222253.20382-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
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
 Paul Burton <paulburton@kernel.org>, kvm@vger.kernel.org,
 libvir-list@redhat.com, Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

'CPU_MIPS32' and 'CPU_MIPS64' definitions concern CPUs implementing
the "Release 1" ISA. Rename it with the 'R1' suffix, as the other
CPU definitions do.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210104221154.3127610-4-f4bug@amsat.org>
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
index cac3d241831..0ba3cf18ef7 100644
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
@@ -552,7 +552,7 @@ const mips_def_t mips_defs[] =
         .CP0_Status_rw_bitmask = 0x12F8FFFF,
         .SEGBITS = 42,
         .PABITS = 36,
-        .insn_flags = CPU_MIPS64,
+        .insn_flags = CPU_MIPS64R1,
         .mmu_type = MMU_TYPE_R4000,
     },
     {
@@ -578,7 +578,7 @@ const mips_def_t mips_defs[] =
         .CP1_fcr31_rw_bitmask = 0xFF83FFFF,
         .SEGBITS = 42,
         .PABITS = 36,
-        .insn_flags = CPU_MIPS64,
+        .insn_flags = CPU_MIPS64R1,
         .mmu_type = MMU_TYPE_R4000,
     },
     {
@@ -607,7 +607,7 @@ const mips_def_t mips_defs[] =
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


