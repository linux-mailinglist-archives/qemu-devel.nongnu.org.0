Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3B034F8BB
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 08:28:31 +0200 (CEST)
Received: from localhost ([::1]:42156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRUL8-0006Pp-Ry
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 02:28:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lRUIL-0004ZS-0d; Wed, 31 Mar 2021 02:25:37 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:56393 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lRUIG-0000p2-5h; Wed, 31 Mar 2021 02:25:36 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F9GX71Dtsz9sWd; Wed, 31 Mar 2021 17:25:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1617171927;
 bh=frdXBfskgd8jnykC7Qw1E4cZMMmjNwvV6d/c8E8/1NQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mhPaDrqJh/i1HUzxdpgYm7mqV9qetgONOvF8d+u/u6o/oh5ZDS/RHk2KUtXLtb/DU
 IA+1tG6BvpD0DBYYTjstVbtlWNgw81nHcOqhvYGKdcAZolo11oqz1gIjgaz3WEQydG
 0YA5v323RXYW9RQShQqztpGYe/TLcF96RVYskGvY=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 4/5] spapr: Fix typo in the patb_entry comment
Date: Wed, 31 Mar 2021 17:25:23 +1100
Message-Id: <20210331062524.335749-5-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210331062524.335749-1-david@gibson.dropbear.id.au>
References: <20210331062524.335749-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexey Kardashevskiy <aik@ozlabs.ru>

There is no H_REGISTER_PROCESS_TABLE, it is H_REGISTER_PROC_TBL handler
for which is still called h_register_process_table() though.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-Id: <20210225032335.64245-1-aik@ozlabs.ru>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 include/hw/ppc/spapr.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index 47cebaf3ac..bf7cab7a2c 100644
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
2.30.2


