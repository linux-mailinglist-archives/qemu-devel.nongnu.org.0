Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36FB812A679
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Dec 2019 07:49:24 +0100 (CET)
Received: from localhost ([::1]:44338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ik0Tz-0006qr-BE
	for lists+qemu-devel@lfdr.de; Wed, 25 Dec 2019 01:49:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48368)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <xiaoyao.li@intel.com>) id 1ik0S1-0004jN-Uy
 for qemu-devel@nongnu.org; Wed, 25 Dec 2019 01:47:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <xiaoyao.li@intel.com>) id 1ik0S0-0007y2-BK
 for qemu-devel@nongnu.org; Wed, 25 Dec 2019 01:47:21 -0500
Received: from mga12.intel.com ([192.55.52.136]:64733)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <xiaoyao.li@intel.com>)
 id 1ik0S0-0007ri-2V
 for qemu-devel@nongnu.org; Wed, 25 Dec 2019 01:47:20 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Dec 2019 22:47:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,353,1571727600"; d="scan'208";a="219965387"
Received: from lxy-clx-4s.sh.intel.com ([10.239.43.57])
 by orsmga003.jf.intel.com with ESMTP; 24 Dec 2019 22:47:11 -0800
From: Xiaoyao Li <xiaoyao.li@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH 1/2] target/i386: Add new bit definitions of
 MSR_IA32_ARCH_CAPABILITIES
Date: Wed, 25 Dec 2019 14:30:17 +0800
Message-Id: <20191225063018.20038-2-xiaoyao.li@intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20191225063018.20038-1-xiaoyao.li@intel.com>
References: <20191225063018.20038-1-xiaoyao.li@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.136
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
Cc: Xiaoyao Li <xiaoyao.li@intel.com>, Cathy Zhang <cathy.zhang@intel.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The bit 6, 7 and 8 of MSR_IA32_ARCH_CAPABILITIES are recently disclosed
for some security issues. Add the definitions for them to be used by named
CPU models.

Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
---
 target/i386/cpu.h | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index af282936a785..594326a79467 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -835,12 +835,15 @@ typedef uint64_t FeatureWordArray[FEATURE_WORDS];
 #define CPUID_TOPOLOGY_LEVEL_DIE      (5U << 8)
 
 /* MSR Feature Bits */
-#define MSR_ARCH_CAP_RDCL_NO    (1U << 0)
-#define MSR_ARCH_CAP_IBRS_ALL   (1U << 1)
-#define MSR_ARCH_CAP_RSBA       (1U << 2)
+#define MSR_ARCH_CAP_RDCL_NO            (1U << 0)
+#define MSR_ARCH_CAP_IBRS_ALL           (1U << 1)
+#define MSR_ARCH_CAP_RSBA               (1U << 2)
 #define MSR_ARCH_CAP_SKIP_L1DFL_VMENTRY (1U << 3)
-#define MSR_ARCH_CAP_SSB_NO     (1U << 4)
-#define MSR_ARCH_CAP_MDS_NO     (1U << 5)
+#define MSR_ARCH_CAP_SSB_NO             (1U << 4)
+#define MSR_ARCH_CAP_MDS_NO             (1U << 5)
+#define MSR_ARCH_CAP_PSCHANGE_MC_NO     (1U << 6)
+#define MSR_ARCH_CAP_TSX_CTRL_MSR       (1U << 7)
+#define MSR_ARCH_CAP_TAA_NO             (1U << 8)
 
 #define MSR_CORE_CAP_SPLIT_LOCK_DETECT  (1U << 5)
 
-- 
2.19.1


