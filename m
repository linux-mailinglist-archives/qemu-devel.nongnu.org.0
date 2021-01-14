Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECD12F664B
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 17:52:13 +0100 (CET)
Received: from localhost ([::1]:47550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l05r2-0004OY-2J
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 11:52:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l05Mo-0003h8-N1
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 11:20:58 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:39506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l05Mm-0000RE-Sz
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 11:20:58 -0500
Received: by mail-wm1-x32d.google.com with SMTP id u14so1007232wmq.4
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 08:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6L5Qc7zxT3Yk0jLE2jrAl+wvFGKjgHCjj6mVUdtCkq0=;
 b=d+cyrvZUMRK1GK+VQ1AWl2pziS2SKkCvba4kL7vMGZQiqZfXPPlhRFFexCccW9BtTN
 iYmo+/9IndnEcA7iadvxiS00yfC1Je9xaZmd7hHTEVm+MszuNM2CT/2tPOvafJTKcsL7
 pY4XufPb6hH200pNGcah4M8eXzm21HQu6MOCbHQ/6Sw7EFxUEsxtXu0fQK06ASZ2RT79
 OM8Zlp8mg5T05MluNe/akFo02ICLlgkUEcSTLkar37gsVRWdRvf2jHjpIKVauZmu5zMS
 Ftdj3O4lwR9MTml8yxVImt2bCXZuUi9MsXAJfizsSrf6C5rjQ19bLfCcc/Zgq8JvoDeT
 rACQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=6L5Qc7zxT3Yk0jLE2jrAl+wvFGKjgHCjj6mVUdtCkq0=;
 b=VE4HjrVjuKxr5P1wzRHw4S+4nSSLiFzKZF6tKTCGzgs3A3dy+QMl533WpMkcleFUwP
 CuEu9vpwTC3dLMMKvxRyVVpWnE9OuY4FnxYi0fEsaQVAFkupLIw3bPSEIMvQ5uIOXPuj
 DAH3yf8VW+DtRO8XxAe/Pp+R8dU4sXQNKsHzL9CLIlIsgJClAkOTnGHoD2QZFWyQfsHl
 WylRBttkUZBQwiYmgK4yA8bxlIWDlGUz6TtPsBIqHNQ13lYvV5j6bt6KRKwwaGwlF8Xc
 P12I5cN5I+RNHIu3w3xljMjBNMkVqGCx+vWKfliXBw75sApO0FUzm/orfUIZKyCpE2y8
 h/VQ==
X-Gm-Message-State: AOAM531QwdXd9Wvw6qplO6YSppEy0WH9KGKHz2SP9P7i8m31/XHByt/b
 UrJHJxEP8iLrc9gJiHLz01E3kQNq2Ho=
X-Google-Smtp-Source: ABdhPJz98Kh69wB5ubK/F5cjkk9o1WgVomnFzsI7H2X9HQ56XzpcTW4+Mr19l4sXlbjDOBDUs4VOWg==
X-Received: by 2002:a7b:cb4f:: with SMTP id v15mr4651644wmj.123.1610641255300; 
 Thu, 14 Jan 2021 08:20:55 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id c7sm12002501wro.16.2021.01.14.08.20.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 08:20:54 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: 
Subject: [PULL v2 52/69] target/mips: Introduce decode tree bindings for MSA
 ASE
Date: Thu, 14 Jan 2021 17:20:06 +0100
Message-Id: <20210114162016.2901557-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210114162016.2901557-1-f4bug@amsat.org>
References: <20210114162016.2901557-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
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

Introduce the 'msa32' decodetree config for the 32-bit MSA ASE.

We start by decoding:
- the branch instructions,
- all instructions based on the MSA opcode.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201215225757.764263-20-f4bug@amsat.org>
Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Tested-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 target/mips/translate.h     |  3 +++
 target/mips/msa32.decode    | 24 ++++++++++++++++++++++++
 target/mips/msa_translate.c | 36 ++++++++++++++++++++++++++++++++++++
 target/mips/meson.build     |  5 +++++
 4 files changed, 68 insertions(+)
 create mode 100644 target/mips/msa32.decode

diff --git a/target/mips/translate.h b/target/mips/translate.h
index ea9c18029d0..b61ae79d431 100644
--- a/target/mips/translate.h
+++ b/target/mips/translate.h
@@ -177,4 +177,7 @@ void msa_translate_init(void);
 void gen_msa(DisasContext *ctx);
 void gen_msa_branch(DisasContext *ctx, uint32_t op1);
 
+/* decodetree generated */
+bool decode_ase_msa(DisasContext *ctx, uint32_t insn);
+
 #endif
diff --git a/target/mips/msa32.decode b/target/mips/msa32.decode
new file mode 100644
index 00000000000..d69675132b8
--- /dev/null
+++ b/target/mips/msa32.decode
@@ -0,0 +1,24 @@
+# MIPS SIMD Architecture Module instruction set
+#
+# Copyright (C) 2020  Philippe Mathieu-Daudé
+#
+# SPDX-License-Identifier: LGPL-2.1-or-later
+#
+# Reference:
+#       MIPS Architecture for Programmers Volume IV-j
+#       The MIPS32 SIMD Architecture Module, Revision 1.12
+#       (Document Number: MD00866-2B-MSA32-AFP-01.12)
+#
+
+&msa_bz             df wt s16
+
+@bz                 ...... ... ..   wt:5 s16:16             &msa_bz df=3
+@bz_df              ...... ... df:2 wt:5 s16:16             &msa_bz
+
+BZ_V                010001 01011  ..... ................    @bz
+BNZ_V               010001 01111  ..... ................    @bz
+
+BZ_x                010001 110 .. ..... ................    @bz_df
+BNZ_x               010001 111 .. ..... ................    @bz_df
+
+MSA                 011110 --------------------------
diff --git a/target/mips/msa_translate.c b/target/mips/msa_translate.c
index 52bd428759a..5efb0a1fc8a 100644
--- a/target/mips/msa_translate.c
+++ b/target/mips/msa_translate.c
@@ -6,6 +6,7 @@
  *  Copyright (c) 2006 Thiemo Seufer (MIPS32R2 support)
  *  Copyright (c) 2009 CodeSourcery (MIPS16 and microMIPS support)
  *  Copyright (c) 2012 Jia Liu & Dongxue Zhang (MIPS ASE DSP support)
+ *  Copyright (c) 2020 Philippe Mathieu-Daudé
  *
  * SPDX-License-Identifier: LGPL-2.1-or-later
  */
@@ -16,6 +17,9 @@
 #include "fpu_helper.h"
 #include "internal.h"
 
+/* Include the auto-generated decoder.  */
+#include "decode-msa32.c.inc"
+
 #define OPC_MSA (0x1E << 26)
 
 #define MASK_MSA_MINOR(op)          (MASK_OP_MAJOR(op) | (op & 0x3F))
@@ -370,6 +374,16 @@ static bool gen_msa_BxZ_V(DisasContext *ctx, int wt, int s16, TCGCond cond)
     return true;
 }
 
+static bool trans_BZ_V(DisasContext *ctx, arg_msa_bz *a)
+{
+    return gen_msa_BxZ_V(ctx, a->wt, a->s16, TCG_COND_EQ);
+}
+
+static bool trans_BNZ_V(DisasContext *ctx, arg_msa_bz *a)
+{
+    return gen_msa_BxZ_V(ctx, a->wt, a->s16, TCG_COND_NE);
+}
+
 static bool gen_msa_BxZ(DisasContext *ctx, int df, int wt, int s16, bool if_not)
 {
     check_msa_access(ctx);
@@ -388,6 +402,16 @@ static bool gen_msa_BxZ(DisasContext *ctx, int df, int wt, int s16, bool if_not)
     return true;
 }
 
+static bool trans_BZ_x(DisasContext *ctx, arg_msa_bz *a)
+{
+    return gen_msa_BxZ(ctx, a->df, a->wt, a->s16, false);
+}
+
+static bool trans_BNZ_x(DisasContext *ctx, arg_msa_bz *a)
+{
+    return gen_msa_BxZ(ctx, a->df, a->wt, a->s16, true);
+}
+
 void gen_msa_branch(DisasContext *ctx, uint32_t op1)
 {
     uint8_t df = (ctx->opcode >> 21) & 0x3;
@@ -2261,3 +2285,15 @@ void gen_msa(DisasContext *ctx)
         break;
     }
 }
+
+static bool trans_MSA(DisasContext *ctx, arg_MSA *a)
+{
+    gen_msa(ctx);
+
+    return true;
+}
+
+bool decode_ase_msa(DisasContext *ctx, uint32_t insn)
+{
+    return decode_msa32(ctx, insn);
+}
diff --git a/target/mips/meson.build b/target/mips/meson.build
index 2aa4d81300b..a3c37241884 100644
--- a/target/mips/meson.build
+++ b/target/mips/meson.build
@@ -1,4 +1,9 @@
+gen = [
+  decodetree.process('msa32.decode', extra_args: '--static-decode=decode_msa32'),
+]
+
 mips_ss = ss.source_set()
+mips_ss.add(gen)
 mips_ss.add(files(
   'cpu.c',
   'gdbstub.c',
-- 
2.26.2


