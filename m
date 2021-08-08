Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 232303E3BFE
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Aug 2021 19:34:35 +0200 (CEST)
Received: from localhost ([::1]:45094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCmh0-0001rD-6R
	for lists+qemu-devel@lfdr.de; Sun, 08 Aug 2021 13:34:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mCmd7-0004za-11
 for qemu-devel@nongnu.org; Sun, 08 Aug 2021 13:30:35 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:47010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mCmd5-0006RC-Gc
 for qemu-devel@nongnu.org; Sun, 08 Aug 2021 13:30:32 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 h24-20020a1ccc180000b029022e0571d1a0so9857320wmb.5
 for <qemu-devel@nongnu.org>; Sun, 08 Aug 2021 10:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/eMBnlVY7aRA5TQWaHvUi3TTkCtDi3J83ziaggVBpSU=;
 b=h1QSnXtVDIQWZKoInEV29JJ6dUCbeE/dyihvNDbd56xVYxufD1OMi8kLGnHfx8dQnV
 pe0l2V1Edg5Hsflc2uVwtIHAIxESqR/dPaw/V/rAC2JzxL9qr5jkR338+aqKAMH4tJTa
 IUV+l/gqqmHDEJOXRuTyTkvpPpavmwv7I+g6RhkTmgvXgo9fTiAmKPQalPfRqwSWwI8+
 eF8vidxVnc1wtKWcKzasSthlCjkhDs19JonLiW9ir9AphYGw8y/5YK3qMlk6FhfjXq1P
 Xbi4cHFJHwsMGmHGOPlVac1NNuEAX27ZI3Sm6AN1OePg1Ta0Ne59W/z0XTax0/Pn3XJT
 xwdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/eMBnlVY7aRA5TQWaHvUi3TTkCtDi3J83ziaggVBpSU=;
 b=YheV7zZux9x9JkjYZqs91UvEcdKyr2M2FFfiHts+f3SOzWNvV9pbP/wXcWLRS+FI01
 v2T8sDrz/lAyqruhqu2e/kVQ1RCfb7zTdUGq5Me+6IXyeONrJy3ZPTh3bof9FZrpC/9o
 wBIQg6sIpckjVvzdK0nNaBTqwKFYg9e2cgaBAzxukiopa72ymkX5H/0b1ThW9rMaw6LT
 SSpSvWdm7+keSQMiECgmSfUKdnMuAegsX1CuLw3J0ikbYpRGqPaRDjl7Hbn8MYj6GDJo
 1yfb1P0keG0Zd+vF44k03Pz4F/pR8jKJhcnEDVSk/jJk8wg/YRjxxuCcFWeE/9PqgX6E
 E6Qg==
X-Gm-Message-State: AOAM531dsBQLekE3hyI5jV6LvdjjLZnZarNSTL0MsCon2OjwPrQ+gJxf
 mD7z6WQ6d3d0SobsFSSafJTYVRX3b3A=
X-Google-Smtp-Source: ABdhPJwvmIikUvYK1r9JI+hHjtcvb/zV2WOel8S79j4JcMIjrFxbc8SYzXgmXrI8BfEVwLhIhXhxDg==
X-Received: by 2002:a7b:c14a:: with SMTP id z10mr30573136wmi.36.1628443829973; 
 Sun, 08 Aug 2021 10:30:29 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 y14sm4832738wrs.29.2021.08.08.10.30.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Aug 2021 10:30:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.2 v3 2/7] target/mips: Extract NEC Vr54xx helper
 definitions
Date: Sun,  8 Aug 2021 19:30:13 +0200
Message-Id: <20210808173018.90960-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210808173018.90960-1-f4bug@amsat.org>
References: <20210808173018.90960-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Extract the NEC Vr54xx helper definitions to
'vendor-vr54xx_helper.h'.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201120210844.2625602-15-f4bug@amsat.org>
---
 target/mips/helper.h                | 18 +++---------------
 target/mips/tcg/vr54xx_helper.h.inc | 24 ++++++++++++++++++++++++
 2 files changed, 27 insertions(+), 15 deletions(-)
 create mode 100644 target/mips/tcg/vr54xx_helper.h.inc

diff --git a/target/mips/helper.h b/target/mips/helper.h
index a9c6c7d1a31..de32d82e980 100644
--- a/target/mips/helper.h
+++ b/target/mips/helper.h
@@ -16,21 +16,6 @@ DEF_HELPER_3(lld, tl, env, tl, int)
 #endif
 #endif
 
-DEF_HELPER_3(muls, tl, env, tl, tl)
-DEF_HELPER_3(mulsu, tl, env, tl, tl)
-DEF_HELPER_3(macc, tl, env, tl, tl)
-DEF_HELPER_3(maccu, tl, env, tl, tl)
-DEF_HELPER_3(msac, tl, env, tl, tl)
-DEF_HELPER_3(msacu, tl, env, tl, tl)
-DEF_HELPER_3(mulhi, tl, env, tl, tl)
-DEF_HELPER_3(mulhiu, tl, env, tl, tl)
-DEF_HELPER_3(mulshi, tl, env, tl, tl)
-DEF_HELPER_3(mulshiu, tl, env, tl, tl)
-DEF_HELPER_3(macchi, tl, env, tl, tl)
-DEF_HELPER_3(macchiu, tl, env, tl, tl)
-DEF_HELPER_3(msachi, tl, env, tl, tl)
-DEF_HELPER_3(msachiu, tl, env, tl, tl)
-
 DEF_HELPER_FLAGS_1(bitswap, TCG_CALL_NO_RWG_SE, tl, tl)
 #ifdef TARGET_MIPS64
 DEF_HELPER_FLAGS_1(dbitswap, TCG_CALL_NO_RWG_SE, tl, tl)
@@ -609,3 +594,6 @@ DEF_HELPER_FLAGS_2(rddsp, 0, tl, tl, env)
 #endif /* !CONFIG_USER_ONLY */
 
 #include "tcg/msa_helper.h.inc"
+
+/* Vendor extensions */
+#include "tcg/vr54xx_helper.h.inc"
diff --git a/target/mips/tcg/vr54xx_helper.h.inc b/target/mips/tcg/vr54xx_helper.h.inc
new file mode 100644
index 00000000000..50b1f5b818d
--- /dev/null
+++ b/target/mips/tcg/vr54xx_helper.h.inc
@@ -0,0 +1,24 @@
+/*
+ * MIPS NEC Vr54xx instruction emulation helpers for QEMU.
+ *
+ *  Copyright (c) 2004-2005 Jocelyn Mayer
+ *  Copyright (c) 2006 Marius Groeger (FPU operations)
+ *  Copyright (c) 2006 Thiemo Seufer (MIPS32R2 support)
+ *
+ * SPDX-License-Identifier: LGPL-2.1-or-later
+ */
+
+DEF_HELPER_3(muls, tl, env, tl, tl)
+DEF_HELPER_3(mulsu, tl, env, tl, tl)
+DEF_HELPER_3(macc, tl, env, tl, tl)
+DEF_HELPER_3(maccu, tl, env, tl, tl)
+DEF_HELPER_3(msac, tl, env, tl, tl)
+DEF_HELPER_3(msacu, tl, env, tl, tl)
+DEF_HELPER_3(mulhi, tl, env, tl, tl)
+DEF_HELPER_3(mulhiu, tl, env, tl, tl)
+DEF_HELPER_3(mulshi, tl, env, tl, tl)
+DEF_HELPER_3(mulshiu, tl, env, tl, tl)
+DEF_HELPER_3(macchi, tl, env, tl, tl)
+DEF_HELPER_3(macchiu, tl, env, tl, tl)
+DEF_HELPER_3(msachi, tl, env, tl, tl)
+DEF_HELPER_3(msachiu, tl, env, tl, tl)
-- 
2.31.1


