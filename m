Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A52BD419
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Sep 2019 23:15:17 +0200 (CEST)
Received: from localhost ([::1]:51570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iCs8S-0005SG-Nj
	for lists+qemu-devel@lfdr.de; Tue, 24 Sep 2019 17:14:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55531)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1iCrw1-0002YN-Ox
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 17:01:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1iCrw0-0004UP-E0
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 17:01:21 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:39980)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1iCrvy-0004Ss-IJ
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 17:01:18 -0400
Received: by mail-wr1-x443.google.com with SMTP id l3so3621159wru.7
 for <qemu-devel@nongnu.org>; Tue, 24 Sep 2019 14:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xmyA2KCLeLU2xSd1cjULfKDT3lF0lDQIQyf5XM38R7k=;
 b=G9hv2TGn0glkGjNVwQCWoqI9R/TEONefekZWgQAUERv8b51D9x0flZX97leiKcQfMZ
 RRXaBfzdsShSJeO0tRYws3ZYmCifZsxZUKNwuhXZQGwhTMoCOdztK6H0ZgfwkLNaIWgC
 nqLkHoIxle4x7T4Hl/vYW9ifSLZXxPAJlVfF6ze4y8GRTVibWJGzAgbHIK2iBVklA1NV
 EtVuWKBI3l33fYPPGhGAzFNZSVM440+cMieHThn+xaXZ2xfd4xrHT3/TtEVVYrwh8tff
 YGNRL0XkPIB1fReYkaixhmb0cRuI1wL/wd6dXiH4UEiGzcau8L2bakI8Sd09IkxmK2VC
 TQxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xmyA2KCLeLU2xSd1cjULfKDT3lF0lDQIQyf5XM38R7k=;
 b=drzuzMUN2uTdnoJO50XbMBBLl8rpdm2dyTXqjS9fuT3ZciDQCivM/ttmHjDqv1YWN2
 rM+19fhRzmRnUeakBWnu4VwQ8blliGBkt8cIDhKzVltNPEM4kQ0rc4bc+w9pk2aGJBnS
 u+J+CZiQM5guei6EudX+qoutEqKExmPK+km4bKctRbjtEspN8ynXmVhZuVIFTJY8AQWe
 iBewV1n8AEKCTznU46kjrOk7nKid+MIIahymQ10b3Be4CQBUJSHnzTZMlIWD7zkwlflZ
 phhwCcTWOyCeukFZOfUFwUdnjjf/NDDitBSCvkNQXtVT+lS7Y1WVbsQ2pql831SBMTfy
 IBSw==
X-Gm-Message-State: APjAAAWz/KI0JF9BGEiI12bTe6PG6FDF96mD/gSHNPnWyZmEz1RdRRpt
 t4chlorOTG5BtdytY551yuLmtwb28MpNvA==
X-Google-Smtp-Source: APXvYqy09QuIjqyBNVMeKxim7Wi7R8p+0Y0yunfpWWYl/gd+9vh3L+dDnMGbO0EsQetRQtrMRC9Aiw==
X-Received: by 2002:a5d:67c3:: with SMTP id n3mr4354206wrw.294.1569358873737; 
 Tue, 24 Sep 2019 14:01:13 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m16sm1066930wml.11.2019.09.24.14.01.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2019 14:01:10 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 73EA71FF96;
 Tue, 24 Sep 2019 22:01:07 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v3 07/33] target/alpha: Tidy helper_fp_exc_raise_s
Date: Tue, 24 Sep 2019 22:00:40 +0100
Message-Id: <20190924210106.27117-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190924210106.27117-1-alex.bennee@linaro.org>
References: <20190924210106.27117-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
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
 Richard Henderson <richard.henderson@linaro.org>, jsnow@redhat.com,
 f4bug@amsat.org, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Remove a redundant masking of ignore.  Once that's gone it is
obvious that the system-mode inner test is redundant with the
outer test.  Move the fpcr_exc_enable masking up and tidy.

No functional change.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20190921043256.4575-8-richard.henderson@linaro.org>
---
 target/alpha/fpu_helper.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/target/alpha/fpu_helper.c b/target/alpha/fpu_helper.c
index 62a066d9020..df8b58963ba 100644
--- a/target/alpha/fpu_helper.c
+++ b/target/alpha/fpu_helper.c
@@ -90,25 +90,18 @@ void helper_fp_exc_raise_s(CPUAlphaState *env, uint32_t ignore, uint32_t regno)
     uint32_t exc = env->error_code & ~ignore;
     if (exc) {
         env->fpcr |= exc;
-        exc &= ~ignore;
-#ifdef CONFIG_USER_ONLY
-        /*
-         * In user mode, the kernel's software handler only
-         * delivers a signal if the exception is enabled.
-         */
-        if (!(exc & env->fpcr_exc_enable)) {
-            return;
-        }
-#else
+        exc &= env->fpcr_exc_enable;
         /*
          * In system mode, the software handler gets invoked
          * for any non-ignored exception.
+         * In user mode, the kernel's software handler only
+         * delivers a signal if the exception is enabled.
          */
+#ifdef CONFIG_USER_ONLY
         if (!exc) {
             return;
         }
 #endif
-        exc &= env->fpcr_exc_enable;
         fp_exc_raise1(env, GETPC(), exc, regno, EXC_M_SWC);
     }
 }
-- 
2.20.1


