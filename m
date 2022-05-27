Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A151536673
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 19:14:46 +0200 (CEST)
Received: from localhost ([::1]:37716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nudXx-0007No-DP
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 13:14:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nudV6-0003tU-CZ
 for qemu-devel@nongnu.org; Fri, 27 May 2022 13:11:48 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:56296)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nudV4-0001aV-H3
 for qemu-devel@nongnu.org; Fri, 27 May 2022 13:11:48 -0400
Received: by mail-pj1-x1034.google.com with SMTP id n10so5112149pjh.5
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 10:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kJ1AONQywmIewq1fWLOclJuaeny07DgumLqXtdcx1pk=;
 b=Gn2UkoTHUktkc2bzr2pqOQG0ZEN/PNlS9hcXzqJO8opfbCDKslbN3hfPw5zOxaBIEZ
 atopO5BLxpdYj9AYTO0IIpANOWKP3Fxe7K5+dtouAzMFSU15ZMymGXjjS01hvXYEAQU2
 55C7nIGNz5UySISNRDtCFdybgRCKUYRUfx9VlAbvo4JCqdV+/w/1tyI80dnxm1oSLrM0
 RrN7FCx1pL+u0xq+xWwNlAC+NNKkyZvvomx73UgI0Z3vLKxmEBVbtH3A9H86XsrspQYJ
 QXaUFbqAjwjPNh+nj6lMiEw+fgoqLn1gV2GID+I7jgg/t4XYQLvJhGIy/ETFz7VarROq
 thuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kJ1AONQywmIewq1fWLOclJuaeny07DgumLqXtdcx1pk=;
 b=ujGlyzhCZ6bJXjfNG355+nQF8Dutzk4IVnKWw1gniVeTiqWVLeeIRIJsOOnXzIAiq4
 IjzhVgcVnHkUZsdHjdrcnOicp/OE+wQ1buTIWJ61akrzQnQy7B2PW4eIB2BIq4Xm+W+Q
 OoxVI2y+297T58tFCcrgIkPzbWmuGaZYElQfxeqpo8MRg7JYKFQPmvC2p95Y4H7U6hTx
 Q8az6BzjSAb6s4qK9OpXY+JkW6m70ALEGT9hG19RoXGvNW+Jb68vMujbE5b++q6MeVOC
 2eo3W2y+wgu/nWx0fiEE2oaqwcxZ7ua/R00PUZWUIJLhRHVClISv4cAbLveKvZb9e46C
 yNqg==
X-Gm-Message-State: AOAM5303LIpKkchQXutDMVIPOlNEENAGXjncRmAuCfcrp8T1XdUUQ3hA
 JFVNVmcJNuaFLqgkoywIDMY7nfdq5JWX+Q==
X-Google-Smtp-Source: ABdhPJx/vj25HUNDxcqJVdtRS0q934UAR9piTnTn9AX+wjgBGs+8LIE8m1XL1lHZjZg6JlGQ+mROMg==
X-Received: by 2002:a17:902:be01:b0:15e:fb07:ba85 with SMTP id
 r1-20020a170902be0100b0015efb07ba85mr44486775pls.85.1653671505068; 
 Fri, 27 May 2022 10:11:45 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 h6-20020a170902f54600b0016170bb6528sm3995634plf.113.2022.05.27.10.11.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 10:11:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
Subject: [PATCH] tests/tcg/i386: Use explicit suffix on fist insns
Date: Fri, 27 May 2022 10:11:43 -0700
Message-Id: <20220527171143.168276-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Fixes a number of assembler warnings of the form:

test-i386.c: Assembler messages:
test-i386.c:869: Warning: no instruction mnemonic suffix given
  and no register operands; using default for `fist'

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/i386/test-i386-fp-exceptions.c | 24 ++++++++++++------------
 tests/tcg/i386/test-i386.c               |  2 +-
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/tests/tcg/i386/test-i386-fp-exceptions.c b/tests/tcg/i386/test-i386-fp-exceptions.c
index dfb7117c17..d445f13c33 100644
--- a/tests/tcg/i386/test-i386-fp-exceptions.c
+++ b/tests/tcg/i386/test-i386-fp-exceptions.c
@@ -423,35 +423,35 @@ int main(void)
     }
 
     __asm__ volatile ("fnclex");
-    __asm__ volatile ("fistp %0" : "=m" (res_16) : "t" (1.5L) : "st");
+    __asm__ volatile ("fistps %0" : "=m" (res_16) : "t" (1.5L) : "st");
     __asm__ volatile ("fnstsw" : "=a" (sw));
     if ((sw & EXC) != PE) {
         printf("FAIL: fistp inexact\n");
         ret = 1;
     }
     __asm__ volatile ("fnclex");
-    __asm__ volatile ("fistp %0" : "=m" (res_16) : "t" (32767.5L) : "st");
+    __asm__ volatile ("fistps %0" : "=m" (res_16) : "t" (32767.5L) : "st");
     __asm__ volatile ("fnstsw" : "=a" (sw));
     if ((sw & EXC) != IE) {
         printf("FAIL: fistp 32767.5\n");
         ret = 1;
     }
     __asm__ volatile ("fnclex");
-    __asm__ volatile ("fistp %0" : "=m" (res_16) : "t" (-32768.51L) : "st");
+    __asm__ volatile ("fistps %0" : "=m" (res_16) : "t" (-32768.51L) : "st");
     __asm__ volatile ("fnstsw" : "=a" (sw));
     if ((sw & EXC) != IE) {
         printf("FAIL: fistp -32768.51\n");
         ret = 1;
     }
     __asm__ volatile ("fnclex");
-    __asm__ volatile ("fistp %0" : "=m" (res_16) : "t" (ld_nan) : "st");
+    __asm__ volatile ("fistps %0" : "=m" (res_16) : "t" (ld_nan) : "st");
     __asm__ volatile ("fnstsw" : "=a" (sw));
     if ((sw & EXC) != IE) {
         printf("FAIL: fistp nan\n");
         ret = 1;
     }
     __asm__ volatile ("fnclex");
-    __asm__ volatile ("fistp %0" : "=m" (res_16) : "t" (ld_invalid_1.ld) :
+    __asm__ volatile ("fistps %0" : "=m" (res_16) : "t" (ld_invalid_1.ld) :
                       "st");
     __asm__ volatile ("fnstsw" : "=a" (sw));
     if ((sw & EXC) != IE) {
@@ -538,49 +538,49 @@ int main(void)
     }
 
     __asm__ volatile ("fnclex");
-    __asm__ volatile ("fisttp %0" : "=m" (res_16) : "t" (1.5L) : "st");
+    __asm__ volatile ("fisttps %0" : "=m" (res_16) : "t" (1.5L) : "st");
     __asm__ volatile ("fnstsw" : "=a" (sw));
     if ((sw & EXC) != PE) {
         printf("FAIL: fisttp inexact\n");
         ret = 1;
     }
     __asm__ volatile ("fnclex");
-    __asm__ volatile ("fisttp %0" : "=m" (res_16) : "t" (32768.0L) : "st");
+    __asm__ volatile ("fisttps %0" : "=m" (res_16) : "t" (32768.0L) : "st");
     __asm__ volatile ("fnstsw" : "=a" (sw));
     if ((sw & EXC) != IE) {
         printf("FAIL: fisttp 32768\n");
         ret = 1;
     }
     __asm__ volatile ("fnclex");
-    __asm__ volatile ("fisttp %0" : "=m" (res_16) : "t" (32768.5L) : "st");
+    __asm__ volatile ("fisttps %0" : "=m" (res_16) : "t" (32768.5L) : "st");
     __asm__ volatile ("fnstsw" : "=a" (sw));
     if ((sw & EXC) != IE) {
         printf("FAIL: fisttp 32768.5\n");
         ret = 1;
     }
     __asm__ volatile ("fnclex");
-    __asm__ volatile ("fisttp %0" : "=m" (res_16) : "t" (-32769.0L) : "st");
+    __asm__ volatile ("fisttps %0" : "=m" (res_16) : "t" (-32769.0L) : "st");
     __asm__ volatile ("fnstsw" : "=a" (sw));
     if ((sw & EXC) != IE) {
         printf("FAIL: fisttp -32769\n");
         ret = 1;
     }
     __asm__ volatile ("fnclex");
-    __asm__ volatile ("fisttp %0" : "=m" (res_16) : "t" (-32769.5L) : "st");
+    __asm__ volatile ("fisttps %0" : "=m" (res_16) : "t" (-32769.5L) : "st");
     __asm__ volatile ("fnstsw" : "=a" (sw));
     if ((sw & EXC) != IE) {
         printf("FAIL: fisttp -32769.5\n");
         ret = 1;
     }
     __asm__ volatile ("fnclex");
-    __asm__ volatile ("fisttp %0" : "=m" (res_16) : "t" (ld_nan) : "st");
+    __asm__ volatile ("fisttps %0" : "=m" (res_16) : "t" (ld_nan) : "st");
     __asm__ volatile ("fnstsw" : "=a" (sw));
     if ((sw & EXC) != IE) {
         printf("FAIL: fisttp nan\n");
         ret = 1;
     }
     __asm__ volatile ("fnclex");
-    __asm__ volatile ("fisttp %0" : "=m" (res_16) : "t" (ld_invalid_1.ld) :
+    __asm__ volatile ("fisttps %0" : "=m" (res_16) : "t" (ld_invalid_1.ld) :
                       "st");
     __asm__ volatile ("fnstsw" : "=a" (sw));
     if ((sw & EXC) != IE) {
diff --git a/tests/tcg/i386/test-i386.c b/tests/tcg/i386/test-i386.c
index 18d5609665..ac8d5a3c1f 100644
--- a/tests/tcg/i386/test-i386.c
+++ b/tests/tcg/i386/test-i386.c
@@ -866,7 +866,7 @@ void test_fcvt(double a)
         uint16_t val16;
         val16 = (fpuc & ~0x0c00) | (i << 10);
         asm volatile ("fldcw %0" : : "m" (val16));
-        asm volatile ("fist %0" : "=m" (wa) : "t" (a));
+        asm volatile ("fists %0" : "=m" (wa) : "t" (a));
         asm volatile ("fistl %0" : "=m" (ia) : "t" (a));
         asm volatile ("fistpll %0" : "=m" (lla) : "t" (a) : "st");
         asm volatile ("frndint ; fstl %0" : "=m" (ra) : "t" (a));
-- 
2.34.1


