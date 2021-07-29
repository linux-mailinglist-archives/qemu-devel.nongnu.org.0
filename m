Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 232AC3DA211
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 13:27:46 +0200 (CEST)
Received: from localhost ([::1]:55234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m94CX-0008OR-5q
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 07:27:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m9419-00010J-Ep
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 07:15:59 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:35450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m940n-0001Eu-8M
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 07:15:56 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 u15-20020a05600c19cfb02902501bdb23cdso6596287wmq.0
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 04:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=bjNMiUKUCYi1YMIhagOS3VyZtwvdg9vDgXthAdg4/AU=;
 b=xwx3JCKFzT1nIRQEPENaVY9u3DmcBFj5Pnmh8Ahjo3p81a4sgGLs1KigrevQQWR689
 ZV1XwYcT8HxrWWr1pogrYP05g/CxNqq6CdZKrMl2O4KzALREP89kb3o35H0c7pBb06ai
 252qfpySUjKuQbT0lNpD4tnhBqlkkJdUw2tEm18b7r1YFTdKuoL6eT7ajQlXlIodgV3b
 fZvf6bATNWBWcudIbHerL0AckgWLQQDUTeVpaJpUYL1Jvn2YHoL7ZULHzKJNxYYDSmDq
 MjV3F4ec9tHOPtfA3Y2dIBlchtOGaApBPz+Jq1MDLnvCE5t9a1PXhh8qXdeGfv6/Hc0a
 6M3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bjNMiUKUCYi1YMIhagOS3VyZtwvdg9vDgXthAdg4/AU=;
 b=VqLvdEbxLkeAooZ8BtqysxSruLqaNe87BnHAIF2rAiJ08ZGAzsTH+N+x0AOE+0ZDNa
 B/8fBwAq/D2MtXemlT9o9OkMZpeksjAsbor0PUM4CYhv76ClV5K56XHr6VFxx18pmt9f
 dMPSdXP+orG/0JHn7HAoRC0dG0KFbubGhhAQHV+BZ+Ty6QWRQhY+I9khazEPou4yZCSX
 v/1RWXaFSruzX3QUcrylTLp1kbDb8PLvAcU5P81E+QIqpVFM4Dl6sPip6y4JEWAoJIdo
 rnIopEslai5ACNFDyyhrftnEdkFUNbfo63+akWvIV0C6oxiyyEQcVuNyeDBu2XQRhPGY
 tdQw==
X-Gm-Message-State: AOAM530v3bcMVX4DsQ3I2omAicBEwx/wMdwZanD49v+DhW5TD58GZIjB
 hl6aLj+bZPyCkM1M1raAaPo9Bo/p+o8AgA==
X-Google-Smtp-Source: ABdhPJywkt57HvKZb3WF0r5DN65lqeODZkFLviJo9aqgVUHni1w9syR3v/uvavtN4JPH+OpvpO0E8g==
X-Received: by 2002:a05:600c:3b98:: with SMTP id
 n24mr13998430wms.182.1627557334673; 
 Thu, 29 Jul 2021 04:15:34 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j140sm3037829wmj.37.2021.07.29.04.15.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 04:15:34 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 24/53] target/arm: Rename MVEGenDualAccOpFn to
 MVEGenLongDualAccOpFn
Date: Thu, 29 Jul 2021 12:14:43 +0100
Message-Id: <20210729111512.16541-25-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210729111512.16541-1-peter.maydell@linaro.org>
References: <20210729111512.16541-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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

The MVEGenDualAccOpFn is a bit misnamed, since it is used for
the "long dual accumulate" operations that use a 64-bit
accumulator. Rename it to MVEGenLongDualAccOpFn so we can
use the former name for the 32-bit accumulator insns.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-mve.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 5c3655efc3c..676411e05cb 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -38,7 +38,7 @@ typedef void MVEGenOneOpFn(TCGv_ptr, TCGv_ptr, TCGv_ptr);
 typedef void MVEGenTwoOpFn(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_ptr);
 typedef void MVEGenTwoOpScalarFn(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_i32);
 typedef void MVEGenTwoOpShiftFn(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_i32);
-typedef void MVEGenDualAccOpFn(TCGv_i64, TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_i64);
+typedef void MVEGenLongDualAccOpFn(TCGv_i64, TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_i64);
 typedef void MVEGenVADDVFn(TCGv_i32, TCGv_ptr, TCGv_ptr, TCGv_i32);
 typedef void MVEGenOneOpImmFn(TCGv_ptr, TCGv_ptr, TCGv_i64);
 typedef void MVEGenVIDUPFn(TCGv_i32, TCGv_ptr, TCGv_ptr, TCGv_i32, TCGv_i32);
@@ -652,7 +652,7 @@ static bool trans_VQDMULLT_scalar(DisasContext *s, arg_2scalar *a)
 }
 
 static bool do_long_dual_acc(DisasContext *s, arg_vmlaldav *a,
-                             MVEGenDualAccOpFn *fn)
+                             MVEGenLongDualAccOpFn *fn)
 {
     TCGv_ptr qn, qm;
     TCGv_i64 rda;
@@ -710,7 +710,7 @@ static bool do_long_dual_acc(DisasContext *s, arg_vmlaldav *a,
 
 static bool trans_VMLALDAV_S(DisasContext *s, arg_vmlaldav *a)
 {
-    static MVEGenDualAccOpFn * const fns[4][2] = {
+    static MVEGenLongDualAccOpFn * const fns[4][2] = {
         { NULL, NULL },
         { gen_helper_mve_vmlaldavsh, gen_helper_mve_vmlaldavxsh },
         { gen_helper_mve_vmlaldavsw, gen_helper_mve_vmlaldavxsw },
@@ -721,7 +721,7 @@ static bool trans_VMLALDAV_S(DisasContext *s, arg_vmlaldav *a)
 
 static bool trans_VMLALDAV_U(DisasContext *s, arg_vmlaldav *a)
 {
-    static MVEGenDualAccOpFn * const fns[4][2] = {
+    static MVEGenLongDualAccOpFn * const fns[4][2] = {
         { NULL, NULL },
         { gen_helper_mve_vmlaldavuh, NULL },
         { gen_helper_mve_vmlaldavuw, NULL },
@@ -732,7 +732,7 @@ static bool trans_VMLALDAV_U(DisasContext *s, arg_vmlaldav *a)
 
 static bool trans_VMLSLDAV(DisasContext *s, arg_vmlaldav *a)
 {
-    static MVEGenDualAccOpFn * const fns[4][2] = {
+    static MVEGenLongDualAccOpFn * const fns[4][2] = {
         { NULL, NULL },
         { gen_helper_mve_vmlsldavsh, gen_helper_mve_vmlsldavxsh },
         { gen_helper_mve_vmlsldavsw, gen_helper_mve_vmlsldavxsw },
@@ -743,7 +743,7 @@ static bool trans_VMLSLDAV(DisasContext *s, arg_vmlaldav *a)
 
 static bool trans_VRMLALDAVH_S(DisasContext *s, arg_vmlaldav *a)
 {
-    static MVEGenDualAccOpFn * const fns[] = {
+    static MVEGenLongDualAccOpFn * const fns[] = {
         gen_helper_mve_vrmlaldavhsw, gen_helper_mve_vrmlaldavhxsw,
     };
     return do_long_dual_acc(s, a, fns[a->x]);
@@ -751,7 +751,7 @@ static bool trans_VRMLALDAVH_S(DisasContext *s, arg_vmlaldav *a)
 
 static bool trans_VRMLALDAVH_U(DisasContext *s, arg_vmlaldav *a)
 {
-    static MVEGenDualAccOpFn * const fns[] = {
+    static MVEGenLongDualAccOpFn * const fns[] = {
         gen_helper_mve_vrmlaldavhuw, NULL,
     };
     return do_long_dual_acc(s, a, fns[a->x]);
@@ -759,7 +759,7 @@ static bool trans_VRMLALDAVH_U(DisasContext *s, arg_vmlaldav *a)
 
 static bool trans_VRMLSLDAVH(DisasContext *s, arg_vmlaldav *a)
 {
-    static MVEGenDualAccOpFn * const fns[] = {
+    static MVEGenLongDualAccOpFn * const fns[] = {
         gen_helper_mve_vrmlsldavhsw, gen_helper_mve_vrmlsldavhxsw,
     };
     return do_long_dual_acc(s, a, fns[a->x]);
-- 
2.20.1


