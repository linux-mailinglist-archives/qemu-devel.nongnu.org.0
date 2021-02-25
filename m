Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C09324964
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 04:24:37 +0100 (CET)
Received: from localhost ([::1]:48684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lF7GW-0003lo-K4
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 22:24:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>)
 id 1lF7Fh-0003Fp-Gr; Wed, 24 Feb 2021 22:23:45 -0500
Received: from ozlabs.ru ([107.174.27.60]:44600)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aik@ozlabs.ru>)
 id 1lF7Ff-0001uZ-Eo; Wed, 24 Feb 2021 22:23:44 -0500
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id 1BFE0AE80049;
 Wed, 24 Feb 2021 22:23:37 -0500 (EST)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: qemu-devel@nongnu.org
Subject: [PATCH qemu] spapr: Fix typo in the patb_entry comment
Date: Thu, 25 Feb 2021 14:23:35 +1100
Message-Id: <20210225032335.64245-1-aik@ozlabs.ru>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=107.174.27.60; envelope-from=aik@ozlabs.ru;
 helo=ozlabs.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is no H_REGISTER_PROCESS_TABLE, it is H_REGISTER_PROC_TBL handler
for which is still called h_register_process_table() though.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 include/hw/ppc/spapr.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index ccbeeca1de84..8dceace4b442 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -168,7 +168,7 @@ struct SpaprMachineState {
     SpaprResizeHpt resize_hpt;
     void *htab;
     uint32_t htab_shift;
-    uint64_t patb_entry; /* Process tbl registed in H_REGISTER_PROCESS_TABLE */
+    uint64_t patb_entry; /* Process tbl registed in H_REGISTER_PROC_TBL */
     SpaprPendingHpt *pending_hpt; /* in-progress resize */
 
     hwaddr rma_size;
-- 
2.17.1


