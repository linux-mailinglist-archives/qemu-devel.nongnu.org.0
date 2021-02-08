Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0162031298F
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 04:54:46 +0100 (CET)
Received: from localhost ([::1]:50074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8xdN-0002kj-Lg
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 22:54:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1l8x6G-0007gD-W2
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 22:20:33 -0500
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130]:34665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1l8x6C-0001iY-I5
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 22:20:32 -0500
Received: by mail-il1-x130.google.com with SMTP id q9so11496652ilo.1
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 19:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MGfxbUHNHVC0PoO0wrBnW/QIqjiqRvvXdfo0luDm70M=;
 b=WlsvuiBDhRnYgnyXvcFFkNMd3K6x3ERkoNTdMoy6ODU8KnCwknS4rSCthu+gyXUs06
 vlKraVxJMEGyLt01ipgwpt8aj1oPd63SY4SN8zg6/AhWpMFpFxzGjZ3T4c1NlLA6xlC9
 gjrKlTizOG3jZ/n/SVvreJexpsgCXG/aRZayVVzfZGqiIUzch1hWyrHknfxPImeNkKFQ
 oasK2dkhgj8rfCJt2LOc0+1NIhLLjPK/lQt8exHEAcHI+pXr/hIMOnZDQ0QgtHY+Khu6
 1u28TbbDeM63iGjxPCUyjc4/RJxARQwuLCzDihTbE1KpOGMNl2H6P2m9lHNwiTMSnzqF
 Jg9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MGfxbUHNHVC0PoO0wrBnW/QIqjiqRvvXdfo0luDm70M=;
 b=Tx1cUDxL08a9AkfoUiUTjm/sOV6njmZAGE159o79cxP7RxqfLa6Q7P0ldMgcYRFVfK
 ttYjEiA8BZwmHNw1S/xJfbi4xOeoWvcsjdbOc7Z7jKixILyyXaFw1ft86YZm53o8PIjh
 WUH41ej8Y7s8TWN7ZKzsiRJPzhP4z7oHW1eKali9EBx4BlNV1QUaH/uduGPCL5T7GXPp
 +dWjbANyZTk1s130DCJz9fwuRsG3bKDcL0WxGoy3+ZbNbvefaLPXFGnu8gf6wdn9/ohB
 Dsmb48BzcKRfZiXRra7uqjKSwMPc13BOtgL39QudcTtTWDPCh6tYnq7hpMLWCztaeyHN
 /P1w==
X-Gm-Message-State: AOAM532IjHcYeKCsaVNSXVx6fzJG02KzVNDuQB0vD2rAZskCwmxsLjUe
 ZtcOwLX2DrclF3eKEcjTzK/X
X-Google-Smtp-Source: ABdhPJyuEHKwBtDmlYcA0wl0Y1z+b0QIC123BMzsf05REygjYcMAlxfhwxyF/QjV+2pGn4Uw9ku7nw==
X-Received: by 2002:a92:c56b:: with SMTP id b11mr14584456ilj.167.1612754426953; 
 Sun, 07 Feb 2021 19:20:26 -0800 (PST)
Received: from localhost.localdomain ([147.75.106.138])
 by smtp.gmail.com with ESMTPSA id o8sm8022965ilu.55.2021.02.07.19.20.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 19:20:26 -0800 (PST)
From: Haibo Xu <haibo.xu@linaro.org>
To: drjones@redhat.com,
	richard.henderson@linaro.org
Subject: [RFC PATCH 1/5] Update Linux headers with new MTE support
Date: Mon,  8 Feb 2021 03:20:02 +0000
Message-Id: <432d5c0c6fb79e29f2e7aa4730cf4339d3d858f0.1612747873.git.haibo.xu@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1612747873.git.haibo.xu@linaro.org>
References: <cover.1612747873.git.haibo.xu@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::130;
 envelope-from=haibo.xu@linaro.org; helo=mail-il1-x130.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, philmd@redhat.com,
 qemu-devel@nongnu.org, Haibo Xu <haibo.xu@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
---
 linux-headers/linux/kvm.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
index 020b62a619..6a291a9a35 100644
--- a/linux-headers/linux/kvm.h
+++ b/linux-headers/linux/kvm.h
@@ -1056,6 +1056,7 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_ENFORCE_PV_FEATURE_CPUID 190
 #define KVM_CAP_SYS_HYPERV_CPUID 191
 #define KVM_CAP_DIRTY_LOG_RING 192
+#define KVM_CAP_ARM_MTE 193
 
 #ifdef KVM_CAP_IRQ_ROUTING
 
@@ -1241,6 +1242,19 @@ struct kvm_arm_device_addr {
 	__u64 addr;
 };
 
+#define KVM_ARM_TAGS_TO_GUEST           0
+#define KVM_ARM_TAGS_FROM_GUEST         1
+
+struct kvm_arm_copy_mte_tags {
+	__u64 guest_ipa;
+	__u64 length;
+	union {
+		void *addr;
+		__u64 padding;
+	};
+	__u64 flags;
+};
+
 /*
  * Device control API, available with KVM_CAP_DEVICE_CTRL
  */
@@ -1396,6 +1410,7 @@ struct kvm_s390_ucas_mapping {
 /* Available with KVM_CAP_PMU_EVENT_FILTER */
 #define KVM_SET_PMU_EVENT_FILTER  _IOW(KVMIO,  0xb2, struct kvm_pmu_event_filter)
 #define KVM_PPC_SVM_OFF		  _IO(KVMIO,  0xb3)
+#define KVM_ARM_MTE_COPY_TAGS	  _IOR(KVMIO,  0xb4, struct kvm_arm_copy_mte_tags)
 
 /* ioctl for vm fd */
 #define KVM_CREATE_DEVICE	  _IOWR(KVMIO,  0xe0, struct kvm_create_device)
-- 
2.17.1


