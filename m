Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C54458B924
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Aug 2019 14:51:10 +0200 (CEST)
Received: from localhost ([::1]:51992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hxWGc-00045i-06
	for lists+qemu-devel@lfdr.de; Tue, 13 Aug 2019 08:51:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53558)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alex.bennee@linaro.org>) id 1hxWFM-0002Gq-Bb
 for qemu-devel@nongnu.org; Tue, 13 Aug 2019 08:49:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1hxWFL-0000eZ-1I
 for qemu-devel@nongnu.org; Tue, 13 Aug 2019 08:49:52 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:54932)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1hxWFK-0000dI-RM
 for qemu-devel@nongnu.org; Tue, 13 Aug 2019 08:49:50 -0400
Received: by mail-wm1-x341.google.com with SMTP id p74so1391013wme.4
 for <qemu-devel@nongnu.org>; Tue, 13 Aug 2019 05:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bzhZ2dvCDc+pUSd5l57iGhNYKTcXOEr6qbHitn8Zc+c=;
 b=h982IvVqIYV+ZjyA983mzieTIw4nGQdNXcRCXtWG4Xn6pyY7A8JKwtV/weaGCOla/+
 3pIJJdyOTmEAGTnGpldt+tKp1rk5014Qfmo4TEfJuDYd4TkBsvFbn99P4cPjDV+Y3RPF
 rXHrds7mqRzSUST2EFnNoGEnNshWY9tXMhw7s4D1HhlNpwGs9EKvMTV91HtKWSRJnzL8
 sF5vHcU5v6Rmjra/Qq1ffFinp1K3cLSgMHmbd1Cz03Cie/Ja0xFJ+Sza2tnTEQ6YpT+m
 eK4ax7sDZgVBdQqyPraxdecytXymdttXBQAfX1bvO3/Lqz9VYD0ovdZOIBRL9qqSYs+U
 a+WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bzhZ2dvCDc+pUSd5l57iGhNYKTcXOEr6qbHitn8Zc+c=;
 b=M00A1trmKLwQzbMv/K+x7rATjxuoVL853XDrBmKLeKXQ5LaGmmHDeN3uD9ZrUK3Joi
 AD2HCN/WcEjsp0FylBl3Oz8JE2eFtY4+6CnenqV3gfH7qUZoM1+V40k55JF0Z9jQCld4
 Ih/6Pun/QAqcm/CQiGL63QRtsVlH0D8lU3fOsBZMDRX1NKiZTZcwEC7zwh5mqpISUz3G
 JgroHHW3W/yW1SMByFVmXIfAKDNpRX+T/TkKzU0/oMhRQdZ0l/tCCrulEzFKfk31mqWw
 vqV7RAVtSCsNVaXJ9iXb96khY8+QPRW21wbMB0U/XS5gkd9tnkXO2axPRGyjAyoEzRbG
 bCgA==
X-Gm-Message-State: APjAAAUvxcu7bDGBGE5b2tj+uoAfMR0dpjkTKSjp1z17i5Q6+vyb5zZs
 +5kSLhYIEjUxNKWWzkKKZfDSxQ==
X-Google-Smtp-Source: APXvYqydiIN1sPxKSAEE3dgFCJTU+in7UYjQmXbS4QTvLfSaPeur6Zk3fhAioGjb7eBwoBSOeoGX/A==
X-Received: by 2002:a7b:ca54:: with SMTP id m20mr3060824wml.102.1565700589733; 
 Tue, 13 Aug 2019 05:49:49 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
 by smtp.gmail.com with ESMTPSA id z18sm954417wml.10.2019.08.13.05.49.47
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 13 Aug 2019 05:49:48 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2DE231FF90;
 Tue, 13 Aug 2019 13:49:47 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 13 Aug 2019 13:49:36 +0100
Message-Id: <20190813124946.25322-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190813124946.25322-1-alex.bennee@linaro.org>
References: <20190813124946.25322-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
Subject: [Qemu-devel] [PATCH v3 03/13] fpu: optimise
 float[16/32/64]_squash_denormal (HACK?)
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, armbru@redhat.com,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Using the floatXX_pack_raw functions is slight overkill for basically
just masking out all but the top bit of the number. This makes the
final code exactly the same as pre-conversion.

TODO: is this worth it, can the compiler do better with make_float?

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 fpu/softfloat.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 0a434555cd8..9e57b7b5933 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -3294,23 +3294,23 @@ float64 float64_silence_nan(float64 a, float_status *status)
 | input-denormal exception and return zero. Otherwise just return the value.
 *----------------------------------------------------------------------------*/
 
-static FloatParts parts_squash_denormal(FloatParts p, float_status *status)
+static bool parts_squash_denormal(FloatParts p, float_status *status)
 {
     if (p.exp == 0 && p.frac != 0) {
         float_raise(float_flag_input_denormal, status);
-        p.frac = 0;
-        p.cls = float_class_zero;
+        return true;
     }
 
-    return p;
+    return false;
 }
 
 float16 float16_squash_input_denormal(float16 a, float_status *status)
 {
     if (status->flush_inputs_to_zero) {
         FloatParts p = float16_unpack_raw(a);
-        p = parts_squash_denormal(p, status);
-        return float16_pack_raw(p);
+        if (parts_squash_denormal(p, status)) {
+            a = make_float16(float16_val(a) & 0x8000);
+        }
     }
     return a;
 }
@@ -3319,8 +3319,9 @@ float32 float32_squash_input_denormal(float32 a, float_status *status)
 {
     if (status->flush_inputs_to_zero) {
         FloatParts p = float32_unpack_raw(a);
-        p = parts_squash_denormal(p, status);
-        return float32_pack_raw(p);
+        if (parts_squash_denormal(p, status)) {
+            a = make_float32(float32_val(a) & 0x80000000);
+        }
     }
     return a;
 }
@@ -3329,8 +3330,9 @@ float64 float64_squash_input_denormal(float64 a, float_status *status)
 {
     if (status->flush_inputs_to_zero) {
         FloatParts p = float64_unpack_raw(a);
-        p = parts_squash_denormal(p, status);
-        return float64_pack_raw(p);
+        if (parts_squash_denormal(p, status)) {
+            a = make_float64(float64_val(a) & (1ULL << 63));
+        }
     }
     return a;
 }
-- 
2.20.1


