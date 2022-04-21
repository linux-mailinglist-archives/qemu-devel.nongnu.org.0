Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 688A8509AA6
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 10:29:09 +0200 (CEST)
Received: from localhost ([::1]:48438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhSBY-0001vv-DZ
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 04:29:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1nhRLY-0005rh-Ok
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 03:35:27 -0400
Received: from mga02.intel.com ([134.134.136.20]:61331)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1nhRLV-0007W2-RR
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 03:35:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650526521; x=1682062521;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=SK6DfUD1Elhz4wP8ubWVI6Kmk8qCznEz0nRUM7R0eFk=;
 b=jUMeni0iJd4UyVdQASXJci2drIZr8+wVSlcELEZ08BE8yDIJN62JyiYk
 DOxhYbkuP6+zxUXFtJAAkkweXLeKcLnjepAbznyZBlpeeeZPsdqZCwsqz
 5YLc8XG4emVjyKLWLb9WAcU8g2WNKnbvSO8GD4rbveWGmpPuI1HvahYGT
 414/4mwoY1l5WAVG1ztKes5H5TccJLDYOejhnZqYxBL19wY66St4Olxpe
 +//2bo3208ns4n7CcruKA022x9pFFu1vjaYJItnqLHYj+UFv6NBnSO0A8
 lfNe3gs4sdDFf+zYEIaKgYjmXc/PS4EN3Y5mDAafKcsQlHxGgyencF0Lw A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10323"; a="251582551"
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; d="scan'208";a="251582551"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 00:35:18 -0700
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; d="scan'208";a="530155145"
Received: from chenyi-pc.sh.intel.com ([10.239.159.73])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 00:35:14 -0700
From: Chenyi Qiang <chenyi.qiang@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Sean Christopherson <seanjc@google.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Xiaoyao Li <xiaoyao.li@intel.com>
Subject: [PATCH v3 1/3] linux-header: update linux header
Date: Thu, 21 Apr 2022 15:40:26 +0800
Message-Id: <20220421074028.18196-2-chenyi.qiang@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220421074028.18196-1-chenyi.qiang@intel.com>
References: <20220421074028.18196-1-chenyi.qiang@intel.com>
Received-SPF: pass client-ip=134.134.136.20;
 envelope-from=chenyi.qiang@intel.com; helo=mga02.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-devel@nongnu.org, kvm@vger.kernel.org,
 Chenyi Qiang <chenyi.qiang@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This linux-header update is only a reference to include some definitions
related to notify VM exit.

Signed-off-by: Chenyi Qiang <chenyi.qiang@intel.com>
---
 linux-headers/asm-x86/kvm.h |  4 +++-
 linux-headers/linux/kvm.h   | 10 ++++++++++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/linux-headers/asm-x86/kvm.h b/linux-headers/asm-x86/kvm.h
index bf6e96011d..41541561ed 100644
--- a/linux-headers/asm-x86/kvm.h
+++ b/linux-headers/asm-x86/kvm.h
@@ -325,6 +325,7 @@ struct kvm_reinject_control {
 #define KVM_VCPUEVENT_VALID_SHADOW	0x00000004
 #define KVM_VCPUEVENT_VALID_SMM		0x00000008
 #define KVM_VCPUEVENT_VALID_PAYLOAD	0x00000010
+#define KVM_VCPUEVENT_VALID_TRIPLE_FAULT	0x00000020
 
 /* Interrupt shadow states */
 #define KVM_X86_SHADOW_INT_MOV_SS	0x01
@@ -359,7 +360,8 @@ struct kvm_vcpu_events {
 		__u8 smm_inside_nmi;
 		__u8 latched_init;
 	} smi;
-	__u8 reserved[27];
+	__u8 triple_fault_pending;
+	__u8 reserved[26];
 	__u8 exception_has_payload;
 	__u64 exception_payload;
 };
diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
index d232feaae9..67c0f6a938 100644
--- a/linux-headers/linux/kvm.h
+++ b/linux-headers/linux/kvm.h
@@ -270,6 +270,7 @@ struct kvm_xen_exit {
 #define KVM_EXIT_X86_BUS_LOCK     33
 #define KVM_EXIT_XEN              34
 #define KVM_EXIT_RISCV_SBI        35
+#define KVM_EXIT_NOTIFY           36
 
 /* For KVM_EXIT_INTERNAL_ERROR */
 /* Emulate instruction failed. */
@@ -487,6 +488,11 @@ struct kvm_run {
 			unsigned long args[6];
 			unsigned long ret[2];
 		} riscv_sbi;
+		/* KVM_EXIT_NOTIFY */
+		struct {
+#define KVM_NOTIFY_CONTEXT_INVALID	(1 << 0)
+			__u32 flags;
+		} notify;
 		/* Fix the size of the union. */
 		char padding[256];
 	};
@@ -1134,6 +1140,7 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_VM_GPA_BITS 207
 #define KVM_CAP_XSAVE2 208
 #define KVM_CAP_SYS_ATTRIBUTES 209
+#define KVM_CAP_X86_NOTIFY_VMEXIT  215
 
 #ifdef KVM_CAP_IRQ_ROUTING
 
@@ -2051,4 +2058,7 @@ struct kvm_stats_desc {
 /* Available with KVM_CAP_XSAVE2 */
 #define KVM_GET_XSAVE2		  _IOR(KVMIO,  0xcf, struct kvm_xsave)
 
+#define KVM_X86_NOTIFY_VMEXIT_ENABLED		(1ULL << 0)
+#define KVM_X86_NOTIFY_VMEXIT_USER		(1ULL << 1)
+
 #endif /* __LINUX_KVM_H */
-- 
2.17.1


