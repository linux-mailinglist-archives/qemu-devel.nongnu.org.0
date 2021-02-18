Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5131731EB23
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 15:53:41 +0100 (CET)
Received: from localhost ([::1]:41682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCkgW-00086Y-7T
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 09:53:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lCkeH-0006n2-Ug
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 09:51:21 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:35064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lCkeG-0005XB-6g
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 09:51:21 -0500
Received: by mail-wr1-x433.google.com with SMTP id l12so3310337wry.2
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 06:51:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UgNWKpbMkhuIdSNTejo0CMTSoieY1NNbSQ6oJOSjciY=;
 b=C4HGcmKJbKtZb1rd1T29R0Og0K6gUN0j7SPI0YuPrxxiGVVFPHcCRSvfyy5loDvgZ5
 MVuXc25m6qKxxsoDsOlze61MeGyirMvOZrhr8g89zfGHU1Mz7o/Ny0ajGEy3u/iUM1I9
 Lq5ay89L6VsybDqDMLeAeorWitYH3AlbTvL02p2sFk1rR4u9KD6QDnNzw4HCycrSyL1J
 1vLG8U2eZo7RruS9zWpjx+b3CcGIw4i/hirbCC7I01Oh63xuvQclEP9xvxvwkWFU4Iil
 xhHRO7j/uuRgJhJc7EoSWzGi0ven1Rkvw2dexdHB64VXnfPcXqu8DeFr/5fO+EyDy9FS
 Idww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=UgNWKpbMkhuIdSNTejo0CMTSoieY1NNbSQ6oJOSjciY=;
 b=hxToh3h411h22x8wn1nl2qbuE6424zvKFli1AaShpL6CgGMVu7lgGkFa4YYFhhF8PM
 h+ohgW2OpEmRS8LgcBY8LXPEgFGR1k98GRq/IhPVdI4PpvotGSQBKuvkiCZE3XoCI5ru
 A6eV3tiVxMnxhtVnSQAJdN9IdYgh9GO36hDtx3Es/U7b92TgNYIXS/rI9N6Bfdxwinzo
 nlZ36/YKDGfpBmxpKAm78SmqLfSyAvHJPldxrWtX7pPBIyHC1whDF8Yun4e4ZnA+Mjqh
 ILP78IeS9OAJQvBQRe1fFDqkiyUWGQGtmyGe6KNMKZWD6NckO5JbSG0/PdjBQ9kvfhsx
 Ku0A==
X-Gm-Message-State: AOAM5307R1fibXIQ4yKPlWLrba3V1NWCfl963f65sTMbmV+UxF8D41Uc
 4hT4kz5A6wLgqaL1I/UXG9vClYp1hwE=
X-Google-Smtp-Source: ABdhPJz1un6Tg6xoBihjnAt+A3dntywO0CGDTvrNg2vuiqfeyY3bAsGX2xs2i4WMCH9xzUNi+jW/NQ==
X-Received: by 2002:adf:f542:: with SMTP id j2mr4677368wrp.46.1613659878535;
 Thu, 18 Feb 2021 06:51:18 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id v15sm9263365wra.61.2021.02.18.06.51.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Feb 2021 06:51:18 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/5] target/sh4: Fix code style for checkpatch.pl
Date: Thu, 18 Feb 2021 15:51:07 +0100
Message-Id: <20210218145111.1591763-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210218145111.1591763-1-f4bug@amsat.org>
References: <20210218145111.1591763-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Joe Komlodi <komlodi@xilinx.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We are going to move this code, fix its style first.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


