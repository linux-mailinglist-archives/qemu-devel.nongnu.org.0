Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 887C95A94CA
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 12:39:25 +0200 (CEST)
Received: from localhost ([::1]:47422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oThbY-0004PI-D0
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 06:39:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1oTh1F-0008J4-0P
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 06:01:53 -0400
Received: from mga03.intel.com ([134.134.136.65]:62221)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1oTh1C-00071G-Qt
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 06:01:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662026510; x=1693562510;
 h=from:to:cc:subject:date:message-id;
 bh=HWuA/83PtyfrHpgEKFWOnq3PD3JzCsB9yxqJghG6iAM=;
 b=hz0dmmMmGydwhbt1aE8gXJF7OiCMLEvCecQ1jxTQP55HfBnsvzhswHmV
 gg4cfGDFzNn7YSHxosIicIXtEqecGk80dZy0xml83XbpiJcNBxYfTnciy
 a2jcO0Cfoy603A2QW8nnz9oijS+j8+CsvHVTD3CQlooeeGJwuT5T85wct
 xw/siNqUfeBiogCd+1x7Ve2JKjuE6LgkOTwYZIA1nyQ1pC71fw2JBSG8n
 6VwFOuVGLzM68lAtsunqmJOteCU0HSC6znYm76BVXaq9EtTzVtg8ZZXrr
 A+//aCbMz7sl4vfBV0yPVeerzPqzW0y9z4kefa4dtv4WTL5o4LsRsNEn8 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10456"; a="296956114"
X-IronPort-AV: E=Sophos;i="5.93,280,1654585200"; d="scan'208";a="296956114"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2022 03:01:47 -0700
X-IronPort-AV: E=Sophos;i="5.93,280,1654585200"; d="scan'208";a="642268636"
Received: from chenyi-pc.sh.intel.com ([10.239.159.73])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2022 03:01:45 -0700
From: Chenyi Qiang <chenyi.qiang@intel.com>
To: "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: Chenyi Qiang <chenyi.qiang@intel.com>,
	qemu-devel@nongnu.org
Subject: [PATCH] hw/pci-bridge: Fix brace Werror with clang 6.0.0
Date: Thu,  1 Sep 2022 18:08:10 +0800
Message-Id: <20220901100810.13804-1-chenyi.qiang@intel.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: permerror client-ip=134.134.136.65;
 envelope-from=chenyi.qiang@intel.com; helo=mga03.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_PERMERROR=0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Two warnings are:

/hw/pci-bridge/cxl_downstream.c:101:51: error: suggest braces
	around initialization of subobject [-Werror,-Wmissing-braces]
    dvsec = (uint8_t *)&(CXLDVSECPortExtensions){ 0 };
                                                  ^
                                                  {}

/hw/pci-bridge/cxl_root_port.c:62:51: error: suggest braces
	around initialization of subobject [-Werror,-Wmissing-braces]
    dvsec = (uint8_t *)&(CXLDVSECPortExtensions){ 0 };
                                                  ^
                                                  {}

The original code is correct, just to work around clang's bogus warning.

Signed-off-by: Chenyi Qiang <chenyi.qiang@intel.com>
---
 hw/pci-bridge/cxl_downstream.c | 2 +-
 hw/pci-bridge/cxl_root_port.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/pci-bridge/cxl_downstream.c b/hw/pci-bridge/cxl_downstream.c
index a361e519d0..8e536f193b 100644
--- a/hw/pci-bridge/cxl_downstream.c
+++ b/hw/pci-bridge/cxl_downstream.c
@@ -98,7 +98,7 @@ static void build_dvsecs(CXLComponentState *cxl)
 {
     uint8_t *dvsec;
 
-    dvsec = (uint8_t *)&(CXLDVSECPortExtensions){ 0 };
+    dvsec = (uint8_t *)&(CXLDVSECPortExtensions){ };
     cxl_component_create_dvsec(cxl, CXL2_DOWNSTREAM_PORT,
                                EXTENSIONS_PORT_DVSEC_LENGTH,
                                EXTENSIONS_PORT_DVSEC,
diff --git a/hw/pci-bridge/cxl_root_port.c b/hw/pci-bridge/cxl_root_port.c
index fb213fa06e..e959f82086 100644
--- a/hw/pci-bridge/cxl_root_port.c
+++ b/hw/pci-bridge/cxl_root_port.c
@@ -59,7 +59,7 @@ static void build_dvsecs(CXLComponentState *cxl)
 {
     uint8_t *dvsec;
 
-    dvsec = (uint8_t *)&(CXLDVSECPortExtensions){ 0 };
+    dvsec = (uint8_t *)&(CXLDVSECPortExtensions){ };
     cxl_component_create_dvsec(cxl, CXL2_ROOT_PORT,
                                EXTENSIONS_PORT_DVSEC_LENGTH,
                                EXTENSIONS_PORT_DVSEC,
-- 
2.17.1


