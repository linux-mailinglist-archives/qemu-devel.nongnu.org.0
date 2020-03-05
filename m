Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D85AC17AABA
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Mar 2020 17:42:47 +0100 (CET)
Received: from localhost ([::1]:52658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j9taA-0004uR-Rs
	for lists+qemu-devel@lfdr.de; Thu, 05 Mar 2020 11:42:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59533)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j9tPQ-0003sg-1C
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 11:31:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j9tPO-0002qp-Qd
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 11:31:39 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:55819)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j9tPO-0002qH-KB
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 11:31:38 -0500
Received: by mail-wm1-x333.google.com with SMTP id 6so7072340wmi.5
 for <qemu-devel@nongnu.org>; Thu, 05 Mar 2020 08:31:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=YYHIjy33GB3VuD4wC7Jf/ToNqj5l8tdIAcVXeQg/vp4=;
 b=EQIwyenBpY9WuM17efhrXAvdjsYUrASNdDg4ZvaHSauPIzmg20IpoGnoSPf5op8PFG
 z2J5nDEXOOo2lzxdRjcAcafIyBzCDOHRTNz3BLTmvlnPIC2j7XOLETMn2q+NL7C8Pdvs
 OWsmFt0y2CC7fMAQJFlhPYRdpwRcbBC8jn4dPSmd3sdU4DnIzKsV/U7oKPapF2iqaw4g
 KovCTAUgSM2NgzBrkgtAIXlATR+SOGn9Cgmm9hrYLyFYcmrCYljAeNVITEykvHrDegEb
 MDSNXsXmKEUl8+1E0hTE4WHtbN8qQ7w5rRdE6F8wKrS7uS4NCuSoNcBiezSlxhsAdD9a
 aj0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YYHIjy33GB3VuD4wC7Jf/ToNqj5l8tdIAcVXeQg/vp4=;
 b=Xi08d7tZtOlYa5ZdgNN3RLD5j4ytCPtD0wUP80uJr9frztA04CVJWu/3YjWYOjiaKl
 +3LzEGgnJ7AzkjpgUCMY2GZOtjfBJv/VnRYFJX3nQtKR+p038GhfRqy2Weo+sByrCiP3
 1DNKAvxOxT09ZUD4wlf4mjZgtZoPbYNW9v5H9V2xnJUQRN3aNJ5sba5qUjQ7r7pUZMQI
 OwkL+/Lia8qTz9mqaBqgxUrNozNprcuTgr9D82+lixMcfi/p27QzzeCkOSg3HoIulhwV
 oN+by4TcFPopQVLlkgsyKQsbxMo9jhSxASxZimKV5WtkbaTLo8FJ0iOO0SHyCiqnoDkj
 Ch2w==
X-Gm-Message-State: ANhLgQ0M3linEk70o0374sS3ykxF+66dUUCane383KJCN5yTLhAryeus
 mpbu6ZUvcGPFKySUmGGNqkOcLYl/OcQjMA==
X-Google-Smtp-Source: ADFU+vtZWFhOBwxv/tcea7r1GfUyba79bHPU9j5ldaKnzFaOSFMjh/R7YnSya/kn554R3cJSV6lQAQ==
X-Received: by 2002:a7b:c4cb:: with SMTP id g11mr10928624wmk.83.1583425897244; 
 Thu, 05 Mar 2020 08:31:37 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id w22sm10310729wmk.34.2020.03.05.08.31.36
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 08:31:36 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 32/37] target/arm: Optimize cpu_mmu_index
Date: Thu,  5 Mar 2020 16:30:55 +0000
Message-Id: <20200305163100.22912-33-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200305163100.22912-1-peter.maydell@linaro.org>
References: <20200305163100.22912-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::333
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

We now cache the core mmu_idx in env->hflags.  Rather than recompute
from scratch, extract the field.  All of the uses of cpu_mmu_index
within target/arm are within helpers, and env->hflags is always stable
within a translation block from whence helpers are called.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20200302175829.2183-3-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h    | 23 +++++++++++++----------
 target/arm/helper.c |  5 -----
 2 files changed, 13 insertions(+), 15 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 0ae07a72e43..4ffd991b6fc 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2943,16 +2943,6 @@ typedef enum ARMMMUIdxBit {
 
 #define MMU_USER_IDX 0
 
-/**
- * cpu_mmu_index:
- * @env: The cpu environment
- * @ifetch: True for code access, false for data access.
- *
- * Return the core mmu index for the current translation regime.
- * This function is used by generic TCG code paths.
- */
-int cpu_mmu_index(CPUARMState *env, bool ifetch);
-
 /* Indexes used when registering address spaces with cpu_address_space_init */
 typedef enum ARMASIdx {
     ARMASIdx_NS = 0,
@@ -3232,6 +3222,19 @@ FIELD(TBFLAG_A64, BTYPE, 10, 2)         /* Not cached. */
 FIELD(TBFLAG_A64, TBID, 12, 2)
 FIELD(TBFLAG_A64, UNPRIV, 14, 1)
 
+/**
+ * cpu_mmu_index:
+ * @env: The cpu environment
+ * @ifetch: True for code access, false for data access.
+ *
+ * Return the core mmu index for the current translation regime.
+ * This function is used by generic TCG code paths.
+ */
+static inline int cpu_mmu_index(CPUARMState *env, bool ifetch)
+{
+    return FIELD_EX32(env->hflags, TBFLAG_ANY, MMUIDX);
+}
+
 static inline bool bswap_code(bool sctlr_b)
 {
 #ifdef CONFIG_USER_ONLY
diff --git a/target/arm/helper.c b/target/arm/helper.c
index f7ba34bbf6d..f91e5d5345f 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -12274,11 +12274,6 @@ ARMMMUIdx arm_mmu_idx(CPUARMState *env)
     return arm_mmu_idx_el(env, arm_current_el(env));
 }
 
-int cpu_mmu_index(CPUARMState *env, bool ifetch)
-{
-    return arm_to_core_mmu_idx(arm_mmu_idx(env));
-}
-
 #ifndef CONFIG_USER_ONLY
 ARMMMUIdx arm_stage1_mmu_idx(CPUARMState *env)
 {
-- 
2.20.1


