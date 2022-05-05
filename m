Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A45AB51C899
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 20:59:06 +0200 (CEST)
Received: from localhost ([::1]:38812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmggr-0004pd-MX
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 14:59:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nmgYO-0002O2-8K; Thu, 05 May 2022 14:50:21 -0400
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f]:37824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nmgYD-0004LN-Ey; Thu, 05 May 2022 14:50:11 -0400
Received: by mail-oi1-x22f.google.com with SMTP id r1so5261361oie.4;
 Thu, 05 May 2022 11:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8wRFsB4oxkSKLu/a1qVp36Mev+RY06uW0DVJiFCGAJk=;
 b=KGBv952lbkOAnZGy+ufi8U//mnLPYF4KmXyZlSInm6wl1rvA479kFy2KwSpVHhgJwy
 PFvlSnVnqxKh/ksOZGvbhsnRGx1ijg+bWgNsGc/JxjUBnqbK6sf6a4omSJZK+XYcFONI
 QI44Donrf7WdYqnkjCPsAyW5uVRRlkwd5EeOSD9dOge3Mp9kO6sdjdEKWghztQLFcGYj
 81tUw4gSi3GwLjXXKk/Yj+SyZnCuX+pjIRlYOTUd0ExUoe8Ug6jnQeCA2Uk/TD3xX7o9
 lgwsFS5ECk5V4BWrgF0rtxTAFvJqW2WV7Fp6hw8e92BHfdCSSPFLuFEDmLhWThp0FUrO
 7cGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8wRFsB4oxkSKLu/a1qVp36Mev+RY06uW0DVJiFCGAJk=;
 b=zVTiZwcVsA/KMjVxhCw3Ux5WjBOD7DpwKVlBJvIvGMiQ0zmyEWxFtnljcgRxuMBsBQ
 6ZR7UBJC6WwSg4VJvKMj2B0S3pCLQSvDzsnTXYFFM0JNmX/Bk6zS7QCLM17fgPlqdQcx
 gZr38xxpNHFxPxA49+fVmDfsYHbdNNI3w9u771YYuOc5FXqg1bfl4zfwEUSELaAiDMUO
 mXHx7dDGba4y4BmuF6DyUE37PBlWlwdp1a6oInNyAPHwBxJq4KfrpRnXbSW9CvSv0iU4
 Mf2hNmCb5tYoiMRqVzfoVHbGH4MKmNTZXN8jYd7BA2e/Hlg2jGUN2mgsMNLNv+J7Xte7
 5Ugg==
X-Gm-Message-State: AOAM532w0kgRr20VRrY3aqFKucEVwhwWCfO86vXNrTwcMSGyLkCs0WE+
 +XD+/b3oI6qRgWJAUCTzIsRDzs0CToo=
X-Google-Smtp-Source: ABdhPJz0LFf/f4jT6UHoW08+tCaMLBAH0lvJJC2HyNITaHmFiOMenrpT1d85INEwx8xpF6g6+XwHDw==
X-Received: by 2002:a05:6808:120f:b0:325:cef0:3f7 with SMTP id
 a15-20020a056808120f00b00325cef003f7mr3339685oil.38.1651776607643; 
 Thu, 05 May 2022 11:50:07 -0700 (PDT)
Received: from balboa.ibmuc.com (201-1-57-208.dsl.telesp.net.br.
 [201.1.57.208]) by smtp.gmail.com with ESMTPSA id
 n67-20020aca4046000000b00325cda1ff94sm917146oia.19.2022.05.05.11.50.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 11:50:07 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 David Gibson <david@gibson.dropbear.id.au>
Subject: [PULL 01/30] target/ppc: initialize 'val' union in kvm_get_one_spr()
Date: Thu,  5 May 2022 15:49:09 -0300
Message-Id: <20220505184938.351866-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220505184938.351866-1-danielhb413@gmail.com>
References: <20220505184938.351866-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

Valgrind isn't convinced that we are initializing the values we assign
to env->spr[spr] because it doesn't understand that the 'val' union is
being written by the kvm_vcpu_ioctl() that follows (via struct
kvm_one_reg).

This results in Valgrind complaining about uninitialized values every
time we use env->spr in a conditional, like this instance:

==707578== Thread 1:
==707578== Conditional jump or move depends on uninitialised value(s)
==707578==    at 0xA10A40: hreg_compute_hflags_value (helper_regs.c:106)
==707578==    by 0xA10C9F: hreg_compute_hflags (helper_regs.c:173)
==707578==    by 0xA110F7: hreg_store_msr (helper_regs.c:262)
==707578==    by 0xA051A3: ppc_cpu_reset (cpu_init.c:7168)
==707578==    by 0xD4730F: device_transitional_reset (qdev.c:799)
==707578==    by 0xD4A11B: resettable_phase_hold (resettable.c:182)
==707578==    by 0xD49A77: resettable_assert_reset (resettable.c:60)
==707578==    by 0xD4994B: resettable_reset (resettable.c:45)
==707578==    by 0xD458BB: device_cold_reset (qdev.c:296)
==707578==    by 0x48FBC7: cpu_reset (cpu-common.c:114)
==707578==    by 0x97B5EB: spapr_reset_vcpu (spapr_cpu_core.c:38)
==707578==    by 0x97BABB: spapr_cpu_core_reset (spapr_cpu_core.c:209)
==707578==  Uninitialised value was created by a stack allocation
==707578==    at 0xB11F08: kvm_get_one_spr (kvm.c:543)

Initializing 'val' has no impact in the logic and makes Valgrind output
more bearable.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Message-Id: <20220331001717.616938-2-danielhb413@gmail.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/kvm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index a3c31b4e48..01baea467f 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -542,10 +542,11 @@ static void kvm_get_one_spr(CPUState *cs, uint64_t id, int spr)
 {
     PowerPCCPU *cpu = POWERPC_CPU(cs);
     CPUPPCState *env = &cpu->env;
+    /* Init 'val' to avoid "uninitialised value" Valgrind warnings */
     union {
         uint32_t u32;
         uint64_t u64;
-    } val;
+    } val = { };
     struct kvm_one_reg reg = {
         .id = id,
         .addr = (uintptr_t) &val,
-- 
2.32.0


