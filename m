Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E856482F1
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 14:50:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3dk6-0006jA-DZ; Fri, 09 Dec 2022 08:48:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p3dk4-0006if-BC
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 08:48:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p3dk1-0004fu-E5
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 08:48:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670593696;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oqRHhe+N1HsqFBsovg2+twURq+MuKDlUDHz5ogNRatI=;
 b=YL+BscOaEBnL+oyY45aEw/zquEdqj0qHg6Cfas7ayKq37O/xMTsVzSFhLqY4/uXUYQnVrA
 +eP2UkqPhChVPMM2MRKPkRox5gYSUVeeOk5kYmvG2iakPE6pmAZr6uyd+sSCdJlgwywa7/
 mHLje7fmeXFgfdFtBCWTweJEJnb9hSY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-tZk1kbwKPeqs7Rvzq65DUw-1; Fri, 09 Dec 2022 08:48:10 -0500
X-MC-Unique: tZk1kbwKPeqs7Rvzq65DUw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7848C185A7A8;
 Fri,  9 Dec 2022 13:48:09 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.144])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3C49A1121331;
 Fri,  9 Dec 2022 13:48:09 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E2D2C21E66CD; Fri,  9 Dec 2022 14:48:02 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, marcel.apfelbaum@gmail.com, ben.widawsky@intel.com,
 jonathan.cameron@huawei.com, philmd@linaro.org
Subject: [PATCH 5/5] include/hw/pci: Include hw/pci/pci.h where needed
Date: Fri,  9 Dec 2022 14:48:02 +0100
Message-Id: <20221209134802.3642942-6-armbru@redhat.com>
In-Reply-To: <20221209134802.3642942-1-armbru@redhat.com>
References: <20221209134802.3642942-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

hw/pci/pcie_sriov.h needs PCI_NUM_REGIONS.  Without the previous
commit, this would close an inclusion loop: hw/pci/pci.h used to
include hw/pci/pcie.h for PCIExpressDevice, which includes
pcie_sriov.h for PCIESriovPF, which now includes hw/pci/pci.h for
PCI_NUM_REGIONS.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 include/hw/pci/pcie_sriov.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/hw/pci/pcie_sriov.h b/include/hw/pci/pcie_sriov.h
index 80f5c84e75..96cc743309 100644
--- a/include/hw/pci/pcie_sriov.h
+++ b/include/hw/pci/pcie_sriov.h
@@ -13,6 +13,8 @@
 #ifndef QEMU_PCIE_SRIOV_H
 #define QEMU_PCIE_SRIOV_H
 
+#include "hw/pci/pci.h"
+
 struct PCIESriovPF {
     uint16_t num_vfs;   /* Number of virtual functions created */
     uint8_t vf_bar_type[PCI_NUM_REGIONS];   /* Store type for each VF bar */
-- 
2.37.3


