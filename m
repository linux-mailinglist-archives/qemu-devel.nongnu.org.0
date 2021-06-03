Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF6B39AD3F
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 23:54:30 +0200 (CEST)
Received: from localhost ([::1]:41660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lovIL-0003lE-9F
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 17:54:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lov6H-0002xL-2G
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 17:42:01 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:34473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lov68-0001BB-Rm
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 17:42:00 -0400
Received: by mail-pg1-x52e.google.com with SMTP id l1so6188282pgm.1
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 14:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0sbWGfdi+vZU0+T2mHM/iN4YQ8XRnXrlumJZuqrhiwA=;
 b=HDrhq4+vlG3C5GOmc5mI2ax4oOXMXjxNVVGWj4BVRttcXz6RsZ4Uh3eQirI28jZjrC
 mAvjckDWm6Q9yPj95Rpuikvth498KEbizIAbukspe5m7UkMur+fMnox6qQHRG9eTpIDz
 C/p0+3H4aXpDP30YtBZFkxE+O2kfrD26y3A94qf9W0l0GpxVE1LyPG3hY+fFc4L0SPdv
 mQbGFB2q6be1NI8VBEyfwtguDYIm+sUKMNELFU5psAInh7qxblGxwfuem/Dbs5OHgL1q
 3qWeHDmvjSdZw2hVhX1u2jhpa+7aiQUuTZ6sPB4w/kP5cO+qYlD7ZN9rPEz5168MEKAi
 EWmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0sbWGfdi+vZU0+T2mHM/iN4YQ8XRnXrlumJZuqrhiwA=;
 b=cw0Ev0sR9eci6LjrV1SotVbs2Vbhji+p2+ZFL4INJ+ab2s5zMY3B2YcwmKXieouoLN
 w6CKBWonSJcmu5ysv3hcmankubyzMe3PhplV9bUCo370uZYZHWi31hxPFP0BlFWG0/Vi
 AKfylOUM2+KKI5pljGR2ysd1YKa/yLJ0gGYSVNloRdWhT46v4S17+RxsqiSrIVIDH/Av
 ItwI/ogcp66rYRmBp7SzDHo6hI+1GdmZsnXjQjB5+2ey+KVwvWzfKNarDDL6eV2uqdGA
 8sborcvxIjeYje/Q8Klfg5B5B2bVbeJEVIayBwELOmkLAZTIvdU+tV8+ic9SW0u1+/Bx
 8a/g==
X-Gm-Message-State: AOAM530tb1q2UfU+AMfVHpKh1pDiJuAhTSSI0RsPUQHXu6vZQTD25YLT
 y6syyrAe6h/Y3+BnF/sZmFOnMKRY9F79Qw==
X-Google-Smtp-Source: ABdhPJxS2NT4C7ii9K1y86ZbXmwf1Z7PhMCFycGyxUf5SPAOdwBMkZntIJAQY5kRUqGH00Un4EjdWw==
X-Received: by 2002:a63:8f4a:: with SMTP id r10mr1494928pgn.242.1622756511005; 
 Thu, 03 Jun 2021 14:41:51 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id p65sm40115pfb.62.2021.06.03.14.41.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 14:41:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 28/29] tests/fp: Enable more tests
Date: Thu,  3 Jun 2021 14:41:30 -0700
Message-Id: <20210603214131.629841-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210603214131.629841-1-richard.henderson@linaro.org>
References: <20210603214131.629841-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alex Bennée <alex.bennee@linaro.org>

Fix the trivial typo in extF80_lt_quiet, and re-enable
all of the floatx80 tests that are now fixed.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-ID: <87bl9iyahr.fsf@linaro.org>
[rth: Squash the fix for lt_quiet, and enable that too.]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/fp/wrap.c.inc  |  2 +-
 tests/fp/meson.build | 16 +++++++---------
 2 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/tests/fp/wrap.c.inc b/tests/fp/wrap.c.inc
index cb1bb77e4c..9ff884c140 100644
--- a/tests/fp/wrap.c.inc
+++ b/tests/fp/wrap.c.inc
@@ -643,7 +643,7 @@ WRAP_CMP80(qemu_extF80M_eq, floatx80_eq_quiet)
 WRAP_CMP80(qemu_extF80M_le, floatx80_le)
 WRAP_CMP80(qemu_extF80M_lt, floatx80_lt)
 WRAP_CMP80(qemu_extF80M_le_quiet, floatx80_le_quiet)
-WRAP_CMP80(qemu_extF80M_lt_quiet, floatx80_le_quiet)
+WRAP_CMP80(qemu_extF80M_lt_quiet, floatx80_lt_quiet)
 #undef WRAP_CMP80
 
 #define WRAP_CMP128(name, func)                                         \
diff --git a/tests/fp/meson.build b/tests/fp/meson.build
index 9218bfd3b0..07e2cdc8d2 100644
--- a/tests/fp/meson.build
+++ b/tests/fp/meson.build
@@ -556,7 +556,9 @@ softfloat_conv_tests = {
                       'extF80_to_f64 extF80_to_f128 ' +
                       'f128_to_f16',
     'int-to-float': 'i32_to_f16 i64_to_f16 i32_to_f32 i64_to_f32 ' +
-                    'i32_to_f64 i64_to_f64 i32_to_f128 i64_to_f128',
+                    'i32_to_f64 i64_to_f64 ' +
+                    'i32_to_extF80 i64_to_extF80 ' +
+                    'i32_to_f128 i64_to_f128',
     'uint-to-float': 'ui32_to_f16 ui64_to_f16 ui32_to_f32 ui64_to_f32 ' +
                      'ui32_to_f64 ui64_to_f64 ui64_to_f128 ' +
                      'ui32_to_extF80 ui64_to_extF80',
@@ -581,7 +583,7 @@ softfloat_conv_tests = {
                      'extF80_to_ui64 extF80_to_ui64_r_minMag ' +
                      'f128_to_ui64 f128_to_ui64_r_minMag',
     'round-to-integer': 'f16_roundToInt f32_roundToInt ' +
-                        'f64_roundToInt f128_roundToInt'
+                        'f64_roundToInt extF80_roundToInt f128_roundToInt'
 }
 softfloat_tests = {
     'eq_signaling' : 'compare',
@@ -602,24 +604,20 @@ fptest_args = ['-s', '-l', '1']
 fptest_rounding_args = ['-r', 'all']
 
 # Conversion Routines:
-# FIXME: i32_to_extF80 (broken), i64_to_extF80 (broken)
-#        extF80_roundToInt (broken)
 foreach k, v : softfloat_conv_tests
   test('fp-test-' + k, fptest,
        args: fptest_args + fptest_rounding_args + v.split(),
        suite: ['softfloat', 'softfloat-conv'])
 endforeach
 
-# FIXME: extF80_{lt_quiet, rem} (broken),
-#        extF80_{mulAdd} (missing)
 foreach k, v : softfloat_tests
-  extF80_broken = ['lt_quiet', 'rem'].contains(k)
   test('fp-test-' + k, fptest,
        args: fptest_args + fptest_rounding_args +
-             ['f16_' + k, 'f32_' + k, 'f64_' + k, 'f128_' + k] +
-             (extF80_broken ? [] : ['extF80_' + k]),
+             ['f16_' + k, 'f32_' + k, 'f64_' + k, 'f128_' + k, 'extF80_' + k],
        suite: ['softfloat', 'softfloat-' + v])
 endforeach
+
+# FIXME: extF80_{mulAdd} (missing)
 test('fp-test-mulAdd', fptest,
      # no fptest_rounding_args
      args: fptest_args +
-- 
2.25.1


