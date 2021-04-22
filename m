Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CEBA367CBF
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 10:44:19 +0200 (CEST)
Received: from localhost ([::1]:52478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZUwb-0002Jh-UB
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 04:44:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1lZUul-0001oe-8W; Thu, 22 Apr 2021 04:42:24 -0400
Received: from mga05.intel.com ([192.55.52.43]:16699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1lZUua-0006ic-PA; Thu, 22 Apr 2021 04:42:22 -0400
IronPort-SDR: FwfY1z9qqkH6io3mvV4q8JVn1Dp599o9jpKqArIFow9l8xv0MQfVf/NPywm0Yt4Uy+C9t7tA9s
 FbGiJnHEp2eg==
X-IronPort-AV: E=McAfee;i="6200,9189,9961"; a="281180125"
X-IronPort-AV: E=Sophos;i="5.82,242,1613462400"; d="scan'208";a="281180125"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2021 01:42:07 -0700
IronPort-SDR: A4IJSmeMoGI5J+XWiEt0FbeoLivV/wUGohddWGjN6OEO5982eB2EYlu8fQQ3Qbpt0ynvLMzHo7
 SNPfvA3c+bFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,242,1613462400"; d="scan'208";a="463877380"
Received: from sqa-gate.sh.intel.com (HELO robert-ivt.tsp.org)
 ([10.239.48.212])
 by orsmga001.jf.intel.com with ESMTP; 22 Apr 2021 01:42:04 -0700
From: Robert Hoo <robert.hu@linux.intel.com>
To: mjt@tls.msk.ru,
	laurent@vivier.eu,
	qemu-trivial@nongnu.org
Subject: [Trivial] docs: More precisely describe memory-backend-*::id's user
Date: Thu, 22 Apr 2021 16:42:02 +0800
Message-Id: <1619080922-83527-1-git-send-email-robert.hu@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Received-SPF: none client-ip=192.55.52.43;
 envelope-from=robert.hu@linux.intel.com; helo=mga05.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: robert.hu@intel.com, qemu-devel@nongnu.org,
 Robert Hoo <robert.hu@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

'id' of memory-backend-{file,ram} is not only for '-numa''s reference, but
also other parameters like '-device nvdimm'.
More clearly call out this to avoid misinterpretation.

Signed-off-by: Robert Hoo <robert.hu@linux.intel.com>
---
 qemu-options.hx | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index fd21002..635dc8a 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4508,11 +4508,11 @@ SRST
         the guest RAM with huge pages.
 
         The ``id`` parameter is a unique ID that will be used to
-        reference this memory region when configuring the ``-numa``
-        argument.
+        reference this memory region in other parameters, e.g. ``-numa``,
+        ``-device nvdimm``, etc.
 
         The ``size`` option provides the size of the memory region, and
-        accepts common suffixes, eg ``500M``.
+        accepts common suffixes, e.g. ``500M``.
 
         The ``mem-path`` provides the path to either a shared memory or
         huge page filesystem mount.
-- 
1.8.3.1


