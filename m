Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44523192965
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Mar 2020 14:18:19 +0100 (CET)
Received: from localhost ([::1]:36108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jH5vG-00085H-6u
	for lists+qemu-devel@lfdr.de; Wed, 25 Mar 2020 09:18:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52972)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1jH5tl-0006Wg-Ug
 for qemu-devel@nongnu.org; Wed, 25 Mar 2020 09:16:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1jH5tk-0005uR-OY
 for qemu-devel@nongnu.org; Wed, 25 Mar 2020 09:16:45 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:28941)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1jH5tk-0005tv-Kr
 for qemu-devel@nongnu.org; Wed, 25 Mar 2020 09:16:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585142204;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pydUbxiU1H3iPmV+/JsmS6Cq589AJNt5/EbCILkfIkI=;
 b=OV/HA6jKu1Nzi3WEKJ0UKpURtz7rW/2+gOVwvD6IAFn38IcfVGDVMVWvBsPFuniw7ToteJ
 ls3Kr3o6hMe7aEarm7jo1F2DxH+eRk3eXXL1nU76JFfnKP4lAo9KR8K24Vx+K136KNMm6b
 ttaXKAubBEaZTz5m0KgQQk5LSJEUiGg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-406-nzGyf0RaPCyYrARlzEnduw-1; Wed, 25 Mar 2020 09:16:42 -0400
X-MC-Unique: nzGyf0RaPCyYrARlzEnduw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2178A1137843;
 Wed, 25 Mar 2020 13:16:41 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-213.ams2.redhat.com
 [10.36.114.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B360D5C241;
 Wed, 25 Mar 2020 13:16:39 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, pannengyuan@huawei.com,
 maozhongyi@cmss.chinamobile.com, vsementsov@virtuozzo.com,
 imammedo@redhat.com, philmd@redhat.com
Subject: [PULL 2/9] xbzrle: update xbzrle doc
Date: Wed, 25 Mar 2020 13:16:25 +0000
Message-Id: <20200325131632.311034-3-dgilbert@redhat.com>
In-Reply-To: <20200325131632.311034-1-dgilbert@redhat.com>
References: <20200325131632.311034-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.128.21.74
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>

Add new parameter description, also:
1. Remove unsociable space.
2. Nit picking: s/two/2 in report

Signed-off-by: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
Message-Id: <20200320143216.423374-1-maozhongyi@cmss.chinamobile.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
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
=20
+Commit 73af8dd8d7 "migration: Make xbzrle_cache_size a migration parameter=
"
+(v2.11.0) deprecated migrate-set-cache-size, therefore, the new parameter
+is recommended.
+    {qemu} migrate_set_parameter xbzrle-cache-size 256m
+
 4. Start outgoing migration
     {qemu} migrate -d tcp:destination.host:4444
     {qemu} info migrate
@@ -108,7 +113,7 @@ power of 2. The cache default value is 64MBytes. (on so=
urce only)
     xbzrle transferred: I kbytes
     xbzrle pages: J pages
     xbzrle cache miss: K
-    xbzrle overflow : L
+    xbzrle overflow: L
=20
 xbzrle cache-miss: the number of cache misses to date - high cache-miss ra=
te
 indicates that the cache size is set too low.
diff --git a/migration/migration.c b/migration/migration.c
index c1d88ace7f..4b26110d57 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1243,7 +1243,7 @@ static bool migrate_params_check(MigrationParameters =
*params, Error **errp)
         error_setg(errp, QERR_INVALID_PARAMETER_VALUE,
                    "xbzrle_cache_size",
                    "is invalid, it should be bigger than target page size"
-                   " and a power of two");
+                   " and a power of 2");
         return false;
     }
=20
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index c882c9f3cc..76725c2ace 100644
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
=20
--=20
2.25.1


