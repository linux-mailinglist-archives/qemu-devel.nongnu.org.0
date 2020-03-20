Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A782A18D0F8
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Mar 2020 15:34:17 +0100 (CET)
Received: from localhost ([::1]:53588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jFIj2-0000jJ-P4
	for lists+qemu-devel@lfdr.de; Fri, 20 Mar 2020 10:34:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49497)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1jFIhg-0000K0-6v
 for qemu-devel@nongnu.org; Fri, 20 Mar 2020 10:32:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1jFIhd-0006JR-OX
 for qemu-devel@nongnu.org; Fri, 20 Mar 2020 10:32:50 -0400
Received: from cmccmta2.chinamobile.com ([221.176.66.80]:9345)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1jFIhd-0006Hi-2g
 for qemu-devel@nongnu.org; Fri, 20 Mar 2020 10:32:49 -0400
Received: from spf.mail.chinamobile.com (unknown[172.16.121.9]) by
 rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id 2ee65e74d3f60ef-45e64;
 Fri, 20 Mar 2020 22:32:24 +0800 (CST)
X-RM-TRANSID: 2ee65e74d3f60ef-45e64
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from maozy-host.mshome.net (unknown[112.25.154.146])
 by rmsmtp-syy-appsvr05-12005 (RichMail) with SMTP id 2ee55e74d3f155d-03a5a;
 Fri, 20 Mar 2020 22:32:24 +0800 (CST)
X-RM-TRANSID: 2ee55e74d3f155d-03a5a
From: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] xbzrle: update xbzrle doc
Date: Fri, 20 Mar 2020 22:32:16 +0800
Message-Id: <20200320143216.423374-1-maozhongyi@cmss.chinamobile.com>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 221.176.66.80
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
 quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add new parameter description, also:
1. Remove unsociable space.
2. Nit picking: s/two/2 in report

Signed-off-by: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
---
 docs/xbzrle.txt       | 7 ++++++-
 migration/migration.c | 2 +-
 monitor/hmp-cmds.c    | 2 +-
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/docs/xbzrle.txt b/docs/xbzrle.txt
index c0a7dfd44c..b431bdaf0f 100644
--- a/docs/xbzrle.txt
+++ b/docs/xbzrle.txt
@@ -92,6 +92,11 @@ Usage
 power of 2. The cache default value is 64MBytes. (on source only)
     {qemu} migrate_set_cache_size 256m
 
+Commit 73af8dd8d7 "migration: Make xbzrle_cache_size a migration parameter"
+(v2.11.0) deprecated migrate-set-cache-size, therefore, the new parameter
+is recommended.
+    {qemu} migrate_set_parameter xbzrle-cache-size 256m
+
 4. Start outgoing migration
     {qemu} migrate -d tcp:destination.host:4444
     {qemu} info migrate
@@ -108,7 +113,7 @@ power of 2. The cache default value is 64MBytes. (on source only)
     xbzrle transferred: I kbytes
     xbzrle pages: J pages
     xbzrle cache miss: K
-    xbzrle overflow : L
+    xbzrle overflow: L
 
 xbzrle cache-miss: the number of cache misses to date - high cache-miss rate
 indicates that the cache size is set too low.
diff --git a/migration/migration.c b/migration/migration.c
index c1d88ace7f..4b26110d57 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1243,7 +1243,7 @@ static bool migrate_params_check(MigrationParameters *params, Error **errp)
         error_setg(errp, QERR_INVALID_PARAMETER_VALUE,
                    "xbzrle_cache_size",
                    "is invalid, it should be bigger than target page size"
-                   " and a power of two");
+                   " and a power of 2");
         return false;
     }
 
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index f8be6bbb16..dbfb121eb2 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -303,7 +303,7 @@ void hmp_info_migrate(Monitor *mon, const QDict *qdict)
                        info->xbzrle_cache->cache_miss);
         monitor_printf(mon, "xbzrle cache miss rate: %0.2f\n",
                        info->xbzrle_cache->cache_miss_rate);
-        monitor_printf(mon, "xbzrle overflow : %" PRIu64 "\n",
+        monitor_printf(mon, "xbzrle overflow: %" PRIu64 "\n",
                        info->xbzrle_cache->overflow);
     }
 
-- 
2.17.1




