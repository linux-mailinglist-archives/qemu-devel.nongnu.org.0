Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 735B93DB0D1
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 03:51:11 +0200 (CEST)
Received: from localhost ([::1]:43324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9Hg6-0006ht-1h
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 21:51:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <caihuoqing@baidu.com>)
 id 1m9Hf1-000633-1M
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 21:50:03 -0400
Received: from mx21.baidu.com ([220.181.3.85]:40970 helo=baidu.com)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <caihuoqing@baidu.com>) id 1m9Hew-0001dP-Cp
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 21:50:00 -0400
Received: from BC-Mail-Ex09.internal.baidu.com (unknown [172.31.51.49])
 by Forcepoint Email with ESMTPS id C7186F2F9C9B0EC02960;
 Fri, 30 Jul 2021 09:49:49 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex09.internal.baidu.com (172.31.51.49) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Fri, 30 Jul 2021 09:49:49 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Fri, 30 Jul 2021 09:49:49 +0800
From: Cai Huoqing <caihuoqing@baidu.com>
To: <mst@redhat.com>, <peterx@redhat.com>, <jasowang@redhat.com>
Subject: [PATCH] intel_iommu:  Fix typo in comments
Date: Fri, 30 Jul 2021 09:49:42 +0800
Message-ID: <20210730014942.2311-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BC-Mail-Ex16.internal.baidu.com (172.31.51.56) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
Received-SPF: pass client-ip=220.181.3.85; envelope-from=caihuoqing@baidu.com;
 helo=baidu.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Cai Huoqing <caihuoqing@baidu.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix typo:
*Unknwon  ==> Unknown
*futher  ==> further
*configed  ==> configured

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
 hw/i386/intel_iommu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index 209b3f5553..75f075547f 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -679,7 +679,7 @@ static inline bool vtd_pe_type_check(X86IOMMUState *x86_iommu,
         }
         break;
     default:
-        /* Unknwon type */
+        /* Unknown type */
         return false;
     }
     return true;
@@ -692,7 +692,7 @@ static inline bool vtd_pdire_present(VTDPASIDDirEntry *pdire)
 
 /**
  * Caller of this function should check present bit if wants
- * to use pdir entry for futher usage except for fpd bit check.
+ * to use pdir entry for further usage except for fpd bit check.
  */
 static int vtd_get_pdire_from_pdir_table(dma_addr_t pasid_dir_base,
                                          uint32_t pasid,
@@ -746,7 +746,7 @@ static int vtd_get_pe_in_pasid_leaf_table(IntelIOMMUState *s,
 
 /**
  * Caller of this function should check present bit if wants
- * to use pasid entry for futher usage except for fpd bit check.
+ * to use pasid entry for further usage except for fpd bit check.
  */
 static int vtd_get_pe_from_pdire(IntelIOMMUState *s,
                                  uint32_t pasid,
@@ -1507,7 +1507,7 @@ static int vtd_sync_shadow_page_table(VTDAddressSpace *vtd_as)
 }
 
 /*
- * Check if specific device is configed to bypass address
+ * Check if specific device is configured to bypass address
  * translation for DMA requests. In Scalable Mode, bypass
  * 1st-level translation or 2nd-level translation, it depends
  * on PGTT setting.
-- 
2.25.1


