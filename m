Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95145DFE7B
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Oct 2019 09:41:27 +0200 (CEST)
Received: from localhost ([::1]:51146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMonG-000516-GW
	for lists+qemu-devel@lfdr.de; Tue, 22 Oct 2019 03:41:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40888)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cathy.zhang@intel.com>) id 1iMolA-0003gl-1r
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 03:39:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cathy.zhang@intel.com>) id 1iMol8-0004A5-Sa
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 03:39:15 -0400
Received: from mga11.intel.com ([192.55.52.93]:62451)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cathy.zhang@intel.com>)
 id 1iMol8-000485-L8
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 03:39:14 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Oct 2019 00:39:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,326,1566889200"; d="scan'208";a="209615713"
Received: from unknown (HELO localhost.localdomain.bj.intel.com)
 ([10.238.156.101])
 by fmsmga001.fm.intel.com with ESMTP; 22 Oct 2019 00:39:06 -0700
From: Cathy Zhang <cathy.zhang@intel.com>
To: qemu-devel@nongnu.org
Subject: [Resend PATCH 2/3] i386: Add macro for stibp
Date: Tue, 22 Oct 2019 15:35:27 +0800
Message-Id: <1571729728-23284-3-git-send-email-cathy.zhang@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1571729728-23284-1-git-send-email-cathy.zhang@intel.com>
References: <1571729728-23284-1-git-send-email-cathy.zhang@intel.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.93
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
Cc: Cathy Zhang <cathy.zhang@intel.com>, pbonzini@redhat.com,
 ehabkost@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

stibp feature is already added through the following commit.
https://github.com/qemu/qemu/commit/0e8916582991b9fd0b94850a8444b8b80d0a0955

Add a macro for it to allow CPU models to report it when host supports.

Signed-off-by: Cathy Zhang <cathy.zhang@intel.com>
Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
Reviewed-by: Tao Xu <tao3.xu@intel.com>
---
 target/i386/cpu.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index e757149..8f8efd7 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -717,6 +717,8 @@ typedef uint64_t FeatureWordArray[FEATURE_WORDS];
 #define CPUID_7_0_EDX_AVX512_4VNNIW (1U << 2) /* AVX512 Neural Network Instructions */
 #define CPUID_7_0_EDX_AVX512_4FMAPS (1U << 3) /* AVX512 Multiply Accumulation Single Precision */
 #define CPUID_7_0_EDX_SPEC_CTRL     (1U << 26) /* Speculation Control */
+/* Single Thread Indirect Branch Predictors */
+#define CPUID_7_0_EDX_STIBP     (1U << 27)
 #define CPUID_7_0_EDX_ARCH_CAPABILITIES (1U << 29)  /*Arch Capabilities*/
 #define CPUID_7_0_EDX_CORE_CAPABILITY   (1U << 30)  /*Core Capability*/
 #define CPUID_7_0_EDX_SPEC_CTRL_SSBD  (1U << 31) /* Speculative Store Bypass Disable */
-- 
1.8.3.1


