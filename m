Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 351EB2B5E22
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 12:20:10 +0100 (CET)
Received: from localhost ([::1]:41304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kez1t-0003Ki-9f
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 06:20:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kez11-0002vg-Pe
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 06:19:15 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:51707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kez0z-0006Y3-V2
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 06:19:15 -0500
Received: from localhost.localdomain ([82.252.130.226]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1Mn2eH-1jx5sA1JYd-00k4EG; Tue, 17 Nov 2020 12:19:09 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH] linux-user, netlink: add IFLA_BRPORT_MRP_RING_OPEN,
 IFLA_BRPORT_MRP_IN_OPEN
Date: Tue, 17 Nov 2020 12:19:05 +0100
Message-Id: <20201117111905.843925-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:C3QgkSzeI7/nrPU5gQVpJxO0gaQgVrfT/Ym8OEjV1x/f32MBz8m
 tyDUto+jCtH8cYSW3FwZfYuKvMGf6NXQNCaE9ifhg0l9CBbWDBk0wROxhLV59Xk+1EswjmV
 RVVfdyyxWfy3ycDwB83PgILJE2VjYE3eKRaC2XYitpoBin2O1dzJp5W6mFlVmA0AyLSOF++
 L2ccuoDUeP8LpaorQiupQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:8AkWFAyE2xs=:kygEb6APOPDW/xZZjL3+uD
 Xi01PbkCrO3OgaNMkvrAtnHka/pzforo6XGWjq8Lp7zf/EFRZO46lWBoWmdTOyAK75UeJoW5f
 oHvBpvBCiq3nxz+vp848BTfc9aR8OOGbqmC+7nCUQo1vYNYM2TJxMBPTLRABsFdIFE1Xzxhku
 lLv0UyduU8bhLHWQo5W7Co0wq4AsFlwPko1RKCbmHdTAID3d18ZoqEPcX7U6DTv0BwyByLL+/
 EL9TaguvNP3RnC1bQmBYrOIrEB4mUuKOqCib9z0UVjQ0pULOQas/3zf/E3CDZEU6MAV/JYRLF
 Y2fwcAX4A0aavPWq06I/ADt723f/1oKkuBIWAIxcdaMfndSGPR6rmvZ/IiYHE4GiJJmQzKdql
 OJp56M6BS3redXzdPVj9EPv5hRo00l/QQ/kIYrtOxDM3sBe5mLzynsdfp/ZVty3DwVZLDiYvY
 vtR2l7Z//Q==
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 06:19:09
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix "-d unimp" trace results:

  Unknown QEMU_IFLA_BRPORT type 35
  Unknown QEMU_IFLA_BRPORT type 36

Also process IFLA_EXT_MASK to fix:

  Unknown target QEMU_IFLA type: 29

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/fd-trans.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/linux-user/fd-trans.c b/linux-user/fd-trans.c
index 1486c81aaa27..913b3cd12a90 100644
--- a/linux-user/fd-trans.c
+++ b/linux-user/fd-trans.c
@@ -175,6 +175,8 @@ enum {
     QEMU_IFLA_BRPORT_NEIGH_SUPPRESS,
     QEMU_IFLA_BRPORT_ISOLATED,
     QEMU_IFLA_BRPORT_BACKUP_PORT,
+    QEMU_IFLA_BRPORT_MRP_RING_OPEN,
+    QEMU_IFLA_BRPORT_MRP_IN_OPEN,
     QEMU___IFLA_BRPORT_MAX
 };
 
@@ -552,6 +554,8 @@ static abi_long host_to_target_slave_data_bridge_nlattr(struct nlattr *nlattr,
     case QEMU_IFLA_BRPORT_BCAST_FLOOD:
     case QEMU_IFLA_BRPORT_NEIGH_SUPPRESS:
     case QEMU_IFLA_BRPORT_ISOLATED:
+    case QEMU_IFLA_BRPORT_MRP_RING_OPEN:
+    case QEMU_IFLA_BRPORT_MRP_IN_OPEN:
         break;
     /* uint16_t */
     case QEMU_IFLA_BRPORT_PRIORITY:
@@ -1125,7 +1129,14 @@ static abi_long target_to_host_for_each_rtattr(struct rtattr *rtattr,
 
 static abi_long target_to_host_data_link_rtattr(struct rtattr *rtattr)
 {
+    uint32_t *u32;
+
     switch (rtattr->rta_type) {
+    /* uint32_t */
+    case QEMU_IFLA_EXT_MASK:
+        u32 = RTA_DATA(rtattr);
+        *u32 = tswap32(*u32);
+        break;
     default:
         qemu_log_mask(LOG_UNIMP, "Unknown target QEMU_IFLA type: %d\n",
                       rtattr->rta_type);
-- 
2.28.0


