Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ACC94C64D7
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 09:27:36 +0100 (CET)
Received: from localhost ([::1]:33090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nObNW-0005Rz-5w
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 03:27:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nOb2H-0008JK-9v
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 03:05:44 -0500
Received: from mga14.intel.com ([192.55.52.115]:50059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nOb2E-0005a2-Ax
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 03:05:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646035534; x=1677571534;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lygLHfFpKkNOpm8ULz7Ml4gu1/xM9RWbAxVPpfHcP1M=;
 b=Xgq4uPvLevh6NxdNyX13tABX3SVBIhcbLjoRk4aGKM9oqGaQLilzx8Qd
 KQ/minb9Pjo1Gawi6o0yZp6xJBF5041FOxLCelApDcnd0VG5bsx4sBPIC
 Cs6naRgAfsXUwqWLD4qU+TZDArHs8wHJRs14qFi4+qb4aYWnqirdexfui
 FMAmz9n7mjkO7yXKA0Thkt2RAxeecORzcUGN/yzWLWQcr9wOrC0D0Dcl/
 uM8jdViVwJfVm6OvBODia20S7vvpVGfTfZMNfM3ZN0QQzV1ZxnErLYNHI
 kpfjpK6oM/ukPMh85YSspkbJRpZHFE5Pw1nASBC7ayAX4dmOVy7XXxMRJ w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10271"; a="253021654"
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400"; d="scan'208";a="253021654"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 00:05:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400"; d="scan'208";a="778014605"
Received: from 984fee00bf64.jf.intel.com ([10.165.54.77])
 by fmsmga006.fm.intel.com with ESMTP; 28 Feb 2022 00:05:18 -0800
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 8/8] linux-header: Sync the linux headers
Date: Mon, 28 Feb 2022 00:05:15 -0800
Message-Id: <20220228080515.42357-9-yang.zhong@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220228080515.42357-1-yang.zhong@intel.com>
References: <20220228080515.42357-1-yang.zhong@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.115; envelope-from=yang.zhong@intel.com;
 helo=mga14.intel.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
 linux-headers/asm-x86/kvm.h | 3 +++
 linux-headers/linux/kvm.h   | 1 +
 2 files changed, 4 insertions(+)

diff --git a/linux-headers/asm-x86/kvm.h b/linux-headers/asm-x86/kvm.h
index 2da3316bb5..8224d0dda2 100644
--- a/linux-headers/asm-x86/kvm.h
+++ b/linux-headers/asm-x86/kvm.h
@@ -452,6 +452,9 @@ struct kvm_sync_regs {
 
 #define KVM_STATE_VMX_PREEMPTION_TIMER_DEADLINE	0x00000001
 
+/* attributes for system fd (group 0) */
+#define KVM_X86_XCOMP_GUEST_SUPP       0
+
 struct kvm_vmx_nested_state_data {
 	__u8 vmcs12[KVM_STATE_NESTED_VMX_VMCS_SIZE];
 	__u8 shadow_vmcs12[KVM_STATE_NESTED_VMX_VMCS_SIZE];
diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
index 00af3bc333..002503dc8b 100644
--- a/linux-headers/linux/kvm.h
+++ b/linux-headers/linux/kvm.h
@@ -1133,6 +1133,7 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_VM_MOVE_ENC_CONTEXT_FROM 206
 #define KVM_CAP_VM_GPA_BITS 207
 #define KVM_CAP_XSAVE2 208
+#define KVM_CAP_SYS_ATTRIBUTES 209
 
 #ifdef KVM_CAP_IRQ_ROUTING
 

