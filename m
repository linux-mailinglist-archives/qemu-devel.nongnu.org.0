Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DAC64CB115
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 22:15:36 +0100 (CET)
Received: from localhost ([::1]:59454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPWJr-0000WF-Kx
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 16:15:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPVxl-0005np-B0
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 15:52:45 -0500
Received: from [2a00:1450:4864:20::334] (port=52064
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPVxj-00088M-PF
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 15:52:45 -0500
Received: by mail-wm1-x334.google.com with SMTP id p4so1946112wmg.1
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 12:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=/jMvBmS05a6AvX2w8GLIu2n1iO4O8JPmoPPf/h/6b0c=;
 b=cl5h83Nw/XRAMZNOHItSybjWY8QdvGf/3GWofao76Z+NqLboxXdVP10J/51zwIZj17
 OHZWjsSU2duOi+sKclrHCxPkLxPfa8I0FLEbGr69oBPkdQvwCOFnwrlpzWgo0H4npkfv
 cdrctQzpRLcDIsJyGZUu897cQvsfpAPgk9KMktpfnI3S/c5fI2G4w9QuYX12ikAND1rH
 YaKw4JWChMV6GoTpbuNyIlVj5rAq7d7av9IBQMAI8lfM/myVwT7pya9kd9di9TGUyC3T
 497quhJXtJRQvMeKFi+PwF/xuizTAVtAuX7sn67g3hBYSNNf4rGF3f9Z4xar4EYF7mpp
 JO6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/jMvBmS05a6AvX2w8GLIu2n1iO4O8JPmoPPf/h/6b0c=;
 b=RolSrG8A512H/5GwRmiPwdtcDufJgcgtWixKcd8S1n+ZNmhhI5jRjjmbITrAY+FJeL
 /faTcc/NHAcmBOkLJhbjNz60o76i6FvEBPkFM3lqh+G4ESmX33x0rVqNlEng/y0unq8N
 4k4ITkxsVzS7W2axUMivQ96Oy5vDwqQn/+HyZrWIyG0bQ2Mi479NgMXsA1VfdRURIwjR
 B6rq2z6KvXgGRFTOk+a6xP3W8IMzO1wH6AYuXlwClyYA2wK/KixAA8S75UY0FTh4I9id
 q2feOmmDlhrC2d0MNV1QQWPH3WrDjuSsMwmw3H/eynI2f3VXL9ZAK6HG/EArz/yeIi0c
 SCgA==
X-Gm-Message-State: AOAM5309iNnXV3otANk0hYZWUBclLcQ0eAN3m4tgC/uESPDeSJuTDgxr
 QFeruGTz2bFvTHelGLwvlefgIysdy+bMhA==
X-Google-Smtp-Source: ABdhPJzlNo1xK7AqQHT1XR4UUkjZORAXZ8Wn5ozAZt/NZOb4CnumjHmWWHl49h+0IMIm0V0UwhN+VA==
X-Received: by 2002:a05:600c:384c:b0:37b:c771:499c with SMTP id
 s12-20020a05600c384c00b0037bc771499cmr1280943wmr.141.1646254362394; 
 Wed, 02 Mar 2022 12:52:42 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 x13-20020adfec0d000000b001e31279cc38sm90801wrn.11.2022.03.02.12.52.41
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 12:52:42 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/26] target/arm: Move arm_pamax out of line
Date: Wed,  2 Mar 2022 20:52:15 +0000
Message-Id: <20220302205230.2122390-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220302205230.2122390-1-peter.maydell@linaro.org>
References: <20220302205230.2122390-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

We will shortly share parts of this function with other portions
of address translation.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220301215958.157011-5-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/internals.h | 19 +------------------
 target/arm/helper.c    | 22 ++++++++++++++++++++++
 2 files changed, 23 insertions(+), 18 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index ef6c25d8cb7..fefd1fb8d88 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -243,24 +243,7 @@ static inline void update_spsel(CPUARMState *env, uint32_t imm)
  * Returns the implementation defined bit-width of physical addresses.
  * The ARMv8 reference manuals refer to this as PAMax().
  */
-static inline unsigned int arm_pamax(ARMCPU *cpu)
-{
-    static const unsigned int pamax_map[] = {
-        [0] = 32,
-        [1] = 36,
-        [2] = 40,
-        [3] = 42,
-        [4] = 44,
-        [5] = 48,
-    };
-    unsigned int parange =
-        FIELD_EX64(cpu->isar.id_aa64mmfr0, ID_AA64MMFR0, PARANGE);
-
-    /* id_aa64mmfr0 is a read-only register so values outside of the
-     * supported mappings can be considered an implementation error.  */
-    assert(parange < ARRAY_SIZE(pamax_map));
-    return pamax_map[parange];
-}
+unsigned int arm_pamax(ARMCPU *cpu);
 
 /* Return true if extended addresses are enabled.
  * This is always the case if our translation regime is 64 bit,
diff --git a/target/arm/helper.c b/target/arm/helper.c
index dd4d95bda24..71e575f352e 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11152,6 +11152,28 @@ static uint8_t convert_stage2_attrs(CPUARMState *env, uint8_t s2attrs)
 }
 #endif /* !CONFIG_USER_ONLY */
 
+/* The cpu-specific constant value of PAMax; also used by hw/arm/virt. */
+unsigned int arm_pamax(ARMCPU *cpu)
+{
+    static const unsigned int pamax_map[] = {
+        [0] = 32,
+        [1] = 36,
+        [2] = 40,
+        [3] = 42,
+        [4] = 44,
+        [5] = 48,
+    };
+    unsigned int parange =
+        FIELD_EX64(cpu->isar.id_aa64mmfr0, ID_AA64MMFR0, PARANGE);
+
+    /*
+     * id_aa64mmfr0 is a read-only register so values outside of the
+     * supported mappings can be considered an implementation error.
+     */
+    assert(parange < ARRAY_SIZE(pamax_map));
+    return pamax_map[parange];
+}
+
 static int aa64_va_parameter_tbi(uint64_t tcr, ARMMMUIdx mmu_idx)
 {
     if (regime_has_2_ranges(mmu_idx)) {
-- 
2.25.1


