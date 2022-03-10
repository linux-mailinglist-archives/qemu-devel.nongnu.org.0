Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E62064D432A
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 10:08:01 +0100 (CET)
Received: from localhost ([::1]:58804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSEm8-0005jC-6P
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 04:08:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1nSEdh-0000rF-Sv
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 03:59:17 -0500
Received: from mga09.intel.com ([134.134.136.24]:26960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1nSEdf-00007Q-9N
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 03:59:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646902755; x=1678438755;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=O0BNcoBFHZHkV7lU+UOxTS5MwHKWWt61DX+AER73+ME=;
 b=TULqLrHZKOMq8G9rBCkNlRELkH2B+IQSHLqtyxp1jzuvdHDHJgcAKY9m
 BG0Yzs/OSMW8NaZilZ7b6bn0nOZvubT9glv4khWj7XRyo/sPDs8CnXcGi
 cJv0dmKkTUAuOSxvJw8ThxI85M3YZQNIU4lSNcCrl9/i2G2Sntc95eh2x
 It87QYmNYrTeAcfYxsBCvM6UN5c4OwPjvtWemWfqr0h/TBl2nFlZmKTfk
 eQqGGzhniRK29xsJ/eBjacqvkIUD0ksjtROmRXuoYiBcy7tJ/QCVX9rkg
 ODtWfB+IYduIPsPv8tpZo4Wa9MTOhNu4iTQFPrvtJAEimLzmp2dx6LJd1 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="254932806"
X-IronPort-AV: E=Sophos;i="5.90,169,1643702400"; d="scan'208";a="254932806"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 00:59:11 -0800
X-IronPort-AV: E=Sophos;i="5.90,169,1643702400"; d="scan'208";a="644367209"
Received: from chenyi-pc.sh.intel.com ([10.239.159.73])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 00:59:08 -0800
From: Chenyi Qiang <chenyi.qiang@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Xiaoyao Li <xiaoyao.li@intel.com>
Subject: [PATCH 1/2] linux-headers: Sync the linux headers
Date: Thu, 10 Mar 2022 17:02:04 +0800
Message-Id: <20220310090205.10645-2-chenyi.qiang@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220310090205.10645-1-chenyi.qiang@intel.com>
References: <20220310090205.10645-1-chenyi.qiang@intel.com>
Received-SPF: pass client-ip=134.134.136.24;
 envelope-from=chenyi.qiang@intel.com; helo=mga09.intel.com
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
index 2da3316bb5..44757bd612 100644
--- a/linux-headers/asm-x86/kvm.h
+++ b/linux-headers/asm-x86/kvm.h
@@ -325,6 +325,7 @@ struct kvm_reinject_control {
 #define KVM_VCPUEVENT_VALID_SHADOW	0x00000004
 #define KVM_VCPUEVENT_VALID_SMM		0x00000008
 #define KVM_VCPUEVENT_VALID_PAYLOAD	0x00000010
+#define KVM_VCPUEVENT_SHUTDOWN		0x00000020
 
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


