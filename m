Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1083E2CE647
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 04:11:45 +0100 (CET)
Received: from localhost ([::1]:37132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kl1VX-0008Qx-LH
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 22:11:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1kl1UU-0007zj-Bo
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 22:10:38 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:2548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1kl1UR-0004k2-13
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 22:10:37 -0500
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4CnHkj6kylzhmQj;
 Fri,  4 Dec 2020 11:10:05 +0800 (CST)
Received: from DESKTOP-8RFUVS3.china.huawei.com (10.174.185.179) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.487.0; Fri, 4 Dec 2020 11:10:18 +0800
From: Zenghui Yu <yuzenghui@huawei.com>
To: <mst@redhat.com>, <marcel.apfelbaum@gmail.com>, <dgilbert@redhat.com>
Subject: [PATCH] pcie_aer: Fix help message of pcie_aer_inject_error command
Date: Fri, 4 Dec 2020 11:09:53 +0800
Message-ID: <20201204030953.837-1-yuzenghui@huawei.com>
X-Mailer: git-send-email 2.23.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.185.179]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32; envelope-from=yuzenghui@huawei.com;
 helo=szxga06-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Zenghui Yu <yuzenghui@huawei.com>, wanghaibin.wang@huawei.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is an interesting typo in the help message of pcie_aer_inject_error
command. Use 'tlp' instead of 'tlb' to match the PCIe AER term.

Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
---
 hmp-commands.hx | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hmp-commands.hx b/hmp-commands.hx
index ff2d7aa8f3..dd460eb908 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -1302,8 +1302,8 @@ ERST
 	              " -c for correctable error\n\t\t\t"
                       "<id> = qdev device id\n\t\t\t"
                       "<error_status> = error string or 32bit\n\t\t\t"
-                      "<tlb header> = 32bit x 4\n\t\t\t"
-                      "<tlb header prefix> = 32bit x 4",
+                      "<tlp header> = 32bit x 4\n\t\t\t"
+                      "<tlp header prefix> = 32bit x 4",
         .cmd        = hmp_pcie_aer_inject_error,
     },
 
-- 
2.19.1


