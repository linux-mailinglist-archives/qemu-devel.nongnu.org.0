Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9295B60EDC7
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 04:09:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onsCx-0001dr-H9; Wed, 26 Oct 2022 22:01:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei4.wang@intel.com>)
 id 1onsCc-0001X1-OS
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 22:01:03 -0400
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei4.wang@intel.com>)
 id 1onsCZ-0004u8-M0
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 22:01:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666836059; x=1698372059;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lXnOrnrHZe3OJ6BeC65+VIIy20/ZTCijpfch6HkmVvo=;
 b=em3OX3i+xIM5vjfMxN0AOqZ20FCJ5xg6BaFFXCkfg9q4CWhUi533A81q
 hQfDN7P+A4zxRdKX39763Ngaab2tL496HGk3Qm6fb0td2wrS604MfKq/c
 RFBBL1SU4XGJaLuawsm34R8Ja996rfZYynLifPz1EQD1RSsRW1Kqdycq4
 +4m2aaijnFs1Qmgm9714iXNskHM8xZqntAglXTsW9SdxUXQNSjaCaPTbR
 qah3yjsfMfsDuZE6SIGBLyWLn7EYLG/OCe6Pk1YEQL7J6oW3Plz/mKTgN
 Lk5AjiO2NQfaWDGydsLHPGkm1k+iQ6fTNF804i01i2oDpKMUWScZ10SvG Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="370174870"
X-IronPort-AV: E=Sophos;i="5.95,215,1661842800"; d="scan'208";a="370174870"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2022 19:00:38 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="877407931"
X-IronPort-AV: E=Sophos;i="5.95,215,1661842800"; d="scan'208";a="877407931"
Received: from b49691a74b20.jf.intel.com ([10.45.76.123])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2022 19:00:37 -0700
From: "Wang, Lei" <lei4.wang@intel.com>
To: pbonzini@redhat.com
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com, berrange@redhat.com,
 xiaoyao.li@intel.com, yang.zhong@linux.intel.com
Subject: [PATCH 2/6] i386: Remove unused parameter "uint32_t bit" in
 feature_word_description()
Date: Wed, 26 Oct 2022 19:00:32 -0700
Message-Id: <20221027020036.373140-3-lei4.wang@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221027020036.373140-1-lei4.wang@intel.com>
References: <20221027020036.373140-1-lei4.wang@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.31; envelope-from=lei4.wang@intel.com;
 helo=mga06.intel.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Parameter "uint32_t bit" is not used in function feature_word_description(),
so remove it.

Signed-off-by: Wang, Lei <lei4.wang@intel.com>
---
 target/i386/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index e98780773c..0083a2a7f7 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -4290,7 +4290,7 @@ static const TypeInfo max_x86_cpu_type_info = {
     .class_init = max_x86_cpu_class_init,
 };
 
-static char *feature_word_description(FeatureWordInfo *f, uint32_t bit)
+static char *feature_word_description(FeatureWordInfo *f)
 {
     assert(f->type == CPUID_FEATURE_WORD || f->type == MSR_FEATURE_WORD);
 
@@ -4329,6 +4329,7 @@ static void mark_unavailable_features(X86CPU *cpu, FeatureWord w, uint64_t mask,
     CPUX86State *env = &cpu->env;
     FeatureWordInfo *f = &feature_word_info[w];
     int i;
+    g_autofree char *feat_word_str = feature_word_description(f);
 
     if (!cpu->force_features) {
         env->features[w] &= ~mask;
@@ -4341,7 +4342,6 @@ static void mark_unavailable_features(X86CPU *cpu, FeatureWord w, uint64_t mask,
 
     for (i = 0; i < 64; ++i) {
         if ((1ULL << i) & mask) {
-            g_autofree char *feat_word_str = feature_word_description(f, i);
             warn_report("%s: %s%s%s [bit %d]",
                         verbose_prefix,
                         feat_word_str,
-- 
2.34.1


