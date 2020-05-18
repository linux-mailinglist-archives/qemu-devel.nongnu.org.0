Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB661D8903
	for <lists+qemu-devel@lfdr.de>; Mon, 18 May 2020 22:19:19 +0200 (CEST)
Received: from localhost ([::1]:40832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jamEI-0000bd-RK
	for lists+qemu-devel@lfdr.de; Mon, 18 May 2020 16:19:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aleksandar.qemu.devel@gmail.com>)
 id 1jam5n-0006DB-JZ
 for qemu-devel@nongnu.org; Mon, 18 May 2020 16:10:31 -0400
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244]:44264)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aleksandar.qemu.devel@gmail.com>)
 id 1jam5m-0002Fy-Qu
 for qemu-devel@nongnu.org; Mon, 18 May 2020 16:10:31 -0400
Received: by mail-lj1-x244.google.com with SMTP id k5so4664125lji.11
 for <qemu-devel@nongnu.org>; Mon, 18 May 2020 13:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k7kVdFWxaVWdBi77zbtYk3nbD/a6snV2/hS5/I/5yJI=;
 b=AU1N9a2TtaVnzKsx1UH/phduitCc42g+fKn6464HDshTnYUSr+bGH7KhjA30IiY7sD
 ULK6lAEbUfHQ5S3WKOYTOsOLnW2cGIsptbQ76Qln4fZT/Ke3giw1fg+bXJ/KCe+z7D9J
 uEI6xDDPbcsGWRtPO+SOfr60/3AyUtpzHPWVo4NSrNSZNQ9vl0lbo80sz8XbMZ9eerWy
 HXiOO02b1GtS4q/voHx1hmox957J+Cc4gRfbVcIDoaHxyYgH6Fo+OkOO/ueFLt8KUs5G
 tukDZbJGBOlQ0IIR//DWqAvsJm2ugCAoDw5t4JXyVJfUaXkkknY6adAhpezMuI2SjNwe
 58uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k7kVdFWxaVWdBi77zbtYk3nbD/a6snV2/hS5/I/5yJI=;
 b=CcQW028sHLLuPRphHwcjxU4rbtOOCrr9FI0IIoZl/IXDKsc97mmuQWbqWgyXE8NmT8
 orUUcscgSJGwJM5q7WBmKvfynusZSDr7ouNniKOIStQjk3ISDt8BIXTiwSnl4n2O9hfI
 BVpQbQizFlvsbcrsBAOlCogNj6/zkLGDHa3K+quMbFM1ucfAW102CaXnJ0yOmI3fymVD
 aszkS5iygzxZU83MaN1pFy7QqUyTwq0T2X++7v35z92Fs0KUMKilX4AY+JntqIIWA99j
 8ICgBDCqv6QC0SPSb/sV+SM5rQdpWM32xDHhWiNPzosr67qG6HHJ9o5lbd5hRC7aogWN
 8s6g==
X-Gm-Message-State: AOAM532mBerzVnj9JcF2wKH09KBX99Bt4ycgzX0CMv6rn9iKWb+XR8if
 4/Pl3Alw9qqVCeGMKlhJrOdwfKVxDWY=
X-Google-Smtp-Source: ABdhPJypF0EWN6QV83XmXhZ4V9F8vaELXRJcT42v4eB5adp0hHL4J+DhYLy6poqym0zuuQZPKoalgA==
X-Received: by 2002:a2e:9743:: with SMTP id f3mr4817109ljj.205.1589832628765; 
 Mon, 18 May 2020 13:10:28 -0700 (PDT)
Received: from localhost.localdomain ([109.245.227.98])
 by smtp.gmail.com with ESMTPSA id c78sm8700591lfd.63.2020.05.18.13.10.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2020 13:10:28 -0700 (PDT)
From: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 05/21] target/mips: fpu: Remove now unused macro FLOAT_BINOP
Date: Mon, 18 May 2020 22:09:04 +0200
Message-Id: <20200518200920.17344-6-aleksandar.qemu.devel@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200518200920.17344-1-aleksandar.qemu.devel@gmail.com>
References: <20200518200920.17344-1-aleksandar.qemu.devel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::244;
 envelope-from=aleksandar.qemu.devel@gmail.com; helo=mail-lj1-x244.google.com
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

After demacroing <ADD|SUB|MUL|DIV>.<D|S|PS>, this macro is not
needed anymore.

Reviewed-by: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Signed-off-by: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
---
 target/mips/fpu_helper.c | 39 ---------------------------------------
 1 file changed, 39 deletions(-)

diff --git a/target/mips/fpu_helper.c b/target/mips/fpu_helper.c
index 2759c9989d..a3a39681f8 100644
--- a/target/mips/fpu_helper.c
+++ b/target/mips/fpu_helper.c
@@ -1170,45 +1170,6 @@ FLOAT_CLASS(class_d, 64)
 #undef FLOAT_CLASS
 
 /* binary operations */
-#define FLOAT_BINOP(name)                                          \
-uint64_t helper_float_ ## name ## _d(CPUMIPSState *env,            \
-                                     uint64_t fdt0, uint64_t fdt1) \
-{                                                                  \
-    uint64_t dt2;                                                  \
-                                                                   \
-    dt2 = float64_ ## name(fdt0, fdt1, &env->active_fpu.fp_status);\
-    update_fcr31(env, GETPC());                                    \
-    return dt2;                                                    \
-}                                                                  \
-                                                                   \
-uint32_t helper_float_ ## name ## _s(CPUMIPSState *env,            \
-                                     uint32_t fst0, uint32_t fst1) \
-{                                                                  \
-    uint32_t wt2;                                                  \
-                                                                   \
-    wt2 = float32_ ## name(fst0, fst1, &env->active_fpu.fp_status);\
-    update_fcr31(env, GETPC());                                    \
-    return wt2;                                                    \
-}                                                                  \
-                                                                   \
-uint64_t helper_float_ ## name ## _ps(CPUMIPSState *env,           \
-                                      uint64_t fdt0,               \
-                                      uint64_t fdt1)               \
-{                                                                  \
-    uint32_t fst0 = fdt0 & 0XFFFFFFFF;                             \
-    uint32_t fsth0 = fdt0 >> 32;                                   \
-    uint32_t fst1 = fdt1 & 0XFFFFFFFF;                             \
-    uint32_t fsth1 = fdt1 >> 32;                                   \
-    uint32_t wt2;                                                  \
-    uint32_t wth2;                                                 \
-                                                                   \
-    wt2 = float32_ ## name(fst0, fst1, &env->active_fpu.fp_status);     \
-    wth2 = float32_ ## name(fsth0, fsth1, &env->active_fpu.fp_status);  \
-    update_fcr31(env, GETPC());                                    \
-    return ((uint64_t)wth2 << 32) | wt2;                           \
-}
-
-#undef FLOAT_BINOP
 
 uint64_t helper_float_add_d(CPUMIPSState *env,
                             uint64_t fdt0, uint64_t fdt1)
-- 
2.20.1


