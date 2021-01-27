Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 939BA3067C6
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 00:23:46 +0100 (CET)
Received: from localhost ([::1]:51856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4uA5-0002BU-Ip
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 18:23:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l4u8R-0000ml-0o
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 18:22:03 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:34994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l4u8O-0006Ej-W7
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 18:22:02 -0500
Received: by mail-wr1-x433.google.com with SMTP id l12so3647157wry.2
 for <qemu-devel@nongnu.org>; Wed, 27 Jan 2021 15:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wrmBhBrTEeGFewV5R3wfy11aAEXgfzoclhrlpdg6/U8=;
 b=kIwDp4jab50EaNFYFJIW1KL0k931M7a/ZmBFJ7xCHzc2aA/nV2B8GQnGHX8A7rQppg
 AfoS9xmNjW/anla3cc7lrJwp3CutuWosXC9lAChHr1ltz2VF6RO/ijx7xlSr4xqkbeKs
 eRo2FaPtYjfrkDh7fzFMU8kDZB52GsuLccvYRJr4VNAxi36HswijsBIjlbwvI4riSWOA
 LjBHNQdLmpx784wqGlELuRR/LKy9cDLr3DpAslvqMT+eXIpTnGdGQqAcdQOFQTz1Oxlz
 8eeSrk0sGEEeO+9RaEbMVmMWe3qaaJwGIR/1Us+iZbkqr6eWbk3KVJ/1UGm+gFev8ZBe
 QnOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=wrmBhBrTEeGFewV5R3wfy11aAEXgfzoclhrlpdg6/U8=;
 b=czLd2XQ92pe6OYhZMozHm3XWjynpFs00q4DTw1f6JJ0h5/a4+COPMVyDFQWqQuVSaO
 YdM9cMcxz6zTAu0y7gxQ7BydyswzwAFD6Ds9q6rS9YyJWGWjp+UR60Yj/RsNeBTX5Who
 5ScyTTP/mZMdK5I2F46138PfnkmB9JvxS8gfr5HAoMRkWcx454EklaczPiX+Ye3GaCuP
 CWYROrkLGeAmuc7S59auHwTjhGMQYoWumpuR/Y33VWIgPwjz6aBsCYfK93MFPp7xyHfo
 LG6TSJrz6g8n9SityIDJf5x4Nx14t0FJrK6IFV84v8N9Ij9RNTbzNboCRQ2Vx0+o1uuc
 Jy0Q==
X-Gm-Message-State: AOAM531OCWWJz/xDCI20MrZa+dWqqMH8XpKuxylamC84dSYgKhsmBEsy
 2yKdlHKaCdQmeTigc4/EQs+Gp7IP09g=
X-Google-Smtp-Source: ABdhPJyDq/H0sS3f2oP4Y1W/2M+gFp8Ge215dCAFhDxnGYA9JswSEu0UH3C90RqVmEm8DQ8lTQyJIQ==
X-Received: by 2002:adf:c413:: with SMTP id v19mr13483760wrf.158.1611789719270; 
 Wed, 27 Jan 2021 15:21:59 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id r25sm5050321wrr.64.2021.01.27.15.21.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 15:21:58 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/5] target/sh4: Fix code style for checkpatch.pl
Date: Thu, 28 Jan 2021 00:21:47 +0100
Message-Id: <20210127232151.3523581-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210127232151.3523581-1-f4bug@amsat.org>
References: <20210127232151.3523581-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Joe Komlodi <komlodi@xilinx.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We are going to move this code, fix its style first.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Easier to review using 'git-diff -w -b'
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


