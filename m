Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C53A7887D5
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Aug 2019 06:15:06 +0200 (CEST)
Received: from localhost ([::1]:34792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hwImY-00022F-0h
	for lists+qemu-devel@lfdr.de; Sat, 10 Aug 2019 00:15:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34614)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <jan.bobek@gmail.com>) id 1hwIkh-0005AN-IJ
 for qemu-devel@nongnu.org; Sat, 10 Aug 2019 00:13:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jan.bobek@gmail.com>) id 1hwIkg-0004BI-FM
 for qemu-devel@nongnu.org; Sat, 10 Aug 2019 00:13:11 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:36299)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jan.bobek@gmail.com>) id 1hwIkg-0004B2-B6
 for qemu-devel@nongnu.org; Sat, 10 Aug 2019 00:13:10 -0400
Received: by mail-ot1-x341.google.com with SMTP id k18so8366688otr.3
 for <qemu-devel@nongnu.org>; Fri, 09 Aug 2019 21:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6nDSi2OJfOTaQ/1QMGaIy9TKp9JFtHSdU8wWAA7Z90w=;
 b=bAg1ZLD5yhKtQ+/2t6GkF7qnprGc3gMX6Zsrijhy8LCLKmvGhQurrIT6Qu7rjv5t1D
 j46jcz22T8yUfsndTrMI0NhQTdIIz+NGYTWcrgG0xViUHCVbQ3phTJYaqH8v9tSA92PH
 kRQMHGw0B3U5TnBLjvzoF9xoJqF6dWZKWXR4pvQfxVoXvaVQFvIGRLNQdYg3J2EHuVwk
 HfHYTKKZAcNv9GhigJk5R1lpFfvVotHNbndPSuP1lQOJjHUsHdLghwrhpkpG+O1linzJ
 8l87F6ntrMmP03Lr653pn6jqDsJCnbBZbCIBWOTqenRALxLidF98+Ws7wMj119wZ+64S
 0hEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6nDSi2OJfOTaQ/1QMGaIy9TKp9JFtHSdU8wWAA7Z90w=;
 b=cRVl9vfB8PNUL34pf4+/G98QyMs+salN1vRUnkbj9paRr1uOHOAkh27W90C0Rvq+7w
 Rc4ObZYpAFZv3V5d/MxmXmIwUvkZ/Hx8wupC9F64YnS0tIgv9V/Y0BDnSHYo9fyVVG/Z
 Si0Nx9hFyUTV93w3veEQSfsL5gQQ/QcrH6Z0ltC1nmo3HDRWhmCDok9DkZUsvw02ZS7I
 hG/OfiUK1rlB8hl+L51Rq6RDpexVL2L4/JhJihO/3wEGFA10G+phGWSMAaHVBuOUNvKA
 wpN5sgP18VTA2iDzfFwXBaPCSDbjdncHYhf8qlg+sqr7F47KFfbLDNZq5UgQPmlboOjp
 ty2w==
X-Gm-Message-State: APjAAAUXkqtx9ZU1K+71ai/cjwdpB/7lqInnSgN7nsHYMVQsX95xpHRD
 uuwOhcwCM+a+5YCMpvTAaJrk868Z
X-Google-Smtp-Source: APXvYqwGuSANDRoYqS4OMbe4mDM62cEqCj2mxAc47WpmEMtzSD4DSohwsCMmGScOZlQ13jgBtZJ9dw==
X-Received: by 2002:a9d:76da:: with SMTP id p26mr21558703otl.311.1565410389635; 
 Fri, 09 Aug 2019 21:13:09 -0700 (PDT)
Received: from dionysus.attlocal.net
 (69-222-133-165.lightspeed.tukrga.sbcglobal.net. [69.222.133.165])
 by smtp.gmail.com with ESMTPSA id f84sm33383540oig.43.2019.08.09.21.13.08
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 09 Aug 2019 21:13:09 -0700 (PDT)
From: Jan Bobek <jan.bobek@gmail.com>
To: qemu-devel@nongnu.org
Date: Sat, 10 Aug 2019 00:12:18 -0400
Message-Id: <20190810041255.6820-3-jan.bobek@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190810041255.6820-1-jan.bobek@gmail.com>
References: <20190810041255.6820-1-jan.bobek@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: [Qemu-devel] [RFC PATCH v2 02/39] target/i386: Push rex_w into
 DisasContext
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <rth@twiddle.net>

Treat this the same as we already do for other rex bits.

Signed-off-by: Richard Henderson <rth@twiddle.net>
---
 target/i386/translate.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/target/i386/translate.c b/target/i386/translate.c
index d74dbfd585..c0866c2797 100644
--- a/target/i386/translate.c
+++ b/target/i386/translate.c
@@ -44,11 +44,13 @@
 #define REX_X(s) ((s)->rex_x)
 #define REX_B(s) ((s)->rex_b)
 #define REX_R(s) ((s)->rex_r)
+#define REX_W(s) ((s)->rex_w)
 #else
 #define CODE64(s) 0
 #define REX_X(s) 0
 #define REX_B(s) 0
 #define REX_R(s) 0
+#define REX_W(s) -1
 #endif
 
 #ifdef TARGET_X86_64
@@ -100,7 +102,7 @@ typedef struct DisasContext {
 #ifdef TARGET_X86_64
     int lma;    /* long mode active */
     int code64; /* 64 bit code segment */
-    int rex_x, rex_b, rex_r;
+    int rex_x, rex_b, rex_r, rex_w;
 #endif
     int vex_l;  /* vex vector length */
     int vex_v;  /* vex vvvv register, without 1's complement.  */
@@ -4495,7 +4497,6 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     int modrm, reg, rm, mod, op, opreg, val;
     target_ulong next_eip, tval;
     target_ulong pc_start = s->base.pc_next;
-    int rex_w;
 
     s->pc_start = s->pc = pc_start;
     s->override = -1;
@@ -4503,6 +4504,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     s->rex_x = 0;
     s->rex_b = 0;
     s->rex_r = 0;
+    s->rex_w = -1;
     s->x86_64_hregs = false;
 #endif
     s->rip_offset = 0; /* for relative ip address */
@@ -4514,7 +4516,6 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     }
 
     prefixes = 0;
-    rex_w = -1;
 
  next_byte:
     b = x86_ldub_code(env, s);
@@ -4557,7 +4558,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     case 0x40 ... 0x4f:
         if (CODE64(s)) {
             /* REX prefix */
-            rex_w = (b >> 3) & 1;
+            s->rex_w = (b >> 3) & 1;
             s->rex_r = (b & 0x4) << 1;
             s->rex_x = (b & 0x2) << 2;
             s->rex_b = (b & 0x1) << 3;
@@ -4606,7 +4607,9 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 s->rex_b = (~vex2 >> 2) & 8;
 #endif
                 vex3 = x86_ldub_code(env, s);
-                rex_w = (vex3 >> 7) & 1;
+#ifdef TARGET_X86_64
+                s->rex_w = (vex3 >> 7) & 1;
+#endif
                 switch (vex2 & 0x1f) {
                 case 0x01: /* Implied 0f leading opcode bytes.  */
                     b = x86_ldub_code(env, s) | 0x100;
@@ -4631,9 +4634,9 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     /* Post-process prefixes.  */
     if (CODE64(s)) {
         /* In 64-bit mode, the default data size is 32-bit.  Select 64-bit
-           data with rex_w, and 16-bit data with 0x66; rex_w takes precedence
+           data with REX_W, and 16-bit data with 0x66; REX_W takes precedence
            over 0x66 if both are present.  */
-        dflag = (rex_w > 0 ? MO_64 : prefixes & PREFIX_DATA ? MO_16 : MO_32);
+        dflag = (REX_W(s) > 0 ? MO_64 : prefixes & PREFIX_DATA ? MO_16 : MO_32);
         /* In 64-bit mode, 0x67 selects 32-bit addressing.  */
         aflag = (prefixes & PREFIX_ADR ? MO_32 : MO_64);
     } else {
@@ -5029,7 +5032,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 /* operand size for jumps is 64 bit */
                 ot = MO_64;
             } else if (op == 3 || op == 5) {
-                ot = dflag != MO_16 ? MO_32 + (rex_w == 1) : MO_16;
+                ot = dflag != MO_16 ? MO_32 + (REX_W(s) == 1) : MO_16;
             } else if (op == 6) {
                 /* default push size is 64 bit */
                 ot = mo_pushpop(s, dflag);
-- 
2.20.1


