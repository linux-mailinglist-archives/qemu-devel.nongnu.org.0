Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 766D34C5A1
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jun 2019 04:44:55 +0200 (CEST)
Received: from localhost ([::1]:43272 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdn4I-0001EL-2d
	for lists+qemu-devel@lfdr.de; Wed, 19 Jun 2019 22:44:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56437)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hdn1p-0007R3-A6
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 22:42:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hdmxw-0004CQ-Dj
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 22:38:22 -0400
Received: from mga14.intel.com ([192.55.52.115]:48458)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1hdmxv-00049v-0L
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 22:38:20 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Jun 2019 19:38:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,395,1557212400"; d="scan'208";a="311526628"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by orsmga004.jf.intel.com with ESMTP; 19 Jun 2019 19:38:12 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Thu, 20 Jun 2019 10:37:46 +0800
Message-Id: <20190620023746.9869-1-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.115
Subject: [Qemu-devel] [PATCH] x86/cpu: use FeatureWordArray to define
 filtered_features
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
Cc: pbonzini@redhat.com, Wei Yang <richardw.yang@linux.intel.com>,
 ehabkost@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the same definition as features/user_features in CPUX86State.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
---
 target/i386/cpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 0732e059ec..fd5ff13817 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1413,7 +1413,7 @@ struct X86CPU {
     } mwait;
 
     /* Features that were filtered out because of missing host capabilities */
-    uint32_t filtered_features[FEATURE_WORDS];
+    FeatureWordArray filtered_features;
 
     /* Enable PMU CPUID bits. This can't be enabled by default yet because
      * it doesn't have ABI stability guarantees, as it passes all PMU CPUID
-- 
2.19.1


