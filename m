Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C50C3ABAE2
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 19:51:03 +0200 (CEST)
Received: from localhost ([::1]:51334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltwAQ-00033m-18
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 13:51:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltw3S-0006PM-6Q
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 13:43:51 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:41756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltw3N-0001FY-W6
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 13:43:47 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 y13-20020a1c4b0d0000b02901c20173e165so4201866wma.0
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 10:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R7Xfsej5DEajIa18cawD/xf7U5trIsp041pqQxhlGvo=;
 b=MTa5Zh2uds1fP9AZai4ljx7+szq45+rbnFOkPqI82F1wNO6Rx6sN2TcGeDgsz+TnP7
 LXcYitIDiOREQ4RXe04mkM0H4hTqIztTQ+Bnd+3lLfgzfeqkhCuNMdUmfFOlMAm8DBBq
 LzlxrGJ+l3YFuXCORmX/Kh5wqxAG3FY+S8+dVCGGMOK+rN4lNmuMzYtWtwwUtQKaV9eZ
 hjia+3vDR/y2033GTmDhClsbsQVHQ0GIvN8vX2HJh/uyrZfVvrpm5oConOR5K83DZ8K0
 HomYj1NwPsRhQw2S9w8dH1VlnRlWj23FKtucRSpcRnb+2wMkfgHeRJEdMOrBG0EZZbDl
 pD6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=R7Xfsej5DEajIa18cawD/xf7U5trIsp041pqQxhlGvo=;
 b=haYJNAyls62b/zFMxQzll7EN5TpLXEPSx/4dP8GoOynksTT1llT4RtdbcvYhuDQ5f6
 89cUsQn3yiKMM5qRR8IXhhZrr6GjKjlSkVSdr4izAqBO9aMGE7MNWXBsqYZif9Ngt8ku
 NB7k3C716I9MsRIsKMtKqkmvgEEI5WHyN1bPGE/aT/2zJXCYVjF0f5EqioFgNsN8X5T7
 7d6xnWpbSx0LqGr1IvR+lXtxeT2E6tGJrb2BrTWF5Ahyzyx7shx4HCSpFNc2fJGrhDNd
 C4oRf1yEj2jGzqs5ZA37h29/QJDZ4XVXI61HdUU+7GnHKAdIljKeFmRsD06JQX4jRiTi
 +6nQ==
X-Gm-Message-State: AOAM532xwoTKNeM5EoQG0syqYCGOeUsMoy1E+nbhgkn+ES79+REnVyj/
 03iM1Y3Lpo14epncqFTTczOWqGB6Vkufvg==
X-Google-Smtp-Source: ABdhPJxxoWugCp2g4bWqeZnUedhbFJM1Cj6OzOhXD2tgNAQG/ODKVFUz3DCXecziNPZye9p8R+AEaw==
X-Received: by 2002:a7b:c3da:: with SMTP id t26mr6411332wmj.63.1623951824297; 
 Thu, 17 Jun 2021 10:43:44 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id n7sm8143605wmq.37.2021.06.17.10.43.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 10:43:43 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/9] target/mips: Move translate.h to tcg/ sub directory
Date: Thu, 17 Jun 2021 19:43:18 +0200
Message-Id: <20210617174323.2900831-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617174323.2900831-1-f4bug@amsat.org>
References: <20210617174323.2900831-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We moved various TCG source files in commit a2b0a27d33e
("target/mips: Move TCG source files under tcg/ sub directory")
but forgot to move the header declaring their prototypes.
Do it now, since all it declares is TCG specific.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/{ => tcg}/translate.h      | 0
 target/mips/tcg/msa_translate.c        | 2 +-
 target/mips/tcg/mxu_translate.c        | 2 +-
 target/mips/tcg/rel6_translate.c       | 2 +-
 target/mips/tcg/translate.c            | 2 +-
 target/mips/tcg/translate_addr_const.c | 2 +-
 target/mips/tcg/tx79_translate.c       | 2 +-
 target/mips/tcg/txx9_translate.c       | 2 +-
 8 files changed, 7 insertions(+), 7 deletions(-)
 rename target/mips/{ => tcg}/translate.h (100%)

diff --git a/target/mips/translate.h b/target/mips/tcg/translate.h
similarity index 100%
rename from target/mips/translate.h
rename to target/mips/tcg/translate.h
diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index ae6587edf69..b3b06352bf2 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -13,7 +13,7 @@
 #include "qemu/osdep.h"
 #include "tcg/tcg-op.h"
 #include "exec/helper-gen.h"
-#include "translate.h"
+#include "tcg/translate.h"
 #include "fpu_helper.h"
 #include "internal.h"
 
diff --git a/target/mips/tcg/mxu_translate.c b/target/mips/tcg/mxu_translate.c
index fb0a811af6c..f70a8ca59f4 100644
--- a/target/mips/tcg/mxu_translate.c
+++ b/target/mips/tcg/mxu_translate.c
@@ -18,7 +18,7 @@
 #include "qemu/osdep.h"
 #include "tcg/tcg-op.h"
 #include "exec/helper-gen.h"
-#include "translate.h"
+#include "tcg/translate.h"
 
 /*
  *
diff --git a/target/mips/tcg/rel6_translate.c b/target/mips/tcg/rel6_translate.c
index 0354370927d..8289263ada5 100644
--- a/target/mips/tcg/rel6_translate.c
+++ b/target/mips/tcg/rel6_translate.c
@@ -11,7 +11,7 @@
 #include "qemu/osdep.h"
 #include "tcg/tcg-op.h"
 #include "exec/helper-gen.h"
-#include "translate.h"
+#include "tcg/translate.h"
 
 /* Include the auto-generated decoder.  */
 #include "decode-mips32r6.c.inc"
diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index a4cab66d338..f0738daa847 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -38,7 +38,7 @@
 #include "exec/log.h"
 #include "qemu/qemu-print.h"
 #include "fpu_helper.h"
-#include "translate.h"
+#include "tcg/translate.h"
 
 /*
  * Many sysemu-only helpers are not reachable for user-only.
diff --git a/target/mips/tcg/translate_addr_const.c b/target/mips/tcg/translate_addr_const.c
index 96f483418eb..3a54749e3bc 100644
--- a/target/mips/tcg/translate_addr_const.c
+++ b/target/mips/tcg/translate_addr_const.c
@@ -12,7 +12,7 @@
  */
 #include "qemu/osdep.h"
 #include "tcg/tcg-op.h"
-#include "translate.h"
+#include "tcg/translate.h"
 
 bool gen_lsa(DisasContext *ctx, int rd, int rt, int rs, int sa)
 {
diff --git a/target/mips/tcg/tx79_translate.c b/target/mips/tcg/tx79_translate.c
index ad83774b977..967969b141a 100644
--- a/target/mips/tcg/tx79_translate.c
+++ b/target/mips/tcg/tx79_translate.c
@@ -9,7 +9,7 @@
 #include "qemu/osdep.h"
 #include "tcg/tcg-op.h"
 #include "exec/helper-gen.h"
-#include "translate.h"
+#include "tcg/translate.h"
 
 /* Include the auto-generated decoder.  */
 #include "decode-tx79.c.inc"
diff --git a/target/mips/tcg/txx9_translate.c b/target/mips/tcg/txx9_translate.c
index 8a2c0b766bd..5f147b89eef 100644
--- a/target/mips/tcg/txx9_translate.c
+++ b/target/mips/tcg/txx9_translate.c
@@ -7,7 +7,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "translate.h"
+#include "tcg/translate.h"
 
 bool decode_ext_txx9(DisasContext *ctx, uint32_t insn)
 {
-- 
2.31.1


