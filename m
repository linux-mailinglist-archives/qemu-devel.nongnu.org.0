Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C863F7593
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 15:07:02 +0200 (CEST)
Received: from localhost ([::1]:49222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIscL-0006Pl-0T
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 09:06:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mIsY8-0006LV-5w
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:02:37 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:46930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mIsY6-0002IR-H7
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:02:35 -0400
Received: by mail-wr1-x429.google.com with SMTP id f5so36294775wrm.13
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 06:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/xr1vfWCdZlXZLBObSsh7uuthKBePi4eDkgX2zne5x8=;
 b=sEUrXeBDPR/7Rd4RaJ1StUnJAsXpTpoxr/4oMPQlYZhKt9BeOdz6M0BY5bV7tT5XF7
 i/WxgsFUVNvIr+RQJocstRYPm8CN1nI0EKDExUY5Vaq9a1n5DSwUnvEOcfSTtwvh3sma
 NY8ePdcxJB2rRio8Ps4WtWiN6YgXtALByj1MOnGQZ6hYxbiE6llbkFiOp/l2opT4MR3l
 e91z70xQqTLpT9bzaELrOb8PX0CmCeHBTDOp26QRRO6d8f652i+Fw5HMqwhkMCzBiDWK
 gi+mNqLUcVWMjPgBOf1rsfnXRJA1YYxWq0LHtSEStn5+tkWCPWGt5vsz/87+EzE6c/nq
 96ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/xr1vfWCdZlXZLBObSsh7uuthKBePi4eDkgX2zne5x8=;
 b=R43E4OkLUL0zJh6rP97nlRtN6U3STiARcZec5+89IXkh5SOftqskHJpyk0ylF9MUj6
 Wj/FBSeiJ3/NgjVAUcGnw66xcllGI2s+SX6+SocwuSFtX7NsLh21tsbNsGH/KpjjBTZf
 YrIDnA4931e7er8S+KyZgHqnE/3WFMb6AljtXyecAqTIynD/IbaOCDRUjgI2totIa90h
 sPd3o39v2cPVY/ga6K8QrXr+f2RoyL3qcTwE1MA086hFUkTtAXzjFiIywwA4Z7DUl6qw
 UcOOywUlCetRyytUcuvvW1ik05q/9hVXyKZ0M3qUiwCjQZs7dwKLMlnsDUpY75qmu7yL
 4GqQ==
X-Gm-Message-State: AOAM532+qndQ6E9Ei6Nsmnlw2nNRIhNRLlWtro8z9PTlJfVujCRApfOB
 DDSrwH7pmrd/BN5zt/2CnuDhD4qyjUg=
X-Google-Smtp-Source: ABdhPJy5iyhfR05Hg8sixihLB8Ckd2WURzCj+W5Oq2bkaOJoB0Vxmiq+ywtbk2xb2NbD0MDsyTlU+w==
X-Received: by 2002:a5d:6ca4:: with SMTP id a4mr1625226wra.140.1629896552909; 
 Wed, 25 Aug 2021 06:02:32 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 e2sm22917188wrq.56.2021.08.25.06.02.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 06:02:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/28] target/mips: Merge 32-bit/64-bit Release6 decodetree
 definitions
Date: Wed, 25 Aug 2021 15:01:47 +0200
Message-Id: <20210825130211.1542338-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210825130211.1542338-1-f4bug@amsat.org>
References: <20210825130211.1542338-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Message-Id: <20210801234202.3167676-4-f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/mips64r6.decode               | 27 -------------------
 .../mips/tcg/{mips32r6.decode => rel6.decode} | 13 +++++++++
 target/mips/tcg/rel6_translate.c              | 16 ++++-------
 target/mips/tcg/meson.build                   |  3 +--
 4 files changed, 19 insertions(+), 40 deletions(-)
 delete mode 100644 target/mips/tcg/mips64r6.decode
 rename target/mips/tcg/{mips32r6.decode => rel6.decode} (69%)

diff --git a/target/mips/tcg/mips64r6.decode b/target/mips/tcg/mips64r6.decode
deleted file mode 100644
index b58d8009ccd..00000000000
--- a/target/mips/tcg/mips64r6.decode
+++ /dev/null
@@ -1,27 +0,0 @@
-# MIPS64 Release 6 instruction set
-#
-# Copyright (C) 2020  Philippe Mathieu-Daudé
-#
-# SPDX-License-Identifier: LGPL-2.1-or-later
-#
-# Reference:
-#       MIPS Architecture for Programmers Volume II-A
-#       The MIPS64 Instruction Set Reference Manual, Revision 6.06
-#       (Document Number: MD00087-2B-MIPS64BIS-AFP-6.06)
-#
-
-&rtype              rs rt rd sa !extern
-
-&REMOVED            !extern
-
-@lsa                ...... rs:5 rt:5 rd:5 ... sa:2 ......   &rtype
-
-DLSA                000000 ..... ..... ..... 000 .. 010101  @lsa
-
-REMOVED             011010 ----- ----- ----------------     # LDL
-REMOVED             011011 ----- ----- ----------------     # LDR
-REMOVED             101100 ----- ----- ----------------     # SDL
-REMOVED             101101 ----- ----- ----------------     # SDR
-
-REMOVED             110100 ----- ----- ----------------     # LLD
-REMOVED             111100 ----- ----- ----------------     # SCD
diff --git a/target/mips/tcg/mips32r6.decode b/target/mips/tcg/rel6.decode
similarity index 69%
rename from target/mips/tcg/mips32r6.decode
rename to target/mips/tcg/rel6.decode
index 837c991edc5..ed069c51662 100644
--- a/target/mips/tcg/mips32r6.decode
+++ b/target/mips/tcg/rel6.decode
@@ -5,21 +5,29 @@
 # SPDX-License-Identifier: LGPL-2.1-or-later
 #
 # Reference:
+#
 #       MIPS Architecture for Programmers Volume II-A
 #       The MIPS32 Instruction Set Reference Manual, Revision 6.06
 #       (Document Number: MD00086-2B-MIPS32BIS-AFP-06.06)
 #
+#       MIPS Architecture for Programmers Volume II-A
+#       The MIPS64 Instruction Set Reference Manual, Revision 6.06
+#       (Document Number: MD00087-2B-MIPS64BIS-AFP-6.06)
 
 &rtype              rs rt rd sa
 
 @lsa                ...... rs:5 rt:5 rd:5 ... sa:2 ......   &rtype
 
 LSA                 000000 ..... ..... ..... 000 .. 000101  @lsa
+DLSA                000000 ..... ..... ..... 000 .. 010101  @lsa
 
 REMOVED             010011 ----- ----- ----- ----- ------   # COP1X (COP3)
 
 REMOVED             011100 ----- ----- ----- ----- ------   # SPECIAL2
 
+REMOVED             011010 ----- ----- ----------------     # LDL
+REMOVED             011011 ----- ----- ----------------     # LDR
+
 REMOVED             011111 ----- ----- ----------  011001   # LWLE
 REMOVED             011111 ----- ----- ----------  011010   # LWRE
 REMOVED             011111 ----- ----- ----------  100001   # SWLE
@@ -28,9 +36,14 @@ REMOVED             011111 ----- ----- ----------  100010   # SWRE
 REMOVED             100010 ----- ----- ----------------     # LWL
 REMOVED             100110 ----- ----- ----------------     # LWR
 REMOVED             101010 ----- ----- ----------------     # SWL
+REMOVED             101100 ----- ----- ----------------     # SDL
+REMOVED             101101 ----- ----- ----------------     # SDR
 REMOVED             101110 ----- ----- ----------------     # SWR
 
 REMOVED             101111 ----- ----- ----------------     # CACHE
+
 REMOVED             110000 ----- ----- ----------------     # LL
 REMOVED             110011 ----- ----- ----------------     # PREF
+REMOVED             110100 ----- ----- ----------------     # LLD
 REMOVED             111000 ----- ----- ----------------     # SC
+REMOVED             111100 ----- ----- ----------------     # SCD
diff --git a/target/mips/tcg/rel6_translate.c b/target/mips/tcg/rel6_translate.c
index 0354370927d..ae2e023a817 100644
--- a/target/mips/tcg/rel6_translate.c
+++ b/target/mips/tcg/rel6_translate.c
@@ -13,9 +13,8 @@
 #include "exec/helper-gen.h"
 #include "translate.h"
 
-/* Include the auto-generated decoder.  */
-#include "decode-mips32r6.c.inc"
-#include "decode-mips64r6.c.inc"
+/* Include the auto-generated decoders.  */
+#include "decode-rel6.c.inc"
 
 bool trans_REMOVED(DisasContext *ctx, arg_REMOVED *a)
 {
@@ -31,13 +30,8 @@ static bool trans_LSA(DisasContext *ctx, arg_rtype *a)
 
 static bool trans_DLSA(DisasContext *ctx, arg_rtype *a)
 {
+    if (TARGET_LONG_BITS != 64) {
+        return false;
+    }
     return gen_dlsa(ctx, a->rd, a->rt, a->rs, a->sa);
 }
-
-bool decode_isa_rel6(DisasContext *ctx, uint32_t insn)
-{
-    if (TARGET_LONG_BITS == 64 && decode_mips64r6(ctx, insn)) {
-        return true;
-    }
-    return decode_mips32r6(ctx, insn);
-}
diff --git a/target/mips/tcg/meson.build b/target/mips/tcg/meson.build
index bf4001e5741..70fa3dd57df 100644
--- a/target/mips/tcg/meson.build
+++ b/target/mips/tcg/meson.build
@@ -1,6 +1,5 @@
 gen = [
-  decodetree.process('mips32r6.decode', extra_args: '--static-decode=decode_mips32r6'),
-  decodetree.process('mips64r6.decode', extra_args: '--static-decode=decode_mips64r6'),
+  decodetree.process('rel6.decode', extra_args: ['--decode=decode_isa_rel6']),
   decodetree.process('msa.decode', extra_args: '--decode=decode_ase_msa'),
   decodetree.process('tx79.decode', extra_args: '--static-decode=decode_tx79'),
 ]
-- 
2.31.1


