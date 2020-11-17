Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D89322B6874
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 16:18:31 +0100 (CET)
Received: from localhost ([::1]:55558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf2kY-0002wJ-Vi
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 10:18:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kf2jB-000211-QP
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 10:17:05 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:50803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kf2j3-0007ZW-Aq
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 10:17:05 -0500
Received: from localhost.localdomain ([82.252.130.226]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MvsyF-1kNWCn3zGB-00sxxS; Tue, 17 Nov 2020 16:16:55 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 2/2] linux-user, netlink: add IFLA_BRPORT_MRP_RING_OPEN,
 IFLA_BRPORT_MRP_IN_OPEN
Date: Tue, 17 Nov 2020 16:16:50 +0100
Message-Id: <20201117151650.867836-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201117151650.867836-1-laurent@vivier.eu>
References: <20201117151650.867836-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:RG3h/1GIPmujHFsVODM+JcG424mz7FrVXkLR0BkhHuGtPQi7Y1n
 fsoIMq1FqD1OhyCW+tfdd7uSa0u3KpL0o8GlzYO/swmd5lrTwHTWgK2mTtaj5UBq9PdYPx2
 IfySBLZyFtXPhnEkj6Na9QEhqrbcS0UJ4JNca2KK8l9ffshsb1XaXS8o/6o7CuRkYoJV1JT
 AttLCjz+CjAg1Ji2Z6sQw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:DDJ+cZWVjcY=:stKsdyJtSQ80hB9tOG68PP
 R1G/M0viCU9BgUVjbDXwybInc+HpgX3OQLLvXkyOFIMhUF8ST5VnWR4DszwZDe4kPmltIc30X
 H9lJXxRKJDHRfsfHzzAx3XIsXt29EDWDFzYUlW2J5ZcINKQCrzNzQoPulK5TKRb9xWcrlWYQJ
 1IAlVHVG2GHEnRzeuVrC/uhLWX7T9LVQUnUNJffjBvxr3kkPN+NFsl6qpsNOqekAFNl0XKzAy
 aE5Vr87rzcL1/1vegqIJ3tG/hGrkZT6hAKmYyxSKXRofBunloQnceeYUnBxlc5jeIkKeCGiEm
 vJ6VoOXOZY33meaIRN/dT8U9l6TlggwFHOEky8T/pzw11jM4k4nx29NBFmmT1l+zNWnR6JISN
 mwf5/TPr4Co1DEoKnP6fNUTS1rsObIKYaXX51ioYGE9sYx2CVLqO6dvrmxACeIji+hyxtVHIK
 YNaOByNP6A==
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 10:16:54
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
Message-Id: <20201117111905.843925-1-laurent@vivier.eu>
---
 linux-user/fd-trans.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/linux-user/fd-trans.c b/linux-user/fd-trans.c
index 7551c883304a..23adaca83639 100644
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


