Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48EF558C560
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 11:17:00 +0200 (CEST)
Received: from localhost ([::1]:41802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oKysb-0003IU-HT
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 05:16:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1oKyaz-0005JD-Bs
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 04:58:46 -0400
Received: from mga09.intel.com ([134.134.136.24]:15910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1oKyax-0001oF-MI
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 04:58:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659949123; x=1691485123;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=olqPZCDG0zJY+g1ql2sCjZxihnCwsiEFNj0e/7YKKis=;
 b=mRiNyw6UHNcH/zM1yMYe0ADqmL/e2bz9JfOAI7GTjJUM4mE2NI0kWB7G
 44PExRyQddgi+CKnrhvHZ1jgDP5Lnf3dBZ8Sa4Xnbdgt+HtCckzjdS4NB
 Oh1N5c9LxmFxFzDnbIwsDKA1xI7kL2AgQy9SIP5gS0tPu+pJcA/pMzlqU
 74QJMwKt4qRXzH//10avNP3rIbt6wtMJTCJMFVbjkCNWygv4YiYUEHhSy
 fncTtHLNHwIdzNpyHjYnDpFL+piCu5CulIwwU9IWtTuYj6RXBQKuI/V+e
 n+K4SDzTryDUU+0Dbj3JOZS4KvWTtL4uVJiK8cysvKKvzKIBeQWZIGkn8 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10432"; a="291319256"
X-IronPort-AV: E=Sophos;i="5.93,221,1654585200"; d="scan'208";a="291319256"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2022 01:58:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,221,1654585200"; d="scan'208";a="931970585"
Received: from lxy-dell.sh.intel.com ([10.239.48.38])
 by fmsmga005.fm.intel.com with ESMTP; 08 Aug 2022 01:58:40 -0700
From: Xiaoyao Li <xiaoyao.li@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>
Cc: qemu-devel@nongnu.org,
	kvm@vger.kernel.org
Subject: [PATCH v2 4/8] target/i386/intel-pt: print special message for
 INTEL_PT_ADDR_RANGES_NUM
Date: Mon,  8 Aug 2022 16:58:30 +0800
Message-Id: <20220808085834.3227541-5-xiaoyao.li@intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220808085834.3227541-1-xiaoyao.li@intel.com>
References: <20220808085834.3227541-1-xiaoyao.li@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.24; envelope-from=xiaoyao.li@intel.com;
 helo=mga09.intel.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Bit[2:0] of CPUID.14H_01H:EAX stands as a whole for the number of INTEL
PT ADDR RANGES. For unsupported value that exceeds what KVM reports,
report it as a whole in mark_unavailable_features() as well.

Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
---
 target/i386/cpu.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 8b74d18c127f..dc0c1bbcbb16 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -4385,7 +4385,14 @@ static void mark_unavailable_features(X86CPU *cpu, FeatureWord w, uint64_t mask,
         return;
     }
 
-    for (i = 0; i < 64; ++i) {
+    if ((w == FEAT_14_1_EAX) && (mask & INTEL_PT_ADDR_RANGES_NUM_MASK)) {
+        warn_report("%s: CPUID.14H_01H:EAX [bit 2:0]", verbose_prefix);
+        i = 3;
+    } else {
+        i = 0;
+    }
+
+    for (; i < 64; ++i) {
         if ((1ULL << i) & mask) {
             g_autofree char *feat_word_str = feature_word_description(f, i);
             warn_report("%s: %s%s%s [bit %d]",
-- 
2.27.0


