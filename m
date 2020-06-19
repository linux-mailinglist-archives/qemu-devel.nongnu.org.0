Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2E62002C4
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Jun 2020 09:32:57 +0200 (CEST)
Received: from localhost ([::1]:43198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jmBWC-0001zD-R9
	for lists+qemu-devel@lfdr.de; Fri, 19 Jun 2020 03:32:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1jmBT4-0005kh-I9
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 03:29:42 -0400
Received: from mga04.intel.com ([192.55.52.120]:38788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1jmBT2-0002VH-OB
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 03:29:42 -0400
IronPort-SDR: thHoFufNwD+QxYn6BllI45MvOBICK0a+DTxCI7B/bQQLmtlQ9G9Gv79N/+x/mofbyVezy1r77+
 ZDWA0rRZlMKQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9656"; a="140406134"
X-IronPort-AV: E=Sophos;i="5.75,254,1589266800"; d="scan'208";a="140406134"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2020 00:29:39 -0700
IronPort-SDR: gpTV0PnFiCSGOAGaeB2DPWS2aCU/UBF1WKCdVRNaH1VBTJg5ltBCYxAv4ElhrwZUytm9A9/xXM
 RfEGc1z4WkFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,254,1589266800"; d="scan'208";a="292040641"
Received: from chenyi-pc.sh.intel.com ([10.239.159.72])
 by orsmga002.jf.intel.com with ESMTP; 19 Jun 2020 00:29:37 -0700
From: Chenyi Qiang <chenyi.qiang@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH v5 4/4] target/i386: modify Icelake-Server CPU model number
Date: Fri, 19 Jun 2020 15:31:14 +0800
Message-Id: <20200619073114.24303-5-chenyi.qiang@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200619073114.24303-1-chenyi.qiang@intel.com>
References: <20200619073114.24303-1-chenyi.qiang@intel.com>
Received-SPF: pass client-ip=192.55.52.120;
 envelope-from=chenyi.qiang@intel.com; helo=mga04.intel.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/19 03:29:31
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Xiaoyao Li <xiaoyao.li@intel.com>, qemu-devel@nongnu.org,
 Robert Hoo <robert.hu@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

According to the Intel Icelake family list, Icelake-Server uses model
number 106(0x6A).

Signed-off-by: Chenyi Qiang <chenyi.qiang@intel.com>
---
 target/i386/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 3c81ca543f..f919607fa0 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -3384,7 +3384,7 @@ static X86CPUDefinition builtin_x86_defs[] = {
         .level = 0xd,
         .vendor = CPUID_VENDOR_INTEL,
         .family = 6,
-        .model = 134,
+        .model = 106,
         .stepping = 0,
         .features[FEAT_1_EDX] =
             CPUID_VME | CPUID_SSE2 | CPUID_SSE | CPUID_FXSR | CPUID_MMX |
-- 
2.17.1


