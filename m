Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A81C5A10FF
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 14:48:30 +0200 (CEST)
Received: from localhost ([::1]:55050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRCHX-0006n7-Rt
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 08:48:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRC44-0001gI-Tz
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 08:34:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRC41-0007Zi-K6
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 08:34:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661430865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2eEz616sRTG4Hw2X/Y5wfEZilY9d7SeyeW4s9PTl1FY=;
 b=C1y+D1wJ+qpbvEoBrFQYZ7XJdTde5tV1K1NaiqJqwrjj7OuMHFtppVbovwSDCrb6YkbD5q
 LNJkOvfc0zPCxBDr+zuqPdA6AGTXrxWR0bNsUJbeoWJqa0D67EmR8u6jiPw9m0Ms/8MmlE
 GsMKK2PwGwh3HP/6ZCClT/Kpvq8R/z0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-673-FAoW1F6wMay3aDi5mEyZzQ-1; Thu, 25 Aug 2022 08:34:23 -0400
X-MC-Unique: FAoW1F6wMay3aDi5mEyZzQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 n7-20020a1c2707000000b003a638356355so8683082wmn.2
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 05:34:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc;
 bh=2eEz616sRTG4Hw2X/Y5wfEZilY9d7SeyeW4s9PTl1FY=;
 b=LRweIVGrqrok6EETTBq0N6U5STuu828GzMEqUrFrYdskZVYems3WMXEq/8FOGvMAFK
 iO8SXcGlM0cbHtWClsxde3nPAtexk+xeXxbJO/mxIcNGlxZhlS7rIM5eNDtKqATO09Nd
 ViY/hCb51OiefkjUoOfO64ZZxIrdQZr2WwRyLs3eYNOgineK8BtC7+lru6gQLT2C4lgK
 xTZ7sKme+aYc+DttutRdAiFpVg+/E4ERC5/douzzLq2hL/a5wKZJxwUYbTkOImstfzsn
 xukJBWZRHMNRHqv5Qd7pVAzdeHQCVRgNt9DkzWtOiU5lJtLiPjFJUlLZh1c4NDY8Ta6W
 RJKQ==
X-Gm-Message-State: ACgBeo0cNzN09PwaJdoHghmZp7tEuEk7gFcnwiNSp+slFup+pyqC7o5Z
 A6sCBQ4/uycyZbg7zJ6dRQ/gJXh5ChDCHybi4wJnSqe8vfEnZL9EngL/w5CrPk+Qf+dh6i6C87A
 rFPe7OCrCFyeUnY6omscjmyx63fs8KN3ICGK4E2G7n4S8BnkSuGuukwHd9EEsYtyg8sE=
X-Received: by 2002:a05:6000:1545:b0:225:635f:8111 with SMTP id
 5-20020a056000154500b00225635f8111mr2103427wry.152.1661430862400; 
 Thu, 25 Aug 2022 05:34:22 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6zarGdtz60YJeVDSCjjvVyJlgLkPglfehyfBqsj9aLczbdbKkXC5tSZd/SEMqEC7q425X5bQ==
X-Received: by 2002:a05:6000:1545:b0:225:635f:8111 with SMTP id
 5-20020a056000154500b00225635f8111mr2103409wry.152.1661430861959; 
 Thu, 25 Aug 2022 05:34:21 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.gmail.com with ESMTPSA id
 p19-20020a05600c1d9300b003a6077384ecsm5491141wms.31.2022.08.25.05.34.20
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 05:34:21 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] tests/tcg: i386: extend BMI test
Date: Thu, 25 Aug 2022 14:34:18 +0200
Message-Id: <20220825123418.319668-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

Cover all BMI1 and BMI2 instructions, both 32- and 64-bit.

Due to the use of inlines, the test now has to be compiled with -O2.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/tcg/i386/Makefile.target  |   1 +
 tests/tcg/i386/test-i386-bmi2.c | 169 ++++++++++++++++++++++++++++++--
 2 files changed, 162 insertions(+), 8 deletions(-)

diff --git a/tests/tcg/i386/Makefile.target b/tests/tcg/i386/Makefile.target
index 5614838ffc..646b4ac13e 100644
--- a/tests/tcg/i386/Makefile.target
+++ b/tests/tcg/i386/Makefile.target
@@ -18,6 +18,7 @@ test-i386-pcmpistri: CFLAGS += -msse4.2
 run-test-i386-pcmpistri: QEMU_OPTS += -cpu max
 run-plugin-test-i386-pcmpistri-%: QEMU_OPTS += -cpu max
 
+test-i386-bmi2: CFLAGS=-O2
 run-test-i386-bmi2: QEMU_OPTS += -cpu max
 run-plugin-test-i386-bmi2-%: QEMU_OPTS += -cpu max
 
diff --git a/tests/tcg/i386/test-i386-bmi2.c b/tests/tcg/i386/test-i386-bmi2.c
index 935a4d2a73..5fadf47510 100644
--- a/tests/tcg/i386/test-i386-bmi2.c
+++ b/tests/tcg/i386/test-i386-bmi2.c
@@ -1,6 +1,66 @@
 /* See if various BMI2 instructions give expected results */
 #include <assert.h>
 #include <stdint.h>
+#include <stdio.h>
+
+#define insn1q(name, arg0)                                                           \
+static inline uint64_t name##q(uint64_t arg0)                                        \
+{                                                                                    \
+    uint64_t result64;                                                               \
+    asm volatile (#name "q   %1, %0" : "=r"(result64) : "rm"(arg0));                 \
+    return result64;                                                                 \
+}
+
+#define insn1l(name, arg0)                                                           \
+static inline uint32_t name##l(uint32_t arg0)                                        \
+{                                                                                    \
+    uint32_t result32;                                                               \
+    asm volatile (#name "l   %k1, %k0" : "=r"(result32) : "rm"(arg0));               \
+    return result32;                                                                 \
+}
+
+#define insn2q(name, arg0, c0, arg1, c1)                                             \
+static inline uint64_t name##q(uint64_t arg0, uint64_t arg1)                         \
+{                                                                                    \
+    uint64_t result64;                                                               \
+    asm volatile (#name "q   %2, %1, %0" : "=r"(result64) : c0(arg0), c1(arg1));     \
+    return result64;                                                                 \
+}
+
+#define insn2l(name, arg0, c0, arg1, c1)                                             \
+static inline uint32_t name##l(uint32_t arg0, uint32_t arg1)                         \
+{                                                                                    \
+    uint32_t result32;                                                               \
+    asm volatile (#name "l   %k2, %k1, %k0" : "=r"(result32) : c0(arg0), c1(arg1));  \
+    return result32;                                                                 \
+}
+
+#ifdef __x86_64
+insn2q(pext, src, "r", mask, "rm")
+insn2q(pdep, src, "r", mask, "rm")
+insn2q(andn, clear, "rm", val, "r")
+insn2q(bextr, range, "rm", val, "r")
+insn2q(bzhi, pos, "rm", val, "r")
+insn2q(rorx, val, "r", n, "i")
+insn2q(sarx, val, "rm", n, "r")
+insn2q(shlx, val, "rm", n, "r")
+insn2q(shrx, val, "rm", n, "r")
+insn1q(blsi, src)
+insn1q(blsmsk, src)
+insn1q(blsr, src)
+#endif
+insn2l(pext, src, "r", mask, "rm")
+insn2l(pdep, src, "r", mask, "rm")
+insn2l(andn, clear, "rm", val, "r")
+insn2l(bextr, range, "rm", val, "r")
+insn2l(bzhi, pos, "rm", val, "r")
+insn2l(rorx, val, "r", n, "i")
+insn2l(sarx, val, "rm", n, "r")
+insn2l(shlx, val, "rm", n, "r")
+insn2l(shrx, val, "rm", n, "r")
+insn1l(blsi, src)
+insn1l(blsmsk, src)
+insn1l(blsr, src)
 
 int main(int argc, char *argv[]) {
     uint64_t ehlo = 0x202020204f4c4845ull;
@@ -11,32 +71,125 @@ int main(int argc, char *argv[]) {
     uint64_t result64;
 
     /* 64 bits */
-    asm volatile ("pextq   %2, %1, %0" : "=r"(result64) : "r"(ehlo), "m"(mask));
+    result64 = andnq(mask, ehlo);
+    assert(result64 == 0x002020204d4c4844);
+
+    result64 = pextq(ehlo, mask);
     assert(result64 == 133);
 
-    asm volatile ("pdepq   %2, %1, %0" : "=r"(result64) : "r"(result64), "m"(mask));
+    result64 = pdepq(result64, mask);
     assert(result64 == (ehlo & mask));
 
-    asm volatile ("pextq   %2, %1, %0" : "=r"(result64) : "r"(-1ull), "m"(mask));
+    result64 = pextq(-1ull, mask);
     assert(result64 == 511); /* mask has 9 bits set */
 
-    asm volatile ("pdepq   %2, %1, %0" : "=r"(result64) : "r"(-1ull), "m"(mask));
+    result64 = pdepq(-1ull, mask);
     assert(result64 == mask);
+
+    result64 = bextrq(mask, 0x3f00);
+    assert(result64 == (mask & ~INT64_MIN));
+
+    result64 = bextrq(mask, 0x1038);
+    assert(result64 == 0xa0);
+
+    result64 = bextrq(mask, 0x10f8);
+    assert(result64 == 0);
+
+    result64 = blsiq(0x30);
+    assert(result64 == 0x10);
+
+    result64 = blsiq(0x30ull << 32);
+    assert(result64 == 0x10ull << 32);
+
+    result64 = blsmskq(0x30);
+    assert(result64 == 0x1f);
+
+    result64 = blsrq(0x30);
+    assert(result64 == 0x20);
+
+    result64 = blsrq(0x30ull << 32);
+    assert(result64 == 0x20ull << 32);
+
+    result64 = bzhiq(mask, 0x3f);
+    assert(result64 == (mask & ~INT64_MIN));
+
+    result64 = bzhiq(mask, 0x1f);
+    assert(result64 == (mask & ~(-1 << 30)));
+
+    result64 = rorxq(0x2132435465768798, 8);
+    assert(result64 == 0x9821324354657687);
+
+    result64 = sarxq(0xffeeddccbbaa9988, 8);
+    assert(result64 == 0xffffeeddccbbaa99);
+
+    result64 = sarxq(0x77eeddccbbaa9988, 8 | 64);
+    assert(result64 == 0x0077eeddccbbaa99);
+
+    result64 = shrxq(0xffeeddccbbaa9988, 8);
+    assert(result64 == 0x00ffeeddccbbaa99);
+
+    result64 = shrxq(0x77eeddccbbaa9988, 8 | 192);
+    assert(result64 == 0x0077eeddccbbaa99);
+
+    result64 = shlxq(0xffeeddccbbaa9988, 8);
+    assert(result64 == 0xeeddccbbaa998800);
 #endif
 
     /* 32 bits */
-    asm volatile ("pextl   %2, %k1, %k0" : "=r"(result32) : "r"((uint32_t) ehlo), "m"(mask));
+    result32 = andnl(mask, ehlo);
+    assert(result32 == 0x04d4c4844);
+
+    result32 = pextl((uint32_t) ehlo, mask);
     assert(result32 == 5);
 
-    asm volatile ("pdepl   %2, %k1, %k0" : "=r"(result32) : "r"(result32), "m"(mask));
+    result32 = pdepl(result32, mask);
     assert(result32 == (uint32_t)(ehlo & mask));
 
-    asm volatile ("pextl   %2, %k1, %k0" : "=r"(result32) : "r"(-1ull), "m"(mask));
+    result32 = pextl(-1u, mask);
     assert(result32 == 7); /* mask has 3 bits set */
 
-    asm volatile ("pdepl   %2, %k1, %k0" : "=r"(result32) : "r"(-1ull), "m"(mask));
+    result32 = pdepl(-1u, mask);
     assert(result32 == (uint32_t)mask);
 
+    result32 = bextrl(mask, 0x1f00);
+    assert(result32 == (mask & ~INT32_MIN));
+
+    result32 = bextrl(ehlo, 0x1018);
+    assert(result32 == 0x4f);
+
+    result32 = bextrl(mask, 0x1038);
+    assert(result32 == 0);
+
+    result32 = blsil(0xffff);
+    assert(result32 == 1);
+
+    result32 = blsmskl(0x300);
+    assert(result32 == 0x1ff);
+
+    result32 = blsrl(0xffc);
+    assert(result32 == 0xff8);
+
+    result32 = bzhil(mask, 0xf);
+    assert(result32 == 1);
+
+    result32 = rorxl(0x65768798, 8);
+    assert(result32 == 0x98657687);
+
+    result32 = sarxl(0xffeeddcc, 8);
+    assert(result32 == 0xffffeedd);
+
+    result32 = sarxl(0x77eeddcc, 8 | 32);
+    assert(result32 == 0x0077eedd);
+
+    result32 = shrxl(0xffeeddcc, 8);
+    assert(result32 == 0x00ffeedd);
+
+    result32 = shrxl(0x77eeddcc, 8 | 128);
+    assert(result32 == 0x0077eedd);
+
+    result32 = shlxl(0xffeeddcc, 8);
+    assert(result32 == 0xeeddcc00);
+
     return 0;
 }
 
-- 
2.37.1


