Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D3F6E8F36
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 12:07:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppRAD-0000cP-WE; Thu, 20 Apr 2023 06:05:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ppRAA-0000Zi-Ed
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:05:15 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ppRA4-0003rV-Dk
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:05:13 -0400
Received: by mail-wm1-x330.google.com with SMTP id he13so964577wmb.2
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 03:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681985105; x=1684577105;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=UBHmKP2QWvbgSGiIjbO0DHXHxUNpy1cA3E2msdtGyEU=;
 b=IMHdiBul6mXvafDGTwo+tkps089yVSk8ABzbTn/IIh7NZA4m/6AAH3LqubRZ3O+Uzi
 MHjf4w7AB3DjOpJH2McdbQwuZ4HrKMzXmmDfpgxnU5GbftHR1BkGTGZQE+01qqW4QDTA
 etPY6oLMDJbuOrWvB9vbh3WuYfEUZIRHg4MlXnFumLo4Y4rTHnUnPT5+c4qMbck677jh
 CRnUf9xztZdQQ7lsUu4aCJw2ToWhZvphj37xi6dnNkGmxAkxqtfS5Qt1uDMRv83zSh96
 Gu0wyDeUtnVBF+QgNUg95pml6pFl1nXuzxQbSwuCY1tr7Fx24eW+kmHiuAzyIDUIxy7s
 fRpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681985105; x=1684577105;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UBHmKP2QWvbgSGiIjbO0DHXHxUNpy1cA3E2msdtGyEU=;
 b=cJ5O4WbG+W7ey0QybC/hGpez/q6D39Pdw4sIzOfxpY5EYTK+lM4CUz3G2YtrjhQIjU
 YHVnEijTZjxkvTmgGTxEyqogVnyZEdODTxW4oHANs1Fc1UQwNPLeA3PUTvDGlW2A+wQM
 2pAyeTyY37qUAxJXS4EM3yaydKA43LENwh+6RGjL5fz6ktN2PyS4FusLrA64G0qdtvel
 3KPOy9qNwJ0vA1PNYZqzpqTpVHe5W7B7VRav/NuWiXcqVcR2mNiPdnXEghJFCPS+rTIS
 Ixp5AOGVDXzKuzBGtxJkCmQ0Jq4Og9wnkkvThIarwxOogg8RVxeKDWqKoGqPpqSY2ItP
 8MNg==
X-Gm-Message-State: AAQBX9fyF/8dY1U8E7XT14J+uq6PrTnVFmbE13SwEBXz9vznecBKEtL6
 kIDEZOwxH2EYMQncoJ1ckA9pDua5rnwQSbi49vw=
X-Google-Smtp-Source: AKy350bbbPVu7Y2MEyPCChzvRNCKLzigX6Tzf9Y8gYOulKq4BvnekfuHwWPirdPcTuKmCF7cgdIq1A==
X-Received: by 2002:a1c:cc02:0:b0:3ef:df3:1693 with SMTP id
 h2-20020a1ccc02000000b003ef0df31693mr840105wmb.32.1681985105712; 
 Thu, 20 Apr 2023 03:05:05 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a5d58c2000000b002fe522117fdsm1556388wrf.36.2023.04.20.03.05.05
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 03:05:05 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/21] target/arm: Initialize debug capabilities only once
Date: Thu, 20 Apr 2023 11:04:46 +0100
Message-Id: <20230420100456.944969-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230420100456.944969-1-peter.maydell@linaro.org>
References: <20230420100456.944969-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Akihiko Odaki <akihiko.odaki@daynix.com>

kvm_arm_init_debug() used to be called several times on a SMP system as
kvm_arch_init_vcpu() calls it. Move the call to kvm_arch_init() to make
sure it will be called only once; otherwise it will overwrite pointers
to memory allocated with the previous call and leak it.

Fixes: e4482ab7e3 ("target-arm: kvm - add support for HW assisted debug")
Suggested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Message-id: 20230405153644.25300-1-akihiko.odaki@daynix.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/kvm_arm.h |  8 ++++++++
 target/arm/kvm.c     |  2 ++
 target/arm/kvm64.c   | 18 ++++--------------
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 99017b635ce..330fbe5c722 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -18,6 +18,14 @@
 #define KVM_ARM_VGIC_V2   (1 << 0)
 #define KVM_ARM_VGIC_V3   (1 << 1)
 
+/**
+ * kvm_arm_init_debug() - initialize guest debug capabilities
+ * @s: KVMState
+ *
+ * Should be called only once before using guest debug capabilities.
+ */
+void kvm_arm_init_debug(KVMState *s);
+
 /**
  * kvm_arm_vcpu_init:
  * @cs: CPUState
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index f022c644d2f..84da49332c4 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -280,6 +280,8 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
         }
     }
 
+    kvm_arm_init_debug(s);
+
     return ret;
 }
 
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 1197253d12f..810db33ccbd 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -74,24 +74,16 @@ GArray *hw_breakpoints, *hw_watchpoints;
 #define get_hw_bp(i)    (&g_array_index(hw_breakpoints, HWBreakpoint, i))
 #define get_hw_wp(i)    (&g_array_index(hw_watchpoints, HWWatchpoint, i))
 
-/**
- * kvm_arm_init_debug() - check for guest debug capabilities
- * @cs: CPUState
- *
- * kvm_check_extension returns the number of debug registers we have
- * or 0 if we have none.
- *
- */
-static void kvm_arm_init_debug(CPUState *cs)
+void kvm_arm_init_debug(KVMState *s)
 {
-    have_guest_debug = kvm_check_extension(cs->kvm_state,
+    have_guest_debug = kvm_check_extension(s,
                                            KVM_CAP_SET_GUEST_DEBUG);
 
-    max_hw_wps = kvm_check_extension(cs->kvm_state, KVM_CAP_GUEST_DEBUG_HW_WPS);
+    max_hw_wps = kvm_check_extension(s, KVM_CAP_GUEST_DEBUG_HW_WPS);
     hw_watchpoints = g_array_sized_new(true, true,
                                        sizeof(HWWatchpoint), max_hw_wps);
 
-    max_hw_bps = kvm_check_extension(cs->kvm_state, KVM_CAP_GUEST_DEBUG_HW_BPS);
+    max_hw_bps = kvm_check_extension(s, KVM_CAP_GUEST_DEBUG_HW_BPS);
     hw_breakpoints = g_array_sized_new(true, true,
                                        sizeof(HWBreakpoint), max_hw_bps);
     return;
@@ -920,8 +912,6 @@ int kvm_arch_init_vcpu(CPUState *cs)
     }
     cpu->mp_affinity = mpidr & ARM64_AFFINITY_MASK;
 
-    kvm_arm_init_debug(cs);
-
     /* Check whether user space can specify guest syndrome value */
     kvm_arm_init_serror_injection(cs);
 
-- 
2.34.1


