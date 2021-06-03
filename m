Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA83C399D67
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 11:07:30 +0200 (CEST)
Received: from localhost ([::1]:44804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lojK5-0002Rl-TD
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 05:07:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lojGQ-0004a6-KA
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 05:03:42 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:43620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lojGM-0000Jb-RQ
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 05:03:40 -0400
Received: by mail-ed1-x532.google.com with SMTP id s6so6205665edu.10
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 02:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+aq3bYmzCfrRF1OZBJAm7L1BFoguyeY0vM7CmI9EICc=;
 b=iX1YCkrvg1cnb1i+Uo83gLbx0VLvoOJCo/g20HG7dJvzW9opJ1yXwPSR4f6UwzUZGO
 oWTtwoSIZiGGoulDKhwlG6xXOdTL8ptcqvxnwNWcjX9zzuLdQci23RuNudm4QJ2hxuSY
 zK33wfbIujZx1hHfXR1/S2F4LcPjbV7cM3zxLVnUBF7RkSAcdVc8c3JQ3uxzHOZ2nNFk
 /C2eQ8fF+7IBK4gXZfDFR/fPIPwNO10JNWXq9DFpe7qxjNOjdP9Kk2h/RIiKUZ7ToKm+
 b4aR0OVamSEeIOGYKOFx+UcyM1cYibuf8/1Ty4P9lPy8AED//B0xtwzBLhfC08HzyW1D
 QmbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=+aq3bYmzCfrRF1OZBJAm7L1BFoguyeY0vM7CmI9EICc=;
 b=kgsS7GZmwijmytzQM14PvkOrTIyvY3tQ5izod/b6FTtxWkE4x2yKx2MOC8Bda8W5f1
 ok/gsOXEWdR2wf3but6S1OYjAvnWKANxjWh8KPAnvCG54TYAB3Ww5uFTC68oYTeW+tvo
 kyOxXpwtkaZ31H9qQ+kjOH8DDCGSlU8mheAO91wlVQPf/iYvQ5MRXed2t/hOb5OO/Qee
 FOhkMKjMJB2o8WtYhpJroowFbT3DHepuIbGmTezyZu8LcrDLNplgnxw5+Y4N6O62z0rC
 +mI31zN2RipV0dJdC4KJHm0g4d0XQQIuKba+lOChZBcpdEOJu+Aw01hv3G7YtRElQ4C+
 8wuw==
X-Gm-Message-State: AOAM53116SOpPQh4QMCNLK3QqzjqpgZb0Z4fuM1a5h+nmvzmK3SoLi+O
 8jiX+hi6VYSqRXMmiY+tsfChniog6BdO/A==
X-Google-Smtp-Source: ABdhPJz2l6GaL/M2V3y+cmBe/2MU0BPXO5o9vnFtKXR6Sr4RzOzk0m1areBGPbjYt8H6T1rbYNm5AQ==
X-Received: by 2002:a05:6402:368:: with SMTP id
 s8mr27852654edw.129.1622711017284; 
 Thu, 03 Jun 2021 02:03:37 -0700 (PDT)
Received: from x1w.redhat.com (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id u1sm1380327edv.91.2021.06.03.02.03.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 02:03:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/6] target/microblaze: Replace magic values by proper
 definitions
Date: Thu,  3 Jun 2021 11:03:09 +0200
Message-Id: <20210603090310.2749892-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210603090310.2749892-1-f4bug@amsat.org>
References: <20210603090310.2749892-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the Exception Status Register definitions from "cpu.h".

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/microblaze/helper.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/target/microblaze/helper.c b/target/microblaze/helper.c
index 20dbd673136..d537f300ca6 100644
--- a/target/microblaze/helper.c
+++ b/target/microblaze/helper.c
@@ -99,14 +99,22 @@ bool mb_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                   mmu_idx, address);
 
     env->ear = address;
+
+    env->esr = (access_type == MMU_DATA_STORE) ? ESR_S : 0;
     switch (lu.err) {
     case ERR_PROT:
-        env->esr = access_type == MMU_INST_FETCH ? 17 : 16;
-        env->esr |= (access_type == MMU_DATA_STORE) << 10;
+        if (access_type == MMU_INST_FETCH) {
+            env->esr |= ESR_EC_INSN_STORAGE;
+        } else {
+           env->esr |= ESR_EC_DATA_STORAGE;
+        }
         break;
     case ERR_MISS:
-        env->esr = access_type == MMU_INST_FETCH ? 19 : 18;
-        env->esr |= (access_type == MMU_DATA_STORE) << 10;
+        if (access_type == MMU_INST_FETCH) {
+            env->esr |= ESR_EC_INSN_TLB;
+        } else {
+           env->esr |= ESR_EC_DATA_TLB;
+        }
         break;
     default:
         abort();
-- 
2.26.3


