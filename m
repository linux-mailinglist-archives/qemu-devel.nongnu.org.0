Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D27D4B9916
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 07:16:44 +0100 (CET)
Received: from localhost ([::1]:52952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKa5r-0003iU-5r
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 01:16:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nKZuL-0006nM-Up
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 01:04:49 -0500
Received: from mga18.intel.com ([134.134.136.126]:2006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nKZuJ-0005nq-DX
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 01:04:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645077887; x=1676613887;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Yq4xukUaiHqwXTGUgfYrsZT4k2vj5JZHtz2oyAYnac4=;
 b=ZJScKtQ0P6fqtKeKMK78qrMxHJKcsC1AONZgduC7ToPUmuK8UE7we2AK
 Tnhzhyi1EbGzADN6veQfuPr5i703NdoRsjkw1QbY5DqhevloAHlLACKky
 Rewcy0USCj0vPpNasEc72dCWhwyBIckDJnLRO7GWULT4H6rpPjtGQZ8W5
 g6HK/Xn2sU8Twfu3GVYXLSTrvVFsDPmtqZPZtwF2SplRev9s3yP418LY1
 bO1DcjvdcFykDENKu/cpdInHXPNSeUrrF9/AO658U15IVpek7ivxVvHcm
 pctSL/TJAyujKCjkB0b3EUbKPHgxCTZRvtO1YguM7rFirkFCkPOAk6spc A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10260"; a="234332904"
X-IronPort-AV: E=Sophos;i="5.88,375,1635231600"; d="scan'208";a="234332904"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 22:04:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,375,1635231600"; d="scan'208";a="634318732"
Received: from 984fee00bf64.jf.intel.com ([10.165.54.77])
 by fmsmga002.fm.intel.com with ESMTP; 16 Feb 2022 22:04:36 -0800
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 8/8] linux-header: Sync the linux headers
Date: Wed, 16 Feb 2022 22:04:34 -0800
Message-Id: <20220217060434.52460-9-yang.zhong@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220217060434.52460-1-yang.zhong@intel.com>
References: <20220217060434.52460-1-yang.zhong@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=yang.zhong@intel.com; helo=mga18.intel.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: yang.zhong@intel.com, kevin.tian@intel.com, seanjc@google.com,
 jing2.liu@linux.intel.com, wei.w.wang@intel.com, guang.zeng@intel.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch will be dropped once Qemu sync linux 5.17 header.
Making all linux-headers changes here are only for maintainers
to easily remove those changes once those patches are queued.

Signed-off-by: Yang Zhong <yang.zhong@intel.com>
---
 linux-headers/asm-x86/kvm.h | 17 +++++++++++++++++
 linux-headers/linux/kvm.h   |  4 ++++
 2 files changed, 21 insertions(+)

diff --git a/linux-headers/asm-x86/kvm.h b/linux-headers/asm-x86/kvm.h
index 5a776a08f7..17735430db 100644
--- a/linux-headers/asm-x86/kvm.h
+++ b/linux-headers/asm-x86/kvm.h
@@ -375,7 +375,21 @@ struct kvm_debugregs {
 
 /* for KVM_CAP_XSAVE */
 struct kvm_xsave {
+	/*
+	 * KVM_GET_XSAVE2 and KVM_SET_XSAVE write and read as many bytes
+	 * as are returned by KVM_CHECK_EXTENSION(KVM_CAP_XSAVE2)
+	 * respectively, when invoked on the vm file descriptor.
+	 *
+	 * The size value returned by KVM_CHECK_EXTENSION(KVM_CAP_XSAVE2)
+	 * will always be at least 4096. Currently, it is only greater
+	 * than 4096 if a dynamic feature has been enabled with
+	 * ``arch_prctl()``, but this may change in the future.
+	 *
+	 * The offsets of the state save areas in struct kvm_xsave follow
+	 * the contents of CPUID leaf 0xD on the host.
+	 */
 	__u32 region[1024];
+	__u32 extra[0];
 };
 
 #define KVM_MAX_XCRS	16
@@ -438,6 +452,9 @@ struct kvm_sync_regs {
 
 #define KVM_STATE_VMX_PREEMPTION_TIMER_DEADLINE	0x00000001
 
+/* attributes for system fd (group 0) */
+#define KVM_X86_XCOMP_GUEST_SUPP       0
+
 struct kvm_vmx_nested_state_data {
 	__u8 vmcs12[KVM_STATE_NESTED_VMX_VMCS_SIZE];
 	__u8 shadow_vmcs12[KVM_STATE_NESTED_VMX_VMCS_SIZE];
diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
index 02c5e7b7bb..54ce7e6d90 100644
--- a/linux-headers/linux/kvm.h
+++ b/linux-headers/linux/kvm.h
@@ -1130,6 +1130,8 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_BINARY_STATS_FD 203
 #define KVM_CAP_EXIT_ON_EMULATION_FAILURE 204
 #define KVM_CAP_ARM_MTE 205
+#define KVM_CAP_XSAVE2  208
+#define KVM_CAP_SYS_ATTRIBUTES 209
 
 #ifdef KVM_CAP_IRQ_ROUTING
 
@@ -1677,6 +1679,8 @@ struct kvm_xen_hvm_attr {
 #define KVM_GET_SREGS2             _IOR(KVMIO,  0xcc, struct kvm_sregs2)
 #define KVM_SET_SREGS2             _IOW(KVMIO,  0xcd, struct kvm_sregs2)
 
+#define KVM_GET_XSAVE2           _IOR(KVMIO,  0xcf, struct kvm_xsave)
+
 struct kvm_xen_vcpu_attr {
 	__u16 type;
 	__u16 pad[3];

