Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1F6BF978
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Sep 2019 20:44:03 +0200 (CEST)
Received: from localhost ([::1]:42644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDYkD-0005zv-Si
	for lists+qemu-devel@lfdr.de; Thu, 26 Sep 2019 14:44:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42039)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1iDYcV-0007ui-S5
 for qemu-devel@nongnu.org; Thu, 26 Sep 2019 14:36:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1iDYcT-0006QW-I3
 for qemu-devel@nongnu.org; Thu, 26 Sep 2019 14:36:03 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:55348)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1iDYcT-0006PU-6W
 for qemu-devel@nongnu.org; Thu, 26 Sep 2019 14:36:01 -0400
Received: by mail-wm1-x332.google.com with SMTP id a6so3882740wma.5
 for <qemu-devel@nongnu.org>; Thu, 26 Sep 2019 11:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QO4tLYij+oa349YGOfZT9w2QPeVWHjf3gqYs3K8CepQ=;
 b=jiiqfvGn0qjCr5+ahunt6WxhQlO0wWwemKBe2W6lEqKsJOAG7ujVD0pY63yyuwsAdc
 H5rxchne6qhm5RQ9CgXWH3+tjasq6qkFchFN+VYKnxnMuHfY9qpLgZ+A11cdle+p9y/q
 K/MDOLUSFcf3R2mHPjI8ffpRHNK5HqfVK9pSjjQAY/otQeT5QS6fWV3/DB54/yxP8UDZ
 tGvFSWqimyvvdbsDSg4efoueSUdx8KrKpbnqLNLcJzU1vUjr36AMJDMLBQ0pJHki0kiy
 j5aCub7jqAFu9danGVxgsJxlvhugtzfv+pXteqhqgSmT5KxG7msMuh1ef0SCAl4YFe8f
 RUTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QO4tLYij+oa349YGOfZT9w2QPeVWHjf3gqYs3K8CepQ=;
 b=qwgh9Ij+cp28gH4DQmSU0qY3QmMXt8hNBa7+F+YztSLYKQiq0h6fxS2TDpiIwLdQdt
 ouZLAvZOBquIpA2VfOp/FnV+n196PvlBL9LTvqOdjMdVyUQ3BaskVWDCwhWFoi/AGMa+
 JG/Bm0xpQbD0LQ/owQFb78nubpcvra7/o5pl19yC0fhgspUoJLyEL5be6HKhQ+bJmKRL
 eU1puz7tO38Mhl8dqSZNwSK8NBI10Ny1Z73t+sIajCPSjEYKLAJ1yauNLfrFRGINiHyV
 eSF0zcR1X2WHvjN1E/QND0wipogkr1Dfg3AD48bUf7wW4yyS0Nl4HB+mBwBx2uCrtYA7
 auKw==
X-Gm-Message-State: APjAAAVOU+L6AbWVFzjTmOf/9yCs+NBrzuPl581Dj/7rdCPDthKm3a61
 nfsNQ04IjtYygV/bhFF+vZ0ok8QRtUMR2Q==
X-Google-Smtp-Source: APXvYqwUtvj6Xw590qfJbZQbUApJnG4mhoduA8e6I2jKqLkjdzqTFSSEcPpC6Ay7IoMVh+arpJQPug==
X-Received: by 2002:a1c:28d4:: with SMTP id o203mr4311326wmo.142.1569522960048; 
 Thu, 26 Sep 2019 11:36:00 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x16sm53098wrl.32.2019.09.26.11.35.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2019 11:35:56 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CA8291FF96;
 Thu, 26 Sep 2019 19:35:53 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 07/28] target/alpha: Tidy helper_fp_exc_raise_s
Date: Thu, 26 Sep 2019 19:35:32 +0100
Message-Id: <20190926183553.13895-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190926183553.13895-1-alex.bennee@linaro.org>
References: <20190926183553.13895-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::332
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
 Richard Henderson <rth@twiddle.net>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Remove a redundant masking of ignore.  Once that's gone it is
obvious that the system-mode inner test is redundant with the
outer test.  Move the fpcr_exc_enable masking up and tidy.

No functional change.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20190921043256.4575-8-richard.henderson@linaro.org>

diff --git a/target/alpha/fpu_helper.c b/target/alpha/fpu_helper.c
index 62a066d902..df8b58963b 100644
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


