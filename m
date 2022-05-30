Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9279538651
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 18:49:46 +0200 (CEST)
Received: from localhost ([::1]:40328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nviaP-00038h-O4
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 12:49:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvj-0003Lt-Ut
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:44 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:55933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhve-0007HV-Vj
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:43 -0400
Received: by mail-wm1-x32e.google.com with SMTP id y24so6636157wmq.5
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=cpd7D4YK0XMRZCXxov+SnKlbCAxYBEy6m0qpqFZT8lo=;
 b=LpV/oJUyIjtUVBzTG+HxygkOTnTiUd1XRn2jlNLUFx+HzhuZ7oBhcQmqFlKQ4sMnuY
 6Ym4Ca7cjGHcZekYBpMlSE5aO/KOXmHjYYrxkGyk2FFgh4BT2/taZzN4iqN3c9TzVAXV
 ib9MAW+dz3KM4+WWqSu+UPd7GguqLCIfKIEkEZ9EgGw0XJmk55MT7mhg7LCpEXF3Q7Xm
 e6Nl14GSO8k3lDcsN57SGRkGzIKJtAuKGEm/u1AWc2v/aLz8sVrg0kxZGFueyn7Y+AWn
 Lq6Rpk5qBqnP7eUb0WsmquXJO19AGZvlieB9MJkf0f7J1zpvNtEYjgBzQvocchqEtRvL
 EJxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cpd7D4YK0XMRZCXxov+SnKlbCAxYBEy6m0qpqFZT8lo=;
 b=NmodFmGXNmyHavkOf6FwpA6qw8rHBYiqI1t8Ptxky2poYXy3ID7n7u6q/4e/n4S8Kb
 WdPLFQMdSB0S/oq99idcvcKGDxn0cVLnloItxOP/TA/zjYN5yFdjPk+6OWyDTJCJrnSI
 4l6euJmIxKFjRuHXnIdEAJKaCeN19iEUZ6V5p0TA7S5XCC/2fMZx/g1juxWhkLyVknaS
 lVo8mSbgYpMgfX97qF50IqflMTAwKOD0tb1CwKYV+fb2QKGVY5m1dI/tWihAQvDggiQR
 AL+KdnRBbcocVt3zGZehJsvbAx9GF2GfGNIx2A2+WmveByjM57Ik4Th6+rtl/TB6u2L2
 Iz4A==
X-Gm-Message-State: AOAM5310Nmk+d0WhbxFoYjsriFGE/R/M1R2PX1eSvTT7Z5IH3Id7WYFH
 1amQl0DkGqz7vtIbKyUboaTgtbId0hLr9A==
X-Google-Smtp-Source: ABdhPJxh5fJoryNpdgXarfpQ8Xcpwwt7lEYh/WyDaU6oxzlW+f7TBoYLeFNh9jweTvQltDWOZZltZQ==
X-Received: by 2002:a05:600c:1d28:b0:397:65ab:4b3e with SMTP id
 l40-20020a05600c1d2800b0039765ab4b3emr19666934wms.137.1653926857460; 
 Mon, 30 May 2022 09:07:37 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.07.36
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:07:37 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 034/117] target/arm: Rename do_zzz_fn to gen_gvec_fn_arg_zzz
Date: Mon, 30 May 2022 17:05:45 +0100
Message-Id: <20220530160708.726466-35-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220530160708.726466-1-peter.maydell@linaro.org>
References: <20220530160708.726466-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

Rename the function to match gen_gvec_fn_zzz,
and move to be adjacent.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220527181907.189259-32-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 3af4626e58a..1b3afcc24cf 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -274,6 +274,12 @@ static bool gen_gvec_fn_zzz(DisasContext *s, GVecGen3Fn *gvec_fn,
     return true;
 }
 
+static bool gen_gvec_fn_arg_zzz(DisasContext *s, GVecGen3Fn *fn,
+                                arg_rrr_esz *a)
+{
+    return gen_gvec_fn_zzz(s, fn, a->esz, a->rd, a->rn, a->rm);
+}
+
 /* Invoke a vector expander on four Zregs.  */
 static void gen_gvec_fn_zzzz(DisasContext *s, GVecGen4Fn *gvec_fn,
                              int esz, int rd, int rn, int rm, int ra)
@@ -370,29 +376,24 @@ const uint64_t pred_esz_masks[4] = {
  *** SVE Logical - Unpredicated Group
  */
 
-static bool do_zzz_fn(DisasContext *s, arg_rrr_esz *a, GVecGen3Fn *gvec_fn)
-{
-    return gen_gvec_fn_zzz(s, gvec_fn, a->esz, a->rd, a->rn, a->rm);
-}
-
 static bool trans_AND_zzz(DisasContext *s, arg_rrr_esz *a)
 {
-    return do_zzz_fn(s, a, tcg_gen_gvec_and);
+    return gen_gvec_fn_arg_zzz(s, tcg_gen_gvec_and, a);
 }
 
 static bool trans_ORR_zzz(DisasContext *s, arg_rrr_esz *a)
 {
-    return do_zzz_fn(s, a, tcg_gen_gvec_or);
+    return gen_gvec_fn_arg_zzz(s, tcg_gen_gvec_or, a);
 }
 
 static bool trans_EOR_zzz(DisasContext *s, arg_rrr_esz *a)
 {
-    return do_zzz_fn(s, a, tcg_gen_gvec_xor);
+    return gen_gvec_fn_arg_zzz(s, tcg_gen_gvec_xor, a);
 }
 
 static bool trans_BIC_zzz(DisasContext *s, arg_rrr_esz *a)
 {
-    return do_zzz_fn(s, a, tcg_gen_gvec_andc);
+    return gen_gvec_fn_arg_zzz(s, tcg_gen_gvec_andc, a);
 }
 
 static void gen_xar8_i64(TCGv_i64 d, TCGv_i64 n, TCGv_i64 m, int64_t sh)
@@ -707,32 +708,32 @@ static bool trans_NBSL(DisasContext *s, arg_rrrr_esz *a)
 
 static bool trans_ADD_zzz(DisasContext *s, arg_rrr_esz *a)
 {
-    return do_zzz_fn(s, a, tcg_gen_gvec_add);
+    return gen_gvec_fn_arg_zzz(s, tcg_gen_gvec_add, a);
 }
 
 static bool trans_SUB_zzz(DisasContext *s, arg_rrr_esz *a)
 {
-    return do_zzz_fn(s, a, tcg_gen_gvec_sub);
+    return gen_gvec_fn_arg_zzz(s, tcg_gen_gvec_sub, a);
 }
 
 static bool trans_SQADD_zzz(DisasContext *s, arg_rrr_esz *a)
 {
-    return do_zzz_fn(s, a, tcg_gen_gvec_ssadd);
+    return gen_gvec_fn_arg_zzz(s, tcg_gen_gvec_ssadd, a);
 }
 
 static bool trans_SQSUB_zzz(DisasContext *s, arg_rrr_esz *a)
 {
-    return do_zzz_fn(s, a, tcg_gen_gvec_sssub);
+    return gen_gvec_fn_arg_zzz(s, tcg_gen_gvec_sssub, a);
 }
 
 static bool trans_UQADD_zzz(DisasContext *s, arg_rrr_esz *a)
 {
-    return do_zzz_fn(s, a, tcg_gen_gvec_usadd);
+    return gen_gvec_fn_arg_zzz(s, tcg_gen_gvec_usadd, a);
 }
 
 static bool trans_UQSUB_zzz(DisasContext *s, arg_rrr_esz *a)
 {
-    return do_zzz_fn(s, a, tcg_gen_gvec_ussub);
+    return gen_gvec_fn_arg_zzz(s, tcg_gen_gvec_ussub, a);
 }
 
 /*
-- 
2.25.1


