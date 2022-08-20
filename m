Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 208C559AED0
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Aug 2022 17:11:59 +0200 (CEST)
Received: from localhost ([::1]:44112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oPQ8h-0004MA-SV
	for lists+qemu-devel@lfdr.de; Sat, 20 Aug 2022 11:11:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobias.roehmel@rwth-aachen.de>)
 id 1oPPKD-0005G6-AI
 for qemu-devel@nongnu.org; Sat, 20 Aug 2022 10:19:45 -0400
Received: from mail-out-3.itc.rwth-aachen.de ([2a00:8a60:1:e501::5:48]:17474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobias.roehmel@rwth-aachen.de>)
 id 1oPPK7-0003ls-VI
 for qemu-devel@nongnu.org; Sat, 20 Aug 2022 10:19:44 -0400
X-IPAS-Result: =?us-ascii?q?A2ATBABk7ABj/5sagoZaHQEBAQEJARIBBQUBQIFPhH6ET?=
 =?us-ascii?q?pEPgROWG4dRCwEBAQEBAQEBAQgBQgQBAYUDAgIChGImOBMBAgQBAQEBAwIDA?=
 =?us-ascii?q?QEBAQEBAwEBBgEBAQEBAQYEgRyFL0aGQwIBAyMPAUYQIAUCJgICVwYOBYJ9g?=
 =?us-ascii?q?yOpGoExgQGEcIUSCQGBByyIEIIahSuCUIEVgTyBNwduhGGDOYJlBJVTg3scO?=
 =?us-ascii?q?AMJBAcFLB5CAwsfDhYFCAkXEhAQAgQRGgsGAxY+CQIEDgNACA0DEQQDDxgJE?=
 =?us-ascii?q?ggQBAYDMQwlCwMUDAEGAwYFAwEDGwMUAwUkBwMZDyMNDQQfDAMDBSUDAgIbB?=
 =?us-ascii?q?wICAwIGFQYCAjYYOQgECAQrIw8FAgcvBQQvAh4EBQYRCAIWAgYEBAQEFQIQC?=
 =?us-ascii?q?AIIJxcHEzMZAQUyJxAJIRwOGhAFBhMDIG8FBz4PKDM1OSsdGwqBEiopFQMEB?=
 =?us-ascii?q?AMCBhMDAyICEC4xAxUGKRMSLQcrdQkCAyJpBQMDBCgsAwk+BwkiJj0FBVs6B?=
 =?us-ascii?q?QMDECI9BgMJAwIpFSeaG3IBgQ4vgiPCAQeCFqFJTJZxApIBLZZaoXeBGIQnA?=
 =?us-ascii?q?gQCBAUCFoF4gX5xgzZRFwIPjiwWFY4bczsCBgEKAQEDCYpcAQE?=
IronPort-Data: A9a23:wWsYU6zyKR28MOh7StZ6t+eKxCrEfRIJ4+MujC+fZmUNrF6WrkUPm
 2QYDTyGPPeJamHwKdAlYY+29BkEvcCBn9A3QVBkrFhgHilAwSbn6XV1DW+tZX/Ifp2bJK5Dx
 59DAjUVBJlsFhcwnj/0bv656yAUOZigHtIQMsadUsxKbVIiGXxJZS5LwbZj2NY424DhWWthh
 PuryyHhEA79s9JLGj9Mg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZcxMUdrJp8tuSH
 I4v+pnkpD+Dr0d1Yj+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRYRQR8/ttmHozx+4
 M1kpN+ae1cqBYDrmsknVDdlTzp1MqITrdcrIVDn2SCS53f5T1vB87BVVgQce5cH5uYyCG0I+
 fFwxDIlN0vfwbvtmPThFK8125lLwMrDZevzvll8yjvYBO1gW5fOQ6DH4fdCwysww8lHFvbTY
 YwVZFKDaTyZPU0fZQxPUM5WcOGAuWPxVhJ08U6puqsw03KLlh5A8unOGY+AEjCNbYAP9qqCn
 Urf8mHkRx0XKtGb4TyC9H2qm6nIhyyTcJofCLCisPtjkVGewmg7DBwQXEG85/6jhSaDt8l3M
 VMI+ic+6LNosUbtVMbhX1ixrDiIs3bwRuZtLgHz0ynVooK83upTLjJsouJpADD+iPILeA==
IronPort-HdrOrdr: A9a23:EBZ1ZKHb71YLRQ5apLqEzseALOsnbusQ8zAXPiFKJSC9F/byqy
 nAppsmPHPP5gr5IUtQ++xoWpPhfZqsz/9ICOAqVN/JMTUO01HYT72Kg7GSuAHIKmnT8fNcyL
 clU4UWMqyLMbB25/yKhzVRH7wbsb26GKrDv5a6859jJzsaDZ2INj0JczpzxHcGPDV7OQ==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.93,251,1654552800"; d="scan'208";a="168873004"
Received: from rwthex-s2-b.rwth-ad.de ([134.130.26.155])
 by mail-in-3.itc.rwth-aachen.de with ESMTP; 20 Aug 2022 16:19:28 +0200
Received: from localhost.localdomain (2a02:908:1088:5920:e70b:29db:1db5:28bf)
 by RWTHEX-S2-B.rwth-ad.de (2a00:8a60:1:e500::26:155) with Microsoft
 SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.12; Sat, 20 Aug 2022 16:19:27 +0200
From: <tobias.roehmel@rwth-aachen.de>
To: <qemu-devel@nongnu.org>
CC: <peter.maydell@linaro.org>, =?UTF-8?q?Tobias=20R=C3=B6hmel?=
 <tobias.roehmel@rwth-aachen.de>
Subject: [PATCH v3 5/9] target/arm: Add ARMCacheAttrs to the signature of
 pmsav8_mpu_lookup
Date: Sat, 20 Aug 2022 16:19:10 +0200
Message-ID: <20220820141914.217399-6-tobias.roehmel@rwth-aachen.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220820141914.217399-1-tobias.roehmel@rwth-aachen.de>
References: <20220820141914.217399-1-tobias.roehmel@rwth-aachen.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2a02:908:1088:5920:e70b:29db:1db5:28bf]
X-ClientProxiedBy: rwthex-w4-b.rwth-ad.de (2a00:8a60:1:e500::26:167) To
 RWTHEX-S2-B.rwth-ad.de (2a00:8a60:1:e500::26:155)
Received-SPF: pass client-ip=2a00:8a60:1:e501::5:48;
 envelope-from=tobias.roehmel@rwth-aachen.de;
 helo=mail-out-3.itc.rwth-aachen.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Tobias Röhmel <tobias.roehmel@rwth-aachen.de>

Add ARMCacheAttrs to the signature of pmsav8_mpu_lookup to prepare
for the Cortex-R52 MPU which uses and combines cache attributes
of different translation levels.

Signed-off-by: Tobias Röhmel <tobias.roehmel@rwth-aachen.de>
---
 target/arm/internals.h | 13 +++++++------
 target/arm/m_helper.c  |  3 ++-
 target/arm/ptw.c       | 11 +++++++----
 3 files changed, 16 insertions(+), 11 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 6f94f3019d..b03049d920 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1109,12 +1109,6 @@ void v8m_security_lookup(CPUARMState *env, uint32_t address,
                          MMUAccessType access_type, ARMMMUIdx mmu_idx,
                          V8M_SAttributes *sattrs);
 
-bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
-                       MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                       hwaddr *phys_ptr, MemTxAttrs *txattrs,
-                       int *prot, bool *is_subpage,
-                       ARMMMUFaultInfo *fi, uint32_t *mregion);
-
 /* Cacheability and shareability attributes for a memory access */
 typedef struct ARMCacheAttrs {
     /*
@@ -1126,6 +1120,13 @@ typedef struct ARMCacheAttrs {
     bool is_s2_format:1;
 } ARMCacheAttrs;
 
+bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
+                       MMUAccessType access_type, ARMMMUIdx mmu_idx,
+                       hwaddr *phys_ptr, MemTxAttrs *txattrs,
+                       int *prot, bool *is_subpage,
+                       ARMMMUFaultInfo *fi, uint32_t *mregion,
+                       ARMCacheAttrs *cacheattrs);
+
 bool get_phys_addr(CPUARMState *env, target_ulong address,
                    MMUAccessType access_type, ARMMMUIdx mmu_idx,
                    hwaddr *phys_ptr, MemTxAttrs *attrs, int *prot,
diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index a740c3e160..44c80d733a 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -2829,10 +2829,11 @@ uint32_t HELPER(v7m_tt)(CPUARMState *env, uint32_t addr, uint32_t op)
      * inspecting the other MPU state.
      */
     if (arm_current_el(env) != 0 || alt) {
+        ARMCacheAttrs cacheattrs = {0};
         /* We can ignore the return value as prot is always set */
         pmsav8_mpu_lookup(env, addr, MMU_DATA_LOAD, mmu_idx,
                           &phys_addr, &attrs, &prot, &is_subpage,
-                          &fi, &mregion);
+                          &fi, &mregion, &cacheattrs);
         if (mregion == -1) {
             mrvalid = false;
             mregion = 0;
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 8b037c1f55..c4f5721012 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1702,7 +1702,8 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
                        MMUAccessType access_type, ARMMMUIdx mmu_idx,
                        hwaddr *phys_ptr, MemTxAttrs *txattrs,
                        int *prot, bool *is_subpage,
-                       ARMMMUFaultInfo *fi, uint32_t *mregion)
+                       ARMMMUFaultInfo *fi, uint32_t *mregion,
+                       ARMCacheAttrs *cacheattrs)
 {
     /*
      * Perform a PMSAv8 MPU lookup (without also doing the SAU check
@@ -1968,7 +1969,7 @@ static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
                                  MMUAccessType access_type, ARMMMUIdx mmu_idx,
                                  hwaddr *phys_ptr, MemTxAttrs *txattrs,
                                  int *prot, target_ulong *page_size,
-                                 ARMMMUFaultInfo *fi)
+                                 ARMMMUFaultInfo *fi, ARMCacheAttrs *cacheattrs)
 {
     uint32_t secure = regime_is_secure(env, mmu_idx);
     V8M_SAttributes sattrs = {};
@@ -2036,7 +2037,8 @@ static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
     }
 
     ret = pmsav8_mpu_lookup(env, address, access_type, mmu_idx, phys_ptr,
-                            txattrs, prot, &mpu_is_subpage, fi, NULL);
+                            txattrs, prot, &mpu_is_subpage, fi,
+                            NULL, cacheattrs);
     *page_size = sattrs.subpage || mpu_is_subpage ? 1 : TARGET_PAGE_SIZE;
     return ret;
 }
@@ -2416,7 +2418,8 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
         if (arm_feature(env, ARM_FEATURE_V8)) {
             /* PMSAv8 */
             ret = get_phys_addr_pmsav8(env, address, access_type, mmu_idx,
-                                       phys_ptr, attrs, prot, page_size, fi);
+                                       phys_ptr, attrs, prot, page_size,
+                                       fi, cacheattrs);
         } else if (arm_feature(env, ARM_FEATURE_V7)) {
             /* PMSAv7 */
             ret = get_phys_addr_pmsav7(env, address, access_type, mmu_idx,
-- 
2.25.1


