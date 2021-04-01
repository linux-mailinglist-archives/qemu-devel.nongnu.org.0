Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 156383514F1
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 14:57:23 +0200 (CEST)
Received: from localhost ([::1]:56944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRwsz-0003EM-S7
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 08:57:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lRwrX-0001hE-9r
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 08:55:51 -0400
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236]:46962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lRwrV-0002xj-7X
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 08:55:51 -0400
Received: by mail-oi1-x236.google.com with SMTP id m13so1634333oiw.13
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 05:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jf1VGujtece+sgrlTdeq9JiiLbbG5le4coO4jmGjzMs=;
 b=uJWJC90Fv3ZfmbNRq3PElKSAw+GkhitzXwH22LsbNIH0RAiT7H9ibTes7cnAWqcvWi
 VODHrHUx+TGfJJvejG3WadK527IcHhlgySFaQMOSwPC6PpOFF5E0oHWKmVWzoF0yixAB
 qW639gd+NAUgg4N52YRZsMWyShCzVb7ERZ4/3r2h/NGgZjcgRoYVabgFJ/aHZmpC2HRx
 frx6v1p9crcOj3mcbfK7cLmth4KW1Dya6BM2gxQcRv/f62XSlqJ2skpyNO/onIR8u0Ft
 lymtdn1jPOSYvaPwhPVHr+vl+EgJIce2OCimm34D45O4TnC1x3IpVDZvtUH8CWCaxCyW
 1Kag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jf1VGujtece+sgrlTdeq9JiiLbbG5le4coO4jmGjzMs=;
 b=GCIo/VtcCMqN8sVB3x98BxJa9AF6jyxM26QDP6RLbq3M631UhP1FJ8CGgKLqCeJHve
 ARmhXCS/cK37eXdtAa1GWQMiF2ahAgAOfWYjEOvO9n36BRhqyE4Ly7zlW6RQKBuAhGH/
 tucXwu6MD8Yh7f20Vhq5WJaGmIfLqGkD3g1jTx1eEIec/0VzAPKDQlsc8wNQEqoLA/yP
 x2hV+MF6b3o5Z4JzoMqhBlHvVQKjLX/jRHZPmXlagpjKJzMUghjHeE/5qINErsBQkGu3
 6ygT8bgR0yl9F1ZyXdJsAFTkXKnPEaf+uEmRU+usF19jPsuf9SRbj8SMNsZgZ7yt5hAs
 Y6FQ==
X-Gm-Message-State: AOAM531re8uDrSfvhpLM9snl4+HhC9o6u3zXxAV6pRybGnUGu2mZFBDs
 0eyTVFJ0reM76ZXp+aMJhGwk79T8XQZYHHw=
X-Google-Smtp-Source: ABdhPJzjQST9swZ1Ajtv8/20xozu3k76Wb0dZHepRGvjiQXJ7fmWyUd+18IsZdmNkdUVd8KHWaMszg==
X-Received: by 2002:aca:4b4d:: with SMTP id y74mr5869561oia.97.1617281748104; 
 Thu, 01 Apr 2021 05:55:48 -0700 (PDT)
Received: from localhost.localdomain ([147.75.106.138])
 by smtp.gmail.com with ESMTPSA id w11sm1082245ooc.35.2021.04.01.05.55.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 05:55:47 -0700 (PDT)
From: Haibo Xu <haibo.xu@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH RESEND v2 1/6] Update linux header with new arm64 NV macro
Date: Thu,  1 Apr 2021 12:55:33 +0000
Message-Id: <87d2a40fa0a6775dd5a6af9b0d1609c1bf2a9610.1617281290.git.haibo.xu@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1617281290.git.haibo.xu@linaro.org>
References: <cover.1617281290.git.haibo.xu@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=haibo.xu@linaro.org; helo=mail-oi1-x236.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, richard.henderson@linaro.org,
 abologna@redhat.com, Haibo Xu <haibo.xu@linaro.org>, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
---
 linux-headers/asm-arm64/kvm.h | 2 ++
 linux-headers/linux/kvm.h     | 1 +
 2 files changed, 3 insertions(+)

diff --git a/linux-headers/asm-arm64/kvm.h b/linux-headers/asm-arm64/kvm.h
index b6a0eaa32a..77b995a26c 100644
--- a/linux-headers/asm-arm64/kvm.h
+++ b/linux-headers/asm-arm64/kvm.h
@@ -106,6 +106,7 @@ struct kvm_regs {
 #define KVM_ARM_VCPU_SVE		4 /* enable SVE for this CPU */
 #define KVM_ARM_VCPU_PTRAUTH_ADDRESS	5 /* VCPU uses address authentication */
 #define KVM_ARM_VCPU_PTRAUTH_GENERIC	6 /* VCPU uses generic authentication */
+#define KVM_ARM_VCPU_HAS_EL2		7 /* Support nested virtualization */
 
 struct kvm_vcpu_init {
 	__u32 target;
@@ -334,6 +335,7 @@ struct kvm_vcpu_events {
 #define KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS 6
 #define KVM_DEV_ARM_VGIC_GRP_LEVEL_INFO  7
 #define KVM_DEV_ARM_VGIC_GRP_ITS_REGS 8
+#define KVM_DEV_ARM_VGIC_GRP_MAINT_IRQ 9
 #define KVM_DEV_ARM_VGIC_LINE_LEVEL_INFO_SHIFT	10
 #define KVM_DEV_ARM_VGIC_LINE_LEVEL_INFO_MASK \
 			(0x3fffffULL << KVM_DEV_ARM_VGIC_LINE_LEVEL_INFO_SHIFT)
diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
index 020b62a619..ce4630c4db 100644
--- a/linux-headers/linux/kvm.h
+++ b/linux-headers/linux/kvm.h
@@ -1056,6 +1056,7 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_ENFORCE_PV_FEATURE_CPUID 190
 #define KVM_CAP_SYS_HYPERV_CPUID 191
 #define KVM_CAP_DIRTY_LOG_RING 192
+#define KVM_CAP_ARM_EL2 193
 
 #ifdef KVM_CAP_IRQ_ROUTING
 
-- 
2.17.1


