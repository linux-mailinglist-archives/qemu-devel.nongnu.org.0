Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A91C39069A
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 18:26:17 +0200 (CEST)
Received: from localhost ([::1]:51754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llZsm-0001Aa-2N
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 12:26:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llYeo-0002Lk-TK
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:07:46 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:36707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llYeU-0006nD-Nf
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:07:46 -0400
Received: by mail-pf1-x435.google.com with SMTP id c12so12247783pfl.3
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0sbWGfdi+vZU0+T2mHM/iN4YQ8XRnXrlumJZuqrhiwA=;
 b=U8vlAa+CqUqKsS5kvTd4vH9kS4wTp9q+Jxb6pGIzpbSgvDSw6fd/MMWunDL+NLsG26
 TtVMeR7PxC9+iE0/15EdBl5MnU1lTNQ/MoTkrnL385fNBfNYWFCU1X+LwZxSueT28lAF
 zpXu18aZTFFuKLjlyUtcuMvLquygWFcP+dnIoOgnGwecLv3CQLDkxvZL6Qw+rj9Z8zS5
 JV3PNkLHD/vyz8RtmKCJLquLW4oCbIHJD0mwgmGjAu4ltG22W3tfQSpV8H5rJ/rDxvrE
 iwFudyL6pLWLbgIQ6NV83E5IeqObcWCJVSkWpWT4Ocm1jnH/ZBVLth0575woq9XTS15i
 Mdsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0sbWGfdi+vZU0+T2mHM/iN4YQ8XRnXrlumJZuqrhiwA=;
 b=tNl04iwYZXE8qSL7AmA4WW0pLrTjuejhQCMt7GxIrJEkY1G9zcUL+4EvlqgpuZgoXu
 08f4VXe6+RPXqxLdLTQ/9+v6qrZ2QT2FpVtOGazmTKXymz1EbVlZLA91y2k1ED4G8Mzs
 l6o/b7lPqwg1lF9D6x8oRMlr26kaIXnaYfokiBklSnzCDh1GHzJwOkxi58g2wUVP7ICY
 auwPG7XKzBJcv769PQD4QNzdV3PrcYbmxd9vu6wPwOMIREu7Jj5Q9qWSRrc8WZRb0E8P
 0PnquSvS6IlbulCQfcrhM1Q89Wbml+a4CdJPes/7IVIHDjBIuw2FWcRivQllBsfpk3Lg
 voVA==
X-Gm-Message-State: AOAM5317XtAn6k39Zvf2FeRcN8sFeILmQ5xkXD9JM+vdx87vY97ZTgQD
 e6jOrxzM3kFlaB4N8m0v4Q1L0FZXqPkJrw==
X-Google-Smtp-Source: ABdhPJwGcue5TJ+DsiKWedst7PvNld1ZVc4xnxsRM2I5bGo6pso0LwmKsqWRJ0ckfdDp0vEewrt7Nw==
X-Received: by 2002:aa7:982e:0:b029:2e4:eef5:e0c9 with SMTP id
 q14-20020aa7982e0000b02902e4eef5e0c9mr22082764pfl.3.1621955245403; 
 Tue, 25 May 2021 08:07:25 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id z19sm2231943pjq.11.2021.05.25.08.07.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:07:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 27/28] tests/fp: Enable more tests
Date: Tue, 25 May 2021 08:07:05 -0700
Message-Id: <20210525150706.294968-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525150706.294968-1-richard.henderson@linaro.org>
References: <20210525150706.294968-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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
Cc: alex.bennee@linaro.org, david@redhat.com
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


