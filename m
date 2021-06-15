Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8033A863C
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 18:18:37 +0200 (CEST)
Received: from localhost ([::1]:50164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltBls-00031R-4X
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 12:18:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltBac-0008Pq-Q6
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 12:06:58 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:43674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltBaa-0003AX-HB
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 12:06:58 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 3-20020a05600c0243b029019f2f9b2b8aso2348389wmj.2
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 09:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2CCiDIA1bv19FdbuEIb2lIEJRpe5hweacNsGvcaUa+I=;
 b=blPsRm/uCi9kxpvsPo/5DBFE8oYdtB/fgdxohz7KaTYy5KjVLtXogr54UU34QPtL1n
 IWOLiwvcWcOIq1q1vw3CE6+MCN0iJ35KpKoFL6h7qvc2GI7QJZqNBnVypqkBcbfZH8ne
 o7ElJGyBZA6a8zJ1EFvMeavh5eBD6TUDSvX1o9urNtGXx9j9o2FsTbaqrEhZoZTk96aj
 wmh7L2VIGPCtD+E7hSAID2tuR3xMmhVROIV1EEse5fT+SjEp5DjmxihAzH5b0Jf62XBJ
 OnoBZyskCBDGQkEHrIGMLK/5k6NgwIypcowUFTSoAgpJbOYRqjR+CfYdf1F7TFuU7YcV
 aHgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2CCiDIA1bv19FdbuEIb2lIEJRpe5hweacNsGvcaUa+I=;
 b=F7PMMRfG/wHIPeknHWGqGtGuLHl/Bp5FCf9yYJS/5bCbbZO+9qelAvjKvdvdeHDBzj
 4yyXmUc+qk+pqq9Fq238mtjIZt/HJYY2gyd80DSC4Z1M0H/sr6EEEmz2Cpj/uYb5+Afv
 Th2SGyFrnhhPGgKzBGXIpJBbRlIqD58EQwk912qnDgbkZXU/M5sqk4MGIgEtygSGWnYE
 WIuMd+5ILAkFrzwtJrWwxn8yhVSv29beh69901vkD+8YCOm23vtU9lsr31sfxA3uGpgr
 iz/e0/0kF7pjN2xshQeWTFxbEZEIy/g55Ye6CQyyXpG4tIrBXPAvCT3qK9+NAIfE4LTG
 Jvtw==
X-Gm-Message-State: AOAM531re1vrWIX2DCsuikSrkYVsEQB+O0dhXkwa++iVP/FpIEqxWJTN
 3+DOoIzu5UXL2nCoz+Nj5J3hPA==
X-Google-Smtp-Source: ABdhPJxoYO4ocTRlT4oGYFNCsX0qyBiycpzNVN7PyzNFIylRj2eOGLM1a8YA9QfcZlC28W7bpOEM/g==
X-Received: by 2002:a7b:c210:: with SMTP id x16mr782wmi.105.1623773214011;
 Tue, 15 Jun 2021 09:06:54 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id z5sm696316wrp.92.2021.06.15.09.06.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 09:06:53 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] docs/system/arm: Document which architecture extensions we
 emulate
Date: Tue, 15 Jun 2021 17:06:52 +0100
Message-Id: <20210615160652.29485-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These days the Arm architecture has a wide range of fine-grained
optional extra architectural features. We implement quite a lot
of these but by no means all of them. Document what we do implement,
so that users can find out without having to dig through back-issues
of our Changelog on the wiki.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
The FEAT_ lists are in the order the features are listed in
the Arm ARM; alternatively we could alphabetize them?
(For M-profile the Arm ARM is using alpha order.)
---
 docs/system/arm/emulation.rst | 98 +++++++++++++++++++++++++++++++++++
 docs/system/target-arm.rst    |  6 +++
 2 files changed, 104 insertions(+)
 create mode 100644 docs/system/arm/emulation.rst

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
new file mode 100644
index 00000000000..6c3d7170714
--- /dev/null
+++ b/docs/system/arm/emulation.rst
@@ -0,0 +1,98 @@
+A-profile CPU architecture support
+==================================
+
+QEMU's TCG emulation includes support for the Armv5, Armv6, Armv7 and
+Armv8 versions of the A-profile architecture. It also has support for
+the following architecture extensions:
+
+- The Armv8 Cryptographic Extension
+- The Scalable Vector Extension (SVE)
+- FEAT_SB (Speculation Barrier)
+- FEAT_SSBS (Speculative Store Bypass Safe)
+- FEAT_SPECRES (Speculation restriction instructions)
+- FEAT_SHA512 (Advanced SIMD SHA512 instructions)
+- FEAT_SHA3 (Advanced SIMD SHA3 instructions)
+- FEAT_SM3 (Advanced SIMD SM3 instructions)
+- FEAT_SM4 (Advanced SIMD SM4 instructions)
+- FEAT_LSE (Large System Extensions)
+- FEAT_RDM (Advanced SIMD rounding double multiply accumulate instructions)
+- FEAT_LOR (Limited ordering regions)
+- FEAT_HPDS (Hierarchical permission disables)
+- FEAT_PAN (Privileged access never)
+- FEAT_VMID16 (16-bit VMID)
+- FEAT_VHE (Virtualization Host Extensions)
+- FEAT_PMUv3p1 (PMU Extensions v3.1)
+- FEAT_PAN2 (AT S1E1R and AT S1E1W instruction variants affected by PSTATE.PAN)
+- FEAT_FP16 (Half-precision floating-point data processing)
+- FEAT_DotProd (Advanced SIMD dot product instructions)
+- FEAT_FHM (Floating-point half-precision multiplication instructions)
+- FEAT_UAO (Unprivileged Access Override control)
+- FEAT_DPB (DC CVAP instruction)
+- FEAT_AA32HPD (AArch32 hierarchical permission disables)
+- FEAT_TTCNP (Translation table Common not private translations)
+- FEAT_XNX (Translation table stage 2 Unprivileged Execute-never)
+- FEAT_BF16 (AArch64 BFloat16 instructions)
+- FEAT_AA32BF16 (AArch32 BFloat16 instructions)
+- FEAT_I8MM (AArch64 Int8 matrix multiplication instructions)
+- FEAT_AA32I8MM (AArch32 Int8 matrix multiplication instructions)
+- FEAT_FCMA (Floating-point complex number instructions)
+- FEAT_JSCVT (JavaScript conversion instructions)
+- FEAT_LRCPC (Load-acquire RCpc instructions)
+- FEAT_PAuth (Pointer authentication)
+- FEAT_DIT (Data Independent Timing instructions)
+- FEAT_FlagM (Flag manipulation instructions v2)
+- FEAT_LRCPC2 (Load-acquire RCpc instructions v2)
+- FEAT_TLBIOS (TLB invalidate instructions in Outer Shareable domain)
+- FEAT_TLBIRANGE (TLB invalidate range instructions)
+- FEAT_TTST (Small translation tables)
+- FEAT_SEL2 (Secure EL2)
+- FEAT_PMUv3p4 (PMU Extensions v3.4)
+- FEAT_FlagM2 (Enhancements to flag manipulation instructions)
+- FEAT_FRINTTS (Floating-point to integer instructions)
+- FEAT_BTI (Branch Target Identification)
+- FEAT_RNG (Random number generator)
+- FEAT_MTE (Memory Tagging Extension)
+- FEAT_MTE2 (Memory Tagging Extension)
+
+For information on the specifics of these extensions, please refer
+to the `Armv8-A Arm Architecture Reference Manual
+<https://developer.arm.com/documentation/ddi0487/latest>`_.
+
+When a specific named CPU is being emulated, only those features which
+are present in hardware for that CPU are emulated. (If a feature is
+not in the list above then it is not supported, even if the real
+hardware should have it.) The ``max`` CPU enables all features.
+
+R-profile CPU architecture support
+==================================
+
+QEMU's TCG emulation support for R-profile CPUs is currently limited.
+We emulate only the Cortex-R5 and Cortex-R5F CPUs.
+
+M-profile CPU architecture support
+==================================
+
+QEMU's TCG emulation includes support for Armv6-M, Armv7-M, Armv8-M, and
+Armv8.1-M versions of the M-profile architucture.  It also has support
+for the following architecture extensions:
+
+- FP (Floating-point Extension)
+- FPCXT (FPCXT access instructions)
+- HP (Half-precision floating-point instructions)
+- LOB (Low Overhead loops and Branch future)
+- M (Main Extension)
+- MPU (Memory Protection Unit Extension)
+- PXN (Privileged Execute Never)
+- RAS (Reliability, Serviceability and Availability): "minimum RAS Extension" only
+- S (Security Extension)
+- ST (System Timer Extension)
+
+For information on the specifics of these extensions, please refer
+to the `Armv8-M Arm Architecture Reference Manual
+<https://developer.arm.com/documentation/ddi0553/latest>`_.
+
+When a specific named CPU is being emulated, only those features which
+are present in hardware for that CPU are emulated. (If a feature is
+not in the list above then it is not supported, even if the real
+hardware should have it.) There is no equivalent of the ``max`` CPU for
+M-profile.
diff --git a/docs/system/target-arm.rst b/docs/system/target-arm.rst
index edd013c7bbd..8b8547f9a9e 100644
--- a/docs/system/target-arm.rst
+++ b/docs/system/target-arm.rst
@@ -99,6 +99,12 @@ undocumented; you can get a complete list by running
    arm/virt
    arm/xlnx-versal-virt
 
+Emulated CPU architecture support
+=================================
+
+.. toctree::
+   arm/emulation
+
 Arm CPU features
 ================
 
-- 
2.20.1


