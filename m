Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D531F6026
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Jun 2020 04:50:02 +0200 (CEST)
Received: from localhost ([::1]:52246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jjDI1-0007dl-Pd
	for lists+qemu-devel@lfdr.de; Wed, 10 Jun 2020 22:50:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1jjDGS-0006Qw-EA
 for qemu-devel@nongnu.org; Wed, 10 Jun 2020 22:48:24 -0400
Received: from mga17.intel.com ([192.55.52.151]:30725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1jjDGR-0003Vi-FL
 for qemu-devel@nongnu.org; Wed, 10 Jun 2020 22:48:24 -0400
IronPort-SDR: VUK6NQKiRnGmub77MIkR5E6AwVJnpLi7wicYb2KcQ3COZt63EAf4Fl7JtMUS4GwOuea/stpfb9
 yBy8OvNr+/GQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2020 19:48:21 -0700
IronPort-SDR: niSxMeSwORaLCTWIJFQE3jZVxwNTQrRZ+EOkyVylLmIMH06dbh+OxB0XvA60TZ9R3B3oZF9mzF
 nXHw0Ic75Izw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,498,1583222400"; d="scan'208";a="275183966"
Received: from sqa-gate.sh.intel.com (HELO robert-ivt.tsp.org)
 ([10.239.48.212])
 by orsmga006.jf.intel.com with ESMTP; 10 Jun 2020 19:48:19 -0700
From: Robert Hoo <robert.hu@linux.intel.com>
To: pbonzini@redhat.com, rth@twiddle.net, ehabkost@redhat.com,
 eblake@redhat.com, armbru@redhat.com
Subject: [PATCH v2 2/2] Mark Icelake-Client CPU models deprecated
Date: Thu, 11 Jun 2020 10:47:56 +0800
Message-Id: <1591843676-102054-2-git-send-email-robert.hu@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1591843676-102054-1-git-send-email-robert.hu@linux.intel.com>
References: <1591843676-102054-1-git-send-email-robert.hu@linux.intel.com>
Received-SPF: none client-ip=192.55.52.151;
 envelope-from=robert.hu@linux.intel.com; helo=mga17.intel.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/10 22:48:22
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=_AUTOLEARN
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

(No changes in v2)

Signed-off-by: Robert Hoo <robert.hu@linux.intel.com>
---
 target/i386/cpu.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 0d8638a..47a11b5 100644
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


