Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8797379FDD
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 08:42:30 +0200 (CEST)
Received: from localhost ([::1]:60944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgM69-0000RR-SJ
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 02:42:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1lgLsQ-0006JI-Mj
 for qemu-devel@nongnu.org; Tue, 11 May 2021 02:28:19 -0400
Received: from mga06.intel.com ([134.134.136.31]:46423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1lgLsJ-0004ZR-Ac
 for qemu-devel@nongnu.org; Tue, 11 May 2021 02:28:18 -0400
IronPort-SDR: C0n4zqoZr4ZK7Qg6Ms1pex89oWKnnYwbwFXbDlMcKX2Fx4k59Twi7Hmq+FNVOmeRDbQq3fJP0a
 v1kSZqTEIgyA==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="260631516"
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="260631516"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2021 23:27:53 -0700
IronPort-SDR: ncA4KtMk03YzcOAur32KLeqy405tKYTSpZFTBWNtoJCPdSejTGKpUomEsU9+Y5kYsf6vYi/gbe
 Pmv0q5d5kXSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="391281204"
Received: from icx-2s.bj.intel.com ([10.240.192.119])
 by orsmga003.jf.intel.com with ESMTP; 10 May 2021 23:27:52 -0700
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 13/32] linux-headers: Add placeholder for
 KVM_CAP_SGX_ATTRIBUTE
Date: Tue, 11 May 2021 14:20:32 +0800
Message-Id: <20210511062051.41948-14-yang.zhong@intel.com>
X-Mailer: git-send-email 2.29.2.334.gfaefdd61ec
In-Reply-To: <20210511062051.41948-1-yang.zhong@intel.com>
References: <20210511062051.41948-1-yang.zhong@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.31; envelope-from=yang.zhong@intel.com;
 helo=mga06.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: yang.zhong@intel.com, pbonzini@redhat.com, kai.huang@intel.com,
 seanjc@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Sean Christopherson <sean.j.christopherson@intel.com>

KVM_CAP_SGX_ATTRIBUTE is a proposed capability for Intel SGX that can be
used by userspace to enable privileged attributes, e.g. access to the
PROVISIONKEY.

Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
Signed-off-by: Yang Zhong <yang.zhong@intel.com>

v1-->v2:
   - Changed the KVM_CAP_SGX_ATTRIBUTE from 195 to 196(Kai).
---
 linux-headers/linux/kvm.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
index 020b62a619..5dfe7e97fb 100644
--- a/linux-headers/linux/kvm.h
+++ b/linux-headers/linux/kvm.h
@@ -1056,6 +1056,7 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_ENFORCE_PV_FEATURE_CPUID 190
 #define KVM_CAP_SYS_HYPERV_CPUID 191
 #define KVM_CAP_DIRTY_LOG_RING 192
+#define KVM_CAP_SGX_ATTRIBUTE 196
 
 #ifdef KVM_CAP_IRQ_ROUTING
 
-- 
2.29.2.334.gfaefdd61ec


