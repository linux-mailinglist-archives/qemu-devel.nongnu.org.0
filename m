Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEAC5359980
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 11:41:54 +0200 (CEST)
Received: from localhost ([::1]:56376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUneD-0004Zb-TG
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 05:41:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lUnZJ-00085Z-OT
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 05:36:49 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:39885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lUnZI-0002nK-Bl
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 05:36:49 -0400
Received: by mail-ej1-x634.google.com with SMTP id v6so6368876ejo.6
 for <qemu-devel@nongnu.org>; Fri, 09 Apr 2021 02:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GLOcVdq6UID+RpF1UB80wJ7L4dB9pvnLuoK+9eg5AUA=;
 b=iuQRKpON7fzy/OMr8h7zhGJheYA7Ps5PEK9OajnkQmkTsT4W7HS1Wd9MyroH1wKEpa
 njvKXxDQC3fPB+FvVpG/w2cB2q4d+VPZjOtMV4lii/oXDoKL35q0nZHGoiFWY2NK97c4
 vLsK23s1gf9PhCIuP0RuzfosGwTP/p6xRxsnZS33NKNI/11ZH/GJqDcGCAb2szFsv9vc
 6qOzF8wGui3WNuXuRIne7W2GsjC4nel5+iX7xUqCdhKlpzgEs3U3GEdvGdlx48h33zCo
 h8LU69qFMP1x8OYnXDxjHQ5ToqdTpK4MWtBETMND6m2LVjArpsDUhw/jvUmH9nHBUJ3G
 b47A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=GLOcVdq6UID+RpF1UB80wJ7L4dB9pvnLuoK+9eg5AUA=;
 b=JvMm1EnA9qBRLYkpAnPjphZH+SJAPVBWhfJB/5bfgg/0FX8H4pzZ1MwPzqDajSVu0a
 RvAUMLztA7WlJcyHK6hAdF/WAS9FvNR0X7gobB9fanF0/jSmmlkX0N36IZnOlBU/S0QI
 ibFea+qZOI2CL9yOZg0qIrotq8R6QE5A1D7BXTCAZtnZSa2EMyhI//xKiR0vyHJG+MFM
 vuHr/QeK7t7yDGvnf0q0+V9mm8P8A9FcnqrBU2lcIAXoPHpCdIUJfA9KUFLLNJ3D0Abp
 jmWU9yreM6Zsr0/m0ZwllO5DNc11PxYW2FxR0idgobo1wXnLj6gIsKKwuzerCEjywsXI
 3O5g==
X-Gm-Message-State: AOAM531w/BeGdTuvz5naMxICxIuMBkLcPcRIst7ei7TINvTeNiDaAIVX
 JvMBeXopA3wvsL4me0r+w3uKIvz79iHfdg==
X-Google-Smtp-Source: ABdhPJyYBRdhsYdICc3OmXUlrnf+Wub7UJNZytylr5dNT/Madf+UcJhPwVEOH87Sn9kkbo5XIXv+mw==
X-Received: by 2002:a17:906:7691:: with SMTP id
 o17mr15339108ejm.55.1617961006917; 
 Fri, 09 Apr 2021 02:36:46 -0700 (PDT)
Received: from x1w.redhat.com (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id cy5sm1120079edb.46.2021.04.09.02.36.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Apr 2021 02:36:46 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH-for-6.1 v2 4/6] target/mips/cp0_timer: Add
 ns_substract_to_count() helper
Date: Fri,  9 Apr 2021 11:36:21 +0200
Message-Id: <20210409093623.2402750-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210409093623.2402750-1-f4bug@amsat.org>
References: <20210409093623.2402750-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Luc Michel <luc@lmichel.fr>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Hao Wu <wuhaotsh@google.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Factor ns_substract_to_count() out to simplify a bit.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/cp0_timer.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/target/mips/cp0_timer.c b/target/mips/cp0_timer.c
index 73355b44b15..85f2f85838d 100644
--- a/target/mips/cp0_timer.c
+++ b/target/mips/cp0_timer.c
@@ -32,6 +32,12 @@ static uint32_t ns_to_count(CPUMIPSState *env, uint64_t ns)
     return ns / env->cp0_count_ns;
 }
 
+static uint32_t ns_substract_to_count(CPUMIPSState *env,
+                                      uint32_t count, uint64_t ns)
+{
+    return count - ns_to_count(env, ns);
+}
+
 /* MIPS R4K timer */
 static void cpu_mips_timer_update(CPUMIPSState *env)
 {
@@ -39,7 +45,7 @@ static void cpu_mips_timer_update(CPUMIPSState *env)
     uint32_t wait;
 
     now_ns = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
-    wait = env->CP0_Compare - env->CP0_Count - ns_to_count(env, now_ns);
+    wait = ns_substract_to_count(env, env->CP0_Compare - env->CP0_Count, now_ns);
     next_ns = now_ns + (uint64_t)wait * env->cp0_count_ns;
     timer_mod(env->timer, next_ns);
 }
@@ -83,8 +89,8 @@ void cpu_mips_store_count(CPUMIPSState *env, uint32_t count)
         env->CP0_Count = count;
     } else {
         /* Store new count register */
-        env->CP0_Count = count - ns_to_count(env,
-                                             qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL));
+        env->CP0_Count = ns_substract_to_count(env, count,
+                                               qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL));
         /* Update timer timer */
         cpu_mips_timer_update(env);
     }
-- 
2.26.3


