Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9330A493350
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 04:08:25 +0100 (CET)
Received: from localhost ([::1]:48470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nA1Ki-0006cZ-51
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 22:08:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nA1Hp-0005e3-7c
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 22:05:31 -0500
Received: from mga14.intel.com ([192.55.52.115]:9703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nA1Hk-00008h-Tq
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 22:05:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642561520; x=1674097520;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cuvNOEj/LdFq3TwtXNzWFkqkZ5U9EFKGfieVF/dhCjQ=;
 b=bkyDC3O3FfMK7omgBU6Md1uK1iOnqmAYjv63Xi1x4dptl65YFYt2un6j
 d/oBUgnFjEJo0MBW59zkQM95KSKouPjnGJDtexViSzMg7nXwFu8guesjl
 mBSMnK0AuWlvGI0acCDK3pgqdN+GwdovAp2VVM6XbguJvTTBov1cpqjOd
 /qVlUhxhyu/hOkQ6K0fWqiPnWBGPT28i8bD4Y1Go+sBAFcnMNrAm+XP6F
 pzWDJDalIs7bVMvIoJAm5MX8OBGdCpZQd++xhxGHeAE16N90arshkF3/3
 h3BVIXfkglMQ50APWzIyySekfz7e/ykpDa7IHKck1MyQ0ztITH2u4nDZm w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10231"; a="245166577"
X-IronPort-AV: E=Sophos;i="5.88,298,1635231600"; d="scan'208";a="245166577"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2022 19:05:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,298,1635231600"; d="scan'208";a="532066576"
Received: from icx.bj.intel.com ([10.240.192.117])
 by orsmga008.jf.intel.com with ESMTP; 18 Jan 2022 19:05:11 -0800
From: Yang Zhong <yang.zhong@intel.com>
To: pbonzini@redhat.com,
	berrange@redhat.com
Subject: [PATCH] qapi: Cleanup SGX related comments
Date: Wed, 19 Jan 2022 07:00:14 -0500
Message-Id: <20220119120014.342180-1-yang.zhong@intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.115; envelope-from=yang.zhong@intel.com;
 helo=mga14.intel.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DATE_IN_FUTURE_06_12=1.947,
 DKIMWL_WL_HIGH=-0.7, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: yang.zhong@intel.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The SGX NUMA patches were merged into Qemu 7.0 release, we need
clarify detailed version history information and also change
some related comments, which make SGX related comments clearer.

Signed-off-by: Yang Zhong <yang.zhong@intel.com>
---
 qapi/machine.json     |  4 ++--
 qapi/misc-target.json | 14 +++++++++-----
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/qapi/machine.json b/qapi/machine.json
index b6a37e17c4..cf47cb63a9 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1207,7 +1207,7 @@
 #
 # @memdev: memory backend linked with device
 #
-# @node: the numa node
+# @node: the numa node (Since: 7.0)
 #
 # Since: 6.2
 ##
@@ -1288,7 +1288,7 @@
 #
 # @memdev: memory backend linked with device
 #
-# @node: the numa node
+# @node: the numa node (Since: 7.0)
 #
 # Since: 6.2
 ##
diff --git a/qapi/misc-target.json b/qapi/misc-target.json
index 1022aa0184..558521bd39 100644
--- a/qapi/misc-target.json
+++ b/qapi/misc-target.json
@@ -344,9 +344,9 @@
 #
 # @node: the numa node
 #
-# @size: the size of epc section
+# @size: the size of EPC section
 #
-# Since: 6.2
+# Since: 7.0
 ##
 { 'struct': 'SGXEPCSection',
   'data': { 'node': 'int',
@@ -365,7 +365,7 @@
 #
 # @flc: true if FLC is supported
 #
-# @sections: The EPC sections info for guest
+# @sections: The EPC sections info for guest(Since: 7.0)
 #
 # Since: 6.2
 ##
@@ -390,7 +390,9 @@
 #
 # -> { "execute": "query-sgx" }
 # <- { "return": { "sgx": true, "sgx1" : true, "sgx2" : true,
-#                  "flc": true, "section-size" : 0 } }
+#                  "flc": true,  "sections":
+#                  [{"node": 0, "size": 67108864},
+#                  {"node": 1, "size": 29360128}]} }
 #
 ##
 { 'command': 'query-sgx', 'returns': 'SGXInfo', 'if': 'TARGET_I386' }
@@ -408,7 +410,9 @@
 #
 # -> { "execute": "query-sgx-capabilities" }
 # <- { "return": { "sgx": true, "sgx1" : true, "sgx2" : true,
-#                  "flc": true, "section-size" : 0 } }
+#                  "flc": true, "section" :
+#                  [{"node": 0, "size": 67108864},
+#                  {"node": 1, "size": 29360128}]} }
 #
 ##
 { 'command': 'query-sgx-capabilities', 'returns': 'SGXInfo', 'if': 'TARGET_I386' }

