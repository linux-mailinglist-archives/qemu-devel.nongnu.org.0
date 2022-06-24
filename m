Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B34B559DBB
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 17:56:17 +0200 (CEST)
Received: from localhost ([::1]:50232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4lfM-0000Hd-5X
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 11:56:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1o4lRA-0006Xz-0Z
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 11:41:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1o4lR4-0000sn-FN
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 11:41:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656085289;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RmSk+tUEqXiBalaaOmEjXLxaJWQNJUFlikSGSiwR69g=;
 b=JxUwdjCnVxLDZuh+Uy9AALq2aIPmPU1Q4fkrKhdR54Dvn7T+Ypf7v0tNRdpeULG9hDNN4V
 4Cb/tBSLEJke77zRoo1L50XrNW2NoBrxD1n6c+n9yWoxPOIJkbUttyil6UdVPcmsBt0Kqz
 F5v7bITYIbZBl6VsaebjbM7810V+7Lc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-265-N5KNe1t8PkqX-Db1zoETkg-1; Fri, 24 Jun 2022 11:41:27 -0400
X-MC-Unique: N5KNe1t8PkqX-Db1zoETkg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DEE652919EA7;
 Fri, 24 Jun 2022 15:41:26 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4AA7A492C3B;
 Fri, 24 Jun 2022 15:41:26 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL v2 14/20] qsd: document vduse-blk exports
Date: Fri, 24 Jun 2022 17:40:57 +0200
Message-Id: <20220624154103.185902-15-kwolf@redhat.com>
In-Reply-To: <20220624154103.185902-1-kwolf@redhat.com>
References: <20220624154103.185902-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Hajnoczi <stefanha@redhat.com>

Document vduse-blk exports in qemu-storage-daemon --help and the
qemu-storage-daemon(1) man page.

Based-on: <20220523084611.91-1-xieyongji@bytedance.com>
Cc: Xie Yongji <xieyongji@bytedance.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20220525121947.859820-1-stefanha@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 docs/tools/qemu-storage-daemon.rst   | 21 +++++++++++++++++++++
 storage-daemon/qemu-storage-daemon.c |  9 +++++++++
 2 files changed, 30 insertions(+)

diff --git a/docs/tools/qemu-storage-daemon.rst b/docs/tools/qemu-storage-daemon.rst
index 8b97592663..fbeaf76954 100644
--- a/docs/tools/qemu-storage-daemon.rst
+++ b/docs/tools/qemu-storage-daemon.rst
@@ -77,6 +77,7 @@ Standard options:
   --export [type=]vhost-user-blk,id=<id>,node-name=<node-name>,addr.type=unix,addr.path=<socket-path>[,writable=on|off][,logical-block-size=<block-size>][,num-queues=<num-queues>]
   --export [type=]vhost-user-blk,id=<id>,node-name=<node-name>,addr.type=fd,addr.str=<fd>[,writable=on|off][,logical-block-size=<block-size>][,num-queues=<num-queues>]
   --export [type=]fuse,id=<id>,node-name=<node-name>,mountpoint=<file>[,growable=on|off][,writable=on|off][,allow-other=on|off|auto]
+  --export [type=]vduse-blk,id=<id>,node-name=<node-name>[,writable=on|off][,num-queues=<num-queues>][,queue-size=<queue-size>][,logical-block-size=<block-size>]
 
   is a block export definition. ``node-name`` is the block node that should be
   exported. ``writable`` determines whether or not the export allows write
@@ -110,6 +111,26 @@ Standard options:
   ``allow-other`` to auto (the default) will try enabling this option, and on
   error fall back to disabling it.
 
+  The ``vduse-blk`` export type uses the ``id`` as the VDUSE device name.
+  ``num-queues`` sets the number of virtqueues (the default is 1).
+  ``queue-size`` sets the virtqueue descriptor table size (the default is 256).
+
+  The instantiated VDUSE device must then be added to the vDPA bus using the
+  vdpa(8) command from the iproute2 project::
+
+  # vdpa dev add name <id> mgmtdev vduse
+
+  The device can be removed from the vDPA bus later as follows::
+
+  # vdpa dev del <id>
+
+  For more information about attaching vDPA devices to the host with
+  virtio_vdpa.ko or attaching them to guests with vhost_vdpa.ko, see
+  https://vdpa-dev.gitlab.io/.
+
+  For more information about VDUSE, see
+  https://docs.kernel.org/userspace-api/vduse.html.
+
 .. option:: --monitor MONITORDEF
 
   is a QMP monitor definition. See the :manpage:`qemu(1)` manual page for
diff --git a/storage-daemon/qemu-storage-daemon.c b/storage-daemon/qemu-storage-daemon.c
index c104817cdd..17fd3f2f5f 100644
--- a/storage-daemon/qemu-storage-daemon.c
+++ b/storage-daemon/qemu-storage-daemon.c
@@ -121,6 +121,15 @@ static void help(void)
 "                         vhost-user-blk device over file descriptor\n"
 "\n"
 #endif /* CONFIG_VHOST_USER_BLK_SERVER */
+#ifdef CONFIG_VDUSE_BLK_EXPORT
+"  --export [type=]vduse-blk,id=<id>,node-name=<node-name>\n"
+"           [,writable=on|off][,num-queues=<num-queues>]\n"
+"           [,queue-size=<queue-size>]\n"
+"           [,logical-block-size=<logical-block-size>]\n"
+"                         export the specified block node as a vduse-blk\n"
+"                         device using the id as the VDUSE device name\n"
+"\n"
+#endif /* CONFIG_VDUSE_BLK_EXPORT */
 "  --monitor [chardev=]name[,mode=control][,pretty[=on|off]]\n"
 "                         configure a QMP monitor\n"
 "\n"
-- 
2.35.3


