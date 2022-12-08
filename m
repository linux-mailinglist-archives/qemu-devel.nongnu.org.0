Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D91864691E
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 07:27:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3ALp-0000jQ-U7; Thu, 08 Dec 2022 01:25:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1p3ALZ-0000hk-N8
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 01:25:29 -0500
Received: from mga17.intel.com ([192.55.52.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1p3ALX-0005NS-IH
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 01:25:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670480727; x=1702016727;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=P1e98jpmiSmmJIjh1aftNejYNigw3c/QIJS1mkpRlYQ=;
 b=YkHYuFO7kBp6iZQUqeT/Bc7NcFx9EYFcMsFuMXJ5/jGFSw4rgL47pr+5
 3cTB0AX1JjWaIC9/nizrb4lTNBXsVy38Rtcp3LHAPUtxZ0pV2CNwmodMP
 53bYCVOdK2KPMaQwa8r8mGy5dNYsL+6WEW2V5UKCkN8jVAJBnhSSTUi7R
 Rl0Sqb57CGqqemK2aCwJbwcnof2GbiW9O1Ld+EMkAngRgb6k4A9KA+B6P
 qsN6b0EEJstA7JFe0xoXl39trKNYK6WWZ6MwY3+yo6jnxkXp4asH7YI4O
 ud28D0kQ6KlspwiJL9vjFNPDXAvIQ1UrcTTS1PdVNgTrifHsUK9/rtje4 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="297444466"
X-IronPort-AV: E=Sophos;i="5.96,226,1665471600"; d="scan'208";a="297444466"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2022 22:25:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="679413412"
X-IronPort-AV: E=Sophos;i="5.96,227,1665471600"; d="scan'208";a="679413412"
Received: from lxy-dell.sh.intel.com ([10.239.48.100])
 by orsmga001.jf.intel.com with ESMTP; 07 Dec 2022 22:25:21 -0800
From: Xiaoyao Li <xiaoyao.li@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>
Cc: qemu-devel@nongnu.org,
	kvm@vger.kernel.org,
	xiaoyao.li@intel.com
Subject: [PATCH v3 4/8] target/i386/intel-pt: print special message for
 INTEL_PT_ADDR_RANGES_NUM
Date: Thu,  8 Dec 2022 14:25:09 +0800
Message-Id: <20221208062513.2589476-5-xiaoyao.li@intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20221208062513.2589476-1-xiaoyao.li@intel.com>
References: <20221208062513.2589476-1-xiaoyao.li@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.151; envelope-from=xiaoyao.li@intel.com;
 helo=mga17.intel.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=0.999, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Bit[2:0] of CPUID.14H_01H:EAX stands as a whole for the number of INTEL
PT ADDR RANGES. For unsupported value that exceeds what KVM reports,
report it as a whole in mark_unavailable_features() as well.

Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
---
 target/i386/cpu.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 65c6f8ae771a..4d7beccc0af7 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -4387,7 +4387,14 @@ static void mark_unavailable_features(X86CPU *cpu, FeatureWord w, uint64_t mask,
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


