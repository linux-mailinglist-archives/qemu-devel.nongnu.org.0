Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A7E314456
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 00:55:44 +0100 (CET)
Received: from localhost ([::1]:37752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9GNb-0005mB-L1
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 18:55:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1l9EYs-0006hW-Ax
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 16:59:14 -0500
Received: from mga02.intel.com ([134.134.136.20]:59483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1l9EYq-0005Gb-SA
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 16:59:14 -0500
IronPort-SDR: 7CZMYqfDSLe4W9Q08zEmGWodA80ZbVN1/QVGPnGCAI6e2I8Y0hjFJUwP38AStZjBt6GAZAPCb4
 0PgnQLS8OJ9Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9889"; a="168911421"
X-IronPort-AV: E=Sophos;i="5.81,163,1610438400"; d="scan'208";a="168911421"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2021 13:59:04 -0800
IronPort-SDR: oegboYgrOT+Buf/lHCjU8lq1V7hsBq5rYcwmBqQVoUTGhyU1TqVAfqNEgpJddERFSSIBDCu3dD
 2rXJ9q6Swe8w==
X-IronPort-AV: E=Sophos;i="5.81,163,1610438400"; d="scan'208";a="487608574"
Received: from ls.sc.intel.com (HELO localhost) ([143.183.96.54])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2021 13:59:04 -0800
From: isaku.yamahata@gmail.com
To: qemu-devel@nongnu.org, imammedo@redhat.com, mst@redhat.com,
 marcel.apfelbaum@gmail.com, philmd@redhat.com
Subject: [PATCH v2 1/9] checkpatch: don't emit warning on newly created acpi
 data files
Date: Mon,  8 Feb 2021 13:57:20 -0800
Message-Id: <6b90a62af91fb54e2db207490f3a6948bfe691ee.1612821109.git.isaku.yamahata@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1612821108.git.isaku.yamahata@intel.com>
References: <cover.1612821108.git.isaku.yamahata@intel.com>
In-Reply-To: <cover.1612821108.git.isaku.yamahata@intel.com>
References: <cover.1612821108.git.isaku.yamahata@intel.com>
Received-SPF: pass client-ip=134.134.136.20;
 envelope-from=isaku.yamahata@intel.com; helo=mga02.intel.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_ADSP_CUSTOM_MED=0.001,
 FORGED_GMAIL_RCVD=1, FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NML_ADSP_CUSTOM_MED=0.9,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Isaku Yamahata <isaku.yamahata@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Isaku Yamahata <isaku.yamahata@intel.com>

Newly created acpi data files(tests/data/acpi/) cause false positive
warning.
If file names are acpi expected file, don't emit warning.

Fixes: e625ba2a41 ("checkpatch: fix acpi check with multiple file name")
Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
---
 scripts/checkpatch.pl | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index e47ad878d8..40c9cc7def 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -1530,7 +1530,9 @@ sub process {
 		    ($line =~ /^(?:new|deleted) file mode\s*\d+\s*$/ ||
 		     $line =~ /^rename (?:from|to) [\w\/\.\-]+\s*$/ ||
 		     ($line =~ /\{\s*([\w\/\.\-]*)\s*\=\>\s*([\w\/\.\-]*)\s*\}/ &&
-		      (defined($1) || defined($2))))) {
+		      (defined($1) || defined($2)))) &&
+                      !(($realfile ne '') &&
+                        ($realfile eq $acpi_testexpected))) {
 			$reported_maintainer_file = 1;
 			WARN("added, moved or deleted file(s), does MAINTAINERS need updating?\n" . $herecurr);
 		}
-- 
2.17.1


