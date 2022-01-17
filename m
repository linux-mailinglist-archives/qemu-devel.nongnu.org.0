Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC9F490B5F
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 16:30:46 +0100 (CET)
Received: from localhost ([::1]:41754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9Txz-0002b0-Da
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 10:30:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuzheng@10-254-3-75>)
 id 1n9IoX-0007KP-0Y
 for qemu-devel@nongnu.org; Sun, 16 Jan 2022 22:36:13 -0500
Received: from [223.112.32.187] (port=26614 helo=10-254-3-75)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuzheng@10-254-3-75>)
 id 1n9IoT-0005Bt-QH
 for qemu-devel@nongnu.org; Sun, 16 Jan 2022 22:36:12 -0500
Received: from 10-254-3-75 (localhost [127.0.0.1])
 by 10-254-3-75 (8.15.2/8.15.2) with ESMTPS id 20H2V5xX1656792
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 17 Jan 2022 10:31:05 +0800
Received: (from root@localhost)
 by 10-254-3-75 (8.15.2/8.15.2/Submit) id 20H2V5Gf1655973;
 Mon, 17 Jan 2022 10:31:05 +0800
From: Xu Zheng <xuzheng@cmss.chinamobile.com>
To: quintela@redhat.com, dgilbert@redhat.com
Subject: [PATCH] migration/ram: clean up unused comment.
Date: Mon, 17 Jan 2022 10:30:03 +0800
Message-Id: <20220117023003.1655917-1-xuzheng@cmss.chinamobile.com>
X-Mailer: git-send-email 2.18.2
X-Host-Lookup-Failed: Reverse DNS lookup failed for 223.112.32.187 (failed)
Received-SPF: none client-ip=223.112.32.187; envelope-from=xuzheng@10-254-3-75;
 helo=10-254-3-75
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, FSL_HELO_NON_FQDN_1=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, HELO_NO_DOMAIN=0.001, RDNS_NONE=0.793,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 17 Jan 2022 10:06:42 -0500
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
Cc: qemu-devel@nongnu.org, Mao Zhongyi <maozhongyi@cmss.chinamobile.com>,
 Xu Zheng <xuzheng@cmss.chinamobile.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Just a removal of an unused comment.
a0a8aa147aa did many fixes and removed the parameter named "ms", but forget to remove the corresponding comment in function named "ram_save_host_page".

Signed-off-by: Xu Zheng <xuzheng@cmss.chinamobile.com>
Signed-off-by: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
---
 migration/ram.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/migration/ram.c b/migration/ram.c
index 57efa67f20..96944f0c70 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2188,7 +2188,6 @@ static int ram_save_target_page(RAMState *rs, PageSearchStatus *pss,
  * Returns the number of pages written or negative on error
  *
  * @rs: current RAM state
- * @ms: current migration state
  * @pss: data about the page we want to send
  * @last_stage: if we are at the completion stage
  */
-- 
2.18.2


