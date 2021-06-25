Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B67053B40F9
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 11:56:49 +0200 (CEST)
Received: from localhost ([::1]:37024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwiZs-0001yA-NK
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 05:56:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwi4v-00074H-Op
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 05:24:51 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:35533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwi4s-0002Le-4B
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 05:24:48 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 j11-20020a05600c1c0bb02901e23d4c0977so7388245wms.0
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 02:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f5DPlzA8O4zttmU/S05Ji9+z4p90zXOhep4QV0U8i+Q=;
 b=Tk0z3vBNKbY1MUy7pIMEXRCKarGDPyJWHXMc6Reit1hMI4oyHCKyVu8410IVfREQKm
 2WPq6gMMsBH8BKPn5Wqsnw92SqWOW5GYxVw3RVzZa7McL0QlKL6bqtgJw3eANDho1stR
 MQ9klNh26wRlkNPUd0QpnLVtfMGsAYvjEVVom2fs4QUeQJl0PEkjD3xUD3xjbCgziBrc
 9jUy27A2eDieuFjbNG2TEkKhSTibawnSv7WUoZnAUbhXYjSfNj0EmL4n07rvrf+rik2x
 vf4AK224MBKJzsWO//Mn+Dx/k9geYi+lq/zRY6DyRzrhp07e4eStTQuMrnI9MD388lFw
 UC8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=f5DPlzA8O4zttmU/S05Ji9+z4p90zXOhep4QV0U8i+Q=;
 b=NpZZP2GjnOABcafJMiRbOXMF2YUeqrPYiXyGBOJjJmceCPT+dwChsdDhSYaTBRCSI8
 asQFV/EiQ6tVLAhc1Rghvp4jtUTT8+8HQkCIV6Id1UejnqKBwiyDFQC3sRzryyik/kEK
 KGZ7nrgdKAgEMQ3Q3C2pgFIsTiHF7yMawhXc0ZRurrWixq1DL3pPD0c/khJxlF4PDpaJ
 W4JTNk6Lf+NGWFcdn/St3aP/JQSK7CexSM6LdA8Q/z7c3zSnALPdstL+COZ8v8f4WXLq
 lusws43QMrTNG4ow93A1Y+04jtwBc6f4+ghfh6g7eLqUWarIZ0gfoM/s9kvdFLTQeOWi
 al2Q==
X-Gm-Message-State: AOAM533r2UL664JJFMOj3djdusEVLqJ60Pk39jTTdXB4A/EiULCndSZE
 k8r/mcR3q9DUrCB0+GYpJqA66/uiFuhqNQ==
X-Google-Smtp-Source: ABdhPJy4K3gWHKlDU0BzLDvtBe1wxiVdqepUw1QIaqk51e2jEQILPmw6WHU/KWTZipqGkTEEVr5DGw==
X-Received: by 2002:a1c:9a8b:: with SMTP id c133mr9650720wme.65.1624613084630; 
 Fri, 25 Jun 2021 02:24:44 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id p13sm4081429wrx.30.2021.06.25.02.24.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 02:24:44 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/15] target/mips: Merge msa32/msa64 decodetree definitions
Date: Fri, 25 Jun 2021 11:23:29 +0200
Message-Id: <20210625092329.1529100-16-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210625092329.1529100-1-f4bug@amsat.org>
References: <20210625092329.1529100-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
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
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We don't need to maintain 2 sets of decodetree definitions.
Merge them into a single file.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210617174636.2902654-3-f4bug@amsat.org>
---
 target/mips/tcg/{msa32.decode => msa.decode} |  8 +++++---
 target/mips/tcg/msa64.decode                 | 17 -----------------
 target/mips/tcg/msa_translate.c              | 14 ++++----------
 target/mips/tcg/meson.build                  |  3 +--
 4 files changed, 10 insertions(+), 32 deletions(-)
 rename target/mips/tcg/{msa32.decode => msa.decode} (74%)
 delete mode 100644 target/mips/tcg/msa64.decode

diff --git a/target/mips/tcg/msa32.decode b/target/mips/tcg/msa.decode
similarity index 74%
rename from target/mips/tcg/msa32.decode
rename to target/mips/tcg/msa.decode
index ca200e373b1..bf132e36b9b 100644
--- a/target/mips/tcg/msa32.decode
+++ b/target/mips/tcg/msa.decode
@@ -6,9 +6,10 @@
 #
 # Reference:
 #       MIPS Architecture for Programmers Volume IV-j
-#       The MIPS32 SIMD Architecture Module, Revision 1.12
-#       (Document Number: MD00866-2B-MSA32-AFP-01.12)
-#
+#       - The MIPS32 SIMD Architecture Module, Revision 1.12
+#         (Document Number: MD00866-2B-MSA32-AFP-01.12)
+#       - The MIPS64 SIMD Architecture Module, Revision 1.12
+#         (Document Number: MD00868-1D-MSA64-AFP-01.12)
 
 &rtype              rs rt rd sa
 
@@ -19,6 +20,7 @@
 @bz_df              ...... ... df:2 wt:5 s16:16             &msa_bz
 
 LSA                 000000 ..... ..... ..... 000 .. 000101  @lsa
+DLSA                000000 ..... ..... ..... 000 .. 010101  @lsa
 
 BZ_V                010001 01011  ..... ................    @bz
 BNZ_V               010001 01111  ..... ................    @bz
diff --git a/target/mips/tcg/msa64.decode b/target/mips/tcg/msa64.decode
deleted file mode 100644
index d2442474d0b..00000000000
--- a/target/mips/tcg/msa64.decode
+++ /dev/null
@@ -1,17 +0,0 @@
-# MIPS SIMD Architecture Module instruction set
-#
-# Copyright (C) 2020  Philippe Mathieu-Daudé
-#
-# SPDX-License-Identifier: LGPL-2.1-or-later
-#
-# Reference:
-#       MIPS Architecture for Programmers Volume IV-j
-#       The MIPS64 SIMD Architecture Module, Revision 1.12
-#       (Document Number: MD00868-1D-MSA64-AFP-01.12)
-#
-
-&rtype              rs rt rd sa !extern
-
-@lsa                ...... rs:5 rt:5 rd:5 ... sa:2 ......   &rtype
-
-DLSA                 000000 ..... ..... ..... 000 .. 010101 @lsa
diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index 9df4497c886..eed2eca6c92 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -18,8 +18,7 @@
 #include "internal.h"
 
 /* Include the auto-generated decoder.  */
-#include "decode-msa32.c.inc"
-#include "decode-msa64.c.inc"
+#include "decode-msa.c.inc"
 
 #define OPC_MSA (0x1E << 26)
 
@@ -2269,13 +2268,8 @@ static bool trans_LSA(DisasContext *ctx, arg_rtype *a)
 
 static bool trans_DLSA(DisasContext *ctx, arg_rtype *a)
 {
+    if (TARGET_LONG_BITS != 64) {
+        return false;
+    }
     return gen_dlsa(ctx, a->rd, a->rt, a->rs, a->sa);
 }
-
-bool decode_ase_msa(DisasContext *ctx, uint32_t insn)
-{
-    if (TARGET_LONG_BITS == 64 && decode_msa64(ctx, insn)) {
-        return true;
-    }
-    return decode_msa32(ctx, insn);
-}
diff --git a/target/mips/tcg/meson.build b/target/mips/tcg/meson.build
index 5d8acbaf0d3..bf4001e5741 100644
--- a/target/mips/tcg/meson.build
+++ b/target/mips/tcg/meson.build
@@ -1,8 +1,7 @@
 gen = [
   decodetree.process('mips32r6.decode', extra_args: '--static-decode=decode_mips32r6'),
   decodetree.process('mips64r6.decode', extra_args: '--static-decode=decode_mips64r6'),
-  decodetree.process('msa32.decode', extra_args: '--static-decode=decode_msa32'),
-  decodetree.process('msa64.decode', extra_args: '--static-decode=decode_msa64'),
+  decodetree.process('msa.decode', extra_args: '--decode=decode_ase_msa'),
   decodetree.process('tx79.decode', extra_args: '--static-decode=decode_tx79'),
 ]
 
-- 
2.31.1


