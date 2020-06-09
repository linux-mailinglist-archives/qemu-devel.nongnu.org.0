Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9301F4178
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Jun 2020 18:54:35 +0200 (CEST)
Received: from localhost ([::1]:56976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jihWE-0007oF-AJ
	for lists+qemu-devel@lfdr.de; Tue, 09 Jun 2020 12:54:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aleksandar.qemu.devel@gmail.com>)
 id 1jih7R-0006KC-Ap
 for qemu-devel@nongnu.org; Tue, 09 Jun 2020 12:28:57 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:51221)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aleksandar.qemu.devel@gmail.com>)
 id 1jih7P-00019Q-Eb
 for qemu-devel@nongnu.org; Tue, 09 Jun 2020 12:28:56 -0400
Received: by mail-wm1-x32f.google.com with SMTP id u13so3452476wml.1
 for <qemu-devel@nongnu.org>; Tue, 09 Jun 2020 09:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=UQ2Sy3jjpiezdKYPxmeYXsC8SSB4J+vTd+4MX7GuzJY=;
 b=CIfb8iShBC5aOnSW1PYEZAb99aT3e2bVO9YY9DGp6t8fWfCjVC2szYVF7ev5VMMVc5
 xr6ofameQKrp0wGFiBzju/Hcxt83heCL1pgC1rpOohIAvDafzS9O5wc52ySqw6RT+LE6
 8PSejBp5Z++MyBtssfeleeti1Xih8sVddFN4RO4rcZ7mY91UxPdOfCbVDpdN/MqTCedC
 jEkVWUPshiB3kqROflE+KYqpWsUZ3DntUCia3G2c4MI1X4iZSTNRXld6tg4J7/+wyNXK
 BRlHccsxkeGUiOdmp5/tCfyMt1J7lbR9pyplgYqpKQUyPcHjLQb852b9PjUoTH+oVkCj
 4mzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=UQ2Sy3jjpiezdKYPxmeYXsC8SSB4J+vTd+4MX7GuzJY=;
 b=OaePNEl02M8WOIBDRUDcQBgPf57+S3DqWivnx0IagphpUMx/NZH4tx9raLoQ0OK7kl
 Xj9Lv9JC0dKy7byZbQyyIN/7dnPHo1tEZdcmyacRQpZSmn5BGxveKmWY+QvMQ95aVGr+
 LWZ3KwPO2OpV7cjTxRC39+dXxvVFHBuTmpFIZr/q2tWSrT3gr7zX3W9bATKJiAz4qOiP
 hm4d0OG+ixbkYXR4t/HYDOW8XtAVcAJhvlh09CYgButHyVFIWvXcIFvChmW3haATTscs
 wGnzox4Md9oJAmygINubjlO7pat9mLrYcFfey01TWbDYMe43rAxBV9Ysm1Xta0LsuiBm
 FPyA==
X-Gm-Message-State: AOAM530fRipPyzz4rQ3fYIxzd2lDIhldqmi42Hh4z0oH8l4Ep5zY3zK+
 KHlUyujG+fWb9Usyy52CfIOEqBJm
X-Google-Smtp-Source: ABdhPJy5xebvu01Ak5+FKTRDfBEkpvVmKpVGqFxbylmJtpLbURz80VJAor99uxNE97O60GzhWlPqtA==
X-Received: by 2002:a1c:2506:: with SMTP id l6mr5013860wml.34.1591720129930;
 Tue, 09 Jun 2020 09:28:49 -0700 (PDT)
Received: from rtrkw774-lin.syrmia.com ([46.240.135.226])
 by smtp.gmail.com with ESMTPSA id 23sm3643598wmo.18.2020.06.09.09.28.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Jun 2020 09:28:49 -0700 (PDT)
From: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 14/20] target/mips: fpu: Remove now unused FLOAT_CLASS macro
Date: Tue,  9 Jun 2020 18:28:32 +0200
Message-Id: <1591720118-7378-15-git-send-email-aleksandar.qemu.devel@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591720118-7378-1-git-send-email-aleksandar.qemu.devel@gmail.com>
References: <1591720118-7378-1-git-send-email-aleksandar.qemu.devel@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=aleksandar.qemu.devel@gmail.com; helo=mail-wm1-x32f.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: aleksandar.qemu.devel@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

After demacroing CLASS.<D|S>, this macro is not needed anymore.

Reviewed-by: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Signed-off-by: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Message-Id: <20200518200920.17344-13-aleksandar.qemu.devel@gmail.com>
---
 target/mips/fpu_helper.c | 39 ---------------------------------------
 1 file changed, 39 deletions(-)

diff --git a/target/mips/fpu_helper.c b/target/mips/fpu_helper.c
index b3903f5..e227e53 100644
--- a/target/mips/fpu_helper.c
+++ b/target/mips/fpu_helper.c
@@ -1128,45 +1128,6 @@ FLOAT_RINT(rint_d, 64)
 #define FLOAT_CLASS_POSITIVE_SUBNORMAL 0x100
 #define FLOAT_CLASS_POSITIVE_ZERO      0x200
 
-#define FLOAT_CLASS(name, bits)                                      \
-uint ## bits ## _t float_ ## name(uint ## bits ## _t arg,            \
-                                  float_status *status)              \
-{                                                                    \
-    if (float ## bits ## _is_signaling_nan(arg, status)) {           \
-        return FLOAT_CLASS_SIGNALING_NAN;                            \
-    } else if (float ## bits ## _is_quiet_nan(arg, status)) {        \
-        return FLOAT_CLASS_QUIET_NAN;                                \
-    } else if (float ## bits ## _is_neg(arg)) {                      \
-        if (float ## bits ## _is_infinity(arg)) {                    \
-            return FLOAT_CLASS_NEGATIVE_INFINITY;                    \
-        } else if (float ## bits ## _is_zero(arg)) {                 \
-            return FLOAT_CLASS_NEGATIVE_ZERO;                        \
-        } else if (float ## bits ## _is_zero_or_denormal(arg)) {     \
-            return FLOAT_CLASS_NEGATIVE_SUBNORMAL;                   \
-        } else {                                                     \
-            return FLOAT_CLASS_NEGATIVE_NORMAL;                      \
-        }                                                            \
-    } else {                                                         \
-        if (float ## bits ## _is_infinity(arg)) {                    \
-            return FLOAT_CLASS_POSITIVE_INFINITY;                    \
-        } else if (float ## bits ## _is_zero(arg)) {                 \
-            return FLOAT_CLASS_POSITIVE_ZERO;                        \
-        } else if (float ## bits ## _is_zero_or_denormal(arg)) {     \
-            return FLOAT_CLASS_POSITIVE_SUBNORMAL;                   \
-        } else {                                                     \
-            return FLOAT_CLASS_POSITIVE_NORMAL;                      \
-        }                                                            \
-    }                                                                \
-}                                                                    \
-                                                                     \
-uint ## bits ## _t helper_float_ ## name(CPUMIPSState *env,          \
-                                         uint ## bits ## _t arg)     \
-{                                                                    \
-    return float_ ## name(arg, &env->active_fpu.fp_status);          \
-}
-
-#undef FLOAT_CLASS
-
 uint64_t float_class_d(uint64_t arg, float_status *status)
 {
     if (float64_is_signaling_nan(arg, status)) {
-- 
2.7.4


