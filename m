Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4674F343DA3
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 11:19:15 +0100 (CET)
Received: from localhost ([::1]:48082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOHeU-0000ZS-9O
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 06:19:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lOHTP-0007Dc-J1
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 06:07:47 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:40599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lOHTL-0002Rl-Rg
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 06:07:47 -0400
Received: by mail-pl1-x62f.google.com with SMTP id g1so6277977plg.7
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 03:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jf1VGujtece+sgrlTdeq9JiiLbbG5le4coO4jmGjzMs=;
 b=N6iKUsFm3jc2NUeWupkVAaHWrDMQnmpc+3X563QHjhEeWbp40BYEqrnBl+3qyNdnr9
 PAQ+8JyJBUmH6QAgHiQGkD2GbjHnp/QJmUrQkbWnEuJxZ6pk17z+3LDznE34CJkT5r6P
 KLMfXvpD7GBtSj83bnkS+hIP5UUsI8BNRhK03dn+hQ3+MKBWl0vBMxNVOiIsbDq0fCLf
 /FjB70CPhXy4lp8J68FWX6PrpsB3eJRhIsYIqIBQDJeMcBq23rM76kDjwzdFEgB+zQDW
 We1GaJwdbK0Uhaf9JeGmfWLdjUdNF3SLhanAKVAF0JIz6RwH4UriRTMcQn0r+4/MDgd/
 jmzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jf1VGujtece+sgrlTdeq9JiiLbbG5le4coO4jmGjzMs=;
 b=Ca1fLkDJV6INYOilhxdP977YyQM7Dm1DfsxYziQyfH19yJO5P/YtHx7gKoP2c1H5A2
 +Zlq4d8S6XKMSpsJjv2wKGKzX/3sXZO+KvNvnkrXzsBvzlPdUQtfjH3KW2qAj/loDEv4
 r5fcdUdermOs+avWFLH906TYHKkKEFj6ve6XObHdmstLw00yinYY65Nb7Sw0gub9dk5w
 q6Lxopcu3bxX5aU2iJpBJdMb0u3QxDSzG/FiPWZ2fH1SMkTeqJ00GaFJcs3obxCjAOiE
 8+lDzu7KXtoj3RwfQUdWS966BALflUxKo1VtNaEfneYZZMqAtRJakr3BDm5I+cbOOe/q
 hUfA==
X-Gm-Message-State: AOAM533WuxTMyEbFloIjNLtJEUXd6AWxqm/cnQdM6FIFX/XPcfoTrk3k
 XWVptS3MFmm0B4YncJU6Rml6Lkr50hU8
X-Google-Smtp-Source: ABdhPJyhYeFSHgSSb6qN5dhPzjQEWzgAVWrd/aX/aoseuXGn7rkS7EL+558ceIPe3jd+MOyp5TCQLQ==
X-Received: by 2002:a17:90b:681:: with SMTP id
 m1mr12231622pjz.168.1616407660836; 
 Mon, 22 Mar 2021 03:07:40 -0700 (PDT)
Received: from localhost.localdomain ([147.75.106.138])
 by smtp.gmail.com with ESMTPSA id c193sm13697145pfc.180.2021.03.22.03.07.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 03:07:40 -0700 (PDT)
From: Haibo Xu <haibo.xu@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH 1/3] Update linux header with new arm64 NV macro.
Date: Mon, 22 Mar 2021 10:07:24 +0000
Message-Id: <636b5932e4cf061b6f97516e82d4319c1d29b871.1616052889.git.haibo.xu@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1616052889.git.haibo.xu@linaro.org>
References: <cover.1616052889.git.haibo.xu@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=haibo.xu@linaro.org; helo=mail-pl1-x62f.google.com
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
 Haibo Xu <haibo.xu@linaro.org>, pbonzini@redhat.com, philmd@redhat.com
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


