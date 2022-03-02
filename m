Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3EA84CB128
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 22:20:11 +0100 (CET)
Received: from localhost ([::1]:42940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPWOI-0000DS-Lk
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 16:20:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPVxr-0005rm-Un
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 15:52:53 -0500
Received: from [2a00:1450:4864:20::429] (port=41511
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPVxo-0008LN-Qt
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 15:52:50 -0500
Received: by mail-wr1-x429.google.com with SMTP id i8so4672987wrr.8
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 12:52:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=CRKzi8an4EM1SJfqwBg52hhLiM5AICaglyAbFT7p8Tc=;
 b=MAPESj58h/YdLK8iF4s787XJ0tWAZLnCgAeIEMo/dpyyCIgqE5F8TfSZzZIesanVC9
 xCHFhKaMXkTNOj8GguE6EYJVHRMX8kw31uHkV6EZdBw7YIwxvFoanHNuRv0OnfyMrSUY
 /dgR+p6AWXkeFE1SIIxHv2frwZYDy40fmbCcS+tQKQ9TGUqZ+A0QmfUP43onP997JLol
 h5MXxydY6lIUCLkPVQ9myGrad/95uzcuaPJLB6sO0FTJ/jTK/psjaGX5gTNkEH6Gg/Y5
 Vqki4Z+oOmTCy5AlSOmXOWFYzc3mmqK+TTJYg5ZzjxOMseoeLWYoXbSuNCD3jJDb7kEd
 K1OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CRKzi8an4EM1SJfqwBg52hhLiM5AICaglyAbFT7p8Tc=;
 b=7y9Y3FX4xNmmA3X1pl36kiOH9/JG1FLmwBMwHMued7Ok4lJnVGHDXnw177ndXwJex7
 bmIGd6bkY9Dma4GmlghRnNuwZjVIBdzPrklCQLEQeIAqtyx2APliJs47KG9VnJ9msnvr
 GMRJ0n6/YAVeCY13JhWNMQTCV8+e5vPGW4wWk6e8Qkfvw1r20SRY7TZJzImN1YffNLt2
 iGMzrPnPceEpR4GQI/GJGfgQ0ZwGFW+wz/ZPz0+0P/cLwa/yhW40TFAJtL3w8UFE391n
 DTdVmfrAyQR5ysQ9AHnb0ZGPmKsKmZtU/V/xuDtLiXxCQFi/1RJ01nzGdnsyHZPOD+45
 la1A==
X-Gm-Message-State: AOAM531vV63271SBTKnjBiWUIrt+eMORJiVldn5sXRRwLc1hG4/Y7aK4
 h18wcDLFizid/WNf46KOBHG9gQ8j1R3CCg==
X-Google-Smtp-Source: ABdhPJwK5IsOqotSpckKuC2NMgttYwr6uuAPwLYcnUeVLuydKLfvx5JjE1c2rJo6v2BT0yCFe99Zrg==
X-Received: by 2002:a5d:648d:0:b0:1ef:d62a:8414 with SMTP id
 o13-20020a5d648d000000b001efd62a8414mr11753944wri.99.1646254367503; 
 Wed, 02 Mar 2022 12:52:47 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 x13-20020adfec0d000000b001e31279cc38sm90801wrn.11.2022.03.02.12.52.46
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 12:52:47 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/26] target/arm: Implement FEAT_LPA
Date: Wed,  2 Mar 2022 20:52:21 +0000
Message-Id: <20220302205230.2122390-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220302205230.2122390-1-peter.maydell@linaro.org>
References: <20220302205230.2122390-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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

This feature widens physical addresses (and intermediate physical
addresses for 2-stage translation) from 48 to 52 bits, when using
64k pages.  The only thing left at this point is to handle the
extra bits in the TTBR and in the table descriptors.

Note that PAR_EL1 and HPFAR_EL2 are nominally extended, but we don't
mask out the high bits when writing to those registers, so no changes
are required there.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220301215958.157011-11-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/emulation.rst |  1 +
 target/arm/cpu-param.h        |  2 +-
 target/arm/cpu64.c            |  2 +-
 target/arm/helper.c           | 19 ++++++++++++++++---
 4 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index f3eabddfb5a..0053ddce208 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -24,6 +24,7 @@ the following architecture extensions:
 - FEAT_I8MM (AArch64 Int8 matrix multiplication instructions)
 - FEAT_JSCVT (JavaScript conversion instructions)
 - FEAT_LOR (Limited ordering regions)
+- FEAT_LPA (Large Physical Address space)
 - FEAT_LRCPC (Load-acquire RCpc instructions)
 - FEAT_LRCPC2 (Load-acquire RCpc instructions v2)
 - FEAT_LSE (Large System Extensions)
diff --git a/target/arm/cpu-param.h b/target/arm/cpu-param.h
index 5f9c288b1a6..b59d505761c 100644
--- a/target/arm/cpu-param.h
+++ b/target/arm/cpu-param.h
@@ -10,7 +10,7 @@
 
 #ifdef TARGET_AARCH64
 # define TARGET_LONG_BITS             64
-# define TARGET_PHYS_ADDR_SPACE_BITS  48
+# define TARGET_PHYS_ADDR_SPACE_BITS  52
 # define TARGET_VIRT_ADDR_SPACE_BITS  52
 #else
 # define TARGET_LONG_BITS             32
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 1de31ffb406..d88662cef68 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -795,7 +795,7 @@ static void aarch64_max_initfn(Object *obj)
     cpu->isar.id_aa64pfr1 = t;
 
     t = cpu->isar.id_aa64mmfr0;
-    t = FIELD_DP64(t, ID_AA64MMFR0, PARANGE, 5); /* PARange: 48 bits */
+    t = FIELD_DP64(t, ID_AA64MMFR0, PARANGE, 6); /* FEAT_LPA: 52 bits */
     cpu->isar.id_aa64mmfr0 = t;
 
     t = cpu->isar.id_aa64mmfr1;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 28b43472131..950f56599e2 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11173,6 +11173,7 @@ static const uint8_t pamax_map[] = {
     [3] = 42,
     [4] = 44,
     [5] = 48,
+    [6] = 52,
 };
 
 /* The cpu-specific constant value of PAMax; also used by hw/arm/virt. */
@@ -11564,11 +11565,15 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
     descaddr = extract64(ttbr, 0, 48);
 
     /*
-     * If the base address is out of range, raise AddressSizeFault.
+     * For FEAT_LPA and PS=6, bits [51:48] of descaddr are in [5:2] of TTBR.
+     *
+     * Otherwise, if the base address is out of range, raise AddressSizeFault.
      * In the pseudocode, this is !IsZero(baseregister<47:outputsize>),
      * but we've just cleared the bits above 47, so simplify the test.
      */
-    if (descaddr >> outputsize) {
+    if (outputsize > 48) {
+        descaddr |= extract64(ttbr, 2, 4) << 48;
+    } else if (descaddr >> outputsize) {
         level = 0;
         fault_type = ARMFault_AddressSize;
         goto do_fault;
@@ -11620,7 +11625,15 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
         }
 
         descaddr = descriptor & descaddrmask;
-        if (descaddr >> outputsize) {
+
+        /*
+         * For FEAT_LPA and PS=6, bits [51:48] of descaddr are in [15:12]
+         * of descriptor.  Otherwise, if descaddr is out of range, raise
+         * AddressSizeFault.
+         */
+        if (outputsize > 48) {
+            descaddr |= extract64(descriptor, 12, 4) << 48;
+        } else if (descaddr >> outputsize) {
             fault_type = ARMFault_AddressSize;
             goto do_fault;
         }
-- 
2.25.1


