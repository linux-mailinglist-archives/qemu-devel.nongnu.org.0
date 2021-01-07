Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A4F2EE8C6
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 23:34:28 +0100 (CET)
Received: from localhost ([::1]:53872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxdrP-0005Z4-D8
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 17:34:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdh9-0007LC-Fx
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:23:51 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:50345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdh7-0004t8-TK
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:23:51 -0500
Received: by mail-wm1-x333.google.com with SMTP id 190so6375226wmz.0
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 14:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RavFb6dHUeenzrSfS/Q/TJH5UznJIUfWdY3rLcA4ySo=;
 b=mzomH6jdr6EZyEVSkuwt5lbCGtIdXcojInKf28RZ7eaHb8UfBBjDHu5odN17tPu6kt
 yscLmJFXJ02sXHpWGRUK47dKzGq69UfyMdvxn5nvY07q4HOKHXGCfn+oEPOcNJm/krfT
 znaJMbL5k2Ky4BMiExwNBTy8ioJRjxBxnkL6QhQ22b39mYDBvObcK7s8vltc8ZB/b5lm
 Sou5o/G2SzG2fXF+GpU1MVnblpF7G3rArUUJb/oSSXjYME/Hs3sri1jYVLd5/MlZ39uF
 U8eyG8qnzNJeAANdniSIxbFD2ZoHato3uN0kHrdAHraBTARYou6D6QQ4IfqvbHtECvHi
 YQrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=RavFb6dHUeenzrSfS/Q/TJH5UznJIUfWdY3rLcA4ySo=;
 b=Qbve7pkQuIH29FAu7Vsaw8AyPHd0uOvFMDXs6LnzXp1XweQEBblfLBROxccsqclamw
 eZrdKc2lAL8fGvyonGaKarpJfYUQIeBmV4BMFllEH7hSgKwrdFuTOPMVWgvpLpGqdhQN
 SLkay4X82fmb2mFhPbnIvbVpucpSJ49kU5wAzz+qBqWgpzE8PFaVlgUo7WKxxb7LJQ3v
 4bFcO+hrlo8FVG1CWdlY2xWgSsvC7rbXwFQ00z701i0+PLold303Otx52gnmahbtY+EY
 6pTf37a6Fe8wveI3/tHm5KNoOZcoYE5EeS6Q3i4RR75zMutwesoyCKH7uKB2AatbxGxF
 BDDw==
X-Gm-Message-State: AOAM530jrkwcXW+dwDgriA58wmYg2+u89J+S6Pl2I0E2piHv1VzsVHV8
 DN6djJAm8X7aAj7dUjAEkXaNcll6yo0=
X-Google-Smtp-Source: ABdhPJzUXXuSdtPR6ULt4R79zWpOOuF4QmJ5/Gvwe7kpCeGD2sb3/+U49oGXlw0Hv5NJhAtc0Km/iw==
X-Received: by 2002:a1c:9ac6:: with SMTP id c189mr492866wme.137.1610058228349; 
 Thu, 07 Jan 2021 14:23:48 -0800 (PST)
Received: from x1w.redhat.com (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id e15sm10531456wrx.86.2021.01.07.14.23.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 14:23:47 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/66] target/mips/mips-defs: Use ISA_MIPS32R2 definition to
 check Release 2
Date: Thu,  7 Jan 2021 23:21:57 +0100
Message-Id: <20210107222253.20382-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210107222253.20382-1-f4bug@amsat.org>
References: <20210107222253.20382-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
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

Use the single ISA_MIPS32R2 definition to check if the Release 2
ISA is supported, whether the CPU support 32/64-bit.

For now we keep '32' in the definition name, we will rename it
as ISA_MIPS_R2 in few commits.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210104221154.3127610-8-f4bug@amsat.org>
---
 target/mips/mips-defs.h    | 3 +--
 linux-user/mips/cpu_loop.c | 1 -
 target/mips/translate.c    | 4 ++--
 3 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/target/mips/mips-defs.h b/target/mips/mips-defs.h
index 23ce8b8406f..b36b59c12d3 100644
--- a/target/mips/mips-defs.h
+++ b/target/mips/mips-defs.h
@@ -18,7 +18,6 @@
 #define ISA_MIPS5         0x0000000000000010ULL
 #define ISA_MIPS32        0x0000000000000020ULL
 #define ISA_MIPS32R2      0x0000000000000040ULL
-#define ISA_MIPS64R2      0x0000000000000100ULL
 #define ISA_MIPS32R3      0x0000000000000200ULL
 #define ISA_MIPS64R3      0x0000000000000400ULL
 #define ISA_MIPS32R5      0x0000000000000800ULL
@@ -78,7 +77,7 @@
 
 /* MIPS Technologies "Release 2" */
 #define CPU_MIPS32R2    (CPU_MIPS32R1 | ISA_MIPS32R2)
-#define CPU_MIPS64R2    (CPU_MIPS64R1 | CPU_MIPS32R2 | ISA_MIPS64R2)
+#define CPU_MIPS64R2    (CPU_MIPS64R1 | CPU_MIPS32R2)
 
 /* MIPS Technologies "Release 3" */
 #define CPU_MIPS32R3    (CPU_MIPS32R2 | ISA_MIPS32R3)
diff --git a/linux-user/mips/cpu_loop.c b/linux-user/mips/cpu_loop.c
index cfe7ba5c47d..f0831379cc4 100644
--- a/linux-user/mips/cpu_loop.c
+++ b/linux-user/mips/cpu_loop.c
@@ -385,7 +385,6 @@ void target_cpu_copy_regs(CPUArchState *env, struct target_pt_regs *regs)
     prog_req.fre &= interp_req.fre;
 
     bool cpu_has_mips_r2_r6 = env->insn_flags & ISA_MIPS32R2 ||
-                              env->insn_flags & ISA_MIPS64R2 ||
                               env->insn_flags & ISA_MIPS32R6 ||
                               env->insn_flags & ISA_MIPS64R6;
 
diff --git a/target/mips/translate.c b/target/mips/translate.c
index 172027f9d6e..9fc9dedf30d 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -28621,7 +28621,7 @@ static void decode_opc_special3(CPUMIPSState *env, DisasContext *ctx)
     case OPC_DINSM:
     case OPC_DINSU:
     case OPC_DINS:
-        check_insn(ctx, ISA_MIPS64R2);
+        check_insn(ctx, ISA_MIPS32R2);
         check_mips_64(ctx);
         gen_bitops(ctx, op1, rt, rs, sa, rd);
         break;
@@ -28641,7 +28641,7 @@ static void decode_opc_special3(CPUMIPSState *env, DisasContext *ctx)
             decode_opc_special3_r6(env, ctx);
             break;
         default:
-            check_insn(ctx, ISA_MIPS64R2);
+            check_insn(ctx, ISA_MIPS32R2);
             check_mips_64(ctx);
             op2 = MASK_DBSHFL(ctx->opcode);
             gen_bshfl(ctx, op2, rt, rd);
-- 
2.26.2


