Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A829545391
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 19:59:01 +0200 (CEST)
Received: from localhost ([::1]:53304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzMQu-0002Qy-FX
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 13:59:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nzLro-0007sy-Qj
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 13:22:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nzLrd-0003hE-T4
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 13:22:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654795348;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RmSk+tUEqXiBalaaOmEjXLxaJWQNJUFlikSGSiwR69g=;
 b=XtzxBJVmX5hpU8Mucz/z5FRVgWf4iDIMhqu5Gdzu/0Hx/AFyPMg/8By2Wsc+V0iXvqaRih
 JbdeS0iuPXaqrbi+npmyo0DaNOzk5e1+nOWr1Pz8IT9Gnk7m/XgqbW3cZrZOT+mEI1uuDu
 bhz/7VrPQ85JNWsorqGkzNjut01sNMA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-230-GVsLWVGBPuu0z39dViz82g-1; Thu, 09 Jun 2022 13:22:25 -0400
X-MC-Unique: GVsLWVGBPuu0z39dViz82g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F01BB80159B;
 Thu,  9 Jun 2022 17:22:24 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.195.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 58210404E4B5;
 Thu,  9 Jun 2022 17:22:24 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 14/18] qsd: document vduse-blk exports
Date: Thu,  9 Jun 2022 19:21:45 +0200
Message-Id: <20220609172149.293877-15-kwolf@redhat.com>
In-Reply-To: <20220609172149.293877-1-kwolf@redhat.com>
References: <20220609172149.293877-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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


