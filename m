Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E811C346BC8
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 23:09:46 +0100 (CET)
Received: from localhost ([::1]:56574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOpDd-00032r-Lq
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 18:09:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOp1Y-000754-48
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 17:57:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOp1P-0002mz-WF
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 17:57:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616536626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YLrjTVwoMbXiA5kbm5QHR+bbexvD3KTjgQOc0ele8eY=;
 b=H2LK0pOGJFgixP8JleA3IhsJT5vNIlauS+DRuaDew9+chBm4IUsIkBXBGYrjQkgQ1xL4eG
 bS7brvnp2pbnKVvOSvZFy4OYHbyS+RYl5gbIDynsbnkZlv/JRqVOeCkS3LBwEIPBa2PamQ
 j6ywnuvmOmtRGr5MR6hj7z7QA6+1G+w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-398-hA1bQNHmMZyHAYI28kApTA-1; Tue, 23 Mar 2021 17:57:04 -0400
X-MC-Unique: hA1bQNHmMZyHAYI28kApTA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A39F0100747D;
 Tue, 23 Mar 2021 21:57:03 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7028510027A5;
 Tue, 23 Mar 2021 21:57:03 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1633611326B4; Tue, 23 Mar 2021 22:56:59 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 29/29] block: Remove monitor command block_passwd
Date: Tue, 23 Mar 2021 22:56:58 +0100
Message-Id: <20210323215658.3840228-30-armbru@redhat.com>
In-Reply-To: <20210323215658.3840228-1-armbru@redhat.com>
References: <20210323215658.3840228-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Command block_passwd always fails since

Commit c01c214b69 "block: remove all encryption handling APIs"
(v2.10.0) turned block_passwd into a stub that always fails, and
hardcoded encryption_key_missing to false in query-named-block-nodes
and query-block.

Commit ad1324e044 "block: remove 'encryption_key_missing' flag from
QAPI" just landed.  Complete the cleanup job: remove block_passwd.

Cc: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20210323101951.3686029-1-armbru@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 qapi/block-core.json           | 14 --------------
 qapi/pragma.json               |  1 -
 block/monitor/block-hmp-cmds.c | 10 ----------
 blockdev.c                     |  8 --------
 hmp-commands.hx                | 15 ---------------
 5 files changed, 48 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 1c3f1deb03..6d227924d0 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -1207,20 +1207,6 @@
 ##
 { 'command': 'query-block-jobs', 'returns': ['BlockJobInfo'] }
 
-##
-# @block_passwd:
-#
-# This command sets the password of a block device that has not been open
-# with a password and requires one.
-#
-# This command is now obsolete and will always return an error since 2.10
-#
-##
-{ 'command': 'block_passwd',
-  'data': { '*device': 'str',
-            '*node-name': 'str',
-            'password': 'str' } }
-
 ##
 # @block_resize:
 #
diff --git a/qapi/pragma.json b/qapi/pragma.json
index b4e17167e1..3bc0335d1f 100644
--- a/qapi/pragma.json
+++ b/qapi/pragma.json
@@ -6,7 +6,6 @@
     # Commands allowed to return a non-dictionary:
     'command-name-exceptions': [
         'add_client',
-        'block_passwd',
         'block_resize',
         'block_set_io_throttle',
         'client_migrate_info',
diff --git a/block/monitor/block-hmp-cmds.c b/block/monitor/block-hmp-cmds.c
index 75d7fa9510..ebf1033f31 100644
--- a/block/monitor/block-hmp-cmds.c
+++ b/block/monitor/block-hmp-cmds.c
@@ -515,16 +515,6 @@ void hmp_block_stream(Monitor *mon, const QDict *qdict)
     hmp_handle_error(mon, error);
 }
 
-void hmp_block_passwd(Monitor *mon, const QDict *qdict)
-{
-    const char *device = qdict_get_str(qdict, "device");
-    const char *password = qdict_get_str(qdict, "password");
-    Error *err = NULL;
-
-    qmp_block_passwd(true, device, false, NULL, password, &err);
-    hmp_handle_error(mon, err);
-}
-
 void hmp_block_set_io_throttle(Monitor *mon, const QDict *qdict)
 {
     Error *err = NULL;
diff --git a/blockdev.c b/blockdev.c
index cf70bb4e43..621cc3b7c4 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -2407,14 +2407,6 @@ exit:
     job_txn_unref(block_job_txn);
 }
 
-void qmp_block_passwd(bool has_device, const char *device,
-                      bool has_node_name, const char *node_name,
-                      const char *password, Error **errp)
-{
-    error_setg(errp,
-               "Setting block passwords directly is no longer supported");
-}
-
 BlockDirtyBitmapSha256 *qmp_x_debug_block_dirty_bitmap_sha256(const char *node,
                                                               const char *name,
                                                               Error **errp)
diff --git a/hmp-commands.hx b/hmp-commands.hx
index 9b88c45174..435c591a1c 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -1493,21 +1493,6 @@ SRST
   used by another monitor command.
 ERST
 
-    {
-        .name       = "block_passwd",
-        .args_type  = "device:B,password:s",
-        .params     = "block_passwd device password",
-        .help       = "set the password of encrypted block devices",
-        .cmd        = hmp_block_passwd,
-    },
-
-SRST
-``block_passwd`` *device* *password*
-  Set the encrypted device *device* password to *password*
-
-  This command is now obsolete and will always return an error since 2.10
-ERST
-
     {
         .name       = "block_set_io_throttle",
         .args_type  = "device:B,bps:l,bps_rd:l,bps_wr:l,iops:l,iops_rd:l,iops_wr:l",
-- 
2.26.3


