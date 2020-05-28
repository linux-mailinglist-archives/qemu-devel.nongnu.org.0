Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A76901E5702
	for <lists+qemu-devel@lfdr.de>; Thu, 28 May 2020 07:49:44 +0200 (CEST)
Received: from localhost ([::1]:58310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jeBQF-0001S0-Mr
	for lists+qemu-devel@lfdr.de; Thu, 28 May 2020 01:49:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vishal.l.verma@intel.com>)
 id 1jeBP9-0008HL-PP
 for qemu-devel@nongnu.org; Thu, 28 May 2020 01:48:35 -0400
Received: from mga02.intel.com ([134.134.136.20]:8380)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vishal.l.verma@intel.com>)
 id 1jeBP8-0001Lx-LU
 for qemu-devel@nongnu.org; Thu, 28 May 2020 01:48:35 -0400
IronPort-SDR: Bat73sddGypnrsmAS7pKztOkcIyFXGBeXmsMWjjpXKBvF3UJMFZziHPQSboyPMwpJGbmRFXLGh
 NohDuj5aIxvQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2020 22:48:30 -0700
IronPort-SDR: eMPVB18MqGJJNUnFAIVXxA1gudDfLLoPS03XwrY9eQdTnx6g7ROtX15gtY/yv7asMA0UnmrHf8
 thcmFMF+Y+SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,443,1583222400"; d="scan'208";a="255696222"
Received: from vverma7-mobl4.lm.intel.com ([10.251.137.143])
 by fmsmga007.fm.intel.com with ESMTP; 27 May 2020 22:48:30 -0700
From: Vishal Verma <vishal.l.verma@intel.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v2 1/3] diffs-allowed: add the SRAT AML to diffs-allowed
Date: Wed, 27 May 2020 23:48:05 -0600
Message-Id: <20200528054807.21278-2-vishal.l.verma@intel.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200528054807.21278-1-vishal.l.verma@intel.com>
References: <20200528054807.21278-1-vishal.l.verma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.20;
 envelope-from=vishal.l.verma@intel.com; helo=mga02.intel.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/28 01:48:29
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, jingqi.liu@intel.com,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Vishal Verma <vishal.l.verma@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In anticipation of a change to the SRAT generation in qemu, add the AML
file to diffs-allowed.

Signed-off-by: Vishal Verma <vishal.l.verma@intel.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..83d3ea5032 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,2 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/pc/SRAT.dimmpxm",
-- 
2.26.2


