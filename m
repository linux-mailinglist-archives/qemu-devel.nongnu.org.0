Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A06240DCA9
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 16:24:29 +0200 (CEST)
Received: from localhost ([::1]:55172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQsJQ-0003vm-EK
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 10:24:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mQs6C-0000cI-91; Thu, 16 Sep 2021 10:10:49 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:51941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mQs6A-0005x9-K8; Thu, 16 Sep 2021 10:10:48 -0400
Received: from quad ([82.142.27.6]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1Mo7eX-1nEoJ51E6N-00peyo; Thu, 16
 Sep 2021 16:10:36 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 07/10] intel_iommu: Fix typo in comments
Date: Thu, 16 Sep 2021 16:10:23 +0200
Message-Id: <20210916141026.1174822-8-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210916141026.1174822-1-laurent@vivier.eu>
References: <20210916141026.1174822-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:fge7NnsPwy4wPoYMEH7X7ClNoNQN3q4Ti7Y4aAVKGLNy6luk9xq
 KYoA2RhbBcf3EqCvI4rFR5tQDVqKCQlaGJ2W8dTCRvCjLRDi+v+mKTRbFgd5r7S+UlxXasp
 ACjg4yTq/wgX+37lzErQOssMFOGtiDqExHk+4R2/1nZo+TrEQBmGTqJUDkkcWU55bMSw4pF
 ko0jExGHuuWOoPNsSIJ0Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:G8ZfQXADvHg=:Lap+TpbbdpWlkX9/nlAJs+
 8ymAtpA1aW1aNY2+3bWKDn8ssnGHN3YPGn3fnsF3rTDVQlPCVuAIXaeRpHocLSEWSDBddsw6o
 xL3W7jyFgpGyazTGf0NQYH/FSOf2tdnRAnJKM9to2amO2HrUTzqGJhsmjeav4gmxr6pQiDYmL
 l7H4Wla1kD+zP+grFmNZjzOgqUQ8PwNOpjEdOKXI18hEKn9FE7G0F2eWBa01Hs9v84S6OzH4d
 80pkBfm8e0RvW+Auq/kHfseOZMjtRbUO4e29Vu0jR6SuJGtRBDLmQzTzd+EyhTFuaocj5pOsS
 joSFPM8TN99rau9uL5fgCka6Vnp9Exbo1/d5MYZZB2QluBIIZn9d7ajhNcUe8d8sa85sWd6J0
 9/VFNJ/WgEqCNOCVCZZuxpUlSpuA29JtqolSkwowB2CtxMzb1QnSjVcB3DlRg/KnX/unAUEik
 wwZKaX7s4P4jbRqEi8jHa5YtLMZcgT55waVhDQ/WuhMiRYw+UmsE1rOK2wNM10NsZp4gUvkIn
 S9q3LyNZVfeUFpmIlMvZLaprNaX3JHXoMSzllRqUqsfvBjyJWs6xSXIBQ3TDvUMRsyhxVHDPK
 4i61H++0pOflgTGrfe7bJ61HQu0eL1RIBGTwSeD4/xn5o6mxzBQFYArWc8UMLniclrfQNTsnY
 zUkGB4qfc/ftr9IxvKhF23SGyLgrn4ycK4krtMsI3sC97g225TeugnQAORGYnmGoHSWj6A8gF
 oaHBk8gZJsfd/31aHmlbFrvSOiyyYazkJU09Kw==
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, Peter Xu <peterx@redhat.com>,
 Cai Huoqing <caihuoqing@baidu.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cai Huoqing <caihuoqing@baidu.com>

Fix typo:
*Unknwon  ==> Unknown
*futher  ==> further
*configed  ==> configured

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Peter Xu <peterx@redhat.com>
Message-Id: <20210730014942.2311-1-caihuoqing@baidu.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/i386/intel_iommu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index 209b3f55530e..75f075547f65 100644
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
2.31.1


