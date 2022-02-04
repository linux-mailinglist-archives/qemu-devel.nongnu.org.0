Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 194A44A9D49
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 18:01:46 +0100 (CET)
Received: from localhost ([::1]:36570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG1xw-0006Rv-2x
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 12:01:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nG1sH-0002xK-Fw
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 11:55:53 -0500
Received: from [2a00:1450:4864:20::330] (port=52200
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nG1rt-0003D4-8e
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 11:55:40 -0500
Received: by mail-wm1-x330.google.com with SMTP id i204so726720wma.1
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 08:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Vu7uIUvA2v4vjGlr2e1UfSedBQQkSc8plW2znNSP+3I=;
 b=l7SaaV3IYMPx+SGK2gL5WfSRb9468UWFRGa/9T69+zlWTeZU3MQJqP5JlyAPQhz/7j
 hj+qfXCy0YunecIBZOIx5lTmVrKncTYvd2fulxEvel5sU9tvDCzSAEFYVYRIrO1QT9F4
 y4CAPCperPQiZjGrQ9cpBR5z5CyCMBwTsnBvQ4HmKAlMsgzl2udW9excNUficBF5kw84
 GPEX4+eVR4KkPAs4yLsn1HXs0KUPajH/HaFDEjptpOMohWIp3O6G5IHAzsy8k9d08ZZ5
 VGlJGaU7GrXG1PXXmj3SufQjDWmWsu89TBgaxmA5Dc4Ix3jfBgUlXNFx1kKaHJanJZ+D
 R3mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Vu7uIUvA2v4vjGlr2e1UfSedBQQkSc8plW2znNSP+3I=;
 b=3R5SGsEa+2L/cRBu+BKPOhr1/9zD8d2S3sI2Mcp/bssK7R3TgJrnQa4FUaCxm5T31w
 ECwIZjWkn6IQt1sfTROgd0QIIzUFFX0JqmhcwFNUJoFyBbRo3ikevCMRYzdwlqzGU2Si
 pjIRNS6OE2oIcm0LcLSxnrjBlrv/ywETdeaOmq0npbPJVSON7JyHyG+Vo8urwhEXZRl2
 CMjz2o9skvnU/QyVKLJPOY5JJT/9XEXZcqWd5CanhMTrnhmZXz31zv38rToBWfSFiGZ+
 SEe2SHHpHbNtwh+dPQ+u5hHYauLrFfbk/mzhwFN/DOiNasgnumAyjK93Vpi8ZPUUbLGr
 UEFA==
X-Gm-Message-State: AOAM530yjVttw5S5kdXAS/BHkW8E0PxN9MxAOCkI3mdH2G1eXjnn8Iwj
 BAetDnkoFC/XPcBPm9Pv0yoFpA==
X-Google-Smtp-Source: ABdhPJwMBYZibRU6FktX4IwrFKiezbR4jlDpD8DP1JJ80qNvkP9d7hgBWA+jm8KdCvAu5rqgOfF2ig==
X-Received: by 2002:a05:600c:3b25:: with SMTP id
 m37mr2944113wms.40.1643993711621; 
 Fri, 04 Feb 2022 08:55:11 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id f12sm2486254wrs.1.2022.02.04.08.55.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 08:55:11 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 4/6] target/arm: Unindent unnecessary else-clause
Date: Fri,  4 Feb 2022 16:55:04 +0000
Message-Id: <20220204165506.2846058-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220204165506.2846058-1-peter.maydell@linaro.org>
References: <20220204165506.2846058-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Andrew Jones <drjones@redhat.com>, Alexander Graf <agraf@csgraf.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that the if() branch of the condition in aarch64_max_initfn()
returns early, we don't need to keep the rest of the code in
the function inside an else block. Remove the else, unindenting
that code.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu64.c | 288 +++++++++++++++++++++++----------------------
 1 file changed, 145 insertions(+), 143 deletions(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index ae2e431247f..bc25a2567bf 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -707,176 +707,178 @@ static void aarch64_host_initfn(Object *obj)
 static void aarch64_max_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
+    uint64_t t;
+    uint32_t u;
 
     if (kvm_enabled()) {
         /* With KVM, '-cpu max' is identical to '-cpu host' */
         aarch64_host_initfn(obj);
         return;
-    } else {
-        uint64_t t;
-        uint32_t u;
-        aarch64_a57_initfn(obj);
+    }
 
-        /*
-         * Reset MIDR so the guest doesn't mistake our 'max' CPU type for a real
-         * one and try to apply errata workarounds or use impdef features we
-         * don't provide.
-         * An IMPLEMENTER field of 0 means "reserved for software use";
-         * ARCHITECTURE must be 0xf indicating "v7 or later, check ID registers
-         * to see which features are present";
-         * the VARIANT, PARTNUM and REVISION fields are all implementation
-         * defined and we choose to define PARTNUM just in case guest
-         * code needs to distinguish this QEMU CPU from other software
-         * implementations, though this shouldn't be needed.
-         */
-        t = FIELD_DP64(0, MIDR_EL1, IMPLEMENTER, 0);
-        t = FIELD_DP64(t, MIDR_EL1, ARCHITECTURE, 0xf);
-        t = FIELD_DP64(t, MIDR_EL1, PARTNUM, 'Q');
-        t = FIELD_DP64(t, MIDR_EL1, VARIANT, 0);
-        t = FIELD_DP64(t, MIDR_EL1, REVISION, 0);
-        cpu->midr = t;
+    /* '-cpu max' for TCG: we currently do this as "A57 with extra things" */
 
-        t = cpu->isar.id_aa64isar0;
-        t = FIELD_DP64(t, ID_AA64ISAR0, AES, 2); /* AES + PMULL */
-        t = FIELD_DP64(t, ID_AA64ISAR0, SHA1, 1);
-        t = FIELD_DP64(t, ID_AA64ISAR0, SHA2, 2); /* SHA512 */
-        t = FIELD_DP64(t, ID_AA64ISAR0, CRC32, 1);
-        t = FIELD_DP64(t, ID_AA64ISAR0, ATOMIC, 2);
-        t = FIELD_DP64(t, ID_AA64ISAR0, RDM, 1);
-        t = FIELD_DP64(t, ID_AA64ISAR0, SHA3, 1);
-        t = FIELD_DP64(t, ID_AA64ISAR0, SM3, 1);
-        t = FIELD_DP64(t, ID_AA64ISAR0, SM4, 1);
-        t = FIELD_DP64(t, ID_AA64ISAR0, DP, 1);
-        t = FIELD_DP64(t, ID_AA64ISAR0, FHM, 1);
-        t = FIELD_DP64(t, ID_AA64ISAR0, TS, 2); /* v8.5-CondM */
-        t = FIELD_DP64(t, ID_AA64ISAR0, TLB, 2); /* FEAT_TLBIRANGE */
-        t = FIELD_DP64(t, ID_AA64ISAR0, RNDR, 1);
-        cpu->isar.id_aa64isar0 = t;
+    aarch64_a57_initfn(obj);
 
-        t = cpu->isar.id_aa64isar1;
-        t = FIELD_DP64(t, ID_AA64ISAR1, DPB, 2);
-        t = FIELD_DP64(t, ID_AA64ISAR1, JSCVT, 1);
-        t = FIELD_DP64(t, ID_AA64ISAR1, FCMA, 1);
-        t = FIELD_DP64(t, ID_AA64ISAR1, SB, 1);
-        t = FIELD_DP64(t, ID_AA64ISAR1, SPECRES, 1);
-        t = FIELD_DP64(t, ID_AA64ISAR1, BF16, 1);
-        t = FIELD_DP64(t, ID_AA64ISAR1, FRINTTS, 1);
-        t = FIELD_DP64(t, ID_AA64ISAR1, LRCPC, 2); /* ARMv8.4-RCPC */
-        t = FIELD_DP64(t, ID_AA64ISAR1, I8MM, 1);
-        cpu->isar.id_aa64isar1 = t;
+    /*
+     * Reset MIDR so the guest doesn't mistake our 'max' CPU type for a real
+     * one and try to apply errata workarounds or use impdef features we
+     * don't provide.
+     * An IMPLEMENTER field of 0 means "reserved for software use";
+     * ARCHITECTURE must be 0xf indicating "v7 or later, check ID registers
+     * to see which features are present";
+     * the VARIANT, PARTNUM and REVISION fields are all implementation
+     * defined and we choose to define PARTNUM just in case guest
+     * code needs to distinguish this QEMU CPU from other software
+     * implementations, though this shouldn't be needed.
+     */
+    t = FIELD_DP64(0, MIDR_EL1, IMPLEMENTER, 0);
+    t = FIELD_DP64(t, MIDR_EL1, ARCHITECTURE, 0xf);
+    t = FIELD_DP64(t, MIDR_EL1, PARTNUM, 'Q');
+    t = FIELD_DP64(t, MIDR_EL1, VARIANT, 0);
+    t = FIELD_DP64(t, MIDR_EL1, REVISION, 0);
+    cpu->midr = t;
 
-        t = cpu->isar.id_aa64pfr0;
-        t = FIELD_DP64(t, ID_AA64PFR0, SVE, 1);
-        t = FIELD_DP64(t, ID_AA64PFR0, FP, 1);
-        t = FIELD_DP64(t, ID_AA64PFR0, ADVSIMD, 1);
-        t = FIELD_DP64(t, ID_AA64PFR0, SEL2, 1);
-        t = FIELD_DP64(t, ID_AA64PFR0, DIT, 1);
-        cpu->isar.id_aa64pfr0 = t;
+    t = cpu->isar.id_aa64isar0;
+    t = FIELD_DP64(t, ID_AA64ISAR0, AES, 2); /* AES + PMULL */
+    t = FIELD_DP64(t, ID_AA64ISAR0, SHA1, 1);
+    t = FIELD_DP64(t, ID_AA64ISAR0, SHA2, 2); /* SHA512 */
+    t = FIELD_DP64(t, ID_AA64ISAR0, CRC32, 1);
+    t = FIELD_DP64(t, ID_AA64ISAR0, ATOMIC, 2);
+    t = FIELD_DP64(t, ID_AA64ISAR0, RDM, 1);
+    t = FIELD_DP64(t, ID_AA64ISAR0, SHA3, 1);
+    t = FIELD_DP64(t, ID_AA64ISAR0, SM3, 1);
+    t = FIELD_DP64(t, ID_AA64ISAR0, SM4, 1);
+    t = FIELD_DP64(t, ID_AA64ISAR0, DP, 1);
+    t = FIELD_DP64(t, ID_AA64ISAR0, FHM, 1);
+    t = FIELD_DP64(t, ID_AA64ISAR0, TS, 2); /* v8.5-CondM */
+    t = FIELD_DP64(t, ID_AA64ISAR0, TLB, 2); /* FEAT_TLBIRANGE */
+    t = FIELD_DP64(t, ID_AA64ISAR0, RNDR, 1);
+    cpu->isar.id_aa64isar0 = t;
 
-        t = cpu->isar.id_aa64pfr1;
-        t = FIELD_DP64(t, ID_AA64PFR1, BT, 1);
-        t = FIELD_DP64(t, ID_AA64PFR1, SSBS, 2);
-        /*
-         * Begin with full support for MTE. This will be downgraded to MTE=0
-         * during realize if the board provides no tag memory, much like
-         * we do for EL2 with the virtualization=on property.
-         */
-        t = FIELD_DP64(t, ID_AA64PFR1, MTE, 3);
-        cpu->isar.id_aa64pfr1 = t;
+    t = cpu->isar.id_aa64isar1;
+    t = FIELD_DP64(t, ID_AA64ISAR1, DPB, 2);
+    t = FIELD_DP64(t, ID_AA64ISAR1, JSCVT, 1);
+    t = FIELD_DP64(t, ID_AA64ISAR1, FCMA, 1);
+    t = FIELD_DP64(t, ID_AA64ISAR1, SB, 1);
+    t = FIELD_DP64(t, ID_AA64ISAR1, SPECRES, 1);
+    t = FIELD_DP64(t, ID_AA64ISAR1, BF16, 1);
+    t = FIELD_DP64(t, ID_AA64ISAR1, FRINTTS, 1);
+    t = FIELD_DP64(t, ID_AA64ISAR1, LRCPC, 2); /* ARMv8.4-RCPC */
+    t = FIELD_DP64(t, ID_AA64ISAR1, I8MM, 1);
+    cpu->isar.id_aa64isar1 = t;
 
-        t = cpu->isar.id_aa64mmfr0;
-        t = FIELD_DP64(t, ID_AA64MMFR0, PARANGE, 5); /* PARange: 48 bits */
-        cpu->isar.id_aa64mmfr0 = t;
+    t = cpu->isar.id_aa64pfr0;
+    t = FIELD_DP64(t, ID_AA64PFR0, SVE, 1);
+    t = FIELD_DP64(t, ID_AA64PFR0, FP, 1);
+    t = FIELD_DP64(t, ID_AA64PFR0, ADVSIMD, 1);
+    t = FIELD_DP64(t, ID_AA64PFR0, SEL2, 1);
+    t = FIELD_DP64(t, ID_AA64PFR0, DIT, 1);
+    cpu->isar.id_aa64pfr0 = t;
 
-        t = cpu->isar.id_aa64mmfr1;
-        t = FIELD_DP64(t, ID_AA64MMFR1, HPDS, 1); /* HPD */
-        t = FIELD_DP64(t, ID_AA64MMFR1, LO, 1);
-        t = FIELD_DP64(t, ID_AA64MMFR1, VH, 1);
-        t = FIELD_DP64(t, ID_AA64MMFR1, PAN, 2); /* ATS1E1 */
-        t = FIELD_DP64(t, ID_AA64MMFR1, VMIDBITS, 2); /* VMID16 */
-        t = FIELD_DP64(t, ID_AA64MMFR1, XNX, 1); /* TTS2UXN */
-        cpu->isar.id_aa64mmfr1 = t;
+    t = cpu->isar.id_aa64pfr1;
+    t = FIELD_DP64(t, ID_AA64PFR1, BT, 1);
+    t = FIELD_DP64(t, ID_AA64PFR1, SSBS, 2);
+    /*
+     * Begin with full support for MTE. This will be downgraded to MTE=0
+     * during realize if the board provides no tag memory, much like
+     * we do for EL2 with the virtualization=on property.
+     */
+    t = FIELD_DP64(t, ID_AA64PFR1, MTE, 3);
+    cpu->isar.id_aa64pfr1 = t;
 
-        t = cpu->isar.id_aa64mmfr2;
-        t = FIELD_DP64(t, ID_AA64MMFR2, UAO, 1);
-        t = FIELD_DP64(t, ID_AA64MMFR2, CNP, 1); /* TTCNP */
-        t = FIELD_DP64(t, ID_AA64MMFR2, ST, 1); /* TTST */
-        cpu->isar.id_aa64mmfr2 = t;
+    t = cpu->isar.id_aa64mmfr0;
+    t = FIELD_DP64(t, ID_AA64MMFR0, PARANGE, 5); /* PARange: 48 bits */
+    cpu->isar.id_aa64mmfr0 = t;
 
-        t = cpu->isar.id_aa64zfr0;
-        t = FIELD_DP64(t, ID_AA64ZFR0, SVEVER, 1);
-        t = FIELD_DP64(t, ID_AA64ZFR0, AES, 2);  /* PMULL */
-        t = FIELD_DP64(t, ID_AA64ZFR0, BITPERM, 1);
-        t = FIELD_DP64(t, ID_AA64ZFR0, BFLOAT16, 1);
-        t = FIELD_DP64(t, ID_AA64ZFR0, SHA3, 1);
-        t = FIELD_DP64(t, ID_AA64ZFR0, SM4, 1);
-        t = FIELD_DP64(t, ID_AA64ZFR0, I8MM, 1);
-        t = FIELD_DP64(t, ID_AA64ZFR0, F32MM, 1);
-        t = FIELD_DP64(t, ID_AA64ZFR0, F64MM, 1);
-        cpu->isar.id_aa64zfr0 = t;
+    t = cpu->isar.id_aa64mmfr1;
+    t = FIELD_DP64(t, ID_AA64MMFR1, HPDS, 1); /* HPD */
+    t = FIELD_DP64(t, ID_AA64MMFR1, LO, 1);
+    t = FIELD_DP64(t, ID_AA64MMFR1, VH, 1);
+    t = FIELD_DP64(t, ID_AA64MMFR1, PAN, 2); /* ATS1E1 */
+    t = FIELD_DP64(t, ID_AA64MMFR1, VMIDBITS, 2); /* VMID16 */
+    t = FIELD_DP64(t, ID_AA64MMFR1, XNX, 1); /* TTS2UXN */
+    cpu->isar.id_aa64mmfr1 = t;
 
-        /* Replicate the same data to the 32-bit id registers.  */
-        u = cpu->isar.id_isar5;
-        u = FIELD_DP32(u, ID_ISAR5, AES, 2); /* AES + PMULL */
-        u = FIELD_DP32(u, ID_ISAR5, SHA1, 1);
-        u = FIELD_DP32(u, ID_ISAR5, SHA2, 1);
-        u = FIELD_DP32(u, ID_ISAR5, CRC32, 1);
-        u = FIELD_DP32(u, ID_ISAR5, RDM, 1);
-        u = FIELD_DP32(u, ID_ISAR5, VCMA, 1);
-        cpu->isar.id_isar5 = u;
+    t = cpu->isar.id_aa64mmfr2;
+    t = FIELD_DP64(t, ID_AA64MMFR2, UAO, 1);
+    t = FIELD_DP64(t, ID_AA64MMFR2, CNP, 1); /* TTCNP */
+    t = FIELD_DP64(t, ID_AA64MMFR2, ST, 1); /* TTST */
+    cpu->isar.id_aa64mmfr2 = t;
 
-        u = cpu->isar.id_isar6;
-        u = FIELD_DP32(u, ID_ISAR6, JSCVT, 1);
-        u = FIELD_DP32(u, ID_ISAR6, DP, 1);
-        u = FIELD_DP32(u, ID_ISAR6, FHM, 1);
-        u = FIELD_DP32(u, ID_ISAR6, SB, 1);
-        u = FIELD_DP32(u, ID_ISAR6, SPECRES, 1);
-        u = FIELD_DP32(u, ID_ISAR6, BF16, 1);
-        u = FIELD_DP32(u, ID_ISAR6, I8MM, 1);
-        cpu->isar.id_isar6 = u;
+    t = cpu->isar.id_aa64zfr0;
+    t = FIELD_DP64(t, ID_AA64ZFR0, SVEVER, 1);
+    t = FIELD_DP64(t, ID_AA64ZFR0, AES, 2);  /* PMULL */
+    t = FIELD_DP64(t, ID_AA64ZFR0, BITPERM, 1);
+    t = FIELD_DP64(t, ID_AA64ZFR0, BFLOAT16, 1);
+    t = FIELD_DP64(t, ID_AA64ZFR0, SHA3, 1);
+    t = FIELD_DP64(t, ID_AA64ZFR0, SM4, 1);
+    t = FIELD_DP64(t, ID_AA64ZFR0, I8MM, 1);
+    t = FIELD_DP64(t, ID_AA64ZFR0, F32MM, 1);
+    t = FIELD_DP64(t, ID_AA64ZFR0, F64MM, 1);
+    cpu->isar.id_aa64zfr0 = t;
 
-        u = cpu->isar.id_pfr0;
-        u = FIELD_DP32(u, ID_PFR0, DIT, 1);
-        cpu->isar.id_pfr0 = u;
+    /* Replicate the same data to the 32-bit id registers.  */
+    u = cpu->isar.id_isar5;
+    u = FIELD_DP32(u, ID_ISAR5, AES, 2); /* AES + PMULL */
+    u = FIELD_DP32(u, ID_ISAR5, SHA1, 1);
+    u = FIELD_DP32(u, ID_ISAR5, SHA2, 1);
+    u = FIELD_DP32(u, ID_ISAR5, CRC32, 1);
+    u = FIELD_DP32(u, ID_ISAR5, RDM, 1);
+    u = FIELD_DP32(u, ID_ISAR5, VCMA, 1);
+    cpu->isar.id_isar5 = u;
 
-        u = cpu->isar.id_pfr2;
-        u = FIELD_DP32(u, ID_PFR2, SSBS, 1);
-        cpu->isar.id_pfr2 = u;
+    u = cpu->isar.id_isar6;
+    u = FIELD_DP32(u, ID_ISAR6, JSCVT, 1);
+    u = FIELD_DP32(u, ID_ISAR6, DP, 1);
+    u = FIELD_DP32(u, ID_ISAR6, FHM, 1);
+    u = FIELD_DP32(u, ID_ISAR6, SB, 1);
+    u = FIELD_DP32(u, ID_ISAR6, SPECRES, 1);
+    u = FIELD_DP32(u, ID_ISAR6, BF16, 1);
+    u = FIELD_DP32(u, ID_ISAR6, I8MM, 1);
+    cpu->isar.id_isar6 = u;
 
-        u = cpu->isar.id_mmfr3;
-        u = FIELD_DP32(u, ID_MMFR3, PAN, 2); /* ATS1E1 */
-        cpu->isar.id_mmfr3 = u;
+    u = cpu->isar.id_pfr0;
+    u = FIELD_DP32(u, ID_PFR0, DIT, 1);
+    cpu->isar.id_pfr0 = u;
 
-        u = cpu->isar.id_mmfr4;
-        u = FIELD_DP32(u, ID_MMFR4, HPDS, 1); /* AA32HPD */
-        u = FIELD_DP32(u, ID_MMFR4, AC2, 1); /* ACTLR2, HACTLR2 */
-        u = FIELD_DP32(u, ID_MMFR4, CNP, 1); /* TTCNP */
-        u = FIELD_DP32(u, ID_MMFR4, XNX, 1); /* TTS2UXN */
-        cpu->isar.id_mmfr4 = u;
+    u = cpu->isar.id_pfr2;
+    u = FIELD_DP32(u, ID_PFR2, SSBS, 1);
+    cpu->isar.id_pfr2 = u;
 
-        t = cpu->isar.id_aa64dfr0;
-        t = FIELD_DP64(t, ID_AA64DFR0, PMUVER, 5); /* v8.4-PMU */
-        cpu->isar.id_aa64dfr0 = t;
+    u = cpu->isar.id_mmfr3;
+    u = FIELD_DP32(u, ID_MMFR3, PAN, 2); /* ATS1E1 */
+    cpu->isar.id_mmfr3 = u;
 
-        u = cpu->isar.id_dfr0;
-        u = FIELD_DP32(u, ID_DFR0, PERFMON, 5); /* v8.4-PMU */
-        cpu->isar.id_dfr0 = u;
+    u = cpu->isar.id_mmfr4;
+    u = FIELD_DP32(u, ID_MMFR4, HPDS, 1); /* AA32HPD */
+    u = FIELD_DP32(u, ID_MMFR4, AC2, 1); /* ACTLR2, HACTLR2 */
+    u = FIELD_DP32(u, ID_MMFR4, CNP, 1); /* TTCNP */
+    u = FIELD_DP32(u, ID_MMFR4, XNX, 1); /* TTS2UXN */
+    cpu->isar.id_mmfr4 = u;
 
-        u = cpu->isar.mvfr1;
-        u = FIELD_DP32(u, MVFR1, FPHP, 3);      /* v8.2-FP16 */
-        u = FIELD_DP32(u, MVFR1, SIMDHP, 2);    /* v8.2-FP16 */
-        cpu->isar.mvfr1 = u;
+    t = cpu->isar.id_aa64dfr0;
+    t = FIELD_DP64(t, ID_AA64DFR0, PMUVER, 5); /* v8.4-PMU */
+    cpu->isar.id_aa64dfr0 = t;
+
+    u = cpu->isar.id_dfr0;
+    u = FIELD_DP32(u, ID_DFR0, PERFMON, 5); /* v8.4-PMU */
+    cpu->isar.id_dfr0 = u;
+
+    u = cpu->isar.mvfr1;
+    u = FIELD_DP32(u, MVFR1, FPHP, 3);      /* v8.2-FP16 */
+    u = FIELD_DP32(u, MVFR1, SIMDHP, 2);    /* v8.2-FP16 */
+    cpu->isar.mvfr1 = u;
 
 #ifdef CONFIG_USER_ONLY
-        /* For usermode -cpu max we can use a larger and more efficient DCZ
-         * blocksize since we don't have to follow what the hardware does.
-         */
-        cpu->ctr = 0x80038003; /* 32 byte I and D cacheline size, VIPT icache */
-        cpu->dcz_blocksize = 7; /*  512 bytes */
+    /* For usermode -cpu max we can use a larger and more efficient DCZ
+     * blocksize since we don't have to follow what the hardware does.
+     */
+    cpu->ctr = 0x80038003; /* 32 byte I and D cacheline size, VIPT icache */
+    cpu->dcz_blocksize = 7; /*  512 bytes */
 #endif
 
-        bitmap_fill(cpu->sve_vq_supported, ARM_MAX_VQ);
-    }
+    bitmap_fill(cpu->sve_vq_supported, ARM_MAX_VQ);
 
     aarch64_add_pauth_properties(obj);
     aarch64_add_sve_properties(obj);
-- 
2.25.1


