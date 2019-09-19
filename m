Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1A1B7164
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Sep 2019 04:07:45 +0200 (CEST)
Received: from localhost ([::1]:36968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iAlrE-0000U9-3q
	for lists+qemu-devel@lfdr.de; Wed, 18 Sep 2019 22:07:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48914)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tao3.xu@intel.com>) id 1iAlqB-0008MT-5T
 for qemu-devel@nongnu.org; Wed, 18 Sep 2019 22:06:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tao3.xu@intel.com>) id 1iAlq9-0001Id-Mi
 for qemu-devel@nongnu.org; Wed, 18 Sep 2019 22:06:38 -0400
Received: from mga06.intel.com ([134.134.136.31]:10336)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tao3.xu@intel.com>) id 1iAlq9-0001Gj-FC
 for qemu-devel@nongnu.org; Wed, 18 Sep 2019 22:06:37 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Sep 2019 19:06:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,522,1559545200"; d="scan'208";a="362368649"
Received: from tao-optiplex-7060.sh.intel.com ([10.239.159.36])
 by orsmga005.jf.intel.com with ESMTP; 18 Sep 2019 19:06:32 -0700
From: Tao Xu <tao3.xu@intel.com>
To: pbonzini@redhat.com,
	rth@twiddle.net,
	ehabkost@redhat.com
Date: Thu, 19 Sep 2019 10:06:29 +0800
Message-Id: <20190919020629.26530-1-tao3.xu@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.31
Subject: [Qemu-devel] [PATCH] target/i386: Correct extra enter and spaces in
 comment
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
Cc: Tao Xu <tao3.xu@intel.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is an extra line in comment of CPUID_8000_0008_EBX_WBNOINVD,
remove the extra enter and spaces.

Signed-off-by: Tao Xu <tao3.xu@intel.com>
---
 target/i386/cpu.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 5f6e3a029a..71b6193390 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -695,8 +695,7 @@ typedef uint32_t FeatureWordArray[FEATURE_WORDS];
 
 #define CPUID_7_1_EAX_AVX512_BF16 (1U << 5) /* AVX512 BFloat16 Instruction */
 
-#define CPUID_8000_0008_EBX_WBNOINVD  (1U << 9)  /* Write back and
-                                                                             do not invalidate cache */
+#define CPUID_8000_0008_EBX_WBNOINVD (1U << 9) /* Write back and do not invalidate cache */
 #define CPUID_8000_0008_EBX_IBPB    (1U << 12) /* Indirect Branch Prediction Barrier */
 
 #define CPUID_XSAVE_XSAVEOPT   (1U << 0)
-- 
2.20.1


