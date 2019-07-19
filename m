Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1636EBDF
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Jul 2019 23:05:16 +0200 (CEST)
Received: from localhost ([::1]:48178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hoa42-0000bK-Ts
	for lists+qemu-devel@lfdr.de; Fri, 19 Jul 2019 17:05:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54953)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hoa2u-0005GU-KX
 for qemu-devel@nongnu.org; Fri, 19 Jul 2019 17:04:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hoa2l-0005Di-T3
 for qemu-devel@nongnu.org; Fri, 19 Jul 2019 17:03:58 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:37903)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hoa2d-000570-7p
 for qemu-devel@nongnu.org; Fri, 19 Jul 2019 17:03:49 -0400
Received: by mail-pg1-x541.google.com with SMTP id f5so6143443pgu.5
 for <qemu-devel@nongnu.org>; Fri, 19 Jul 2019 14:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=NUSM1qmbu6kHaDmLHqWVtWdOZoHscxZfBv6st8fQLVo=;
 b=E1RFVPs9zYEk8fml6OCh0EpMr5IVFaInRJ9uIH6agfw4gErIuOFQcubkxH8J3VAUiL
 b1zaB+bZZuJS+Zo1U0YjxWlg5AK6VfK5N3TdrRBItCdL46nYw3g5OjK8NQ0PBXJywEB2
 NOnjz+5QVYuFxOsE9BsUW5sYfIEdxA2sxn9BAsd9MIem6IU+6uDLNwOfqjjGV3j6bYIe
 NtpIsjPsX7l5puqdh2PcwoaL42yOAvJxp72ke4maBie31yvPW6qNFaNN+zjfFLPrwbrB
 DnwASec56bnyTYs1CmcAdvavhAyepcFti0m8UCisRiiBo8TmX4ekZAuKM8QA744M1I7F
 DdMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=NUSM1qmbu6kHaDmLHqWVtWdOZoHscxZfBv6st8fQLVo=;
 b=tI98G1r3x14HbKZ90aFjMEHJ+N0Ht6pNtAkUUT46CmQVOhqAeXjB/pS3p0WsIYYQ0+
 v8ZAoLg0ZMyZnFMtSe06PjeL1rNgrqDNgILtqvOVh60+8HDMChVMjTPUyRdIRXBcVuAd
 hSOOT3TtUh+rvlaSS64EiAXbclz8oCAk1+pZ2iQ3U0FvBCa49TweyFtmQCt2dKcrBV7k
 eFMzAxKkmyC+knUZD5B4+tzGYBLU9uapBxve3bAbuJ4F4Q7qzFmVD3UW21QRe7v9xTVD
 G1VqgtpBqbkIrZqN3qDoLaF1ryBKBFbCxa54qUfH61SEDtHYxBr6Uas9p9Xko+R7Ffni
 NvGw==
X-Gm-Message-State: APjAAAXwQDbsAHPzYL2Pc6bWppW52wQ5l031YVxbmcXhcBmPMK/hmd7Y
 3VmxPdnzx/Y3US/lWKRZsVApuRv7gdY=
X-Google-Smtp-Source: APXvYqzjHhk482RJwTVnA4FsUxDJ+JWbzdUdwj8hk2ALZsakhakW4j0h3KU8U66zoYe9xzvTpFLxtg==
X-Received: by 2002:a63:5945:: with SMTP id j5mr55943450pgm.452.1563570214508; 
 Fri, 19 Jul 2019 14:03:34 -0700 (PDT)
Received: from localhost.localdomain (97-126-117-207.tukw.qwest.net.
 [97.126.117.207])
 by smtp.gmail.com with ESMTPSA id i6sm32724751pgi.40.2019.07.19.14.03.33
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 19 Jul 2019 14:03:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri, 19 Jul 2019 14:03:07 -0700
Message-Id: <20190719210326.15466-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190719210326.15466-1-richard.henderson@linaro.org>
References: <20190719210326.15466-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
Subject: [Qemu-devel] [PATCH for-4.2 05/24] target/arm: Install ASIDs for EL2
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
Cc: peter.maydell@linaro.org, beata.michalska@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The VMID is the ASID for the 2nd stage page lookup.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 1ed7c06313..3a9f35bf4b 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3452,17 +3452,23 @@ static void vmsa_ttbr_el1_write(CPUARMState *env, const ARMCPRegInfo *ri,
 static void vttbr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                         uint64_t value)
 {
-    ARMCPU *cpu = env_archcpu(env);
-    CPUState *cs = CPU(cpu);
+    CPUState *cs = env_cpu(env);
+    int vmid;
 
-    /* Accesses to VTTBR may change the VMID so we must flush the TLB.  */
-    if (raw_read(env, ri) != value) {
-        tlb_flush_by_mmuidx(cs,
-                            ARMMMUIdxBit_S12NSE1 |
-                            ARMMMUIdxBit_S12NSE0 |
-                            ARMMMUIdxBit_S2NS);
-        raw_write(env, ri, value);
-    }
+    raw_write(env, ri, value);
+
+    /*
+     * TODO: with ARMv8.1-VMID16, aarch64 must examine VTCR.VS
+     * (re-evaluating with changes to VTCR) then use bits [63:48].
+     */
+    vmid = extract64(value, 48, 8);
+
+    /*
+     * A change in VMID to the stage2 page table (S2NS) invalidates
+     * the combined stage 1&2 tlbs (S12NSE1 and S12NSE0).
+     */
+    tlb_set_asid_for_mmuidx(cs, vmid, ARMMMUIdxBit_S2NS,
+                            ARMMMUIdxBit_S12NSE1 | ARMMMUIdxBit_S12NSE0);
 }
 
 static const ARMCPRegInfo vmsa_pmsa_cp_reginfo[] = {
-- 
2.17.1


