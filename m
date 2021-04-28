Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D9D36D971
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 16:19:56 +0200 (CEST)
Received: from localhost ([::1]:44150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbl2h-0000x9-7b
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 10:19:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbl0D-0006ks-00
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 10:17:21 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:44942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbl0A-0003OU-CG
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 10:17:20 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 82-20020a1c01550000b0290142562ff7c9so4802525wmb.3
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 07:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h/nIb3IjINN2mrXWPh2f9m2AgY9HURbh9xQILDV1MKc=;
 b=fVt5zTNthBSgsTxrPQbo8i145acibOlMaQYVHhsyK/6Dhm/L+2GU7peHW6pRC1x2Kv
 PCMma2NuNDxweIZAxVYO5BbBLgbHYiA3la6zYv/2fMjCOl9oRoNCqwKRBH8D0q+MNnqi
 r6II8WmgvOqVsIhWHIKljhzM8h59G6ooxIpkk/Pwk0xwANmrKQq6QC/sWHDoN+LaYrtU
 mQD7a+g1ergUeosFGSKfjHAUtCPOJif+GMdb99VJFierj5/w430veapYO388JR2PZybs
 FZ51igxbYxNMKoy1NC+Y1xlxlt4ZUTsLPVWy0BGK/zINWD//X6tJaovFOoFUPFjpeIk9
 K6gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=h/nIb3IjINN2mrXWPh2f9m2AgY9HURbh9xQILDV1MKc=;
 b=rZo/rOvaYFmnY9p/pice4cJvdaVWRVqZA0KBJlTGiDb8VIRSvi3XYnIk48sgw1ko4f
 vVSzLvNQbHHgXFaPd5qxgs1WQEd3C9E3KExlxQ51fAdnH2bXyUQZ6i5XWCor//WpPcqL
 ty+ySV3kXWlVJE/b9luD6CsmYN93Xj5fo3+Hv9d9nUcHu97x4aaQ9Y9Be9wR5SFnKt+c
 fuUu4lUzqybuLFchM4t5IL2F42h69J/RzVSECs0KE7YOQowV/1eczM4aJRGQ4XmfZT/D
 RS0SKMYLU1k4PrqV+qt/sWH0waoaPciOEjdsFLsaZUwluogO9ifL7CUojCb3ssBSnYpx
 8IzA==
X-Gm-Message-State: AOAM530z0huG5R2cDA8fjXa/1MoveppB8hsxK57Od+4IUHyNFNu/9Tzv
 5E7qeD7ohOiMrwg2BeBJzTadz5kviahNAg==
X-Google-Smtp-Source: ABdhPJy8+CnENi0qNMz/AzxpDjlAWCBgHyPSrk+5kHj90ygYGU1+MUGbf6AuTR5DqD5JuBLsynrbzQ==
X-Received: by 2002:a05:600c:2315:: with SMTP id
 21mr15898745wmo.39.1619619436738; 
 Wed, 28 Apr 2021 07:17:16 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id o1sm77653wrw.95.2021.04.28.07.17.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 07:17:16 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/4] hw/sparc64: Fix code style for checkpatch.pl
Date: Wed, 28 Apr 2021 16:16:53 +0200
Message-Id: <20210428141655.387430-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210428141655.387430-1-f4bug@amsat.org>
References: <20210428141655.387430-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Fabien Chouteau <chouteau@adacore.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We are going to move this code, fix its style first.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sparc64/sparc64.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/hw/sparc64/sparc64.c b/hw/sparc64/sparc64.c
index cc0b9bd30d3..fd29a79edc0 100644
--- a/hw/sparc64/sparc64.c
+++ b/hw/sparc64/sparc64.c
@@ -48,14 +48,18 @@ void cpu_check_irqs(CPUSPARCState *env)
         return;
     }
     cs = env_cpu(env);
-    /* check if TM or SM in SOFTINT are set
-       setting these also causes interrupt 14 */
+    /*
+     * check if TM or SM in SOFTINT are set
+     * setting these also causes interrupt 14
+     */
     if (env->softint & (SOFTINT_TIMER | SOFTINT_STIMER)) {
         pil |= 1 << 14;
     }
 
-    /* The bit corresponding to psrpil is (1<< psrpil), the next bit
-       is (2 << psrpil). */
+    /*
+     * The bit corresponding to psrpil is (1<< psrpil),
+     * the next bit is (2 << psrpil).
+     */
     if (pil < (2 << env->psrpil)) {
         if (cs->interrupt_request & CPU_INTERRUPT_HARD) {
             trace_sparc64_cpu_check_irqs_reset_irq(env->interrupt_index);
-- 
2.26.3


