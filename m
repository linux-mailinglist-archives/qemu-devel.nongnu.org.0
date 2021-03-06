Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D9F32FB67
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Mar 2021 16:40:04 +0100 (CET)
Received: from localhost ([::1]:48970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIZ2B-0003vy-R3
	for lists+qemu-devel@lfdr.de; Sat, 06 Mar 2021 10:40:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lIYyl-00089U-6M
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 10:36:31 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:35412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lIYyj-00082l-F6
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 10:36:30 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 c76-20020a1c9a4f0000b029010c94499aedso1138403wme.0
 for <qemu-devel@nongnu.org>; Sat, 06 Mar 2021 07:36:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QdVPFW+rTeOfBCb153J72RdegotAb1vteWkrrhEb3Cg=;
 b=P1rfKnLZWUHzdLckvOTTPqPpX5iyB3oH1QtkHfUc0eK5EMK5g35w/jakn/r/OQH0ug
 RjwNvvMFYHvYIQF/KRmOnLW0QHxC+FfmwpfakK3o37r/bDIPuRUL7Wubo83ixJFDiHhl
 RdtKqxZXNj8Sy4mGMzWMgdtaBh+xHyHvPa9WBQM0q74Lmxb6Gq8TeZr86DsUi2Y7dFhX
 ZREWYV7QD3IxAQ3jKegBLdsBpL9+MOTWKDPA0vD5UG8Bpc9v/Uf6uu65NMfWJK6zXsVm
 z71Fci8RP2Pk0FVRdKzqIrGJvVyhEtzKc76J06XkZHt4NOQ+eNhGZLDfknh9x0+1RVPG
 nK0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=QdVPFW+rTeOfBCb153J72RdegotAb1vteWkrrhEb3Cg=;
 b=Ey1hG2Rm30v7720bf09AtbNttIAeFLgD6u0vQ3MW174o6zmOc9D5kj5pf+RDqS6yn3
 hhNJhI6GEkfoQ+SAcYyjLs5eUwnSdwShzzVRX9RK0w5JMbRUYV5QDjZKkIsweGTGz0ux
 cYiTzsRfTJRBfT/aMniVr1v7XFpGrF9lWoBKf8nSEY89gfEQuYu5YUfT09YFo7eJJOgs
 H9z9LdeCmM5DlJ19WwRsoI/nV5TrZRg+rZfbjZoTLR3GhBE8BjQRTkGZt2z29zVSjoC4
 kQ/ksHPGvmPin83Jw9V2qFbCS8gHZptmmQriFnUz+B3jw7x+8X4HKgv16Hc2etpdYOUF
 N8mw==
X-Gm-Message-State: AOAM533jhAH4p+m+mjde5wcgJgwFVnr3tjfW720qbz4HHsdNiQ7txYUg
 1sISqkrNQ4R9KUYbi8YJEFgs6yD5GkA=
X-Google-Smtp-Source: ABdhPJxKD/K0Y1oJmNZBeli0HPK5bRuqX/Aw0rgywwJt8KSMWrDs5T+xSrzOyRJBbwQkEDIlbV6pdw==
X-Received: by 2002:a05:600c:4844:: with SMTP id
 j4mr14127546wmo.179.1615044987695; 
 Sat, 06 Mar 2021 07:36:27 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id 75sm10489761wma.23.2021.03.06.07.36.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Mar 2021 07:36:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/14] target/sh4: Fix code style for checkpatch.pl
Date: Sat,  6 Mar 2021 16:36:08 +0100
Message-Id: <20210306153621.2393879-2-f4bug@amsat.org>
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

We are going to move this code, fix its style first.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210127232151.3523581-2-f4bug@amsat.org>
---
 target/sh4/helper.c | 82 ++++++++++++++++++++++-----------------------
 1 file changed, 41 insertions(+), 41 deletions(-)

diff --git a/target/sh4/helper.c b/target/sh4/helper.c
index 408478ce5dc..fc816137766 100644
--- a/target/sh4/helper.c
+++ b/target/sh4/helper.c
@@ -330,8 +330,8 @@ static int find_utlb_entry(CPUSH4State * env, target_ulong address, int use_asid
    MMU_IADDR_ERROR, MMU_DADDR_ERROR_READ, MMU_DADDR_ERROR_WRITE.
 */
 static int get_mmu_address(CPUSH4State * env, target_ulong * physical,
-			   int *prot, target_ulong address,
-			   int rw, int access_type)
+                           int *prot, target_ulong address,
+                           int rw, int access_type)
 {
     int use_asid, n;
     tlb_t *matching = NULL;
@@ -340,12 +340,12 @@ static int get_mmu_address(CPUSH4State * env, target_ulong * physical,
 
     if (rw == 2) {
         n = find_itlb_entry(env, address, use_asid);
-	if (n >= 0) {
-	    matching = &env->itlb[n];
+        if (n >= 0) {
+            matching = &env->itlb[n];
             if (!(env->sr & (1u << SR_MD)) && !(matching->pr & 2)) {
-		n = MMU_ITLB_VIOLATION;
+                n = MMU_ITLB_VIOLATION;
             } else {
-		*prot = PAGE_EXEC;
+                *prot = PAGE_EXEC;
             }
         } else {
             n = find_utlb_entry(env, address, use_asid);
@@ -365,14 +365,14 @@ static int get_mmu_address(CPUSH4State * env, target_ulong * physical,
             } else if (n == MMU_DTLB_MISS) {
                 n = MMU_ITLB_MISS;
             }
-	}
+        }
     } else {
-	n = find_utlb_entry(env, address, use_asid);
-	if (n >= 0) {
-	    matching = &env->utlb[n];
+        n = find_utlb_entry(env, address, use_asid);
+        if (n >= 0) {
+            matching = &env->utlb[n];
             if (!(env->sr & (1u << SR_MD)) && !(matching->pr & 2)) {
-                n = (rw == 1) ? MMU_DTLB_VIOLATION_WRITE :
-                    MMU_DTLB_VIOLATION_READ;
+                n = (rw == 1)
+                    ? MMU_DTLB_VIOLATION_WRITE : MMU_DTLB_VIOLATION_READ;
             } else if ((rw == 1) && !(matching->pr & 1)) {
                 n = MMU_DTLB_VIOLATION_WRITE;
             } else if ((rw == 1) && !matching->d) {
@@ -383,15 +383,15 @@ static int get_mmu_address(CPUSH4State * env, target_ulong * physical,
                     *prot |= PAGE_WRITE;
                 }
             }
-	} else if (n == MMU_DTLB_MISS) {
-	    n = (rw == 1) ? MMU_DTLB_MISS_WRITE :
-		MMU_DTLB_MISS_READ;
-	}
+        } else if (n == MMU_DTLB_MISS) {
+            n = (rw == 1)
+                ? MMU_DTLB_MISS_WRITE : MMU_DTLB_MISS_READ;
+        }
     }
     if (n >= 0) {
-	n = MMU_OK;
-	*physical = ((matching->ppn << 10) & ~(matching->size - 1)) |
-	    (address & (matching->size - 1));
+        n = MMU_OK;
+        *physical = ((matching->ppn << 10) & ~(matching->size - 1))
+                    | (address & (matching->size - 1));
     }
     return n;
 }
@@ -401,34 +401,34 @@ static int get_physical_address(CPUSH4State * env, target_ulong * physical,
                                 int rw, int access_type)
 {
     /* P1, P2 and P4 areas do not use translation */
-    if ((address >= 0x80000000 && address < 0xc0000000) ||
-	address >= 0xe0000000) {
+    if ((address >= 0x80000000 && address < 0xc0000000) || address >= 0xe0000000) {
         if (!(env->sr & (1u << SR_MD))
-	    && (address < 0xe0000000 || address >= 0xe4000000)) {
-	    /* Unauthorized access in user mode (only store queues are available) */
+                && (address < 0xe0000000 || address >= 0xe4000000)) {
+            /* Unauthorized access in user mode (only store queues are available) */
             qemu_log_mask(LOG_GUEST_ERROR, "Unauthorized access\n");
-	    if (rw == 0)
-		return MMU_DADDR_ERROR_READ;
-	    else if (rw == 1)
-		return MMU_DADDR_ERROR_WRITE;
-	    else
-		return MMU_IADDR_ERROR;
-	}
-	if (address >= 0x80000000 && address < 0xc0000000) {
-	    /* Mask upper 3 bits for P1 and P2 areas */
-	    *physical = address & 0x1fffffff;
-	} else {
-	    *physical = address;
-	}
-	*prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
-	return MMU_OK;
+            if (rw == 0) {
+                return MMU_DADDR_ERROR_READ;
+            } else if (rw == 1) {
+                return MMU_DADDR_ERROR_WRITE;
+            } else {
+                return MMU_IADDR_ERROR;
+            }
+        }
+        if (address >= 0x80000000 && address < 0xc0000000) {
+            /* Mask upper 3 bits for P1 and P2 areas */
+            *physical = address & 0x1fffffff;
+        } else {
+            *physical = address;
+        }
+        *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
+        return MMU_OK;
     }
 
     /* If MMU is disabled, return the corresponding physical page */
     if (!(env->mmucr & MMUCR_AT)) {
-	*physical = address & 0x1FFFFFFF;
-	*prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
-	return MMU_OK;
+        *physical = address & 0x1FFFFFFF;
+        *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
+        return MMU_OK;
     }
 
     /* We need to resort to the MMU */
-- 
2.26.2


