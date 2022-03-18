Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD254DD619
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 09:28:13 +0100 (CET)
Received: from localhost ([::1]:34288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nV7y0-0007eg-6u
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 04:28:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1nV7ts-0005df-Sz
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 04:23:56 -0400
Received: from mga14.intel.com ([192.55.52.115]:23480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1nV7tq-0002IL-AT
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 04:23:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647591834; x=1679127834;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=5YXNEAgaJ+7s6gJA5/O3Dafe8nW8CuWa2e2RKkmBD2o=;
 b=ZurEPFRno6aTGRBFIqkj6WzL9wNUCnOwj/UFR3lSYlvigChjLB5UyQH7
 DYzIJgjwno3J+wtJMN/KvKI9ic3r6yyzmRf1iSCNQTdDDUlRFD/ZBmi53
 08EJjMDHE/PV7oc8LWqgPUExUBpH8ClP79Az5V6K6tFPKnQLNPFYn9Ch/
 YJ0yflMmPCkJdnuiceb0fXpfYYm8WpZEZJwGzDDBkmA4pDLRUWdughHvT
 GbregpG3WjSC+zawXGCd/+fiklFlVrlpZFxEpI7gBYxm0CqQUnZfbSaJv
 R7WaXb6EGHu7d1Wio/MkbJ5laRC+kzqVszNvqjL4HREj9PB0hp81jURwJ A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10289"; a="257280670"
X-IronPort-AV: E=Sophos;i="5.90,191,1643702400"; d="scan'208";a="257280670"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2022 01:23:52 -0700
X-IronPort-AV: E=Sophos;i="5.90,191,1643702400"; d="scan'208";a="558320559"
Received: from chenyi-pc.sh.intel.com ([10.239.159.73])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2022 01:23:50 -0700
From: Chenyi Qiang <chenyi.qiang@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Xiaoyao Li <xiaoyao.li@intel.com>
Subject: [PATCH v2 1/3] linux-headers: Sync the linux headers
Date: Fri, 18 Mar 2022 16:29:32 +0800
Message-Id: <20220318082934.25030-2-chenyi.qiang@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220318082934.25030-1-chenyi.qiang@intel.com>
References: <20220318082934.25030-1-chenyi.qiang@intel.com>
Received-SPF: pass client-ip=192.55.52.115;
 envelope-from=chenyi.qiang@intel.com; helo=mga14.intel.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Chenyi Qiang <chenyi.qiang@intel.com>, kvm@vger.kernel.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Chenyi Qiang <chenyi.qiang@intel.com>
---
 linux-headers/asm-x86/kvm.h |  4 ++++
 linux-headers/linux/kvm.h   | 29 ++++++++++++++++++++++++-----
 2 files changed, 28 insertions(+), 5 deletions(-)

diff --git a/linux-headers/asm-x86/kvm.h b/linux-headers/asm-x86/kvm.h
index 2da3316bb5..d8ef0d993e 100644
--- a/linux-headers/asm-x86/kvm.h
+++ b/linux-headers/asm-x86/kvm.h
@@ -325,6 +325,7 @@ struct kvm_reinject_control {
 #define KVM_VCPUEVENT_VALID_SHADOW	0x00000004
 #define KVM_VCPUEVENT_VALID_SMM		0x00000008
 #define KVM_VCPUEVENT_VALID_PAYLOAD	0x00000010
+#define KVM_VCPUEVENT_TRIPLE_FAULT	0x00000020
 
 /* Interrupt shadow states */
 #define KVM_X86_SHADOW_INT_MOV_SS	0x01
@@ -452,6 +453,9 @@ struct kvm_sync_regs {
 
 #define KVM_STATE_VMX_PREEMPTION_TIMER_DEADLINE	0x00000001
 
+/* attributes for system fd (group 0) */
+#define KVM_X86_XCOMP_GUEST_SUPP	0
+
 struct kvm_vmx_nested_state_data {
 	__u8 vmcs12[KVM_STATE_NESTED_VMX_VMCS_SIZE];
 	__u8 shadow_vmcs12[KVM_STATE_NESTED_VMX_VMCS_SIZE];
diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
index 00af3bc333..9579b10a46 100644
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
+			__u32 data;
+		} notify;
 		/* Fix the size of the union. */
 		char padding[256];
 	};
@@ -562,9 +568,12 @@ struct kvm_s390_mem_op {
 	__u32 op;		/* type of operation */
 	__u64 buf;		/* buffer in userspace */
 	union {
-		__u8 ar;	/* the access register number */
+		struct {
+			__u8 ar;	/* the access register number */
+			__u8 key;	/* access key, ignored if flag unset */
+		};
 		__u32 sida_offset; /* offset into the sida */
-		__u8 reserved[32]; /* should be set to 0 */
+		__u8 reserved[32]; /* ignored */
 	};
 };
 /* types for kvm_s390_mem_op->op */
@@ -572,9 +581,12 @@ struct kvm_s390_mem_op {
 #define KVM_S390_MEMOP_LOGICAL_WRITE	1
 #define KVM_S390_MEMOP_SIDA_READ	2
 #define KVM_S390_MEMOP_SIDA_WRITE	3
+#define KVM_S390_MEMOP_ABSOLUTE_READ	4
+#define KVM_S390_MEMOP_ABSOLUTE_WRITE	5
 /* flags for kvm_s390_mem_op->flags */
 #define KVM_S390_MEMOP_F_CHECK_ONLY		(1ULL << 0)
 #define KVM_S390_MEMOP_F_INJECT_EXCEPTION	(1ULL << 1)
+#define KVM_S390_MEMOP_F_SKEY_PROTECTION	(1ULL << 2)
 
 /* for KVM_INTERRUPT */
 struct kvm_interrupt {
@@ -1133,6 +1145,11 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_VM_MOVE_ENC_CONTEXT_FROM 206
 #define KVM_CAP_VM_GPA_BITS 207
 #define KVM_CAP_XSAVE2 208
+#define KVM_CAP_SYS_ATTRIBUTES 209
+#define KVM_CAP_PPC_AIL_MODE_3 210
+#define KVM_CAP_S390_MEM_OP_EXTENSION 211
+#define KVM_CAP_PMU_CAPABILITY 212
+#define KVM_CAP_X86_NOTIFY_VMEXIT 213
 
 #ifdef KVM_CAP_IRQ_ROUTING
 
@@ -1623,9 +1640,6 @@ struct kvm_enc_region {
 #define KVM_S390_NORMAL_RESET	_IO(KVMIO,   0xc3)
 #define KVM_S390_CLEAR_RESET	_IO(KVMIO,   0xc4)
 
-/* Available with KVM_CAP_XSAVE2 */
-#define KVM_GET_XSAVE2		  _IOR(KVMIO,  0xcf, struct kvm_xsave)
-
 struct kvm_s390_pv_sec_parm {
 	__u64 origin;
 	__u64 length;
@@ -1972,6 +1986,8 @@ struct kvm_dirty_gfn {
 #define KVM_BUS_LOCK_DETECTION_OFF             (1 << 0)
 #define KVM_BUS_LOCK_DETECTION_EXIT            (1 << 1)
 
+#define KVM_PMU_CAP_DISABLE                    (1 << 0)
+
 /**
  * struct kvm_stats_header - Header of per vm/vcpu binary statistics data.
  * @flags: Some extra information for header, always 0 for now.
@@ -2047,4 +2063,7 @@ struct kvm_stats_desc {
 
 #define KVM_GET_STATS_FD  _IO(KVMIO,  0xce)
 
+/* Available with KVM_CAP_XSAVE2 */
+#define KVM_GET_XSAVE2		  _IOR(KVMIO,  0xcf, struct kvm_xsave)
+
 #endif /* __LINUX_KVM_H */
-- 
2.17.1


