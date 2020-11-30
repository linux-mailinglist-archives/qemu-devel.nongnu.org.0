Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0332C85C2
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 14:42:11 +0100 (CET)
Received: from localhost ([::1]:51632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjjRT-0006b4-0B
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 08:42:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kjjOR-0005Ix-SE
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 08:39:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kjjOP-0008LI-JO
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 08:39:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606743540;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uohsauvIsjYEA0XUxpazEHeSKdAgOCIc129bvX1wErE=;
 b=T7M/PzxEbuiZEzUmmhgBXR5zO8x4/ZcGUKpNV7kJOqN+LjWjKh2AFSArU1vq/zAGCk67g0
 09G6fS68Y7i5Squ7K7DbJjpCjrn1mG3Dcm58pMpTjP28AHIJ80Yy7EpN5jOcu+lMGqi0+A
 Cccu0v5klZgXsxFEDpasgrVksGfdDrI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-244-dur6NQcVP3WZhMlsigyNIg-1; Mon, 30 Nov 2020 08:38:58 -0500
X-MC-Unique: dur6NQcVP3WZhMlsigyNIg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7AD0C1009462;
 Mon, 30 Nov 2020 13:38:57 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.35.206.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4982D60867;
 Mon, 30 Nov 2020 13:38:53 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] Update the kernel headers for 5.10-rc5 + TSC
Date: Mon, 30 Nov 2020 15:38:44 +0200
Message-Id: <20201130133845.233552-2-mlevitsk@redhat.com>
In-Reply-To: <20201130133845.233552-1-mlevitsk@redhat.com>
References: <20201130133845.233552-1-mlevitsk@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Marcelo Tosatti <mtosatti@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Maxim Levitsky <mlevitsk@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 include/standard-headers/asm-x86/kvm_para.h |  1 +
 linux-headers/asm-x86/kvm.h                 |  2 +
 linux-headers/linux/kvm.h                   | 70 ++++++++++++++++++++-
 3 files changed, 72 insertions(+), 1 deletion(-)

diff --git a/include/standard-headers/asm-x86/kvm_para.h b/include/standard-headers/asm-x86/kvm_para.h
index 07877d3295..215d01b4ec 100644
--- a/include/standard-headers/asm-x86/kvm_para.h
+++ b/include/standard-headers/asm-x86/kvm_para.h
@@ -32,6 +32,7 @@
 #define KVM_FEATURE_POLL_CONTROL	12
 #define KVM_FEATURE_PV_SCHED_YIELD	13
 #define KVM_FEATURE_ASYNC_PF_INT	14
+#define KVM_FEATURE_MSI_EXT_DEST_ID	15
 
 #define KVM_HINTS_REALTIME      0
 
diff --git a/linux-headers/asm-x86/kvm.h b/linux-headers/asm-x86/kvm.h
index 89e5f3d1bb..2a60fc6674 100644
--- a/linux-headers/asm-x86/kvm.h
+++ b/linux-headers/asm-x86/kvm.h
@@ -12,6 +12,7 @@
 
 #define KVM_PIO_PAGE_OFFSET 1
 #define KVM_COALESCED_MMIO_PAGE_OFFSET 2
+#define KVM_DIRTY_LOG_PAGE_OFFSET 64
 
 #define DE_VECTOR 0
 #define DB_VECTOR 1
@@ -403,6 +404,7 @@ struct kvm_sync_regs {
 #define KVM_X86_QUIRK_LAPIC_MMIO_HOLE	   (1 << 2)
 #define KVM_X86_QUIRK_OUT_7E_INC_RIP	   (1 << 3)
 #define KVM_X86_QUIRK_MISC_ENABLE_NO_MWAIT (1 << 4)
+#define KVM_X86_QUIRK_TSC_HOST_ACCESS      (1 << 5)
 
 #define KVM_STATE_NESTED_FORMAT_VMX	0
 #define KVM_STATE_NESTED_FORMAT_SVM	1
diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
index 56ce14ad20..55dd0f563c 100644
--- a/linux-headers/linux/kvm.h
+++ b/linux-headers/linux/kvm.h
@@ -250,6 +250,7 @@ struct kvm_hyperv_exit {
 #define KVM_EXIT_ARM_NISV         28
 #define KVM_EXIT_X86_RDMSR        29
 #define KVM_EXIT_X86_WRMSR        30
+#define KVM_EXIT_DIRTY_RING_FULL  31
 
 /* For KVM_EXIT_INTERNAL_ERROR */
 /* Emulate instruction failed. */
@@ -1053,6 +1054,9 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_X86_USER_SPACE_MSR 188
 #define KVM_CAP_X86_MSR_FILTER 189
 #define KVM_CAP_ENFORCE_PV_FEATURE_CPUID 190
+#define KVM_CAP_SYS_HYPERV_CPUID 191
+#define KVM_CAP_DIRTY_LOG_RING 192
+#define KVM_CAP_PRECISE_TSC 193
 
 #ifdef KVM_CAP_IRQ_ROUTING
 
@@ -1166,6 +1170,15 @@ struct kvm_clock_data {
 	__u32 pad[9];
 };
 
+
+#define KVM_TSC_STATE_TSC_ADJUST_VALID 1
+struct kvm_tsc_state {
+	__u32 flags;
+	__u64 nsec;
+	__u64 tsc;
+	__u64 tsc_adjust;
+};
+
 /* For KVM_CAP_SW_TLB */
 
 #define KVM_MMU_FSL_BOOKE_NOHV		0
@@ -1511,7 +1524,7 @@ struct kvm_enc_region {
 /* Available with KVM_CAP_MANUAL_DIRTY_LOG_PROTECT_2 */
 #define KVM_CLEAR_DIRTY_LOG          _IOWR(KVMIO, 0xc0, struct kvm_clear_dirty_log)
 
-/* Available with KVM_CAP_HYPERV_CPUID */
+/* Available with KVM_CAP_HYPERV_CPUID (vcpu) / KVM_CAP_SYS_HYPERV_CPUID (system) */
 #define KVM_GET_SUPPORTED_HV_CPUID _IOWR(KVMIO, 0xc1, struct kvm_cpuid2)
 
 /* Available with KVM_CAP_ARM_SVE */
@@ -1557,6 +1570,13 @@ struct kvm_pv_cmd {
 /* Available with KVM_CAP_X86_MSR_FILTER */
 #define KVM_X86_SET_MSR_FILTER	_IOW(KVMIO,  0xc6, struct kvm_msr_filter)
 
+/* Available with KVM_CAP_DIRTY_LOG_RING */
+#define KVM_RESET_DIRTY_RINGS		_IO(KVMIO, 0xc7)
+
+/* Available with KVM_CAP_PRECISE_TSC*/
+#define KVM_SET_TSC_STATE          _IOW(KVMIO,  0xc8, struct kvm_tsc_state)
+#define KVM_GET_TSC_STATE          _IOR(KVMIO,  0xc9, struct kvm_tsc_state)
+
 /* Secure Encrypted Virtualization command */
 enum sev_cmd_id {
 	/* Guest initialization commands */
@@ -1710,4 +1730,52 @@ struct kvm_hyperv_eventfd {
 #define KVM_DIRTY_LOG_MANUAL_PROTECT_ENABLE    (1 << 0)
 #define KVM_DIRTY_LOG_INITIALLY_SET            (1 << 1)
 
+/*
+ * Arch needs to define the macro after implementing the dirty ring
+ * feature.  KVM_DIRTY_LOG_PAGE_OFFSET should be defined as the
+ * starting page offset of the dirty ring structures.
+ */
+#ifndef KVM_DIRTY_LOG_PAGE_OFFSET
+#define KVM_DIRTY_LOG_PAGE_OFFSET 0
+#endif
+
+/*
+ * KVM dirty GFN flags, defined as:
+ *
+ * |---------------+---------------+--------------|
+ * | bit 1 (reset) | bit 0 (dirty) | Status       |
+ * |---------------+---------------+--------------|
+ * |             0 |             0 | Invalid GFN  |
+ * |             0 |             1 | Dirty GFN    |
+ * |             1 |             X | GFN to reset |
+ * |---------------+---------------+--------------|
+ *
+ * Lifecycle of a dirty GFN goes like:
+ *
+ *      dirtied         harvested        reset
+ * 00 -----------> 01 -------------> 1X -------+
+ *  ^                                          |
+ *  |                                          |
+ *  +------------------------------------------+
+ *
+ * The userspace program is only responsible for the 01->1X state
+ * conversion after harvesting an entry.  Also, it must not skip any
+ * dirty bits, so that dirty bits are always harvested in sequence.
+ */
+#define KVM_DIRTY_GFN_F_DIRTY           BIT(0)
+#define KVM_DIRTY_GFN_F_RESET           BIT(1)
+#define KVM_DIRTY_GFN_F_MASK            0x3
+
+/*
+ * KVM dirty rings should be mapped at KVM_DIRTY_LOG_PAGE_OFFSET of
+ * per-vcpu mmaped regions as an array of struct kvm_dirty_gfn.  The
+ * size of the gfn buffer is decided by the first argument when
+ * enabling KVM_CAP_DIRTY_LOG_RING.
+ */
+struct kvm_dirty_gfn {
+	__u32 flags;
+	__u32 slot;
+	__u64 offset;
+};
+
 #endif /* __LINUX_KVM_H */
-- 
2.26.2


