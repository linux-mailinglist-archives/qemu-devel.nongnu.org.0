Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4E82815D5
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Oct 2020 16:53:22 +0200 (CEST)
Received: from localhost ([::1]:52652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kOMQz-0004Tx-4E
	for lists+qemu-devel@lfdr.de; Fri, 02 Oct 2020 10:53:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kOMI7-0001Go-4H
 for qemu-devel@nongnu.org; Fri, 02 Oct 2020 10:44:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kOMI2-0004Vr-8d
 for qemu-devel@nongnu.org; Fri, 02 Oct 2020 10:44:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601649844;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sXxg/FT/4Y3mCvoxUibNIpE+K9W0Tiw7lZIkheb+Ff4=;
 b=epSpJsJY2iDs+NKNdnET8tZipUBRdkK0dctM8pIRKoRn0o1okEJmMBcKjqD6GQQytJa1nt
 mZX6yEk4SyQKgn2ElRjXnIPWI1AQdIC/rsoy+MNOi/wlHD8MfcBchE+uChvFCkJaNJeEEF
 y7j8mtPOvrXVsgX38o5J7wD7GAcGO0g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-TkzH2ye-ORqJ0yJW15DhiA-1; Fri, 02 Oct 2020 10:44:01 -0400
X-MC-Unique: TkzH2ye-ORqJ0yJW15DhiA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE8A6192AB60;
 Fri,  2 Oct 2020 14:43:59 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-112-139.ams2.redhat.com
 [10.36.112.139])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 070F05D9D3;
 Fri,  2 Oct 2020 14:43:58 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 07/37] qapi: Rename BlockExport to BlockExportOptions
Date: Fri,  2 Oct 2020 16:43:15 +0200
Message-Id: <20201002144345.253865-8-kwolf@redhat.com>
In-Reply-To: <20201002144345.253865-1-kwolf@redhat.com>
References: <20201002144345.253865-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/02 01:13:31
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The name BlockExport will be used for the struct containing the runtime
state of block exports, so change the name of export creation options.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20200924152717.287415-4-kwolf@redhat.com>
Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 qapi/block-export.json               | 12 ++++++------
 block/monitor/block-hmp-cmds.c       |  6 +++---
 blockdev-nbd.c                       |  2 +-
 storage-daemon/qemu-storage-daemon.c |  8 ++++----
 4 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/qapi/block-export.json b/qapi/block-export.json
index b21b8e3f4d..6ac3a63123 100644
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
@@ -159,16 +159,16 @@
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


