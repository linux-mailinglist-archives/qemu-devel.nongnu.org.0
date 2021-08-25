Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A023F73BF
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 12:53:54 +0200 (CEST)
Received: from localhost ([::1]:53648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIqXZ-0002ke-0t
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 06:53:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIqGI-0003zN-9P
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:36:02 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:41682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIqGF-0005UQ-EC
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:36:01 -0400
Received: by mail-wr1-x435.google.com with SMTP id u9so751274wrg.8
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 03:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=bjNMiUKUCYi1YMIhagOS3VyZtwvdg9vDgXthAdg4/AU=;
 b=iIxVYzcAC2yXRfxEtnMRwUDxJG122KdpLFt9Kovgtt+ZJehFhgPsRpCQive1T8G7Lz
 /Nu1bO9VRmZgh6++aNn+kJBCfsWQv2UaFlFmxp3RMBECYVfAjCPhjX7eFAiNALP/4jMk
 Yn/s7bHbR8qBk4panMk6Q47mRyQZpMyhcfpBA0j62/0vd8TA2etnD2+gwKgAzW02IKir
 jfQCA9IQjwcOat6CpoFBEdq/o49ubYfbufD75FWufRyNV5QhdWDBgKVAhqvuXfS+IL3T
 Fp3pTyA8heBGQDjQRDfdDj0oRa7RrbLun82XIxRQQCkN/H2hPMnIrDn4bZ2u4z4kDPtH
 LK0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bjNMiUKUCYi1YMIhagOS3VyZtwvdg9vDgXthAdg4/AU=;
 b=gzf/J+R+MVXfBaArjf70qOTo/Lfv9RSiQuLb/DJFPP1lr6wyP15amidMZ35Af1Az/4
 QZRRjP4tW0uZul892BrOdpqlafmVhBPw/Phkm4PzWLyAQA+m9SJkzwufaAC1GZhNMcjq
 F4iNybmS8kTzwjDGl3j2WQGoAh16MAR88yc6aGemHSsrlbfwi9UrWFzH/t+NAnef682p
 Ynf9/iKY0kpM3MlVXWOvEgONOn4glU8R0roZodhjdTQtJd9EH+nXfGJyxD9sbmjpmh3q
 DQGhLomAUoZSECr325mqVci4U7odrhiBztGjxM4yHJC0lCyyn/On8bKYttiFHXuXgtrv
 L1YQ==
X-Gm-Message-State: AOAM533XT3pt+suQf0+farsNQN7wINmyhQc4mVquaLvQ+NoDxcsgVeGX
 6e4CxN0yhkhVi3TFxmQOsFkt1vtNF8WfdA==
X-Google-Smtp-Source: ABdhPJzMnGqATNgjE8Y4YX6fU+DapxhULgKMxRK4y0pPp519MfesqFtCOO9FLWxnZjfNuRnDrsderQ==
X-Received: by 2002:a5d:51c6:: with SMTP id n6mr24451606wrv.370.1629887757958; 
 Wed, 25 Aug 2021 03:35:57 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m4sm5075931wml.28.2021.08.25.03.35.57
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 03:35:57 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 24/44] target/arm: Rename MVEGenDualAccOpFn to
 MVEGenLongDualAccOpFn
Date: Wed, 25 Aug 2021 11:35:14 +0100
Message-Id: <20210825103534.6936-25-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210825103534.6936-1-peter.maydell@linaro.org>
References: <20210825103534.6936-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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


