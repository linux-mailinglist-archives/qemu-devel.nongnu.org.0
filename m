Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7150D320E46
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 23:29:02 +0100 (CET)
Received: from localhost ([::1]:35510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDxDp-0008H4-H7
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 17:29:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDxBW-0006LO-UC; Sun, 21 Feb 2021 17:26:39 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:34176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDxBS-0004Lw-RP; Sun, 21 Feb 2021 17:26:38 -0500
Received: by mail-wr1-x42a.google.com with SMTP id n4so17155971wrx.1;
 Sun, 21 Feb 2021 14:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cEXLvbn+xOMhhi0R83S9d9mv5EMrvbKx+ABzbeLQvl8=;
 b=eSeWjLq+KyscXQ8Th017uO4fqnLfNOGj1jhqKRVZxvfslt9thLpQkdj9gAz+gV2uYS
 nAzrsd/of2lfj/e306RaaqsmhFbkmtn5nYZ4OMbIw9fSH+FsUQWxcjwuOCKQSIEw+62h
 WrBmGC2d+XhMJFjVON9XQ75qnFI1z/FDhohCB/oeFAE0X0iPr1eFlrJs/oPE9mgiSsW/
 b7ka2h/tvLYtlAONyw39pLSczlMC2qQLmxZYmKFrvqo26d7d7HXkMhd2g1IVmJdNOBDU
 UeWIZO37PZX/7Vvf6IVzHgpHkvhxiIU+MvHF2REGm9c1fktS4H1iE54/40XLfJAMLqVZ
 pLEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=cEXLvbn+xOMhhi0R83S9d9mv5EMrvbKx+ABzbeLQvl8=;
 b=rHRGUnTK2NRwIksi9xxYti1b9no7mfRWYnzGqxmTJXLYysPz+eDnrlmUFzYGkkw75F
 +xDj3FZOOxJtZfzJ0WpMSLbzq927a6C6RDhOjU5/7+i61FW8lDmVBwJzU9zon6OAR1+F
 fMhR35FbuSML9B1cBeiWlnN0sJsHYQY0t6Koz09UlGXDuojr72Ugkxbk0lUet6mzW3Gt
 EIIyI30T/mglWT0EUwUGpyWuckubJ43kwtJiM7WLpdySr6vEx0hSdpNBlM9naGAL3VU1
 RydwrihWDs7Pkk/ntKH2rGQYCUmab2R8I9rAraUK98a69xQpfAtUlQVwnBtoSvqfiCAy
 9hyg==
X-Gm-Message-State: AOAM530c/79xw4z9aOaK9HCj2lEnyVllatuwJBs8OfP5lSWWo4fqPaAG
 oOMyew5F57UonsLIYGkeh1alCO+ydB8=
X-Google-Smtp-Source: ABdhPJyOMrKoQte92dYJDiRgfO2901+usjlYn5za/rvDrvWS7sh459Depdk1zlTmdwirU3j52qsWLw==
X-Received: by 2002:adf:f4d1:: with SMTP id h17mr696657wrp.350.1613946389648; 
 Sun, 21 Feb 2021 14:26:29 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id 2sm26365710wre.24.2021.02.21.14.26.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Feb 2021 14:26:29 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/3] target/arm/cpu: Update coding style to make
 checkpatch.pl happy
Date: Sun, 21 Feb 2021 23:26:16 +0100
Message-Id: <20210221222617.2579610-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210221222617.2579610-1-f4bug@amsat.org>
References: <20210221222617.2579610-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
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
index a772fd4926f..6865ea76466 100644
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
2.26.2


