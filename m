Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 524BB3513CD
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 12:43:03 +0200 (CEST)
Received: from localhost ([::1]:51188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRun0-0000HP-85
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 06:43:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lRulH-000736-Pb
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 06:41:15 -0400
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d]:46804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lRulF-0002N4-Sc
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 06:41:15 -0400
Received: by mail-ot1-x32d.google.com with SMTP id
 68-20020a9d0f4a0000b02901b663e6258dso1647702ott.13
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 03:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jf1VGujtece+sgrlTdeq9JiiLbbG5le4coO4jmGjzMs=;
 b=qVfeYxG05PVTr+WDX4E0hcCtnnuGyFkGgbUy/HDUW9ROB28HCtfQnSlyhxKF4jGTjU
 Tgc4O4JkleK169+lvjDS+MFLAeXn8ot5/RpB+CqgNukwYVeWfp9UF/ChqS0cIWg7kH9o
 s5Ktf0DAm5aNdAbdN2/RkyCgslo+dJ93GjCUmCff1ZVunJk48wJERxxzKjGEBQYXca7u
 ziT2wlz7fUch5+ur+l3PrHXPkKwEJ0f/+1ta4cbUuiLWCFPRZZLey5HYn2/IOQ9wyfbN
 mYdiKkLVZ7Qyw6/FYh5fC8XaGSWkpmnmwzsMjzsPGVDwlDKsmdXu/eAdr/8+i3RRG6kW
 t0NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jf1VGujtece+sgrlTdeq9JiiLbbG5le4coO4jmGjzMs=;
 b=IIgZLjOtar+i8i6qr0RqDTNBGTnPzV3tLQE1hBLMKtyu0yK6DYEGZhuy3JiynZ2nq2
 iJVXXlqKXNixymmBliVO1v8QTMRmTNU9+/4VYFuA9eC7Ra6rf7R2GcIf3MOL16lkO2h2
 Mofm2bjVzHVlzCC0W41bmSdn1mKU/Nwc9P4GeH303b8NIby3aKUItNxJK3xgqbGR+ELt
 kDa7aI/ChTz7bp9WGou9O7iUyzhChb6RBOG+AwlKGa0mjDuswa5knUHVDo8j79ppQ/kY
 VVWDKzQ/IRcfeolxmsOxV5h98so7tCOYmELn5QfzZX4R+dm5Mg4+x/xWZxLkZQ9lyh8X
 4LZA==
X-Gm-Message-State: AOAM533dwg8ptGGBR7j3xC+gxz0whJixFNq8RyKN7+JeMUJ2rP+vTRDP
 rbshFCXbm4zo9hXrPIOWVFEgLhp5XbUdSXo=
X-Google-Smtp-Source: ABdhPJzwpt6fA3TATq9NRPha2pCXNjuHDgXh84k+i5QwOtigvTVGGItzm/pSmdRJtyJRZ5cxeBhpng==
X-Received: by 2002:a9d:761a:: with SMTP id k26mr6178705otl.193.1617273672763; 
 Thu, 01 Apr 2021 03:41:12 -0700 (PDT)
Received: from localhost.localdomain ([147.75.106.138])
 by smtp.gmail.com with ESMTPSA id a6sm1069066otq.79.2021.04.01.03.41.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 03:41:12 -0700 (PDT)
From: Haibo Xu <haibo.xu@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 1/6] Update linux header with new arm64 NV macro
Date: Thu,  1 Apr 2021 10:40:53 +0000
Message-Id: <87d2a40fa0a6775dd5a6af9b0d1609c1bf2a9610.1617272690.git.haibo.xu@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1617272690.git.haibo.xu@linaro.org>
References: <cover.1617272690.git.haibo.xu@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32d;
 envelope-from=haibo.xu@linaro.org; helo=mail-ot1-x32d.google.com
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


