Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1391ECEE1
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Jun 2020 13:48:43 +0200 (CEST)
Received: from localhost ([::1]:46704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jgRsw-0005yj-Mc
	for lists+qemu-devel@lfdr.de; Wed, 03 Jun 2020 07:48:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1jgRrn-0004iV-Nq
 for qemu-devel@nongnu.org; Wed, 03 Jun 2020 07:47:31 -0400
Received: from mga03.intel.com ([134.134.136.65]:46654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1jgRrm-0002y4-Fg
 for qemu-devel@nongnu.org; Wed, 03 Jun 2020 07:47:31 -0400
IronPort-SDR: sdaMFo4kfBhD8ZfBXZ0CkwquBsp4VacMi1wh6zSf7dpaw+ePDiaZ04tWFC7HyfvDua0LjmgVip
 BJKcWUD6jmwA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2020 04:47:26 -0700
IronPort-SDR: Jpmr2lN0RAxFiS1Lgvm8akkWybml+3tSGhL2qsbQ50JRWwVfAp20Jvx6zQLHP4kQah6kbpOHnZ
 NAHtnw03mX5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,467,1583222400"; d="scan'208";a="304582619"
Received: from sqa-gate.sh.intel.com (HELO robert-ivt.tsp.org)
 ([10.239.48.212])
 by orsmga008.jf.intel.com with ESMTP; 03 Jun 2020 04:47:23 -0700
From: Robert Hoo <robert.hu@linux.intel.com>
To: pbonzini@redhat.com, rth@twiddle.net, ehabkost@redhat.com,
 eblake@redhat.com, armbru@redhat.com
Subject: [PATCH 2/2] Mark Icelake-Client CPU models deprecated
Date: Wed,  3 Jun 2020 19:47:03 +0800
Message-Id: <1591184823-140846-2-git-send-email-robert.hu@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1591184823-140846-1-git-send-email-robert.hu@linux.intel.com>
References: <1591184823-140846-1-git-send-email-robert.hu@linux.intel.com>
Received-SPF: none client-ip=134.134.136.65;
 envelope-from=robert.hu@linux.intel.com; helo=mga03.intel.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/03 07:47:24
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
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
Cc: robert.hu@intel.com, Robert Hoo <robert.hu@linux.intel.com>,
 xiaoyao.li@intel.com, qemu-devel@nongnu.org, chenyi.qiang@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Going to obsolete Icelake-Client CPU models in the future.

Signed-off-by: Robert Hoo <robert.hu@linux.intel.com>
---
 target/i386/cpu.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index d7ac22f..6c34ea3 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -3350,7 +3350,12 @@ static X86CPUDefinition builtin_x86_defs[] = {
         .xlevel = 0x80000008,
         .model_id = "Intel Core Processor (Icelake)",
         .versions = (X86CPUVersionDefinition[]) {
-            { .version = 1 },
+            {
+                .version = 1,
+                .deprecated = true,
+                .note = "Deprecated. Will be obsoleted in v5.1. Please use "
+                        "'Icelake-Server-v1' CPU model",
+            },
             {
                 .version = 2,
                 .alias = "Icelake-Client-noTSX",
@@ -3359,6 +3364,9 @@ static X86CPUDefinition builtin_x86_defs[] = {
                     { "rtm", "off" },
                     { /* end of list */ }
                 },
+                .deprecated = true,
+                .note = "Deprecated. Will be obsoleted in v5.1. Please use "
+                        "'Icelake-Server-v2' CPU model",
             },
             { /* end of list */ }
         }
-- 
1.8.3.1


