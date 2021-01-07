Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 436092EE89F
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 23:28:47 +0100 (CET)
Received: from localhost ([::1]:60952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxdlu-0005BT-9Q
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 17:28:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdh7-0007Fq-HC
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:23:49 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:37582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdh5-0004rM-Qd
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:23:49 -0500
Received: by mail-wm1-x334.google.com with SMTP id q75so6838012wme.2
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 14:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JF+srhqzVhiG9h5YfjprayJ58NzAW66CVocxdnKYZak=;
 b=MyguUpy9swxrQddCuBBhGkZGqa0U5jWbrSLDTzAIhc1PiGDgyuPql0/kz7s5UThQa8
 M2R4vS9nZK5kp5WHUbO20F7wvtmgvkMuUY3SwBWxWYDbH1sn4QvCqw2SNEn4CbTwbItY
 2E1XodvxynzXBeiHkAeyfMRIeZu9NU/rZWD85UPoQtlX4KWlHSelWB3Top/3qaB2L8WF
 cI00sx4srzSEdcXmd1S/6QJTj0G5rN+xGYsMSP8mS6w/t+GU93ZKt++rH+dY4bB94UoN
 +iMPeUtbk7ESKYeUub/jY5KWAw1ZDlxthUOZZwyzxl152hWs6dBDb49It4mI16d9zD7F
 3NEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=JF+srhqzVhiG9h5YfjprayJ58NzAW66CVocxdnKYZak=;
 b=fqB9Ko064j9v7aSbWaD0wsKj686nESGFU4vUVkcaDo3dhLXS7Qm37UNKNZMiie/Z4w
 6oj4YcGf3hYm1C1e5kGqWq5Nz63DNt0rIa9Gh2dHp12+duCgDVxFqw3CxfqUfGRq33UR
 tUTXGYQfNzFVYUfYsEfMkG4Yd0kwZWZLha21mNfroxLfC58zIZ8jmT1KHgp2Uyo7iWp1
 MmVUI2/Pf9IAA3hK5Ip+08xMlCuAS5dOr7pvKHMEe3JTpBlr2klSEihoh2yr2+LywLkc
 9ZHn3voU0QZZckdM36fkKwJcCnKt6WOFns4/lsPwFhGPHR/A8DUnvVr08sCPg184kcpO
 0o4Q==
X-Gm-Message-State: AOAM531we4J95NnnjN59DsqPujY1/lRHMnK0TCb10nJAj0NR5FEwi5bP
 rjGT6JcCF01GZC9mdg0TPW8mlZ3vzJ8=
X-Google-Smtp-Source: ABdhPJyqDIoi12kS/zEfaBOSjiMRo+zjIF9jiFqHqRZVWv01024Gv+Yl22rTTDgoM4CVyIbrMKG0xA==
X-Received: by 2002:a1c:4904:: with SMTP id w4mr507415wma.140.1610058223270;
 Thu, 07 Jan 2021 14:23:43 -0800 (PST)
Received: from x1w.redhat.com (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id c6sm10834861wrh.7.2021.01.07.14.23.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 14:23:42 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/66] target/mips/mips-defs: Use ISA_MIPS32 definition to
 check Release 1
Date: Thu,  7 Jan 2021 23:21:56 +0100
Message-Id: <20210107222253.20382-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210107222253.20382-1-f4bug@amsat.org>
References: <20210107222253.20382-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
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

Use the single ISA_MIPS32 definition to check if the Release 1
ISA is supported, whether the CPU support 32/64-bit.

For now we keep '32' in the definition name, we will rename it
as ISA_MIPS_R1 in few commits.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210104221154.3127610-7-f4bug@amsat.org>
---
 target/mips/mips-defs.h |  3 +--
 target/mips/translate.c | 10 +++++-----
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/target/mips/mips-defs.h b/target/mips/mips-defs.h
index 89a9a4dda31..23ce8b8406f 100644
--- a/target/mips/mips-defs.h
+++ b/target/mips/mips-defs.h
@@ -18,7 +18,6 @@
 #define ISA_MIPS5         0x0000000000000010ULL
 #define ISA_MIPS32        0x0000000000000020ULL
 #define ISA_MIPS32R2      0x0000000000000040ULL
-#define ISA_MIPS64        0x0000000000000080ULL
 #define ISA_MIPS64R2      0x0000000000000100ULL
 #define ISA_MIPS32R3      0x0000000000000200ULL
 #define ISA_MIPS64R3      0x0000000000000400ULL
@@ -75,7 +74,7 @@
 
 /* MIPS Technologies "Release 1" */
 #define CPU_MIPS32R1    (CPU_MIPS2 | ISA_MIPS32)
-#define CPU_MIPS64R1    (CPU_MIPS5 | CPU_MIPS32R1 | ISA_MIPS64)
+#define CPU_MIPS64R1    (CPU_MIPS5 | CPU_MIPS32R1)
 
 /* MIPS Technologies "Release 2" */
 #define CPU_MIPS32R2    (CPU_MIPS32R1 | ISA_MIPS32R2)
diff --git a/target/mips/translate.c b/target/mips/translate.c
index 19933b7868c..172027f9d6e 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -8943,7 +8943,7 @@ static void gen_dmfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
     const char *register_name = "invalid";
 
     if (sel != 0) {
-        check_insn(ctx, ISA_MIPS64);
+        check_insn(ctx, ISA_MIPS32);
     }
 
     switch (reg) {
@@ -9669,7 +9669,7 @@ static void gen_dmtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
     const char *register_name = "invalid";
 
     if (sel != 0) {
-        check_insn(ctx, ISA_MIPS64);
+        check_insn(ctx, ISA_MIPS32);
     }
 
     if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
@@ -14907,12 +14907,12 @@ static int decode_mips16_opc(CPUMIPSState *env, DisasContext *ctx)
                 break;
 #if defined(TARGET_MIPS64)
             case RR_RY_CNVT_ZEW:
-                check_insn(ctx, ISA_MIPS64);
+                check_insn(ctx, ISA_MIPS32);
                 check_mips_64(ctx);
                 tcg_gen_ext32u_tl(cpu_gpr[rx], cpu_gpr[rx]);
                 break;
             case RR_RY_CNVT_SEW:
-                check_insn(ctx, ISA_MIPS64);
+                check_insn(ctx, ISA_MIPS32);
                 check_mips_64(ctx);
                 tcg_gen_ext32s_tl(cpu_gpr[rx], cpu_gpr[rx]);
                 break;
@@ -27612,7 +27612,7 @@ static void decode_opc_special2_legacy(CPUMIPSState *env, DisasContext *ctx)
 #if defined(TARGET_MIPS64)
     case OPC_DCLO:
     case OPC_DCLZ:
-        check_insn(ctx, ISA_MIPS64);
+        check_insn(ctx, ISA_MIPS32);
         check_mips_64(ctx);
         gen_cl(ctx, op1, rd, rs);
         break;
-- 
2.26.2


