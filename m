Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5263B4CB0A6
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 22:07:36 +0100 (CET)
Received: from localhost ([::1]:36394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPWC7-0001g4-Ca
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 16:07:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPVxx-0005uQ-9m
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 15:52:57 -0500
Received: from [2a00:1450:4864:20::432] (port=39433
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPVxv-0000Gf-N3
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 15:52:57 -0500
Received: by mail-wr1-x432.google.com with SMTP id ay10so4678133wrb.6
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 12:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=l/7EADgfQiDC7fxjtgYtq9X1xBlDjXtx1HGr/ZG8QYc=;
 b=ykA8VvGEZIbRQh0Vi4Uq1gtgxTDH+GkvZ1QU+QaoqxYAdV0woIaIqd6yplmeaEhQzB
 2cTuETVow8yU+xPlzgfKgYVlkfuFJ7zlrOIjTOUFGP1Ts0w6ux0yjg8EjpGhle7zrst/
 r1jRZV091MBlsfiaJLF1tnoNeGOmdVswVrzl5cc4yDevARqCe82hmS4+WSY5UQo133tB
 w18Qdtp3sHmJBdt6hHBqmDhc9BihFMzskMDuEBKpNMSNsHJP11EW8REwYUU3MsDsBKiS
 6KKyXDkYt61b8AVfoJeCvEkIS4L3PAteu/c014cpghmow4xk1F0cEfuJL7MfObLPKZTn
 zpDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l/7EADgfQiDC7fxjtgYtq9X1xBlDjXtx1HGr/ZG8QYc=;
 b=20CnyfCBql/Kw5hmS0Vg9+ZPPZ4vpFsls4n5JWZrqpu92nO1+KNkj/xhG9j5dtsrFR
 ARPhhLOOhSiffaZmg9SdfxUpVLn/l2xoFUewcupmmN1bcPbvMhkHIdYOdLRqq1xMfL72
 ePnSdOIhdanJ6vZC0hb8yvDXLaW1Vr1V5hwU/LFUDjEpUevY9ooVNvst6Oq5UAJMk5Xa
 QffngxQ3DxKlW2Nv+c4KWc0AX/gQPxRnVn2XEzyS+guOerVMxoIoeTshC996xLERHgbk
 0VjsAm5YiPvygWKmbWQXL7Vv4yyzW0xAfXImiH7AIgZsARX5AKo3n3nT/AwKTvs0XTSL
 OdoQ==
X-Gm-Message-State: AOAM531kodsQfozJGNpN1G2FrF2C4lEXmH9zEkOu+WiwlMFOn489p1pE
 fm4j5WEoEVzwM2HhYFHDWrLQJ9cCBSdX8g==
X-Google-Smtp-Source: ABdhPJyzCsr4K9z9y1NlrJ6NMMar5gMDWu/F7yXwEz+8zCutbURpb/n6OROqGaf5oX7Molaq6mFeBQ==
X-Received: by 2002:a5d:5302:0:b0:1ed:e1d2:f0fd with SMTP id
 e2-20020a5d5302000000b001ede1d2f0fdmr24853768wrv.585.1646254373706; 
 Wed, 02 Mar 2022 12:52:53 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 x13-20020adfec0d000000b001e31279cc38sm90801wrn.11.2022.03.02.12.52.53
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 12:52:53 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 24/26] target/arm: Report KVM's actual PSCI version to guest in
 dtb
Date: Wed,  2 Mar 2022 20:52:28 +0000
Message-Id: <20220302205230.2122390-25-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220302205230.2122390-1-peter.maydell@linaro.org>
References: <20220302205230.2122390-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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

When we're using KVM, the PSCI implementation is provided by the
kernel, but QEMU has to tell the guest about it via the device tree.
Currently we look at the KVM_CAP_ARM_PSCI_0_2 capability to determine
if the kernel is providing at least PSCI 0.2, but if the kernel
provides a newer version than that we will still only tell the guest
it has PSCI 0.2.  (This is fairly harmless; it just means the guest
won't use newer parts of the PSCI API.)

The kernel exposes the specific PSCI version it is implementing via
the ONE_REG API; use this to report in the dtb that the PSCI
implementation is 1.0-compatible if appropriate.  (The device tree
binding currently only distinguishes "pre-0.2", "0.2-compatible" and
"1.0-compatible".)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Marc Zyngier <maz@kernel.org>
Reviewed-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Message-id: 20220224134655.1207865-1-peter.maydell@linaro.org
---
 target/arm/kvm-consts.h |  1 +
 hw/arm/boot.c           |  5 ++---
 target/arm/kvm64.c      | 12 ++++++++++++
 3 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/target/arm/kvm-consts.h b/target/arm/kvm-consts.h
index e770921ddc2..faacf96fdc7 100644
--- a/target/arm/kvm-consts.h
+++ b/target/arm/kvm-consts.h
@@ -95,6 +95,7 @@ MISMATCH_CHECK(QEMU_PSCI_1_0_FN_PSCI_FEATURES, PSCI_1_0_FN_PSCI_FEATURES);
 
 #define QEMU_PSCI_VERSION_0_1                     0x00001
 #define QEMU_PSCI_VERSION_0_2                     0x00002
+#define QEMU_PSCI_VERSION_1_0                     0x10000
 #define QEMU_PSCI_VERSION_1_1                     0x10001
 
 MISMATCH_CHECK(QEMU_PSCI_0_2_RET_TOS_MIGRATION_NOT_REQUIRED, PSCI_0_2_TOS_MP);
diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 0eeef94ceb5..a47f38dfc90 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -488,9 +488,8 @@ static void fdt_add_psci_node(void *fdt)
     }
 
     qemu_fdt_add_subnode(fdt, "/psci");
-    if (armcpu->psci_version == QEMU_PSCI_VERSION_0_2 ||
-        armcpu->psci_version == QEMU_PSCI_VERSION_1_1) {
-        if (armcpu->psci_version == QEMU_PSCI_VERSION_0_2) {
+    if (armcpu->psci_version >= QEMU_PSCI_VERSION_0_2) {
+        if (armcpu->psci_version < QEMU_PSCI_VERSION_1_0) {
             const char comp[] = "arm,psci-0.2\0arm,psci";
             qemu_fdt_setprop(fdt, "/psci", "compatible", comp, sizeof(comp));
         } else {
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 64d48bfb19d..ccadfbbe72b 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -849,6 +849,7 @@ int kvm_arch_init_vcpu(CPUState *cs)
     uint64_t mpidr;
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
+    uint64_t psciver;
 
     if (cpu->kvm_target == QEMU_KVM_ARM_TARGET_NONE ||
         !object_dynamic_cast(OBJECT(cpu), TYPE_AARCH64_CPU)) {
@@ -904,6 +905,17 @@ int kvm_arch_init_vcpu(CPUState *cs)
         }
     }
 
+    /*
+     * KVM reports the exact PSCI version it is implementing via a
+     * special sysreg. If it is present, use its contents to determine
+     * what to report to the guest in the dtb (it is the PSCI version,
+     * in the same 15-bits major 16-bits minor format that PSCI_VERSION
+     * returns).
+     */
+    if (!kvm_get_one_reg(cs, KVM_REG_ARM_PSCI_VERSION, &psciver)) {
+        cpu->psci_version = psciver;
+    }
+
     /*
      * When KVM is in use, PSCI is emulated in-kernel and not by qemu.
      * Currently KVM has its own idea about MPIDR assignment, so we
-- 
2.25.1


