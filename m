Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 484183AC5F
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jun 2019 00:23:35 +0200 (CEST)
Received: from localhost ([::1]:38740 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ha6Du-0001AV-0I
	for lists+qemu-devel@lfdr.de; Sun, 09 Jun 2019 18:23:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38927)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1ha6DI-0000kb-0J
 for qemu-devel@nongnu.org; Sun, 09 Jun 2019 18:22:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1ha6DG-00038e-RX
 for qemu-devel@nongnu.org; Sun, 09 Jun 2019 18:22:55 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:38481)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1ha6DG-00037D-K1
 for qemu-devel@nongnu.org; Sun, 09 Jun 2019 18:22:54 -0400
Received: by mail-pf1-x441.google.com with SMTP id a186so4110845pfa.5
 for <qemu-devel@nongnu.org>; Sun, 09 Jun 2019 15:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=E/meMAW2gq8NXcKfT0ML8GzN11fVNlQ8Zs9Ymgydqoo=;
 b=ep9DeyUZ3D5WALA6ZZAKHHUtwFJMGsw+K4ar3ouCOgKj05r9Z8eOvYsTowi3NSSzZ6
 Zac9gVop9LZpyJdPeDeqXJE9so6RhjxCDUIYRECldsgWBqfn54yJZsqHOnPxNw5XIv7v
 Ti9iwTp8f+8Mmt7icut4kCg5ZoRc6siIMXvZ2fgwb16UwDOE7I6+lGPxTP1XULA9E4wv
 Zpl3L0FEJJVuBomNXAZ2GbdVRNR5ds2yGALO6oc4mRZxlf7IlNigU5i57CvDDktcMyF+
 jHqTbdIagyWSqpF9ffjSMSAooR+V1piDYH7oIiE9AfXMYpe//69YfVZnoXEakUKazCP+
 wAcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=E/meMAW2gq8NXcKfT0ML8GzN11fVNlQ8Zs9Ymgydqoo=;
 b=GP+b9G0oDWrJQmsRRiCpX9uAfijwC/jYSdT0TL7qVaZbU/LU8VL7/5PLcQd2SvsX2K
 3u61f0tdhhRumPH2SPWM6RGnD7d1mQAvs4DesEOxTxAFrItFpBOLWgmM1Zjg4MVpHwnn
 HUHxwbUKxcyQumuAp/bkJSrXyUSrX6T5KdQZlsJVBTaxR5q7x+Q9d3tp5MUGYtvT8j4T
 MYREhNUhSflXltOk6f66KprjilIhVTTAT6VziQ81jL4T80bGbJovRpgNqnICEyMhFw90
 kOxGClWLlHIjYoI+R9Bi5vi2fiou3TtGOA+iZv6Kodqr0JHCkp55+FQhusC0zYR/kPV2
 8seQ==
X-Gm-Message-State: APjAAAVDTdEkElm4/khsaRb2UgbrEggqUu/jOaBh8USC9UuyBKHHAs8O
 weRexdgXDYMPsRzv5Hl0L15k1+femE0=
X-Google-Smtp-Source: APXvYqyD2LKacNDtVA40vbH/oPvISeKMXPkF26+OqXmu9WgVNksNB1yfm+DbTWlQb53mvEwEuvSScw==
X-Received: by 2002:aa7:90ce:: with SMTP id k14mr71506646pfk.239.1560118972089; 
 Sun, 09 Jun 2019 15:22:52 -0700 (PDT)
Received: from localhost.localdomain (97-113-13-231.tukw.qwest.net.
 [97.113.13.231])
 by smtp.gmail.com with ESMTPSA id q198sm3165336pfq.155.2019.06.09.15.22.49
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 09 Jun 2019 15:22:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sun,  9 Jun 2019 15:22:49 -0700
Message-Id: <20190609222249.28818-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: [Qemu-devel] [PATCH] target/arm: Fix output of PAuth Auth
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The ARM pseudocode installs the error_code into the original
pointer, not the encrypted pointer.  The difference applies
within the 7 bits of pac data; the result should be the sign
extension of bit 55.

Add a testcase to that effect.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/pauth_helper.c         |  4 +-
 tests/tcg/aarch64/pauth-2.c       | 61 +++++++++++++++++++++++++++++++
 tests/tcg/aarch64/Makefile.target |  2 +-
 3 files changed, 64 insertions(+), 3 deletions(-)
 create mode 100644 tests/tcg/aarch64/pauth-2.c

diff --git a/target/arm/pauth_helper.c b/target/arm/pauth_helper.c
index 7f30ae7395..d3194f2043 100644
--- a/target/arm/pauth_helper.c
+++ b/target/arm/pauth_helper.c
@@ -344,9 +344,9 @@ static uint64_t pauth_auth(CPUARMState *env, uint64_t ptr, uint64_t modifier,
     if (unlikely(extract64(test, bot_bit, top_bit - bot_bit))) {
         int error_code = (keynumber << 1) | (keynumber ^ 1);
         if (param.tbi) {
-            return deposit64(ptr, 53, 2, error_code);
+            return deposit64(orig_ptr, 53, 2, error_code);
         } else {
-            return deposit64(ptr, 61, 2, error_code);
+            return deposit64(orig_ptr, 61, 2, error_code);
         }
     }
     return orig_ptr;
diff --git a/tests/tcg/aarch64/pauth-2.c b/tests/tcg/aarch64/pauth-2.c
new file mode 100644
index 0000000000..2fe030ba3d
--- /dev/null
+++ b/tests/tcg/aarch64/pauth-2.c
@@ -0,0 +1,61 @@
+#include <stdint.h>
+#include <assert.h>
+
+asm(".arch armv8.4-a");
+
+void do_test(uint64_t value)
+{
+    uint64_t salt1, salt2;
+    uint64_t encode, decode;
+
+    /*
+     * With TBI enabled and a 48-bit VA, there are 7 bits of auth,
+     * and so a 1/128 chance of encode = pac(value,key,salt) producing
+     * an auth for which leaves value unchanged.
+     * Iterate until we find a salt for which encode != value.
+     */
+    for (salt1 = 1; ; salt1++) {
+        asm volatile("pacda %0, %2" : "=r"(encode) : "0"(value), "r"(salt1));
+        if (encode != value) {
+            break;
+        }
+    }
+
+    /* A valid salt must produce a valid authorization.  */
+    asm volatile("autda %0, %2" : "=r"(decode) : "0"(encode), "r"(salt1));
+    assert(decode == value);
+
+    /*
+     * An invalid salt usually fails authorization, but again there
+     * is a chance of choosing another salt that works.
+     * Iterate until we find another salt which does fail.
+     */
+    for (salt2 = salt1 + 1; ; salt2++) {
+        asm volatile("autda %0, %2" : "=r"(decode) : "0"(encode), "r"(salt2));
+        if (decode != value) {
+            break;
+        }
+    }
+
+    /* The VA bits, bit 55, and the TBI bits, should be unchanged.  */
+    assert(((decode ^ value) & 0xff80ffffffffffffull) == 0);
+
+    /*
+     * Bits [54:53] are an error indicator based on the key used;
+     * the DA key above is keynumber 0, so error == 0b01.  Otherwise
+     * bit 55 of the original is sign-extended into the rest of the auth.
+     */
+    if ((value >> 55) & 1) {
+        assert(((decode >> 48) & 0xff) == 0b10111111);
+    } else {
+        assert(((decode >> 48) & 0xff) == 0b00100000);
+    }
+}
+
+int main()
+{
+    do_test(0);
+    do_test(-1);
+    do_test(0xda004acedeadbeefull);
+    return 0;
+}
diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
index 2bb914975b..31ba9cfcaa 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -15,7 +15,7 @@ run-fcvt: fcvt
 	$(call run-test,$<,$(QEMU) $<, "$< on $(TARGET_NAME)")
 	$(call diff-out,$<,$(AARCH64_SRC)/fcvt.ref)
 
-AARCH64_TESTS += pauth-1
+AARCH64_TESTS += pauth-1 pauth-2
 run-pauth-%: QEMU += -cpu max
 
 TESTS:=$(AARCH64_TESTS)
-- 
2.17.1


