Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97082167E68
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Feb 2020 14:22:45 +0100 (CET)
Received: from localhost ([::1]:57506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j58GS-0004zw-K4
	for lists+qemu-devel@lfdr.de; Fri, 21 Feb 2020 08:22:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56793)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j582T-0007PV-Er
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 08:08:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j582S-00034b-2r
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 08:08:17 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:33740)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j582R-00033u-S8
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 08:08:16 -0500
Received: by mail-wr1-x433.google.com with SMTP id u6so2020226wrt.0
 for <qemu-devel@nongnu.org>; Fri, 21 Feb 2020 05:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=uveg6XQ+btPciQjR9M/wF8Pu54qyiyTAuMZo4NhoVOI=;
 b=oFij9mrNkIDQEGntjoKsanDjlJHELjzSu1Lpv5MV+UXytzpOegM1ytd7/dT1cqqovN
 rNCd72obNVjc71pCHI10mRE1SG5MEVxcPBXpUM4XdVM8iWlOsXhE6B1BiqCxZDeE9LYJ
 0bFeCdk09xilcOAn7wN5a8KyNv6xW4QVc1uJ7VzZLNDl7osuWNnuX2KIQmrPHyxXEhMd
 9K3A7FQpW1lr4r6jrg68oXmlFM8F1nM+WwkF7/f4ivcVVXNiB3y7N6wlvNqaf71jBUVX
 CirFGRIS1r9mvyg5xJHjPYTNfyQGoxGUdLpMAvzXEjEXp+b392xpZns+mN8eErOetweb
 wZwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uveg6XQ+btPciQjR9M/wF8Pu54qyiyTAuMZo4NhoVOI=;
 b=kmMh8Ap7YC0BPdUDLm7NYuOAIzg6LILkyXjX2e8SGgVi8KY59qxCUt5JPA/v086Y1s
 HvZgMhQ4DzOp0quXIw036eB6pBqe3ATNuTqccOTRjF/p1dqgrUik0jHO9erqZdTiWRFq
 aTNV1GXTwlKXQI6kGM6Dka3PS09PTdGMrb6EcGaA2qK6Kpla+VccjJzd9lbTjzx9al4o
 yX+Aj6Bc3KCcJnaRCqKzOqvuqpmNrEQ7JogQu07pNCpTcSUhBA8B0WFP++yLgub+x/xz
 86G/oo+XrNt9ZpMs4aniMYwOP5Gdvfvoju7C9IQbPbTf3k/u7wevpd+puguZHub3a6Vd
 FhmA==
X-Gm-Message-State: APjAAAVvjC2GIRtlUIbXoVfQFdYWagN0YSuUwTHwdis7fW2B890W6p8O
 faAqQJL4U1jTTy246CSvrmxM/xbHU8ATuQ==
X-Google-Smtp-Source: APXvYqzBvo/BFz4yT2cQo8cQatwmt7PNxobRbMA9xb+ylsBHr7g4zk+0fqDCKyiBXCl67JnkXAoGgg==
X-Received: by 2002:adf:fa87:: with SMTP id h7mr51176917wrr.172.1582290494435; 
 Fri, 21 Feb 2020 05:08:14 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id p15sm3598892wma.40.2020.02.21.05.08.13
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2020 05:08:13 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 26/52] target/arm: Implement ARMv8.1-PMU extension
Date: Fri, 21 Feb 2020 13:07:14 +0000
Message-Id: <20200221130740.7583-27-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200221130740.7583-1-peter.maydell@linaro.org>
References: <20200221130740.7583-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::433
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The ARMv8.1-PMU extension requires:
 * the evtCount field in PMETYPER<n>_EL0 is 16 bits, not 10
 * MDCR_EL2.HPMD allows event counting to be disabled at EL2
 * two new required events, STALL_FRONTEND and STALL_BACKEND
 * ID register bits in ID_AA64DFR0_EL1 and ID_DFR0

We already implement the 16-bit evtCount field and the
HPMD bit, so all that is missing is the two new events:
  STALL_FRONTEND
   "counts every cycle counted by the CPU_CYCLES event on which no
    operation was issued because there are no operations available
    to issue to this PE from the frontend"
  STALL_BACKEND
   "counts every cycle counted by the CPU_CYCLES event on which no
    operation was issued because the backend is unable to accept
    any available operations from the frontend"

QEMU never stalls in this sense, so our implementation is trivial:
always return a zero count.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20200214175116.9164-14-peter.maydell@linaro.org
---
 target/arm/helper.c | 32 ++++++++++++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 68649121250..2fe09c1d604 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1124,6 +1124,24 @@ static int64_t instructions_ns_per(uint64_t icount)
 }
 #endif
 
+static bool pmu_8_1_events_supported(CPUARMState *env)
+{
+    /* For events which are supported in any v8.1 PMU */
+    return cpu_isar_feature(any_pmu_8_1, env_archcpu(env));
+}
+
+static uint64_t zero_event_get_count(CPUARMState *env)
+{
+    /* For events which on QEMU never fire, so their count is always zero */
+    return 0;
+}
+
+static int64_t zero_event_ns_per(uint64_t cycles)
+{
+    /* An event which never fires can never overflow */
+    return -1;
+}
+
 static const pm_event pm_events[] = {
     { .number = 0x000, /* SW_INCR */
       .supported = event_always_supported,
@@ -1140,8 +1158,18 @@ static const pm_event pm_events[] = {
       .supported = event_always_supported,
       .get_count = cycles_get_count,
       .ns_per_count = cycles_ns_per,
-    }
+    },
 #endif
+    { .number = 0x023, /* STALL_FRONTEND */
+      .supported = pmu_8_1_events_supported,
+      .get_count = zero_event_get_count,
+      .ns_per_count = zero_event_ns_per,
+    },
+    { .number = 0x024, /* STALL_BACKEND */
+      .supported = pmu_8_1_events_supported,
+      .get_count = zero_event_get_count,
+      .ns_per_count = zero_event_ns_per,
+    },
 };
 
 /*
@@ -1150,7 +1178,7 @@ static const pm_event pm_events[] = {
  * should first be updated to something sparse instead of the current
  * supported_event_map[] array.
  */
-#define MAX_EVENT_ID 0x11
+#define MAX_EVENT_ID 0x24
 #define UNSUPPORTED_EVENT UINT16_MAX
 static uint16_t supported_event_map[MAX_EVENT_ID + 1];
 
-- 
2.20.1


