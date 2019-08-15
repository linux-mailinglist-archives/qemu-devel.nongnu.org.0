Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 433388E2A7
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Aug 2019 04:21:30 +0200 (CEST)
Received: from localhost ([::1]:37434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hy5OK-0001g3-Nq
	for lists+qemu-devel@lfdr.de; Wed, 14 Aug 2019 22:21:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46664)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jan.bobek@gmail.com>) id 1hy5DI-0005ya-Mn
 for qemu-devel@nongnu.org; Wed, 14 Aug 2019 22:10:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jan.bobek@gmail.com>) id 1hy5DH-0008HV-Cr
 for qemu-devel@nongnu.org; Wed, 14 Aug 2019 22:10:04 -0400
Received: from mail-yw1-xc43.google.com ([2607:f8b0:4864:20::c43]:37210)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jan.bobek@gmail.com>) id 1hy5DH-0008HA-8h
 for qemu-devel@nongnu.org; Wed, 14 Aug 2019 22:10:03 -0400
Received: by mail-yw1-xc43.google.com with SMTP id u141so299416ywe.4
 for <qemu-devel@nongnu.org>; Wed, 14 Aug 2019 19:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4CK+/tqFumu5cqD2bCvSyCvaayre0ms7vwE+gEz3afc=;
 b=bUVVcO4BbhajbYsOArvKeLcSUIANzCUfg+z360t/iFZ2u/lr6eFBInBIs5ujnLBaZ2
 at0fZywJ+RyYRDEkPzRz+BCHcEW9T9qyGYqrvTwZ26lnLClOTFZ/Gve0pf5UUsXpdzd8
 4UYAS90q1VJAMTs7v6XRUFs21gp/uY37It8D513jjZ03Z5MwXBhelbqMBDTDUXIEKTjY
 n8ableGWHLPDCXVjrHROgnGrVRHZ/VinpVJlj8zrxqugKMQS4767+yR/r0Cce5e1UPh/
 He8WtEwOEFpCbEYiFDFF1YansmdJYwv7jX8PnGVMYCHT2bbQXlc0jaP9jiO/feWa3Ghx
 wAQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4CK+/tqFumu5cqD2bCvSyCvaayre0ms7vwE+gEz3afc=;
 b=tN/F8jDtphe7Mg6WSqhP4leRz3bzwr20dEt18/tiHowOFWHStkyyjmDdiN08lqy53U
 vWRhEBn4kbl/k6050i0WzJM3GPB4fUkQgRbALowIAmLYJ0bUgtqY77KWLDJr0TkgZSts
 aSQ3g7P5odxXB4ARWFUxY1CnUkY3MRPWDpWMBDMQQX//sQaCT0K7pQWh4wcmGTck1HPM
 WmSXatwZ8UFQoyilL2zSwL5gSppWG6t8o3mb1slU/bPmy0CB7CYYvRQ+NERbcPQDzjxX
 9jzwmakWHlj+AKxh0+2SKnZRrxL3zs303sndgvMUvmkzYBSYyJw1w630uCjw0FO9xLtz
 OI/w==
X-Gm-Message-State: APjAAAUruU05Bo/6TjsuEDWL/q8LpYxxCRao62ujeNjZhnu7YBnxy/LO
 ZlTJr0mIX/gjme/6vwqsbgiFu6ck
X-Google-Smtp-Source: APXvYqz/eH5YQG0BoT5m6syGo9Nmwaa7ClZTRTjE7VqncjOol9+wF3e3sIGnpMwjqQX1OkyKbvuvJg==
X-Received: by 2002:a81:aa50:: with SMTP id z16mr1524522ywk.278.1565835002571; 
 Wed, 14 Aug 2019 19:10:02 -0700 (PDT)
Received: from dionysus.attlocal.net ([2601:c0:c67f:e390:8a9a:e33f:caf8:f018])
 by smtp.gmail.com with ESMTPSA id
 j3sm374882ywk.21.2019.08.14.19.10.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Aug 2019 19:10:02 -0700 (PDT)
From: Jan Bobek <jan.bobek@gmail.com>
To: qemu-devel@nongnu.org
Date: Wed, 14 Aug 2019 22:08:51 -0400
Message-Id: <20190815020928.9679-10-jan.bobek@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190815020928.9679-1-jan.bobek@gmail.com>
References: <20190815020928.9679-1-jan.bobek@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::c43
Subject: [Qemu-devel] [RFC PATCH v3 09/46] target/i386: make variable is_xmm
 const
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
Cc: Jan Bobek <jan.bobek@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The variable is_xmm does not change value after assignment, so make
this fact explicit by marking it const.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Jan Bobek <jan.bobek@gmail.com>
---
 target/i386/translate.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/target/i386/translate.c b/target/i386/translate.c
index 8bf39b73c4..c5ec309fe2 100644
--- a/target/i386/translate.c
+++ b/target/i386/translate.c
@@ -3042,7 +3042,7 @@ static const struct SSEOpHelper_eppi sse_op_table7[256] = {
 
 static void gen_sse(CPUX86State *env, DisasContext *s, int b)
 {
-    int op1_offset, op2_offset, is_xmm, val;
+    int op1_offset, op2_offset, val;
     int modrm, mod, rm, reg;
     SSEFunc_0_epp sse_fn_epp;
     SSEFunc_0_eppi sse_fn_eppi;
@@ -3056,20 +3056,15 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b)
         : s->prefix & PREFIX_REPZ ? 2
         : s->prefix & PREFIX_REPNZ ? 3
         : 0;
+    const int is_xmm =
+        (0x10 <= b && b <= 0x5f)
+        || b == 0xc6
+        || b == 0xc2
+        || !!b1;
     sse_fn_epp = sse_op_table1[b][b1];
     if (!sse_fn_epp) {
         goto unknown_op;
     }
-    if ((b <= 0x5f && b >= 0x10) || b == 0xc6 || b == 0xc2) {
-        is_xmm = 1;
-    } else {
-        if (b1 == 0) {
-            /* MMX case */
-            is_xmm = 0;
-        } else {
-            is_xmm = 1;
-        }
-    }
     /* simple MMX/SSE operation */
     if (s->flags & HF_TS_MASK) {
         gen_exception(s, EXCP07_PREX);
-- 
2.20.1


