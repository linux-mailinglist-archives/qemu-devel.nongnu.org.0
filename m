Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E7018E24E
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Mar 2020 16:11:45 +0100 (CET)
Received: from localhost ([::1]:38004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jFfmp-0003lC-Mq
	for lists+qemu-devel@lfdr.de; Sat, 21 Mar 2020 11:11:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36487)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1jFfls-00030N-LF
 for qemu-devel@nongnu.org; Sat, 21 Mar 2020 11:10:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1jFflq-0008Vb-Ma
 for qemu-devel@nongnu.org; Sat, 21 Mar 2020 11:10:44 -0400
Received: from cmccmta1.chinamobile.com ([221.176.66.79]:7318)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1jFflq-0008ND-30
 for qemu-devel@nongnu.org; Sat, 21 Mar 2020 11:10:42 -0400
Received: from spf.mail.chinamobile.com (unknown[172.16.121.13]) by
 rmmx-syy-dmz-app02-12002 (RichMail) with SMTP id 2ee25e762e5d272-54118;
 Sat, 21 Mar 2020 23:10:22 +0800 (CST)
X-RM-TRANSID: 2ee25e762e5d272-54118
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from maozy-host.localdomain (unknown[117.136.68.181])
 by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee75e762e594c3-813a7;
 Sat, 21 Mar 2020 23:10:22 +0800 (CST)
X-RM-TRANSID: 2ee75e762e594c3-813a7
From: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] monitor/hmp-cmds: remove redundant check for tls_authz in
 hmp_info_migrate_parameters
Date: Sat, 21 Mar 2020 23:10:15 +0800
Message-Id: <20200321151015.564989-1-maozhongyi@cmss.chinamobile.com>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 221.176.66.79
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
Cc: dgilbert@redhat.com, Mao Zhongyi <maozhongyi@cmss.chinamobile.com>,
 armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

'params->has_tls_authz = true' has been hardcoded as true in
qmp_query_migrate_parameters, so remove the redundant check.

Signed-off-by: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
---
 monitor/hmp-cmds.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index f8be6bbb16..d18826309b 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -461,7 +461,7 @@ void hmp_info_migrate_parameters(Monitor *mon, const QDict *qdict)
             params->max_postcopy_bandwidth);
         monitor_printf(mon, "%s: '%s'\n",
             MigrationParameter_str(MIGRATION_PARAMETER_TLS_AUTHZ),
-            params->has_tls_authz ? params->tls_authz : "");
+            params->tls_authz);
     }
 
     qapi_free_MigrationParameters(params);
-- 
2.17.1




