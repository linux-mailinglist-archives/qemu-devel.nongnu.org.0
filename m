Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 298EE1D8882
	for <lists+qemu-devel@lfdr.de>; Mon, 18 May 2020 21:53:36 +0200 (CEST)
Received: from localhost ([::1]:41886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jalpO-0001eS-VR
	for lists+qemu-devel@lfdr.de; Mon, 18 May 2020 15:53:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aleksandar.qemu.devel@gmail.com>)
 id 1jaleb-0002sW-Cv
 for qemu-devel@nongnu.org; Mon, 18 May 2020 15:42:25 -0400
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141]:40609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aleksandar.qemu.devel@gmail.com>)
 id 1jalea-0004aA-Ja
 for qemu-devel@nongnu.org; Mon, 18 May 2020 15:42:25 -0400
Received: by mail-lf1-x141.google.com with SMTP id h188so9158756lfd.7
 for <qemu-devel@nongnu.org>; Mon, 18 May 2020 12:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b/SGzR0VfdaMngvwcIJ4Z6wJcDUJ7yTUrhHwIwtU8Nc=;
 b=vR6pORsEQJYY+6BWYa/rt208WbTjJV1lTvi6Csxxm69Q1KZ2SYch6sCRvc4Xuh34G2
 eIgmyJvfzsoN2tJb41/01Dnmf4w8XQVPE68M4DxHnIooF7J+p9XAYvjmQipN2wF9gyq1
 7z2ZTpHIOXJbeeuCwLdV1jmhVjNyAhWjFsRLGGCd2FqNhrFIx4jIjSpAOL8ud1FL7l3I
 hrW4d9unyzjnqK60Y3KIEMnvJTJOqBrFA5D9HH3rJ2kw3RPf/JXalYYs/KYnypD+lvQE
 nyXUjB3Nf+q9AnJst6M6msFvwrw/KY4hkXgNIXKYAvWX0956b2JTWnB+gDejMxpcKJ/K
 1uPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b/SGzR0VfdaMngvwcIJ4Z6wJcDUJ7yTUrhHwIwtU8Nc=;
 b=G+5K286tPTdI+B8+zoo4KfmQyPXDY3NeECyK/TuGCNMXyjmEIP2ojEtMJPdRT99JK7
 IXTgBJTaPMYZnFCNNOyPMf3i/bLfEFclORoPny6g4J2zHB3HvvZOeEfpNC/66dXbmFVQ
 ZovfYRwPndnMI3js1FOl+0Ii+19wPf0oj08dySS0xjui2Abu38KifOZn4L8TNXdm6/mh
 D/9MZVJyRjEWMzdYLvXpxye6APqxNjZJz9ZsWKWMWssF9+5QknwPuNXNVc0MKkg6YH9Y
 HA50GyLko1RiUE1XwqVCoZ5vc81MfBwRlrK4uEMZ+LY9Adenh8vLgzEXgbaYeFyte4R1
 8AFQ==
X-Gm-Message-State: AOAM530UXQ+MT+dDBy2mMoKZH8igKrJolKIq/Im2JJtUNWagTn5p2kKC
 SJPxG3VFdtGtpBeNbdRbUQQMqd2wVVM=
X-Google-Smtp-Source: ABdhPJyamsHgs/VxRrmwr53YcnMxgiKnEwx+XkmKJ5C3Ou7haCxDdfF/Flk9hM5/YW0s40OtFGDY/g==
X-Received: by 2002:a19:f108:: with SMTP id p8mr12832449lfh.101.1589830942922; 
 Mon, 18 May 2020 12:42:22 -0700 (PDT)
Received: from localhost.localdomain ([109.245.227.98])
 by smtp.gmail.com with ESMTPSA id r15sm7593128lfp.34.2020.05.18.12.42.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2020 12:42:22 -0700 (PDT)
From: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 11/22] target/mips: fpu: Remove now unused UNFUSED_FMA and
 FLOAT_FMA macros
Date: Mon, 18 May 2020 21:41:38 +0200
Message-Id: <20200518194149.16281-12-aleksandar.qemu.devel@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200518194149.16281-1-aleksandar.qemu.devel@gmail.com>
References: <20200518194149.16281-1-aleksandar.qemu.devel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::141;
 envelope-from=aleksandar.qemu.devel@gmail.com; helo=mail-lf1-x141.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_PASS=-0.001,
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
Cc: aleksandar.rikalo@syrmia.com,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

After demacroing <MADD|MSUB|NMADD|NMSUB>.<D|S|PS>, these macros
are not needed anymore.

Reviewed-by: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Signed-off-by: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
---
 target/mips/fpu_helper.c | 50 ----------------------------------------
 1 file changed, 50 deletions(-)

diff --git a/target/mips/fpu_helper.c b/target/mips/fpu_helper.c
index 927bac24ac..e8e50e4bc0 100644
--- a/target/mips/fpu_helper.c
+++ b/target/mips/fpu_helper.c
@@ -1446,56 +1446,6 @@ FLOAT_MINMAX(mina_d, 64, minnummag)
 #undef FLOAT_MINMAX
 
 /* ternary operations */
-#define UNFUSED_FMA(prefix, a, b, c, flags)                          \
-{                                                                    \
-    a = prefix##_mul(a, b, &env->active_fpu.fp_status);              \
-    if ((flags) & float_muladd_negate_c) {                           \
-        a = prefix##_sub(a, c, &env->active_fpu.fp_status);          \
-    } else {                                                         \
-        a = prefix##_add(a, c, &env->active_fpu.fp_status);          \
-    }                                                                \
-    if ((flags) & float_muladd_negate_result) {                      \
-        a = prefix##_chs(a);                                         \
-    }                                                                \
-}
-
-/* FMA based operations */
-#define FLOAT_FMA(name, type)                                        \
-uint64_t helper_float_ ## name ## _d(CPUMIPSState *env,              \
-                                     uint64_t fdt0, uint64_t fdt1,   \
-                                     uint64_t fdt2)                  \
-{                                                                    \
-    UNFUSED_FMA(float64, fdt0, fdt1, fdt2, type);                    \
-    update_fcr31(env, GETPC());                                      \
-    return fdt0;                                                     \
-}                                                                    \
-                                                                     \
-uint32_t helper_float_ ## name ## _s(CPUMIPSState *env,              \
-                                     uint32_t fst0, uint32_t fst1,   \
-                                     uint32_t fst2)                  \
-{                                                                    \
-    UNFUSED_FMA(float32, fst0, fst1, fst2, type);                    \
-    update_fcr31(env, GETPC());                                      \
-    return fst0;                                                     \
-}                                                                    \
-                                                                     \
-uint64_t helper_float_ ## name ## _ps(CPUMIPSState *env,             \
-                                      uint64_t fdt0, uint64_t fdt1,  \
-                                      uint64_t fdt2)                 \
-{                                                                    \
-    uint32_t fst0 = fdt0 & 0XFFFFFFFF;                               \
-    uint32_t fsth0 = fdt0 >> 32;                                     \
-    uint32_t fst1 = fdt1 & 0XFFFFFFFF;                               \
-    uint32_t fsth1 = fdt1 >> 32;                                     \
-    uint32_t fst2 = fdt2 & 0XFFFFFFFF;                               \
-    uint32_t fsth2 = fdt2 >> 32;                                     \
-                                                                     \
-    UNFUSED_FMA(float32, fst0, fst1, fst2, type);                    \
-    UNFUSED_FMA(float32, fsth0, fsth1, fsth2, type);                 \
-    update_fcr31(env, GETPC());                                      \
-    return ((uint64_t)fsth0 << 32) | fst0;                           \
-}
-#undef FLOAT_FMA
 
 uint64_t helper_float_madd_d(CPUMIPSState *env, uint64_t fst0,
                              uint64_t fst1, uint64_t fst2)
-- 
2.20.1


