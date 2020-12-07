Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFF22D1EBB
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 01:02:21 +0100 (CET)
Received: from localhost ([::1]:57672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmQSS-000187-Kc
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 19:02:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmQMd-0004XS-0T
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 18:56:20 -0500
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:43316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmQMb-0004IN-3L
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 18:56:18 -0500
Received: by mail-ed1-x542.google.com with SMTP id q16so15663367edv.10
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 15:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=53Dvdfm15q5hV8eSzEAIt0mbwAz3z1SRdWqDZyLTyCw=;
 b=JQtb7jU1a90twhjLZt5ZZPdmmu3yFQAsj03UgFwgNoKfcSvOqVfLlYdj0enOECfflG
 BDbJNcKqudpTMrSmyJNG+V44zFpGWEO7fyGddISSyODBHm5XIYz56SegjjO0FOrNxjdC
 K/Xd5JRUkstUsDejeesioCujzpRI1BGTTdWaUa2EjrybyWSwFycr9byiJbr1JXLBOZrW
 uUgR1W1l4y09OGBYpUshdR28JlFw/UyCCPXfTdVjC362Mbx+HBL3RIwCTH3Fwsv1aXr/
 SNSJMiuP2TiGsbTEW0cIP+HoPIiCjQvPSvTR2T3hd09vk66u2GD3V6RTs7jBzkm6eS13
 Adpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=53Dvdfm15q5hV8eSzEAIt0mbwAz3z1SRdWqDZyLTyCw=;
 b=CGmVxLxPUN2SibYTNwr0+wa30/usOKZK/DJABBtvP1Zs77mYZUQeoUnNJwNiEFcAwK
 KeoEvtohUD4XfPwG5Xx0FsL8xwk3azawULC9szT/jPZ8SAyqGRYgeYP5ZP3GpcOUWoAL
 PsX/o5sjGGXxFv7wkvWl11IkZ2LL18APhKS8tYnazKuNyygFwS5qutfl8csedLqgocK1
 cut9zIPk018+vJ7ZWPIEm/nf6VG8EMev3Fu8cgvxnILz9yyD2YUIdk+raTQqiu/zSGbK
 8equz2yQtWoI6a7Y99ACDgO+g4xIzBIX+pZI8ioT7M55Nl5NnUqPNazKOA19/HgHKnNl
 dqDw==
X-Gm-Message-State: AOAM530PQMg0BJfHBpQE2kpO748HxYj8xgHadOnzQFGo/xxm/VP0Q8aR
 fCjWHyECqMH6ywu1JuwmEu+5vGfYoJQ=
X-Google-Smtp-Source: ABdhPJxplgzajb9bgrDV5yDYPoUk6SaPXNXC86rbVLE639k9Z9BJtJk9kcrIAdYSt72Rwo3bHpuR0g==
X-Received: by 2002:aa7:c403:: with SMTP id j3mr22079182edq.217.1607385373179; 
 Mon, 07 Dec 2020 15:56:13 -0800 (PST)
Received: from x1w.redhat.com (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id f11sm13875704ejd.40.2020.12.07.15.56.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 15:56:12 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/7] target/mips: Declare generic FPU functions in
 'fpu_translate.h'
Date: Tue,  8 Dec 2020 00:55:38 +0100
Message-Id: <20201207235539.4070364-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201207235539.4070364-1-f4bug@amsat.org>
References: <20201207235539.4070364-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::542;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x542.google.com
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
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some FPU translation functions / registers can be used by
ISA / ASE / extensions out of the big translate.c file.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/fpu_translate.h | 25 +++++++++++++++++++++++++
 target/mips/translate.c     | 14 ++++++++------
 2 files changed, 33 insertions(+), 6 deletions(-)
 create mode 100644 target/mips/fpu_translate.h

diff --git a/target/mips/fpu_translate.h b/target/mips/fpu_translate.h
new file mode 100644
index 00000000000..430e0b77537
--- /dev/null
+++ b/target/mips/fpu_translate.h
@@ -0,0 +1,25 @@
+/*
+ * FPU-related MIPS translation routines.
+ *
+ *  Copyright (C) 2004-2005  Jocelyn Mayer
+ *  Copyright (c) 2006 Marius Groeger (FPU operations)
+ *
+ * SPDX-License-Identifier: LGPL-2.1-or-later
+ */
+#ifndef TARGET_MIPS_FPU_TRANSLATE_H
+#define TARGET_MIPS_FPU_TRANSLATE_H
+
+#include "exec/translator.h"
+#include "translate.h"
+
+extern TCGv_i32 fpu_fcr0, fpu_fcr31;
+extern TCGv_i64 fpu_f64[32];
+
+void gen_load_fpr64(DisasContext *ctx, TCGv_i64 t, int reg);
+void gen_store_fpr64(DisasContext *ctx, TCGv_i64 t, int reg);
+
+int get_fp_bit(int cc);
+
+void check_cp1_enabled(DisasContext *ctx);
+
+#endif
diff --git a/target/mips/translate.c b/target/mips/translate.c
index 6614512a828..bc54eb58c70 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -40,7 +40,9 @@
 #include "exec/log.h"
 #include "qemu/qemu-print.h"
 #include "fpu_helper.h"
+
 #include "translate.h"
+#include "fpu_translate.h"
 
 enum {
     /* indirect opcode tables */
@@ -2496,8 +2498,8 @@ static TCGv cpu_dspctrl, btarget;
 TCGv bcond;
 static TCGv cpu_lladdr, cpu_llval;
 static TCGv_i32 hflags;
-static TCGv_i32 fpu_fcr0, fpu_fcr31;
-static TCGv_i64 fpu_f64[32];
+TCGv_i32 fpu_fcr0, fpu_fcr31;
+TCGv_i64 fpu_f64[32];
 static TCGv_i64 msa_wr_d[64];
 
 #if defined(TARGET_MIPS64)
@@ -2813,7 +2815,7 @@ static void gen_store_fpr32h(DisasContext *ctx, TCGv_i32 t, int reg)
     }
 }
 
-static void gen_load_fpr64(DisasContext *ctx, TCGv_i64 t, int reg)
+void gen_load_fpr64(DisasContext *ctx, TCGv_i64 t, int reg)
 {
     if (ctx->hflags & MIPS_HFLAG_F64) {
         tcg_gen_mov_i64(t, fpu_f64[reg]);
@@ -2822,7 +2824,7 @@ static void gen_load_fpr64(DisasContext *ctx, TCGv_i64 t, int reg)
     }
 }
 
-static void gen_store_fpr64(DisasContext *ctx, TCGv_i64 t, int reg)
+void gen_store_fpr64(DisasContext *ctx, TCGv_i64 t, int reg)
 {
     if (ctx->hflags & MIPS_HFLAG_F64) {
         tcg_gen_mov_i64(fpu_f64[reg], t);
@@ -2836,7 +2838,7 @@ static void gen_store_fpr64(DisasContext *ctx, TCGv_i64 t, int reg)
     }
 }
 
-static inline int get_fp_bit(int cc)
+int get_fp_bit(int cc)
 {
     if (cc) {
         return 24 + cc;
@@ -2911,7 +2913,7 @@ static inline void check_cp0_enabled(DisasContext *ctx)
     }
 }
 
-static inline void check_cp1_enabled(DisasContext *ctx)
+void check_cp1_enabled(DisasContext *ctx)
 {
     if (unlikely(!(ctx->hflags & MIPS_HFLAG_FPU))) {
         generate_exception_err(ctx, EXCP_CpU, 1);
-- 
2.26.2


