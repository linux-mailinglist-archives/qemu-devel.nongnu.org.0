Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5CF2260472
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Sep 2020 20:22:07 +0200 (CEST)
Received: from localhost ([::1]:35706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFLmI-0006tx-Po
	for lists+qemu-devel@lfdr.de; Mon, 07 Sep 2020 14:22:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kFLkv-0004uV-NU
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 14:20:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kFLkr-0004Rn-R6
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 14:20:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599502832;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ifOb174vCOuZKtX6jDaDjIhFVaGvhdYutKGZEFKcOLg=;
 b=cPeW89ODbwXeEopaKKN8EK8YQGrLLd1k0JFCFp0a9zO1zY4v4WfT7aL/JU2wWAImWEzsg3
 3rPVwtx4rR5yvPsKuZabI4Gl9hpMfRJIPn91NMfrDi8yMKHyW4WdyaFKCkWziV641KC9Fa
 wkHdA4MKyMZgwSclbrkxnSrB34kF2K4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-462-c2q-_bOINFmJeumxHUB1ow-1; Mon, 07 Sep 2020 14:20:29 -0400
X-MC-Unique: c2q-_bOINFmJeumxHUB1ow-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9850A18B9EC1;
 Mon,  7 Sep 2020 18:20:28 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-114-154.ams2.redhat.com
 [10.36.114.154])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7F85560BF3;
 Mon,  7 Sep 2020 18:20:27 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 03/29] qapi: Rename BlockExport to BlockExportOptions
Date: Mon,  7 Sep 2020 20:19:45 +0200
Message-Id: <20200907182011.521007-4-kwolf@redhat.com>
In-Reply-To: <20200907182011.521007-1-kwolf@redhat.com>
References: <20200907182011.521007-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/07 13:43:03
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The name BlockExport will be used for the struct containing the runtime
state of block exports, so change the name of export creation options.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 qapi/block-export.json               | 12 ++++++------
 block/monitor/block-hmp-cmds.c       |  6 +++---
 blockdev-nbd.c                       |  2 +-
 storage-daemon/qemu-storage-daemon.c |  8 ++++----
 4 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/qapi/block-export.json b/qapi/block-export.json
index f038eb47aa..799b7e50e7 100644
--- a/qapi/block-export.json
+++ b/qapi/block-export.json
@@ -57,7 +57,7 @@
             '*tls-authz': 'str'} }
 
 ##
-# @BlockExportNbd:
+# @BlockExportOptionsNbd:
 #
 # An NBD block export.
 #
@@ -78,7 +78,7 @@
 #
 # Since: 5.0
 ##
-{ 'struct': 'BlockExportNbd',
+{ 'struct': 'BlockExportOptionsNbd',
   'data': {'device': 'str', '*name': 'str', '*description': 'str',
            '*writable': 'bool', '*bitmap': 'str' } }
 
@@ -93,7 +93,7 @@
 # Since: 1.3.0
 ##
 { 'command': 'nbd-server-add',
-  'data': 'BlockExportNbd', 'boxed': true }
+  'data': 'BlockExportOptionsNbd', 'boxed': true }
 
 ##
 # @NbdServerRemoveMode:
@@ -159,17 +159,17 @@
   'data': [ 'nbd' ] }
 
 ##
-# @BlockExport:
+# @BlockExportOptions:
 #
 # Describes a block export, i.e. how single node should be exported on an
 # external interface.
 #
 # Since: 4.2
 ##
-{ 'union': 'BlockExport',
+{ 'union': 'BlockExportOptions',
   'base': { 'type': 'BlockExportType' },
   'discriminator': 'type',
   'data': {
-      'nbd': 'BlockExportNbd'
+      'nbd': 'BlockExportOptionsNbd'
    } }
 
diff --git a/block/monitor/block-hmp-cmds.c b/block/monitor/block-hmp-cmds.c
index 6ce0f8f87c..fb632b1189 100644
--- a/block/monitor/block-hmp-cmds.c
+++ b/block/monitor/block-hmp-cmds.c
@@ -398,7 +398,7 @@ void hmp_nbd_server_start(Monitor *mon, const QDict *qdict)
     Error *local_err = NULL;
     BlockInfoList *block_list, *info;
     SocketAddress *addr;
-    BlockExportNbd export;
+    BlockExportOptionsNbd export;
 
     if (writable && !all) {
         error_setg(&local_err, "-w only valid together with -a");
@@ -431,7 +431,7 @@ void hmp_nbd_server_start(Monitor *mon, const QDict *qdict)
             continue;
         }
 
-        export = (BlockExportNbd) {
+        export = (BlockExportOptionsNbd) {
             .device         = info->value->device,
             .has_writable   = true,
             .writable       = writable,
@@ -458,7 +458,7 @@ void hmp_nbd_server_add(Monitor *mon, const QDict *qdict)
     bool writable = qdict_get_try_bool(qdict, "writable", false);
     Error *local_err = NULL;
 
-    BlockExportNbd export = {
+    BlockExportOptionsNbd export = {
         .device         = (char *) device,
         .has_name       = !!name,
         .name           = (char *) name,
diff --git a/blockdev-nbd.c b/blockdev-nbd.c
index 0f6b80c58f..98ee1b6170 100644
--- a/blockdev-nbd.c
+++ b/blockdev-nbd.c
@@ -148,7 +148,7 @@ void qmp_nbd_server_start(SocketAddressLegacy *addr,
     qapi_free_SocketAddress(addr_flat);
 }
 
-void qmp_nbd_server_add(BlockExportNbd *arg, Error **errp)
+void qmp_nbd_server_add(BlockExportOptionsNbd *arg, Error **errp)
 {
     BlockDriverState *bs = NULL;
     BlockBackend *on_eject_blk;
diff --git a/storage-daemon/qemu-storage-daemon.c b/storage-daemon/qemu-storage-daemon.c
index ed9d2afcf3..ed26097254 100644
--- a/storage-daemon/qemu-storage-daemon.c
+++ b/storage-daemon/qemu-storage-daemon.c
@@ -150,7 +150,7 @@ static void init_qmp_commands(void)
                          qmp_marshal_qmp_capabilities, QCO_ALLOW_PRECONFIG);
 }
 
-static void init_export(BlockExport *export, Error **errp)
+static void init_export(BlockExportOptions *export, Error **errp)
 {
     switch (export->type) {
     case BLOCK_EXPORT_TYPE_NBD:
@@ -235,14 +235,14 @@ static void process_options(int argc, char *argv[])
         case OPTION_EXPORT:
             {
                 Visitor *v;
-                BlockExport *export;
+                BlockExportOptions *export;
 
                 v = qobject_input_visitor_new_str(optarg, "type", &error_fatal);
-                visit_type_BlockExport(v, NULL, &export, &error_fatal);
+                visit_type_BlockExportOptions(v, NULL, &export, &error_fatal);
                 visit_free(v);
 
                 init_export(export, &error_fatal);
-                qapi_free_BlockExport(export);
+                qapi_free_BlockExportOptions(export);
                 break;
             }
         case OPTION_MONITOR:
-- 
2.25.4


