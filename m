Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F10F4C4209
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 11:16:37 +0100 (CET)
Received: from localhost ([::1]:58668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNXeO-0002af-6H
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 05:16:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nNXZx-0006ov-KV; Fri, 25 Feb 2022 05:12:02 -0500
Received: from [2607:f8b0:4864:20::c29] (port=34457
 helo=mail-oo1-xc29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nNXZv-0004TY-6U; Fri, 25 Feb 2022 05:12:01 -0500
Received: by mail-oo1-xc29.google.com with SMTP id
 k13-20020a4a948d000000b003172f2f6bdfso5661981ooi.1; 
 Fri, 25 Feb 2022 02:11:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=327DkvtyPlmOk/BbGsj7+zy8MYMhQ3E4ZM6Cf9A98ao=;
 b=o8FTCs7ntkUqA6gHGxNtdw1cvWB45per1FPzvEucHL1jztnKe0JdnGoFhtWbIbegxO
 6cCnFEDt9RzfQ93tgH0FW7SxZWwAxJtlQFa8pKL6Oh9bhnKn1eqX4fP0WzROnQk+GVLb
 BMeXxJTkDPce+0FwiAVzZR3ZPM5iyAdtO5w94FUsOZtMF5/SHtlqe8gKZVQkI1S/1l3M
 dTXS36E2n7W2zhmCCoCC6Q0eQXuTdvyFEBGkEi1dfOHCATQODkCNXr5S464+l3rQt0ip
 3mYm225J3Acvhtygk37n1p7jpOUO1okNSc9yybZp8hiSECZ346xrB9IrWNLw6Em/8jbu
 XD0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=327DkvtyPlmOk/BbGsj7+zy8MYMhQ3E4ZM6Cf9A98ao=;
 b=452dnZ2+pqRUNGWqtmSIqfV/UgHW1dMiy/LGCxAy+QB0QJ5cRi4IT8A73ubCQ8GiRx
 g5IwJNoomXvQmjdpm6Yae/YS8AkQj8TBjlrocGmldBTvhqLNhURq6pA/2qYhESy2b5Fm
 qLr4flHxEXZpyPp3jHagFJkZqV/jBgeSMDmT+PigdtZOFcoGcAG/ysO5iro0oJ3tUKxM
 b/T//ron+SiDYUaB14Ywx0GHm94QT4vgV4dM4Nzl0qUR9S9if7Ld/M856aGxD55/q+jT
 1NDGCS3E3F+lxz70AfXWiQR862OObNW13r9JG8UmUHEAcif8e9+p86jkNjwyYUbhtcpl
 /+Bg==
X-Gm-Message-State: AOAM530it+na5PRYZlOYbWN/c1GVKTMfGVA02bnkoUa+zZ/V6xOcq4+N
 fudnCaXADUysDYg1nLnSNsV33rgh/G4=
X-Google-Smtp-Source: ABdhPJw7dxzKd4XpbfqtKPHy+lzr1PpKpS6ANeQKzgxPnQOcaPFB0Xq35Hl2VlrkJbOMPgYvuJVgAg==
X-Received: by 2002:a05:6870:9a0a:b0:d0:9f72:18b3 with SMTP id
 fo10-20020a0568709a0a00b000d09f7218b3mr978536oab.226.1645783917821; 
 Fri, 25 Feb 2022 02:11:57 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:bec1:d9bb:8ce0:5ce7:a377])
 by smtp.gmail.com with ESMTPSA id
 v8-20020a4ae6c8000000b0031c2e6dd492sm847823oot.28.2022.02.25.02.11.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 02:11:57 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v14 2/4] target/ppc: finalize pre-EBB PMU logic
Date: Fri, 25 Feb 2022 07:11:38 -0300
Message-Id: <20220225101140.1054160-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220225101140.1054160-1-danielhb413@gmail.com>
References: <20220225101140.1054160-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c29
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c29;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc29.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There are still PMU exclusive bits to handle in fire_PMC_interrupt()
before implementing the EBB support. Let's finalize it now to avoid
dealing with PMU and EBB logic at the same time in the next patches.

fire_PMC_interrupt() will fire an Performance Monitor alert depending on
MMCR0_PMAE. If we are required to freeze the timers (MMCR0_FCECE) we'll
also need to update summaries and delete the existing overflow timers.
In all cases we're going to update the cycle counters.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/power8-pmu.c | 36 ++++++++++++++++++++++++++++++++++--
 1 file changed, 34 insertions(+), 2 deletions(-)

diff --git a/target/ppc/power8-pmu.c b/target/ppc/power8-pmu.c
index 236e8e66e9..d245663158 100644
--- a/target/ppc/power8-pmu.c
+++ b/target/ppc/power8-pmu.c
@@ -222,6 +222,20 @@ static void pmu_update_overflow_timers(CPUPPCState *env)
     }
 }
 
+static void pmu_delete_timers(CPUPPCState *env)
+{
+    QEMUTimer *pmc_overflow_timer;
+    int sprn;
+
+    for (sprn = SPR_POWER_PMC1; sprn <= SPR_POWER_PMC6; sprn++) {
+        pmc_overflow_timer = get_cyc_overflow_timer(env, sprn);
+
+        if (pmc_overflow_timer) {
+            timer_del(pmc_overflow_timer);
+        }
+    }
+}
+
 void helper_store_mmcr0(CPUPPCState *env, target_ulong value)
 {
     bool hflags_pmcc0 = (value & MMCR0_PMCC0) != 0;
@@ -271,8 +285,26 @@ static void fire_PMC_interrupt(PowerPCCPU *cpu)
 {
     CPUPPCState *env = &cpu->env;
 
-    if (!(env->spr[SPR_POWER_MMCR0] & MMCR0_EBE)) {
-        return;
+    pmu_update_cycles(env);
+
+    if (env->spr[SPR_POWER_MMCR0] & MMCR0_FCECE) {
+        env->spr[SPR_POWER_MMCR0] &= ~MMCR0_FCECE;
+        env->spr[SPR_POWER_MMCR0] |= MMCR0_FC;
+
+        /* Changing MMCR0_FC requires a new HFLAGS_INSN_CNT calc */
+        pmu_update_summaries(env);
+
+        /*
+         * Delete all pending timers if we need to freeze
+         * the PMC. We'll restart them when the PMC starts
+         * running again.
+         */
+        pmu_delete_timers(env);
+    }
+
+    if (env->spr[SPR_POWER_MMCR0] & MMCR0_PMAE) {
+        env->spr[SPR_POWER_MMCR0] &= ~MMCR0_PMAE;
+        env->spr[SPR_POWER_MMCR0] |= MMCR0_PMAO;
     }
 
     /* PMC interrupt not implemented yet */
-- 
2.35.1


