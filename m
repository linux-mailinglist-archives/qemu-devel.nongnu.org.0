Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D58B653DE9
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 11:04:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8IQS-0004Ne-IM; Thu, 22 Dec 2022 05:03:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p8IQL-0004Ku-P5
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 05:03:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p8IQK-0007YR-7Z
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 05:03:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671703415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OAZKX2GTRUFcjuBHaDHmVAHLhAQPleK3Cb1JPLPMus0=;
 b=DpV7lgFjKu2LwDcwrbw8RkEjn4cOOK8bzsUepD8u8z/+xBl0pzFQsgHx10R+fapT+WnQmh
 4xoEeZdEWFwmhXpsLjSfQYmx6X5CoDI7kwSMlHidBBVlFKJMy5bGSCF7TT28bf7alIotSP
 cE/o98C+xdNwMYB8mRjXMD3aTCWlAT4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-448-_wZ3DlRNO3CMi89W7KV7RQ-1; Thu, 22 Dec 2022 05:03:33 -0500
X-MC-Unique: _wZ3DlRNO3CMi89W7KV7RQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EE3A13817A6A;
 Thu, 22 Dec 2022 10:03:32 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C270B2166B26;
 Thu, 22 Dec 2022 10:03:32 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2080421E693E; Thu, 22 Dec 2022 11:03:30 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, marcel.apfelbaum@gmail.com, jonathan.cameron@huawei.com,
 philmd@linaro.org
Subject: [PATCH v2 6/7] include/hw/pci: Include hw/pci/pci.h where needed
Date: Thu, 22 Dec 2022 11:03:29 +0100
Message-Id: <20221222100330.380143-7-armbru@redhat.com>
In-Reply-To: <20221222100330.380143-1-armbru@redhat.com>
References: <20221222100330.380143-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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
2.38.1


