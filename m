Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9084D247D44
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Aug 2020 06:22:24 +0200 (CEST)
Received: from localhost ([::1]:59956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k7t8h-0002Hp-Fx
	for lists+qemu-devel@lfdr.de; Tue, 18 Aug 2020 00:22:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1k7t69-0007QT-K5; Tue, 18 Aug 2020 00:19:45 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:44003 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1k7t66-0006LP-K5; Tue, 18 Aug 2020 00:19:45 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4BVyNZ4rr9z9sV4; Tue, 18 Aug 2020 14:19:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1597724366;
 bh=2Je7Mov1VPed8D3DxgihncFAFZ6VXR6JiIuHyTMxrvE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HCvXF4IW3SBimjJObU/rx0jfBJu2dWUFIEx2jGlejZnLWlgtOF7lLZBagSOBrw7tz
 +lEb2CjVPNsxTV0KqhxTHCUV3RMUrHE5+Xxv0drTBGZynFkxbr/EOcpaH9ysB/Idmm
 3PXJ8QdBjerx/5c2vm3+jO7QK9unZmsjZc4EWQXE=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 10/40] ppc/xive: Fix some typos in comments
Date: Tue, 18 Aug 2020 14:18:52 +1000
Message-Id: <20200818041922.251708-11-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200818041922.251708-1-david@gibson.dropbear.id.au>
References: <20200818041922.251708-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/18 00:19:26
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=1,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=no autolearn_force=no
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
Cc: David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, Gustavo Romero <gromero@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gustavo Romero <gromero@linux.ibm.com>

Fix some typos in comments about code modeling coalescing points in the
XIVE routing engine (IVRE).

Signed-off-by: Gustavo Romero <gromero@linux.ibm.com>
Message-Id: <1595461434-27725-1-git-send-email-gromero@linux.ibm.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/intc/xive.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/intc/xive.c b/hw/intc/xive.c
index 9a162431e0..9b55e0356c 100644
--- a/hw/intc/xive.c
+++ b/hw/intc/xive.c
@@ -1502,7 +1502,7 @@ static bool xive_presenter_notify(XiveFabric *xfb, uint8_t format,
 
 /*
  * Notification using the END ESe/ESn bit (Event State Buffer for
- * escalation and notification). Profide futher coalescing in the
+ * escalation and notification). Provide further coalescing in the
  * Router.
  */
 static bool xive_router_end_es_notify(XiveRouter *xrtr, uint8_t end_blk,
@@ -1581,7 +1581,7 @@ static void xive_router_end_notify(XiveRouter *xrtr, uint8_t end_blk,
 
     /*
      * Check the END ESn (Event State Buffer for notification) for
-     * even futher coalescing in the Router
+     * even further coalescing in the Router
      */
     if (!xive_end_is_notify(&end)) {
         /* ESn[Q]=1 : end of notification */
@@ -1660,7 +1660,7 @@ do_escalation:
 
     /*
      * Check the END ESe (Event State Buffer for escalation) for even
-     * futher coalescing in the Router
+     * further coalescing in the Router
      */
     if (!xive_end_is_uncond_escalation(&end)) {
         /* ESe[Q]=1 : end of notification */
-- 
2.26.2


