Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8B73DCE30
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 01:47:53 +0200 (CEST)
Received: from localhost ([::1]:58522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mALBQ-0008PD-73
	for lists+qemu-devel@lfdr.de; Sun, 01 Aug 2021 19:47:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mAL65-0002j1-D0
 for qemu-devel@nongnu.org; Sun, 01 Aug 2021 19:42:21 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:43899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mAL63-0003qw-Mh
 for qemu-devel@nongnu.org; Sun, 01 Aug 2021 19:42:21 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 m20-20020a05600c4f54b029024e75a15716so9923353wmq.2
 for <qemu-devel@nongnu.org>; Sun, 01 Aug 2021 16:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MEexVZpOmMQGQKbdMdmdE8d8zbgl8YhKPkuKPBINUxU=;
 b=XKBjKUtJ9i1o6TdDS1uCHWl49NustW8bcFRQ1Pt1Pkmbv2e8TsAe9IbadtHSn78DbS
 V+RzLczrrmyJLwlwQGmCwS0mU21wUgTkawA+K5u8UUOFKBWGLp6V35HaPCt5pNrOr/up
 jM4lvsLPZxDf7CK0vus6cGOgdOLGSeBFGbg+cv2v3vwOmR4cc31agmdMfsjnMbU5beze
 a/+HNLuahczJ6QP6z9+X/rKOusDrit8c3u3EO/VI9uxpUCWD6GTaBi9ij/YlawGK+k8q
 gYGAFe1yik4f7QK7HlD9j+RowDAdhMwIOZLR3V+RPD5ZFcHej/djxy/Ed/XcPU0Keq3h
 riCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=MEexVZpOmMQGQKbdMdmdE8d8zbgl8YhKPkuKPBINUxU=;
 b=pyLjt44LLpaJCSpRWeEGMF1Jx8UgWpVECzEut5FltDHiqCH3T6IldQema5VTP9Z2ch
 TxITWVLxRyvZuoEdW7X4yV2dB0Yo5sIJc04HKkBntRo+ENVnqFvS1DyqlLs8x6EGsu3d
 3eIJm2RIsP3t3vC5pa78FyoSX3N1f/yFlmuqVDe0Ji3JeriglfCKPMm72H/3oQ0ALLL5
 DGpQmjBiMTc4etEBlON8hMBKwNd1fDJspdlWGU/ittXfNFrqdPfWo0HUxwqzZb6xqR5U
 IhHngzgyz4dDEr4xml/Wxggq0SmXb7dUIvb4PdtMPAHkjKIzvDHoFnuY7SjGhy8i/erT
 STBQ==
X-Gm-Message-State: AOAM532D6P8AATpXtJVFon5bS+SnCDkFhNhIKXWAshfhzEhyp5s0qdCp
 0smUJBv2pQslNZTmIZPR8zJj4803uTzNog==
X-Google-Smtp-Source: ABdhPJwLAt2ETijowAWtJpYpX9m4hUeDpTFfJi8C4bh7yT00oJioRIjQ1xHFEUykPMP/eS/J1wtPrA==
X-Received: by 2002:a1c:5449:: with SMTP id p9mr13920931wmi.101.1627861338260; 
 Sun, 01 Aug 2021 16:42:18 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 t8sm9755115wmj.5.2021.08.01.16.42.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Aug 2021 16:42:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.2 3/4] target/mips: Merge 32-bit/64-bit release6
 decodetree definitions
Date: Mon,  2 Aug 2021 01:42:01 +0200
Message-Id: <20210801234202.3167676-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210801234202.3167676-1-f4bug@amsat.org>
References: <20210801234202.3167676-1-f4bug@amsat.org>
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We don't need to maintain 2 sets of decodetree definitions.
Merge them into a single file.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


