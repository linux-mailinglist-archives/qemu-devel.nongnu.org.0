Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4A71F0F63
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Jun 2020 22:00:16 +0200 (CEST)
Received: from localhost ([::1]:40808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ji1Sp-0004U7-FT
	for lists+qemu-devel@lfdr.de; Sun, 07 Jun 2020 16:00:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aleksandar.qemu.devel@gmail.com>)
 id 1ji1Fg-0003xI-6Q
 for qemu-devel@nongnu.org; Sun, 07 Jun 2020 15:46:40 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:34516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aleksandar.qemu.devel@gmail.com>)
 id 1ji1Fd-0004mg-VB
 for qemu-devel@nongnu.org; Sun, 07 Jun 2020 15:46:39 -0400
Received: by mail-wr1-x430.google.com with SMTP id r7so15171309wro.1
 for <qemu-devel@nongnu.org>; Sun, 07 Jun 2020 12:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=UQ2Sy3jjpiezdKYPxmeYXsC8SSB4J+vTd+4MX7GuzJY=;
 b=YT1jKlfy7wm6GkCP/0Ds4U7UKRMCivNXcFthrXyWnYRi7y68ZOz9/jHyW1I6anK7Il
 I0zr6z+mseKpsSHQcGUJP9sbM2mJ280jbIHd0ylxvZj1oHdbp7Srx0hsb7HYMXiq5FEs
 vob2UR8xL9Sp3ByKn1wqH2WvllVFVZy7jeT3/+QmlHR6XZtKDuOwomPBOH1xF8TsUSKx
 xoBZh4jAFFtuQln8upEjRAH7qFPy7BGx3uanldfC36ebcG+HZvxKLjNLqUmgmoljw7dd
 WScR0BzZE4OEMp0BXeidIYnkDs6JfpRqaScfauI5vZekiP4vfAXZa70Yeewvuu7HTOlE
 JnDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=UQ2Sy3jjpiezdKYPxmeYXsC8SSB4J+vTd+4MX7GuzJY=;
 b=XU2PM5bcXa0s0j/rcxTrO7ADIrQsj0uq4LMjceaDgnqdIoInvfzxrq6uu5FYjDnRds
 ZE5GIdDGijIVzjOoUX30rV5HcUqEv91d1G8Wfzic6SnCGLxcYJRQqtdJGV+iuIYYC1o5
 fg8SAO9UoKAuyJ7fMA5CLQydloxJevDd/hkbq/k9uQP8vfEGPdIrLr91V0XN3sn+hIAg
 lOgi3zekyGokq/Sllo6l4mbrlUAehSmXUS3EYXVRNaxHWlju7FSv+4TQY+ifNYw2SjNJ
 YKa8eVKE+FQctLNzjNdGbxKtyGeA7mV1v9ntJ3mEaWs2QM9OcwGuwFgZUQjh8hIFBKRb
 Mpcw==
X-Gm-Message-State: AOAM531P37zr9el34kOnJRU/S09mO1p8S68xlgsWcQPU3DIc9IZEQSYd
 RmLbuEUEv1X01VPMSlqE/vTMVMuy
X-Google-Smtp-Source: ABdhPJxQ0Icc7lJjrQ+r5Hyq4CTTdp28q2tolux0B3wQfVkMar1x+Dw0slOz867vyAWmH/vB7k/f8w==
X-Received: by 2002:adf:ed4f:: with SMTP id u15mr19546263wro.126.1591559196519; 
 Sun, 07 Jun 2020 12:46:36 -0700 (PDT)
Received: from rtrkw774-lin.syrmia.com ([46.240.135.226])
 by smtp.gmail.com with ESMTPSA id u130sm21091339wmg.32.2020.06.07.12.46.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 07 Jun 2020 12:46:36 -0700 (PDT)
From: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 14/21] target/mips: fpu: Remove now unused FLOAT_CLASS macro
Date: Sun,  7 Jun 2020 21:46:18 +0200
Message-Id: <1591559185-31287-15-git-send-email-aleksandar.qemu.devel@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591559185-31287-1-git-send-email-aleksandar.qemu.devel@gmail.com>
References: <1591559185-31287-1-git-send-email-aleksandar.qemu.devel@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=aleksandar.qemu.devel@gmail.com; helo=mail-wr1-x430.google.com
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


