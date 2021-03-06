Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C01832FB64
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Mar 2021 16:38:15 +0100 (CET)
Received: from localhost ([::1]:41706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIZ0Q-00011A-JN
	for lists+qemu-devel@lfdr.de; Sat, 06 Mar 2021 10:38:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lIYyp-0008EU-Og
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 10:36:35 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:34682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lIYyo-00085A-D6
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 10:36:35 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 n11-20020a05600c4f8bb029010e5cf86347so1664445wmq.1
 for <qemu-devel@nongnu.org>; Sat, 06 Mar 2021 07:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F2UFebTVoWHluSlCY/+GXgLEdPhMIp3RZbpdfu82Uhk=;
 b=g9FhJKChH0Dt25MVTMcIx+XvWtl9ypeYiaemfla8oNegdWtZgjT5cWqG4ESIGif3s4
 ihwQkLThruyGFwi6ba0TxCcyifGsbNAt4fYYvLgbQrct5FpXBwEPGKS3m17wVNXIFMJQ
 qBrvl+4YsVLNVFF/hvNKTqN9OotHACjXLTAga0q9qOgjNU0XoHQju48j5NS+uZUnhqn1
 MW3N9dOEc5gjGN2PWzNK/DZQrUjgkCE5TnHQ0RpKDyA12tMniXkigjPuMlabB1xfmiH+
 gLC1E8WEvqfD7Q0BVAH6Nq2aoziTlSw4BZFKct594xUxpvQjXZ84Yitw/hUcmkDNoW+X
 p52A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=F2UFebTVoWHluSlCY/+GXgLEdPhMIp3RZbpdfu82Uhk=;
 b=kTXCqeLJ1Z4PzaAqOpVOmr3hGeu/pGN1uFFCJEPUxu/j5aOp+8vfPpuGMZTrN1a4s1
 fS3FLIbR2srLbv4cXMspr9VUu9663enJuFj+urLrWP0Jm268ECW1IE7H4ZUb8+5dCJwV
 GsFQmqCJvcmYMDTgz8m0iardlG003Mlrnqr3x5ZjDh8hKQQ7Cj3bgR8BIYv+LV62gEEh
 SyWr4XqzzwZ7ij/LGciQVyOfKZRIGOKt4LtEsAKlpyctBA5JORG+zhzFvrEWYjXBthPa
 3Y3DhdAqidCvL/kiFZtNLzIc7mvHXOjmmAgV5Yfw4FGDDV7R4yQlGpqaVVA8UPk6SnKe
 MfcA==
X-Gm-Message-State: AOAM5337/V5l27ciNdj7wS8Va2zSxCavDPmFlnpQ3XJnCpmEgzc4qGkQ
 GolUbZndHwAm+wXIubvQXRHXtbBrbVU=
X-Google-Smtp-Source: ABdhPJwNTi96qMvX2jRRIPEFcDfYvKHG2ElLUU0t2AdCsSk0vtSjW1K8hIK2Fvorls11QYeLI4/0KA==
X-Received: by 2002:a1c:df46:: with SMTP id w67mr14089515wmg.176.1615044992876; 
 Sat, 06 Mar 2021 07:36:32 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id o9sm9405313wmc.8.2021.03.06.07.36.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Mar 2021 07:36:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/14] target/sh4: Replace magic value by MMUAccessType
 definitions
Date: Sat,  6 Mar 2021 16:36:09 +0100
Message-Id: <20210306153621.2393879-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210306153621.2393879-1-f4bug@amsat.org>
References: <20210306153621.2393879-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace the 0/1/2 magic values by the corresponding MMUAccessType.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210127232151.3523581-3-f4bug@amsat.org>
---
 target/sh4/helper.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/sh4/helper.c b/target/sh4/helper.c
index fc816137766..4303ebf018b 100644
--- a/target/sh4/helper.c
+++ b/target/sh4/helper.c
@@ -338,7 +338,7 @@ static int get_mmu_address(CPUSH4State * env, target_ulong * physical,
 
     use_asid = !(env->mmucr & MMUCR_SV) || !(env->sr & (1u << SR_MD));
 
-    if (rw == 2) {
+    if (rw == MMU_INST_FETCH) {
         n = find_itlb_entry(env, address, use_asid);
         if (n >= 0) {
             matching = &env->itlb[n];
@@ -371,11 +371,11 @@ static int get_mmu_address(CPUSH4State * env, target_ulong * physical,
         if (n >= 0) {
             matching = &env->utlb[n];
             if (!(env->sr & (1u << SR_MD)) && !(matching->pr & 2)) {
-                n = (rw == 1)
+                n = (rw == MMU_DATA_STORE)
                     ? MMU_DTLB_VIOLATION_WRITE : MMU_DTLB_VIOLATION_READ;
-            } else if ((rw == 1) && !(matching->pr & 1)) {
+            } else if ((rw == MMU_DATA_STORE) && !(matching->pr & 1)) {
                 n = MMU_DTLB_VIOLATION_WRITE;
-            } else if ((rw == 1) && !matching->d) {
+            } else if ((rw == MMU_DATA_STORE) && !matching->d) {
                 n = MMU_DTLB_INITIAL_WRITE;
             } else {
                 *prot = PAGE_READ;
@@ -384,7 +384,7 @@ static int get_mmu_address(CPUSH4State * env, target_ulong * physical,
                 }
             }
         } else if (n == MMU_DTLB_MISS) {
-            n = (rw == 1)
+            n = (rw == MMU_DATA_STORE)
                 ? MMU_DTLB_MISS_WRITE : MMU_DTLB_MISS_READ;
         }
     }
@@ -406,9 +406,9 @@ static int get_physical_address(CPUSH4State * env, target_ulong * physical,
                 && (address < 0xe0000000 || address >= 0xe4000000)) {
             /* Unauthorized access in user mode (only store queues are available) */
             qemu_log_mask(LOG_GUEST_ERROR, "Unauthorized access\n");
-            if (rw == 0) {
+            if (rw == MMU_DATA_LOAD) {
                 return MMU_DADDR_ERROR_READ;
-            } else if (rw == 1) {
+            } else if (rw == MMU_DATA_STORE) {
                 return MMU_DADDR_ERROR_WRITE;
             } else {
                 return MMU_IADDR_ERROR;
@@ -441,7 +441,7 @@ hwaddr superh_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
     target_ulong physical;
     int prot;
 
-    get_physical_address(&cpu->env, &physical, &prot, addr, 0, 0);
+    get_physical_address(&cpu->env, &physical, &prot, addr, MMU_DATA_LOAD, 0);
     return physical;
 }
 
-- 
2.26.2


