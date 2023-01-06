Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5849965FD24
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 09:54:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDiFc-00067x-DJ; Fri, 06 Jan 2023 03:38:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei4.wang@intel.com>)
 id 1pDiF3-00060w-Va
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 03:38:22 -0500
Received: from mga05.intel.com ([192.55.52.43])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei4.wang@intel.com>)
 id 1pDiF2-0008Nh-7m
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 03:38:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672994300; x=1704530300;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xDBR1AIofbX/BZeIfhHGjpPVbPt6SRoBtioaVSfH/7A=;
 b=Z/Re5OVTq3DbhYW6U8Dp016pyEHMJsbC4VO6nUmv1f1Y6xCGXoHr+L1N
 RChm6M/Nz26iR05fKXkqGFcFAr/F51a2l4Z2oTCf0Clfyfo4ut0lIlo7U
 Zl5KfenT9P0FG6kl1DKht/dMJVEv+t7Kgf/yGKaC/Mng/AV8pqUT2aL/i
 FuZVUgOeY7SySchNkeckegv6ja3lyypbtSd8T8Ai+WYibOFpI4UpY3AW4
 x13VPYJPOk0yIjaGwsmPbKY8JyFBfXzCN4ipMK2AVWq+sqFyxhoVttgdS
 LBbO2adQZiPXWPegvWdUH9wulPsC7jWenxfsIfZqPuXLvKoZD20pusOOW A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10581"; a="408688485"
X-IronPort-AV: E=Sophos;i="5.96,304,1665471600"; d="scan'208";a="408688485"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2023 00:38:13 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10581"; a="724378827"
X-IronPort-AV: E=Sophos;i="5.96,304,1665471600"; d="scan'208";a="724378827"
Received: from sdp.sh.intel.com ([10.112.228.155])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2023 00:38:11 -0800
From: Lei Wang <lei4.wang@intel.com>
To: pbonzini@redhat.com
Cc: qemu-devel@nongnu.org, imammedo@redhat.com, dgilbert@redhat.com,
 berrange@redhat.com, xiaoyao.li@intel.com, yang.zhong@linux.intel.com,
 lei4.wang@intel.com
Subject: [PATCH v3 2/6] i386: Remove unused parameter "uint32_t bit" in
 feature_word_description()
Date: Fri,  6 Jan 2023 00:38:22 -0800
Message-Id: <20230106083826.5384-3-lei4.wang@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230106083826.5384-1-lei4.wang@intel.com>
References: <20230106083826.5384-1-lei4.wang@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.43; envelope-from=lei4.wang@intel.com;
 helo=mga05.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Parameter "uint32_t bit" is not used in function feature_word_description(),
so remove it.

Signed-off-by: Lei Wang <lei4.wang@intel.com>
---
 target/i386/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index b6d1247e5e..883098bc5a 100644
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


