Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EDA2309DE7
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Jan 2021 17:52:30 +0100 (CET)
Received: from localhost ([::1]:33568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6Fxd-00066o-Hw
	for lists+qemu-devel@lfdr.de; Sun, 31 Jan 2021 11:52:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6Fpz-0008Vj-Rj; Sun, 31 Jan 2021 11:44:35 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:34257)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6Fpy-0001Ym-9k; Sun, 31 Jan 2021 11:44:35 -0500
Received: by mail-wm1-x331.google.com with SMTP id o10so9975605wmc.1;
 Sun, 31 Jan 2021 08:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P3RGtYOfTPa/4QX/PpSq+3Pw4Nd81ZJXrAdtTbdsm7Q=;
 b=A/dTHcDqqwc/tv3bQIAUAgwkqkP9ogdiVYTHvGv4iS35a2bxwgVuewcC+imA8Fy/Dm
 9z8r+8Dz2f4j2yM5Zjwu7RZFN9ZeJlnWYz+El1ZewH64ly3EXRycrTgWz5utguWbI3mP
 f63oCoK/vERG7govyVTx2HOnU19BwZgdqHP3uDAIO+SKM9bWxBYaLsuvq+ZAA0cFYjHd
 owSiGCbvLHh86Ik9nixpSBy3859VTpWySRlnKU6AJz47ETY6a9riCJxSMbDvFccJjdOE
 v0Jn+pon3g2pbVh7IOiSWTYVuMokX3myMIN+wwIvYvgAmkbMxtGS0MAwfUsVAMlDlC01
 e7EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=P3RGtYOfTPa/4QX/PpSq+3Pw4Nd81ZJXrAdtTbdsm7Q=;
 b=OgqhXRS2TjXIDQBQNzTXMRAYGvTx9o0eNDW5lUfM7gweu29RIcUbbqmaMAEZfOxWZS
 tBGbwvokvamrMbOu1ZV9UHQaQywUiUcXYEj1sfv2iszHi7AIoYWSUuTqZREo+6u6n6Rx
 IJ1Nc4ZPIbg51ApgJ4wNWSsy/fabjz1C94vSdNY2xLDaPTNWWzMkWA3cj2pHSIZFI+Qz
 q1bYYJL9iqqTmCG/YDPzFsy+HbgXWj0Gcc7SNq9p6x4tuqqZrLaBQZQAwDxejwy766fE
 4qSbeJhTu5VeU4ov6h+fKpDW/lLcbTaQadMJFOZq0++SSuceGYZAWnjE+xN+xjdWzCL/
 ffyQ==
X-Gm-Message-State: AOAM533P9vPrKYPtf54phqdMnnHZOJ+n1+y6Z79a+qOLq8rJGmf4j2MV
 pJmcmbfaQPNVL5WwJ70iSFXMP5iBX10=
X-Google-Smtp-Source: ABdhPJyBJV9qNbR5DPTz0HUp0DyXl1ZIzB9xoOCs3LTwCfRoVPiZP6SqvsQYCveB1TIND08YEA7Xkg==
X-Received: by 2002:a1c:9e4d:: with SMTP id h74mr7608936wme.103.1612111471488; 
 Sun, 31 Jan 2021 08:44:31 -0800 (PST)
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id d3sm26664724wrp.79.2021.01.31.08.44.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jan 2021 08:44:30 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/5] target/arm/cpu: Update coding style to make checkpatch.pl
 happy
Date: Sun, 31 Jan 2021 17:44:05 +0100
Message-Id: <20210131164406.349825-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210131164406.349825-1-f4bug@amsat.org>
References: <20210131164406.349825-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We will move this code in the next commit. Clean it up
first to avoid checkpatch.pl errors.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/arm/cpu.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index d0853fae5ae..2d8312267f7 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1956,7 +1956,8 @@ static void cortex_a8_initfn(Object *obj)
 }
 
 static const ARMCPRegInfo cortexa9_cp_reginfo[] = {
-    /* power_control should be set to maximum latency. Again,
+    /*
+     * power_control should be set to maximum latency. Again,
      * default to 0 and set by private hook
      */
     { .name = "A9_PWRCTL", .cp = 15, .crn = 15, .crm = 0, .opc1 = 0, .opc2 = 0,
@@ -1993,7 +1994,8 @@ static void cortex_a9_initfn(Object *obj)
     set_feature(&cpu->env, ARM_FEATURE_NEON);
     set_feature(&cpu->env, ARM_FEATURE_THUMB2EE);
     set_feature(&cpu->env, ARM_FEATURE_EL3);
-    /* Note that A9 supports the MP extensions even for
+    /*
+     * Note that A9 supports the MP extensions even for
      * A9UP and single-core A9MP (which are both different
      * and valid configurations; we don't model A9UP).
      */
@@ -2030,7 +2032,8 @@ static uint64_t a15_l2ctlr_read(CPUARMState *env, const ARMCPRegInfo *ri)
 {
     MachineState *ms = MACHINE(qdev_get_machine());
 
-    /* Linux wants the number of processors from here.
+    /*
+     * Linux wants the number of processors from here.
      * Might as well set the interrupt-controller bit too.
      */
     return ((ms->smp.cpus - 1) << 24) | (1 << 23);
@@ -2077,7 +2080,8 @@ static void cortex_a7_initfn(Object *obj)
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
2.26.2


