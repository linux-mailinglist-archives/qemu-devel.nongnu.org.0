Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7352DD4FB7
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Oct 2019 14:30:20 +0200 (CEST)
Received: from localhost ([::1]:32954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iJGXL-00064m-GX
	for lists+qemu-devel@lfdr.de; Sat, 12 Oct 2019 08:30:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47893)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cathy.zhang@intel.com>) id 1iJBRt-0001Gw-Rj
 for qemu-devel@nongnu.org; Sat, 12 Oct 2019 03:04:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cathy.zhang@intel.com>) id 1iJBRs-0001yy-AV
 for qemu-devel@nongnu.org; Sat, 12 Oct 2019 03:04:21 -0400
Received: from mga01.intel.com ([192.55.52.88]:29436)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cathy.zhang@intel.com>)
 id 1iJBRs-0001s3-2a
 for qemu-devel@nongnu.org; Sat, 12 Oct 2019 03:04:20 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Oct 2019 00:04:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,286,1566889200"; d="scan'208";a="197802829"
Received: from unknown (HELO localhost.localdomain.bj.intel.com)
 ([10.238.156.101])
 by orsmga003.jf.intel.com with ESMTP; 12 Oct 2019 00:04:13 -0700
From: Cathy Zhang <cathy.zhang@intel.com>
To: pbonzini@redhat.com,
	rth@twiddle.net,
	ehabkost@redhat.com
Subject: [PATCH 1/3] i386: Add MSR feature bit for MDS-NO
Date: Sat, 12 Oct 2019 15:00:36 +0800
Message-Id: <1570863638-22272-2-git-send-email-cathy.zhang@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1570863638-22272-1-git-send-email-cathy.zhang@intel.com>
References: <1570863638-22272-1-git-send-email-cathy.zhang@intel.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.88
X-Mailman-Approved-At: Sat, 12 Oct 2019 08:24:54 -0400
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
Cc: qemu-devel@nongnu.org, Cathy Zhang <cathy.zhang@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Define MSR_ARCH_CAP_MDS_NO in the IA32_ARCH_CAPABILITIES MSR to allow
CPU models to report the feature when host supports it.

Signed-off-by: Cathy Zhang <cathy.zhang@intel.com>
---
 target/i386/cpu.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index eaa5395..e757149 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -777,6 +777,7 @@ typedef uint64_t FeatureWordArray[FEATURE_WORDS];
 #define MSR_ARCH_CAP_RSBA       (1U << 2)
 #define MSR_ARCH_CAP_SKIP_L1DFL_VMENTRY (1U << 3)
 #define MSR_ARCH_CAP_SSB_NO     (1U << 4)
+#define MSR_ARCH_CAP_MDS_NO     (1U << 5)
 
 #define MSR_CORE_CAP_SPLIT_LOCK_DETECT  (1U << 5)
 
-- 
1.8.3.1


