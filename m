Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6F13ACD68
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 16:19:25 +0200 (CEST)
Received: from localhost ([::1]:43136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luFLA-0003VF-8B
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 10:19:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1luFCq-0007d5-QC
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 10:10:49 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:34569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1luFCV-0001wL-HF
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 10:10:48 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 u5-20020a7bc0450000b02901480e40338bso6621327wmc.1
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 07:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=F9963mAn0HXp01JNVVDARECVbWpEusJQnHobNxtO4XM=;
 b=X2asAge8fEBRpJXityfVMz196fb0GRmTKIXzormOwSqi5rxJmr3lbPXnYymc9R0Xmc
 YuhsAibVzeaTL9D49jZFu3mNRv3XnC/adX25e3GzYx35hxCtKBSTzHSqYAe9/gYkbhVV
 gEXs5P5qrT6GMNA9gEznRZ8pZ72Xz0LNp2fTlXdV/54V6p1si/Xn6bwu5AX9AsJChzzP
 MwTn328RLKNErP5Td6ZLdqYMmgXY+pPSgb40s5d7ZT672mYrEyUgEOLX50AO4gXxJXsI
 z9cjd6HpIzfFAjpvEJSweqob5F7NET4PHVyZWymU20NQNFtGLBxxpN4z11YTepsUZZZk
 ZLxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F9963mAn0HXp01JNVVDARECVbWpEusJQnHobNxtO4XM=;
 b=j3Ar7vBwmr14enp3rSB3jIyvBarCvaKNrTOmQ5ZLg/aT21F3fuFQAwsNKa8qBe0reT
 NkW3SUA/kij+Ax6xEI2xXwSqhS/r3mAbuI8ZqlGnf42roFSmuR5PcbWBMgnUP7C7t8Fx
 zBHtBu5+hlsKnzrGKQLVevLP2IoR7hXpwAAB5UWRwahRJvKI4ovXlIy0ujd+i00TB5xQ
 T16KvMOS7yd8F9DfJ9SHXIoqbAKWhK9Seo7x9lIVhFTtglLcJEr5k7LkTQ9LYtZ/QUt2
 c4q4SjEgYmfdUsqXPyQu3JFf5Ye+Wi4PdLAoV4dvBajkaaZZh8+1Xf7cu5HQvbtdnNYp
 +7kw==
X-Gm-Message-State: AOAM5318ep1GwQWN0wIGIRJtY2vLgjbCP4CuiIlUA2GFc9bEpbP9gxk6
 qQkel5jj433hYffDcYn2et5vvQ==
X-Google-Smtp-Source: ABdhPJx1vAV/fjp4MJmoBrBJ6uGWq3j01JlQlfXN7lYY2Ks2b5EmOj6xXT2k7TYorHH8LcVq3BnJ6Q==
X-Received: by 2002:a1c:7314:: with SMTP id d20mr1132372wmb.156.1624025422370; 
 Fri, 18 Jun 2021 07:10:22 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j11sm7751661wmq.4.2021.06.18.07.10.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 07:10:22 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 1/7] target/arm/translate-vfp.c: Whitespace fixes
Date: Fri, 18 Jun 2021 15:10:13 +0100
Message-Id: <20210618141019.10671-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210618141019.10671-1-peter.maydell@linaro.org>
References: <20210618141019.10671-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In the code for handling VFP system register accesses there is some
stray whitespace after a unary '-' operator, and also some incorrect
indent in a couple of function prototypes.  We're about to move this
code to another file, so fix the code style issues first so
checkpatch doesn't complain about the code-movement patch.

Cc: qemu-stable@nongnu.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-vfp.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/target/arm/translate-vfp.c b/target/arm/translate-vfp.c
index 01e26a246d6..5a4a13ec1e1 100644
--- a/target/arm/translate-vfp.c
+++ b/target/arm/translate-vfp.c
@@ -771,9 +771,8 @@ static void gen_branch_fpInactive(DisasContext *s, TCGCond cond,
 }
 
 static bool gen_M_fp_sysreg_write(DisasContext *s, int regno,
-
                                   fp_sysreg_loadfn *loadfn,
-                                 void *opaque)
+                                  void *opaque)
 {
     /* Do a write to an M-profile floating point system register */
     TCGv_i32 tmp;
@@ -874,8 +873,8 @@ static bool gen_M_fp_sysreg_write(DisasContext *s, int regno,
 }
 
 static bool gen_M_fp_sysreg_read(DisasContext *s, int regno,
-                                fp_sysreg_storefn *storefn,
-                                void *opaque)
+                                 fp_sysreg_storefn *storefn,
+                                 void *opaque)
 {
     /* Do a read from an M-profile floating point system register */
     TCGv_i32 tmp;
@@ -1207,7 +1206,7 @@ static void fp_sysreg_to_memory(DisasContext *s, void *opaque, TCGv_i32 value)
     TCGv_i32 addr;
 
     if (!a->a) {
-        offset = - offset;
+        offset = -offset;
     }
 
     addr = load_reg(s, a->rn);
@@ -1242,7 +1241,7 @@ static TCGv_i32 memory_to_fp_sysreg(DisasContext *s, void *opaque)
     TCGv_i32 value = tcg_temp_new_i32();
 
     if (!a->a) {
-        offset = - offset;
+        offset = -offset;
     }
 
     addr = load_reg(s, a->rn);
-- 
2.20.1


