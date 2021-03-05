Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 755E832F17C
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 18:39:55 +0100 (CET)
Received: from localhost ([::1]:48308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIEQc-0000ua-HC
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 12:39:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIE3N-0006rz-7b
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:15:53 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:33386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIE30-0007VN-3V
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:15:52 -0500
Received: by mail-wr1-x441.google.com with SMTP id 7so2919500wrz.0
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 09:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Dfzr66wsjUrErkuFqV1TIkYdkn8tVXOVqGkF1bF/Fto=;
 b=d3cj8Icx4mbBTXB++hZMEv9PK55aB8g4mMzaYVBUVohyL2rthIJYUDPXQfum7W6WXu
 w38xt9yUnxB3QvLlVnDQT48nZlX2tRQqiFpT1STFbqIvXae4jLR1Cq3ZGjNd1H/6ORmh
 oXOp49dMaQXhn3O+UKMrUa+T13QIPcLIaG1L43QGALdBCuinIAEtowBJDIiJXdIm8loc
 SZUX7qg65r5IAYvjuxHtX3J8uz8o693zKpumgZoPmiSo/Fpv/Ri1WQMn+G+1kJfPSTU4
 wYJpymxfTYNNeFiGCRaEZLB5zoZ2VRxu8OSpiW8V0K+F8gjxJXEzAxJe1/xRUUdcFwhp
 tThQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Dfzr66wsjUrErkuFqV1TIkYdkn8tVXOVqGkF1bF/Fto=;
 b=WLZcQ0lm8eGcojUaj+OUbxEkF4di+2kjT0lJ3AeAnPkA+HLb9JNND7JkrgK4SDYC26
 PlZBlO42orJWSaldSLU8MS4xgaFprxuH0NkKDyKPF+kZCPc6l+aypdb0nRBsw/tRoaL3
 H1nNn+K74pzTZFlC70/9QqCQvumWQdTG7bR6l3gYpQpZllWM6RC1z+VYO82OdqB354Is
 Z2qxsf45HrLhOmrI5O9Y0Yy2rKmFzCKcjSjzponz8tpZY3WDxiIwkq++R8A6Sk3IMlwC
 PWcFRimaDOHIH/pf+P3Ngax8GKEEnZiK760N46W1gnVyE/jf7rUVCsEZoFCwClNb01Yf
 h/Rw==
X-Gm-Message-State: AOAM533dUM1qL5M9sg/mWbs09ylw6mOmr/WXAt4sknw+0oWOavgFanbz
 yOz98Fe+yVwtQWY5pg7+jrW0f2o7Og8mDw==
X-Google-Smtp-Source: ABdhPJx1GtvFUeL8Oz5D15UG8LwtlSd4cOC1e1VXqI6SDOb14arXKZl1x6yrfudkOtQkMVgZTwl9Ng==
X-Received: by 2002:adf:b609:: with SMTP id f9mr9977290wre.223.1614964528674; 
 Fri, 05 Mar 2021 09:15:28 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m132sm5942357wmf.45.2021.03.05.09.15.28
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 09:15:28 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/49] target/arm/cpu: Update coding style to make
 checkpatch.pl happy
Date: Fri,  5 Mar 2021 17:14:41 +0000
Message-Id: <20210305171515.1038-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210305171515.1038-1-peter.maydell@linaro.org>
References: <20210305171515.1038-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x441.google.com
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

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

We will move this code in the next commit. Clean it up
first to avoid checkpatch.pl errors.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210221222617.2579610-3-f4bug@amsat.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 2666d4363d0..6facb66f4d2 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1972,7 +1972,8 @@ static void cortex_a8_initfn(Object *obj)
 }
 
 static const ARMCPRegInfo cortexa9_cp_reginfo[] = {
-    /* power_control should be set to maximum latency. Again,
+    /*
+     * power_control should be set to maximum latency. Again,
      * default to 0 and set by private hook
      */
     { .name = "A9_PWRCTL", .cp = 15, .crn = 15, .crm = 0, .opc1 = 0, .opc2 = 0,
@@ -2009,7 +2010,8 @@ static void cortex_a9_initfn(Object *obj)
     set_feature(&cpu->env, ARM_FEATURE_NEON);
     set_feature(&cpu->env, ARM_FEATURE_THUMB2EE);
     set_feature(&cpu->env, ARM_FEATURE_EL3);
-    /* Note that A9 supports the MP extensions even for
+    /*
+     * Note that A9 supports the MP extensions even for
      * A9UP and single-core A9MP (which are both different
      * and valid configurations; we don't model A9UP).
      */
@@ -2046,7 +2048,8 @@ static uint64_t a15_l2ctlr_read(CPUARMState *env, const ARMCPRegInfo *ri)
 {
     MachineState *ms = MACHINE(qdev_get_machine());
 
-    /* Linux wants the number of processors from here.
+    /*
+     * Linux wants the number of processors from here.
      * Might as well set the interrupt-controller bit too.
      */
     return ((ms->smp.cpus - 1) << 24) | (1 << 23);
@@ -2093,7 +2096,8 @@ static void cortex_a7_initfn(Object *obj)
     cpu->isar.id_mmfr1 = 0x40000000;
     cpu->isar.id_mmfr2 = 0x01240000;
     cpu->isar.id_mmfr3 = 0x02102211;
-    /* a7_mpcore_r0p5_trm, page 4-4 gives 0x01101110; but
+    /*
+     * a7_mpcore_r0p5_trm, page 4-4 gives 0x01101110; but
      * table 4-41 gives 0x02101110, which includes the arm div insns.
      */
     cpu->isar.id_isar0 = 0x02101110;
-- 
2.20.1


