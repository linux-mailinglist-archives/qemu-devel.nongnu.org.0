Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C56A493D95
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 16:47:41 +0100 (CET)
Received: from localhost ([::1]:52440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nADBU-0004GK-2D
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 10:47:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nACU5-0006WD-85
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 10:02:50 -0500
Received: from mga04.intel.com ([192.55.52.120]:34879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nACU2-0006fc-5X
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 10:02:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642604566; x=1674140566;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/kkP/dFR5rAQjBQchQiQ9HxQtlORZNkgZTAPvjp+wIw=;
 b=OTaNifryIKpPhh7afP5UDMTDX4HLwg/N1pWJNwybjcSSozWLDoBZVFcd
 tSnM96l/nxDJXIZhv653fsoQBYJhS/bmL6N92Jz21LqYxr73Gs++8Oskd
 FLkWlNUql6zo8/2Ej+5pyRIOQQgE3IMvqsL92sJmitkP6QmGoXdnSFXEV
 1Bgu7QrkEcDvmriO2Ak49sN7ft7WfG9OEWt5lWGDFEXWuAR5Mr+cVQWcj
 FziMgiyxFybvaK8jBao/6S9ElwKJx1bhdnyxFOdyIvVcLKsaZ/g/M4M4X
 91dXDJ6UNiwjgRahhyuNOxFslE0tMQS6a2XnZp5PTG2YPVNmF8BQX/agv w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10231"; a="243905549"
X-IronPort-AV: E=Sophos;i="5.88,299,1635231600"; d="scan'208";a="243905549"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2022 07:02:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,299,1635231600"; d="scan'208";a="493052735"
Received: from icx.bj.intel.com ([10.240.192.117])
 by orsmga002.jf.intel.com with ESMTP; 19 Jan 2022 07:02:17 -0800
From: Yang Zhong <yang.zhong@intel.com>
To: pbonzini@redhat.com,
	berrange@redhat.com
Subject: [PATCH v2] qapi: Cleanup SGX related comments and restore
 @section-size
Date: Wed, 19 Jan 2022 18:57:20 -0500
Message-Id: <20220119235720.371961-1-yang.zhong@intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.120; envelope-from=yang.zhong@intel.com;
 helo=mga04.intel.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DATE_IN_FUTURE_06_12=1.947,
 DKIMWL_WL_HIGH=-0.7, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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

The QMP command schema promises backwards compatibility as standard.
We temporarily restore "@section-size", which can avoid incompatible
API breakage. The "@section-size" will be deprecated in 7.2 version.

Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Yang Zhong <yang.zhong@intel.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 qapi/machine.json     |  4 ++--
 qapi/misc-target.json | 17 ++++++++++++-----
 hw/i386/sgx.c         | 11 +++++++++--
 3 files changed, 23 insertions(+), 9 deletions(-)

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
index 1022aa0184..a87358ea44 100644
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
@@ -365,7 +365,9 @@
 #
 # @flc: true if FLC is supported
 #
-# @sections: The EPC sections info for guest
+# @section-size: The EPC section size for guest (Will be deprecated in 7.2)
+#
+# @sections: The EPC sections info for guest (Since: 7.0)
 #
 # Since: 6.2
 ##
@@ -374,6 +376,7 @@
             'sgx1': 'bool',
             'sgx2': 'bool',
             'flc': 'bool',
+            'section-size': 'uint64',
             'sections': ['SGXEPCSection']},
    'if': 'TARGET_I386' }
 
@@ -390,7 +393,9 @@
 #
 # -> { "execute": "query-sgx" }
 # <- { "return": { "sgx": true, "sgx1" : true, "sgx2" : true,
-#                  "flc": true, "section-size" : 0 } }
+#                  "flc": true,  "section-size" : 96468992,
+#                  "sections": [{"node": 0, "size": 67108864},
+#                  {"node": 1, "size": 29360128}]} }
 #
 ##
 { 'command': 'query-sgx', 'returns': 'SGXInfo', 'if': 'TARGET_I386' }
@@ -408,7 +413,9 @@
 #
 # -> { "execute": "query-sgx-capabilities" }
 # <- { "return": { "sgx": true, "sgx1" : true, "sgx2" : true,
-#                  "flc": true, "section-size" : 0 } }
+#                  "flc": true, "section-size" : 96468992,
+#                  "section" : [{"node": 0, "size": 67108864},
+#                  {"node": 1, "size": 29360128}]} }
 #
 ##
 { 'command': 'query-sgx-capabilities', 'returns': 'SGXInfo', 'if': 'TARGET_I386' }
diff --git a/hw/i386/sgx.c b/hw/i386/sgx.c
index 5de5dd0893..a2b318dd93 100644
--- a/hw/i386/sgx.c
+++ b/hw/i386/sgx.c
@@ -83,7 +83,7 @@ static uint64_t sgx_calc_section_metric(uint64_t low, uint64_t high)
            ((high & MAKE_64BIT_MASK(0, 20)) << 32);
 }
 
-static SGXEPCSectionList *sgx_calc_host_epc_sections(void)
+static SGXEPCSectionList *sgx_calc_host_epc_sections(uint64_t *size)
 {
     SGXEPCSectionList *head = NULL, **tail = &head;
     SGXEPCSection *section;
@@ -106,6 +106,7 @@ static SGXEPCSectionList *sgx_calc_host_epc_sections(void)
         section = g_new0(SGXEPCSection, 1);
         section->node = j++;
         section->size = sgx_calc_section_metric(ecx, edx);
+        *size += section->size;
         QAPI_LIST_APPEND(tail, section);
     }
 
@@ -156,6 +157,7 @@ SGXInfo *qmp_query_sgx_capabilities(Error **errp)
 {
     SGXInfo *info = NULL;
     uint32_t eax, ebx, ecx, edx;
+    uint64_t size = 0;
 
     int fd = qemu_open_old("/dev/sgx_vepc", O_RDWR);
     if (fd < 0) {
@@ -173,7 +175,8 @@ SGXInfo *qmp_query_sgx_capabilities(Error **errp)
     info->sgx1 = eax & (1U << 0) ? true : false;
     info->sgx2 = eax & (1U << 1) ? true : false;
 
-    info->sections = sgx_calc_host_epc_sections();
+    info->sections = sgx_calc_host_epc_sections(&size);
+    info->section_size = size;
 
     close(fd);
 
@@ -220,12 +223,14 @@ SGXInfo *qmp_query_sgx(Error **errp)
         return NULL;
     }
 
+    SGXEPCState *sgx_epc = &pcms->sgx_epc;
     info = g_new0(SGXInfo, 1);
 
     info->sgx = true;
     info->sgx1 = true;
     info->sgx2 = true;
     info->flc = true;
+    info->section_size = sgx_epc->size;
     info->sections = sgx_get_epc_sections_list();
 
     return info;
@@ -249,6 +254,8 @@ void hmp_info_sgx(Monitor *mon, const QDict *qdict)
                    info->sgx2 ? "enabled" : "disabled");
     monitor_printf(mon, "FLC support: %s\n",
                    info->flc ? "enabled" : "disabled");
+    monitor_printf(mon, "size: %" PRIu64 "\n",
+                   info->section_size);
 
     section_list = info->sections;
     for (section = section_list; section; section = section->next) {

