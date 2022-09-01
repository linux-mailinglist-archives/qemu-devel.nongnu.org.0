Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 619E85A9F5E
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 20:47:23 +0200 (CEST)
Received: from localhost ([::1]:52520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTpDm-00062F-6x
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 14:47:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTosI-0007mn-SX
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 14:25:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTosA-0008Ky-ME
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 14:25:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662056702;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ky+mDhTMUmh457wcahi4XIcKoE4doIjSYf3UGcWLn2U=;
 b=NXn1+Mup9r3y7mcml27boxJJBvYLAiHJ68KTWjzb8R37DEl+8cxwFpgPeA+YY8zdEbkPaj
 NQaEIy6WemP0jf74GE6zielDvWJ8KL4oHMO1waIf9VhbPO8CQvDrHG6tPMkNp6yEt7VX8+
 q9sWjJwxYdTbMSNoyG+QBjvdrHWKvpM=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-495-_DVQ29VIPeGQ9uKAd4N_Vg-1; Thu, 01 Sep 2022 14:24:56 -0400
X-MC-Unique: _DVQ29VIPeGQ9uKAd4N_Vg-1
Received: by mail-ed1-f69.google.com with SMTP id
 b13-20020a056402350d00b0043dfc84c533so12108318edd.5
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 11:24:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Ky+mDhTMUmh457wcahi4XIcKoE4doIjSYf3UGcWLn2U=;
 b=oM8G2NyijAOg0fzzxTHSNsmx436C26SGFmzCzCA6IbM3GBPuBTgwPSjkre2sdUq64B
 AHGTV0RIA5AcFdephTZgZNLw1my+BX14Ebyhe4Zgq806gFHYjPuekiDEnR6wqvIz5bfX
 TQh/b+IF0HGUaiK9TMXl4aIy0WmGhaj7h5cvHDS5+qp3JZT8KXCLPTvodYfEIoKrn1Gr
 G9eDHuiZyfPF4KU/2MyLozbhgVy7KyXRejPOcA2qzwilqAl6WkJNuzzeDkXVTq43WWT3
 20+jTn76jCTEWc2fcY6JXfMSAQRCuQ78aXiBykfoiJpEBphg07qww0dJfm44Rzii7vrp
 JlLQ==
X-Gm-Message-State: ACgBeo1zAHFVZF2tllhPdQYuQnXQ98mMQTkyN+jkXhtdLXIXzUHhnrCG
 THJMY6AbhaGvQZ7DAsn9OQMg7pkJcWNpC2nxPKSq3GUSast7LziGBYY6rTRqTmocIXvgtjsGClI
 6I2j9CeWE+rXf7QxU3XMz80QpARCOmVQqctglAOTCwANvj1jsFLon9l1e8GqpSOpoKAY=
X-Received: by 2002:a05:6402:350e:b0:448:4918:af81 with SMTP id
 b14-20020a056402350e00b004484918af81mr19718623edd.384.1662056695257; 
 Thu, 01 Sep 2022 11:24:55 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5PvGgHST38Vhm0XJzSK7veMMB6h6gcT9PbVmTX5FCe6nZOk7FKhZ2f64eVcSav5I/R90A6QQ==
X-Received: by 2002:a05:6402:350e:b0:448:4918:af81 with SMTP id
 b14-20020a056402350e00b004484918af81mr19718603edd.384.1662056694748; 
 Thu, 01 Sep 2022 11:24:54 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 r18-20020a17090609d200b0074150f51d86sm7299692eje.162.2022.09.01.11.24.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 11:24:53 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 12/39] tests/tcg: i386: extend BMI test
Date: Thu,  1 Sep 2022 20:24:02 +0200
Message-Id: <20220901182429.93533-13-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220901182429.93533-1-pbonzini@redhat.com>
References: <20220901182429.93533-1-pbonzini@redhat.com>
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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
2.37.2



