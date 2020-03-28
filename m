Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC58196346
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Mar 2020 04:06:41 +0100 (CET)
Received: from localhost ([::1]:49604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jI1o0-00046k-Pr
	for lists+qemu-devel@lfdr.de; Fri, 27 Mar 2020 23:06:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55486)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <chenyi.qiang@intel.com>) id 1jI1mp-0002ok-Uf
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 23:05:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <chenyi.qiang@intel.com>) id 1jI1mo-0004Of-V5
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 23:05:27 -0400
Received: from mga12.intel.com ([192.55.52.136]:6621)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <chenyi.qiang@intel.com>)
 id 1jI1mo-0003if-Kd
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 23:05:26 -0400
IronPort-SDR: FjBJezPUKwmXuSe/YUtwT3EAMDxV7q31sBOwDuS8CSRv0wbnFTfmeRl9kbhloKOOqnD3nR6G8O
 cwtMNqDE+ukg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2020 20:05:26 -0700
IronPort-SDR: E6xUX6bHhwz0NAifiT25F9XlqR9f99ez9esiTB424WnLAYjqUYHkLZm/IjpwrCS5/MirCV5YUw
 /umKFFpwaWcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,314,1580803200"; d="scan'208";a="421319479"
Received: from chenyi-pc.sh.intel.com ([10.239.159.72])
 by orsmga005.jf.intel.com with ESMTP; 27 Mar 2020 20:05:24 -0700
From: Chenyi Qiang <chenyi.qiang@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH v2 4/4] target/i386: modify Icelake-Client and Icelake-Server
 CPU model number
Date: Sat, 28 Mar 2020 11:06:25 +0800
Message-Id: <20200328030625.16428-5-chenyi.qiang@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200328030625.16428-1-chenyi.qiang@intel.com>
References: <20200328030625.16428-1-chenyi.qiang@intel.com>
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 192.55.52.136
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

According to the Intel Icelake family list, Icelake-Client uses model
number 125(0x7D) and Icelake-Server uses model number 106(0x6A).

Signed-off-by: Chenyi Qiang <chenyi.qiang@intel.com>
---
 target/i386/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index babb074abf..5bd52f2c4b 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -3328,7 +3328,7 @@ static X86CPUDefinition builtin_x86_defs[] = {
         .level = 0xd,
         .vendor = CPUID_VENDOR_INTEL,
         .family = 6,
-        .model = 126,
+        .model = 125,
         .stepping = 0,
         .features[FEAT_1_EDX] =
             CPUID_VME | CPUID_SSE2 | CPUID_SSE | CPUID_FXSR | CPUID_MMX |
@@ -3441,7 +3441,7 @@ static X86CPUDefinition builtin_x86_defs[] = {
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


