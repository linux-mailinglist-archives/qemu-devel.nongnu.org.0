Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60115167E2E
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Feb 2020 14:15:09 +0100 (CET)
Received: from localhost ([::1]:57292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j5896-0001yR-AU
	for lists+qemu-devel@lfdr.de; Fri, 21 Feb 2020 08:15:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56611)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j582F-0006o1-Ve
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 08:08:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j582E-0002i8-CZ
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 08:08:03 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:42073)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j582E-0002c5-4i
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 08:08:02 -0500
Received: by mail-wr1-x42c.google.com with SMTP id k11so1983552wrd.9
 for <qemu-devel@nongnu.org>; Fri, 21 Feb 2020 05:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=erpCrXEQNw7w6CRXISwFOLOWw8r/yT2DPAkNDqPVIP0=;
 b=R3HMUa6vL5nxmxfQeJP+muczfvK33hmTxKgP5UaSAS8bL1lq9kN6SgaRebzZrxqfZK
 uMa+tC/VG3tI/8275aCPJCIBQQsEXDztGKBPeMYWMyDfseyrnuS7MU6iieH6xVo+tvZa
 hT7lqqEkjwh7ITGPwpysZy9cUU/5u/VlsnuYI10zZ6Dcw6T6W6mdwgE+vLDmB2AXieE5
 S78x1vRa4oQVRklZQSPj7HQLK3XdWqsY7U6Y/ldNs+H+fBM5WuXuxso+y8JUkE+jduR2
 bgsWx399lrxQwicL4fza2RVgJZq1guiLGffHLi5Uf9IWaSfiMrQHJlv6dgjgBzedVDBQ
 W6yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=erpCrXEQNw7w6CRXISwFOLOWw8r/yT2DPAkNDqPVIP0=;
 b=hreLDyRST9ZbWIJrmOcuxkbgaWoMYyGcWi+elAawmMEReXgT5HNFi8UaAloqLs37E/
 X5v6izAKJUA7iAosd4vjnn64cD8KLP/WXEjb7Ziht/fcv7bBDpDCx/5xmOSVdKModaHn
 gS8+viT8CfIFpHDIu4ITL/zwAp6+QcjVGP8qmPvdiw0HRgkAu+CoI32t5/dK8oRPBgoR
 DggdWGpD9vNC0AykEZOb9Xi3ccVucA0gXCRvESDFJl6XBSK8uubBD1euXvBYfaACW5JU
 ymSu5yaz+kky+iKybYn+bxCAPtq8seM0eXoUntQp47abLdWefRHrXurEZj6ZbsLfRm6A
 0f9A==
X-Gm-Message-State: APjAAAUwhX2B1ryhOjdhN9ds5cf7+8PAVYi6ysHmlqmz9+vW8vs+4Atz
 2NeJXBh+v3jqSVFH5Zp1/LLqYrjl0/Dlpg==
X-Google-Smtp-Source: APXvYqzJqbzX6Ge8LL92/QlpEjpxwn41EgfxPThHl7Nz/9H/5Vy9ekP3Xbfa606L+RSCy50AvAu/GA==
X-Received: by 2002:a5d:61c2:: with SMTP id q2mr46866816wrv.425.1582290477960; 
 Fri, 21 Feb 2020 05:07:57 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id p15sm3598892wma.40.2020.02.21.05.07.56
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2020 05:07:57 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/52] target/arm: Split out aa64_va_parameter_tbi,
 aa64_va_parameter_tbid
Date: Fri, 21 Feb 2020 13:07:01 +0000
Message-Id: <20200221130740.7583-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200221130740.7583-1-peter.maydell@linaro.org>
References: <20200221130740.7583-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::42c
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

From: Richard Henderson <richard.henderson@linaro.org>

For the purpose of rebuild_hflags_a64, we do not need to compute
all of the va parameters, only tbi.  Moreover, we can compute them
in a form that is more useful to storing in hflags.

This eliminates the need for aa64_va_parameter_both, so fold that
in to aa64_va_parameter.  The remaining calls to aa64_va_parameter
are in get_phys_addr_lpae and in pauth_helper.c.

This reduces the total cpu consumption of aa64_va_parameter in a
kernel boot plus a kvm guest kernel boot from 3% to 0.5%.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20200216194343.21331-5-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/internals.h |  3 --
 target/arm/helper.c    | 68 +++++++++++++++++++++++-------------------
 2 files changed, 37 insertions(+), 34 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 58c4d707c5d..14328e3f7da 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1127,15 +1127,12 @@ typedef struct ARMVAParameters {
     unsigned tsz    : 8;
     unsigned select : 1;
     bool tbi        : 1;
-    bool tbid       : 1;
     bool epd        : 1;
     bool hpd        : 1;
     bool using16k   : 1;
     bool using64k   : 1;
 } ARMVAParameters;
 
-ARMVAParameters aa64_va_parameters_both(CPUARMState *env, uint64_t va,
-                                        ARMMMUIdx mmu_idx);
 ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
                                    ARMMMUIdx mmu_idx, bool data);
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index eec7b01ab35..8d0f6eca27b 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10234,12 +10234,34 @@ static uint8_t convert_stage2_attrs(CPUARMState *env, uint8_t s2attrs)
 }
 #endif /* !CONFIG_USER_ONLY */
 
-ARMVAParameters aa64_va_parameters_both(CPUARMState *env, uint64_t va,
-                                        ARMMMUIdx mmu_idx)
+static int aa64_va_parameter_tbi(uint64_t tcr, ARMMMUIdx mmu_idx)
+{
+    if (regime_has_2_ranges(mmu_idx)) {
+        return extract64(tcr, 37, 2);
+    } else if (mmu_idx == ARMMMUIdx_Stage2) {
+        return 0; /* VTCR_EL2 */
+    } else {
+        return extract32(tcr, 20, 1);
+    }
+}
+
+static int aa64_va_parameter_tbid(uint64_t tcr, ARMMMUIdx mmu_idx)
+{
+    if (regime_has_2_ranges(mmu_idx)) {
+        return extract64(tcr, 51, 2);
+    } else if (mmu_idx == ARMMMUIdx_Stage2) {
+        return 0; /* VTCR_EL2 */
+    } else {
+        return extract32(tcr, 29, 1);
+    }
+}
+
+ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
+                                   ARMMMUIdx mmu_idx, bool data)
 {
     uint64_t tcr = regime_tcr(env, mmu_idx)->raw_tcr;
-    bool tbi, tbid, epd, hpd, using16k, using64k;
-    int select, tsz;
+    bool epd, hpd, using16k, using64k;
+    int select, tsz, tbi;
 
     if (!regime_has_2_ranges(mmu_idx)) {
         select = 0;
@@ -10248,11 +10270,9 @@ ARMVAParameters aa64_va_parameters_both(CPUARMState *env, uint64_t va,
         using16k = extract32(tcr, 15, 1);
         if (mmu_idx == ARMMMUIdx_Stage2) {
             /* VTCR_EL2 */
-            tbi = tbid = hpd = false;
+            hpd = false;
         } else {
-            tbi = extract32(tcr, 20, 1);
             hpd = extract32(tcr, 24, 1);
-            tbid = extract32(tcr, 29, 1);
         }
         epd = false;
     } else {
@@ -10266,28 +10286,30 @@ ARMVAParameters aa64_va_parameters_both(CPUARMState *env, uint64_t va,
             epd = extract32(tcr, 7, 1);
             using64k = extract32(tcr, 14, 1);
             using16k = extract32(tcr, 15, 1);
-            tbi = extract64(tcr, 37, 1);
             hpd = extract64(tcr, 41, 1);
-            tbid = extract64(tcr, 51, 1);
         } else {
             int tg = extract32(tcr, 30, 2);
             using16k = tg == 1;
             using64k = tg == 3;
             tsz = extract32(tcr, 16, 6);
             epd = extract32(tcr, 23, 1);
-            tbi = extract64(tcr, 38, 1);
             hpd = extract64(tcr, 42, 1);
-            tbid = extract64(tcr, 52, 1);
         }
     }
     tsz = MIN(tsz, 39);  /* TODO: ARMv8.4-TTST */
     tsz = MAX(tsz, 16);  /* TODO: ARMv8.2-LVA  */
 
+    /* Present TBI as a composite with TBID.  */
+    tbi = aa64_va_parameter_tbi(tcr, mmu_idx);
+    if (!data) {
+        tbi &= ~aa64_va_parameter_tbid(tcr, mmu_idx);
+    }
+    tbi = (tbi >> select) & 1;
+
     return (ARMVAParameters) {
         .tsz = tsz,
         .select = select,
         .tbi = tbi,
-        .tbid = tbid,
         .epd = epd,
         .hpd = hpd,
         .using16k = using16k,
@@ -10295,16 +10317,6 @@ ARMVAParameters aa64_va_parameters_both(CPUARMState *env, uint64_t va,
     };
 }
 
-ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
-                                   ARMMMUIdx mmu_idx, bool data)
-{
-    ARMVAParameters ret = aa64_va_parameters_both(env, va, mmu_idx);
-
-    /* Present TBI as a composite with TBID.  */
-    ret.tbi &= (data || !ret.tbid);
-    return ret;
-}
-
 #ifndef CONFIG_USER_ONLY
 static ARMVAParameters aa32_va_parameters(CPUARMState *env, uint32_t va,
                                           ARMMMUIdx mmu_idx)
@@ -12134,21 +12146,15 @@ static uint32_t rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
 {
     uint32_t flags = rebuild_hflags_aprofile(env);
     ARMMMUIdx stage1 = stage_1_mmu_idx(mmu_idx);
-    ARMVAParameters p0 = aa64_va_parameters_both(env, 0, stage1);
+    uint64_t tcr = regime_tcr(env, mmu_idx)->raw_tcr;
     uint64_t sctlr;
     int tbii, tbid;
 
     flags = FIELD_DP32(flags, TBFLAG_ANY, AARCH64_STATE, 1);
 
     /* Get control bits for tagged addresses.  */
-    if (regime_has_2_ranges(mmu_idx)) {
-        ARMVAParameters p1 = aa64_va_parameters_both(env, -1, stage1);
-        tbid = (p1.tbi << 1) | p0.tbi;
-        tbii = tbid & ~((p1.tbid << 1) | p0.tbid);
-    } else {
-        tbid = p0.tbi;
-        tbii = tbid & !p0.tbid;
-    }
+    tbid = aa64_va_parameter_tbi(tcr, mmu_idx);
+    tbii = tbid & ~aa64_va_parameter_tbid(tcr, mmu_idx);
 
     flags = FIELD_DP32(flags, TBFLAG_A64, TBII, tbii);
     flags = FIELD_DP32(flags, TBFLAG_A64, TBID, tbid);
-- 
2.20.1


