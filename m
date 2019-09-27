Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 382D6C0989
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Sep 2019 18:25:29 +0200 (CEST)
Received: from localhost ([::1]:53174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDt3e-0001DR-Ui
	for lists+qemu-devel@lfdr.de; Fri, 27 Sep 2019 12:25:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51251)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iDrSd-0002UZ-9l
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 10:43:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iDrSa-00089B-Ov
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 10:43:07 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:42397)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iDrSa-000873-9P
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 10:43:04 -0400
Received: by mail-wr1-x42c.google.com with SMTP id n14so3112337wrw.9
 for <qemu-devel@nongnu.org>; Fri, 27 Sep 2019 07:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=1Vii/oE4Oe++plZNXT8pOaZce8x1F9AjQIS0PE1aPcU=;
 b=I6Dz2CbqeEu28PPZIr2cgE1cMjhbqcUFC3UoOObAdsK6JEKK2JoMZKCNNGXue3j2Ba
 p/h4aNcgMBHhyOvJyWW2lYizE56Rw3yhJC8P+S7JTXV2JOfO5nx3XoWuHC4RhCoDZZGY
 meP8x1fCEs/yAwHFRC9vRMo+BFVv5MjSfcAFPmU689SP2CqGkUyfNdh7IC7BhRE7tUIA
 iHz2tzRfPOeRrl59gCy8PZUffrYbm42LJ2y2IcBywiaEuuRuLdAuZ/xQ5CaoEh4/Woy9
 xsY6mbCBcvPfJsJaR0pbU7KvBT07Np3JIuI/U1Oq+rk6DwJ/V12Tg7Wky6ZbhDCzYLHQ
 SnAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1Vii/oE4Oe++plZNXT8pOaZce8x1F9AjQIS0PE1aPcU=;
 b=X5DoAJn7A0cy6ltAYC/a1ETV/BvcQ8ZTnhBik/HLIAUl3exLJUGGcDRkGCi5RnrsIe
 94da13Gjs+wvE3sxAWvbYtDgneFTmsK2Z58yMSmEC4Urdil4331H20ivP/dRK2CuncvE
 v0H8ezPHqMW2SNHGxexO4omnsbhlRW3ZDyoDOhEYIGTWSJj7bkkF6L3qe/m1hU0m0k6Q
 MPZVLJyuS7G9wfWKQzRn90E0YuVKZjsRA+2rftNpFe0Rh8RkzmTZHJSMF7MskvQ3lvPo
 dip72eeQOfRwQ2cScjtQbtMJ7wDSlDRbvRj9gKjmBf/ivf6RUwTtcIF7ayCQXJt3Zv8w
 ZhZQ==
X-Gm-Message-State: APjAAAWPtNEhQ/h+feoyUwxZ51qpZ+KRkdXTw3itX7MeDim7yqT6siqP
 MFDbLZL3rwqZ4mokiMter0rcdlftzdEbug==
X-Google-Smtp-Source: APXvYqwhJI60UrD2bC8ap2blNTj2fVqFK4h53f+lmKf9rF8/loZKQi7F+Ugb1fZcSL1/nhomKE/oLA==
X-Received: by 2002:adf:ce04:: with SMTP id p4mr3182047wrn.130.1569595375488; 
 Fri, 27 Sep 2019 07:42:55 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y12sm2874539wrn.74.2019.09.27.07.42.54
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Sep 2019 07:42:54 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 4/9] target/arm: handle A-profile semihosting at translate time
Date: Fri, 27 Sep 2019 15:42:44 +0100
Message-Id: <20190927144249.29999-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190927144249.29999-1-peter.maydell@linaro.org>
References: <20190927144249.29999-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::42c
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alex Bennée <alex.bennee@linaro.org>

As for the other semihosting calls we can resolve this at translate
time.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20190913151845.12582-4-alex.bennee@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index b5272119330..698c594e8ce 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10222,14 +10222,25 @@ static bool trans_CBZ(DisasContext *s, arg_CBZ *a)
 }
 
 /*
- * Supervisor call
+ * Supervisor call - both T32 & A32 come here so we need to check
+ * which mode we are in when checking for semihosting.
  */
 
 static bool trans_SVC(DisasContext *s, arg_SVC *a)
 {
-    gen_set_pc_im(s, s->base.pc_next);
-    s->svc_imm = a->imm;
-    s->base.is_jmp = DISAS_SWI;
+    const uint32_t semihost_imm = s->thumb ? 0xab : 0x123456;
+
+    if (!arm_dc_feature(s, ARM_FEATURE_M) && semihosting_enabled() &&
+#ifndef CONFIG_USER_ONLY
+        !IS_USER(s) &&
+#endif
+        (a->imm == semihost_imm)) {
+        gen_exception_internal_insn(s, s->base.pc_next, EXCP_SEMIHOST);
+    } else {
+        gen_set_pc_im(s, s->base.pc_next);
+        s->svc_imm = a->imm;
+        s->base.is_jmp = DISAS_SWI;
+    }
     return true;
 }
 
-- 
2.20.1


