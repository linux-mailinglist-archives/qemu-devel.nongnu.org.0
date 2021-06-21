Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FFAB3AEF46
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 18:37:39 +0200 (CEST)
Received: from localhost ([::1]:55864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvMva-0004R1-AW
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 12:37:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvMmw-0006zh-MW
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 12:28:42 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:40650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvMmt-0007TS-B2
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 12:28:42 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 n35-20020a05600c3ba3b02901cdecb6bda8so14315799wms.5
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 09:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=CfvSgFlfAE5Pi2/5sXL1REQIGTvqf9Zq2uhV06VrMzc=;
 b=NBGbr0MbWY25Oi/xs2VgtpCCkZpaC9LQ80ielqGXQWt9cGbUA+Y/aarm2cppNzvEMD
 9Ca+on8/7zPJ+oSLFDinHBLijGnUlGDmWgdgJu8q/7T6SiVyBMWSY58oa3fTQUK33oGR
 VdOjvlqIw/xUI7tQej0Gk8NX00optLM3p80KYTT1S/Jh6LFhhvadG3Lh5aMUV8T8UwWw
 DnyphiDiF6nQQYo4k4OmVF7B3cMjRmOdvlyNrDRD7EYvUqZY35qLoCp05N4Iuj5SUBbs
 eTs54FBFJetLhAheZWo/soI7fDMYHPE1SzUN+Axev5zckWEdJehc1K9UVGx7wPbyyNsx
 qARQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CfvSgFlfAE5Pi2/5sXL1REQIGTvqf9Zq2uhV06VrMzc=;
 b=hoywUL2XS5sTMrzZQ2vm1NiOkyR1YbOYC3JUxKpNTROkMt/mpdVvpfBreleteLTyjJ
 A/6R0rQCLa57Z0sZloHCaa5RTw+FbaZUmX/FcmhM4WELNn0kf5VMtioqBm7Yjt+XGdt8
 M2ExdnfbJLl+52WxanRw3siuaYo0yao8i3APUEejZCXPqqVKwycsOgD0HKO/2tPBqdAp
 urtTAtxU9Dqc0FYXJKc0CbroOLeWhQU8dnSJXZuWPiVCC+1binsAJHAyDz6nV8J4gkq7
 RC2k56mM+fVHHUVhNBq36fmyUavFZCezyvgqwN+wbGaQUz6f5O/pt6mUQX/UfCxSO1nk
 fx9g==
X-Gm-Message-State: AOAM532+Nlz+/i5fa9S4bQg8FVh0iclYKcHlQztY5fIJNXRa44IlmZBp
 hXQNSSKNosvEkO3cCQkM+fwRoz4db36Ozz1g
X-Google-Smtp-Source: ABdhPJxG6CzGwpEgksJNy4NJJ+Lr4rR2N18Uhubrpt39H/vY/gnLBwTJ8f1nbdTR/YC2Cnkgnc3GdQ==
X-Received: by 2002:a1c:1f54:: with SMTP id f81mr27762717wmf.121.1624292918096; 
 Mon, 21 Jun 2021 09:28:38 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n65sm11615496wme.21.2021.06.21.09.28.37
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 09:28:37 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/57] docs/system/arm: Document which architecture extensions
 we emulate
Date: Mon, 21 Jun 2021 17:27:40 +0100
Message-Id: <20210621162833.32535-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210621162833.32535-1-peter.maydell@linaro.org>
References: <20210621162833.32535-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-id: 20210617140328.28622-1-peter.maydell@linaro.org
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 docs/system/arm/emulation.rst | 102 ++++++++++++++++++++++++++++++++++
 docs/system/target-arm.rst    |   6 ++
 2 files changed, 108 insertions(+)
 create mode 100644 docs/system/arm/emulation.rst

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
new file mode 100644
index 00000000000..836c1ca8453
--- /dev/null
+++ b/docs/system/arm/emulation.rst
@@ -0,0 +1,102 @@
+A-profile CPU architecture support
+==================================
+
+QEMU's TCG emulation includes support for the Armv5, Armv6, Armv7 and
+Armv8 versions of the A-profile architecture. It also has support for
+the following architecture extensions:
+
+- FEAT_AA32BF16 (AArch32 BFloat16 instructions)
+- FEAT_AA32HPD (AArch32 hierarchical permission disables)
+- FEAT_AA32I8MM (AArch32 Int8 matrix multiplication instructions)
+- FEAT_AES (AESD and AESE instructions)
+- FEAT_BF16 (AArch64 BFloat16 instructions)
+- FEAT_BTI (Branch Target Identification)
+- FEAT_DIT (Data Independent Timing instructions)
+- FEAT_DPB (DC CVAP instruction)
+- FEAT_DotProd (Advanced SIMD dot product instructions)
+- FEAT_FCMA (Floating-point complex number instructions)
+- FEAT_FHM (Floating-point half-precision multiplication instructions)
+- FEAT_FP16 (Half-precision floating-point data processing)
+- FEAT_FRINTTS (Floating-point to integer instructions)
+- FEAT_FlagM (Flag manipulation instructions v2)
+- FEAT_FlagM2 (Enhancements to flag manipulation instructions)
+- FEAT_HPDS (Hierarchical permission disables)
+- FEAT_I8MM (AArch64 Int8 matrix multiplication instructions)
+- FEAT_JSCVT (JavaScript conversion instructions)
+- FEAT_LOR (Limited ordering regions)
+- FEAT_LRCPC (Load-acquire RCpc instructions)
+- FEAT_LRCPC2 (Load-acquire RCpc instructions v2)
+- FEAT_LSE (Large System Extensions)
+- FEAT_MTE (Memory Tagging Extension)
+- FEAT_MTE2 (Memory Tagging Extension)
+- FEAT_PAN (Privileged access never)
+- FEAT_PAN2 (AT S1E1R and AT S1E1W instruction variants affected by PSTATE.PAN)
+- FEAT_PAuth (Pointer authentication)
+- FEAT_PMULL (PMULL, PMULL2 instructions)
+- FEAT_PMUv3p1 (PMU Extensions v3.1)
+- FEAT_PMUv3p4 (PMU Extensions v3.4)
+- FEAT_RDM (Advanced SIMD rounding double multiply accumulate instructions)
+- FEAT_RNG (Random number generator)
+- FEAT_SB (Speculation Barrier)
+- FEAT_SEL2 (Secure EL2)
+- FEAT_SHA1 (SHA1 instructions)
+- FEAT_SHA256 (SHA256 instructions)
+- FEAT_SHA3 (Advanced SIMD SHA3 instructions)
+- FEAT_SHA512 (Advanced SIMD SHA512 instructions)
+- FEAT_SM3 (Advanced SIMD SM3 instructions)
+- FEAT_SM4 (Advanced SIMD SM4 instructions)
+- FEAT_SPECRES (Speculation restriction instructions)
+- FEAT_SSBS (Speculative Store Bypass Safe)
+- FEAT_TLBIOS (TLB invalidate instructions in Outer Shareable domain)
+- FEAT_TLBIRANGE (TLB invalidate range instructions)
+- FEAT_TTCNP (Translation table Common not private translations)
+- FEAT_TTST (Small translation tables)
+- FEAT_UAO (Unprivileged Access Override control)
+- FEAT_VHE (Virtualization Host Extensions)
+- FEAT_VMID16 (16-bit VMID)
+- FEAT_XNX (Translation table stage 2 Unprivileged Execute-never)
+- SVE (The Scalable Vector Extension)
+- SVE2 (The Scalable Vector Extension v2)
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


