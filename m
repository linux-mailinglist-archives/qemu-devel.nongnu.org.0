Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 296B131D8F2
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 13:00:45 +0100 (CET)
Received: from localhost ([::1]:50676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCLVc-0003CG-7r
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 07:00:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lCLU0-0002Ll-GL
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 06:59:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lCLTx-0002lk-Mi
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 06:59:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613563139;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=09plxGU+Bsvnk34ZEop/wZlOiub8bmqVmqpQ6t17O4Y=;
 b=UUwdioV24p3j/J8OIvtsdD6TE4zeCMITcxarSwOjlI3NFDdu1x2euhPWOweQE491aE7RFH
 dWs1vgRgIOue7v9JwOyjjvhJUsDOqrpbkW6VQDxECqcDcLzy1T3NZ5F42etwhevr7xy8X1
 8Ls980FnBYxk9gI60aAxxWygN9SOs6k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-415-ruAUQjTRMruOybgliv23kw-1; Wed, 17 Feb 2021 06:58:47 -0500
X-MC-Unique: ruAUQjTRMruOybgliv23kw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C1FC1AFA80;
 Wed, 17 Feb 2021 11:58:46 +0000 (UTC)
Received: from localhost (ovpn-114-112.ams2.redhat.com [10.36.114.112])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3534819D6C;
 Wed, 17 Feb 2021 11:58:45 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH] qsd: Document FUSE exports
Date: Wed, 17 Feb 2021 12:58:44 +0100
Message-Id: <20210217115844.62661-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implementing FUSE exports required no changes to the storage daemon, so
we forgot to document them there.  Considering that both NBD and
vhost-user-blk exports are documented in its man page (and NBD exports
in its --help text), we should probably do the same for FUSE.

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 docs/tools/qemu-storage-daemon.rst   | 19 +++++++++++++++++++
 storage-daemon/qemu-storage-daemon.c |  4 ++++
 2 files changed, 23 insertions(+)

diff --git a/docs/tools/qemu-storage-daemon.rst b/docs/tools/qemu-storage-daemon.rst
index f63627eaf6..f5a906f6fc 100644
--- a/docs/tools/qemu-storage-daemon.rst
+++ b/docs/tools/qemu-storage-daemon.rst
@@ -74,6 +74,7 @@ Standard options:
 .. option:: --export [type=]nbd,id=<id>,node-name=<node-name>[,name=<export-name>][,writable=on|off][,bitmap=<name>]
   --export [type=]vhost-user-blk,id=<id>,node-name=<node-name>,addr.type=unix,addr.path=<socket-path>[,writable=on|off][,logical-block-size=<block-size>][,num-queues=<num-queues>]
   --export [type=]vhost-user-blk,id=<id>,node-name=<node-name>,addr.type=fd,addr.str=<fd>[,writable=on|off][,logical-block-size=<block-size>][,num-queues=<num-queues>]
+  --export [type=]fuse,id=<id>,node-name=<node-name>,mountpoint=<file>[,growable=on|off][,writable=on|off]
 
   is a block export definition. ``node-name`` is the block node that should be
   exported. ``writable`` determines whether or not the export allows write
@@ -91,6 +92,16 @@ Standard options:
   ``logical-block-size`` sets the logical block size in bytes (the default is
   512). ``num-queues`` sets the number of virtqueues (the default is 1).
 
+  The ``fuse`` export type takes a mount point, which must be a regular file,
+  on which to export the given block node. That file will not be changed, it
+  will just appear to have the block node's content while the export is active
+  (very much like mounting a filesystem on a directory does not change what the
+  directory contains, it only shows a different content while the filesystem is
+  mounted). Consequently, applications that have opened the given file before
+  the export became active will continue to see its original content. If
+  ``growable`` is set, writes after the end of the exported file will grow the
+  block node to fit.
+
 .. option:: --monitor MONITORDEF
 
   is a QMP monitor definition. See the :manpage:`qemu(1)` manual page for
@@ -142,6 +153,14 @@ domain socket ``vhost-user-blk.sock``::
       --blockdev driver=qcow2,node-name=qcow2,file=file \
       --export type=vhost-user-blk,id=export,addr.type=unix,addr.path=vhost-user-blk.sock,node-name=qcow2
 
+Export a qcow2 image file ``disk.qcow2`` via FUSE on itself, so the disk image
+file will then appear as a raw image::
+
+  $ qemu-storage-daemon \
+      --blockdev driver=file,node-name=file,filename=disk.qcow2 \
+      --blockdev driver=qcow2,node-name=qcow2,file=file \
+      --export type=fuse,id=export,node-name=qcow2,mountpoint=disk.qcow2,writable=on
+
 See also
 --------
 
diff --git a/storage-daemon/qemu-storage-daemon.c b/storage-daemon/qemu-storage-daemon.c
index 9021a46b3a..bdf8877995 100644
--- a/storage-daemon/qemu-storage-daemon.c
+++ b/storage-daemon/qemu-storage-daemon.c
@@ -97,6 +97,10 @@ static void help(void)
 "                         export the specified block node over NBD\n"
 "                         (requires --nbd-server)\n"
 "\n"
+"  --export [type=]fuse,id=<id>,node-name=<node-name>,mountpoint=<file>\n"
+"           [,growable=on|off][,writable=on|off]\n"
+"                         export the specified block node over FUSE\n"
+"\n"
 "  --monitor [chardev=]name[,mode=control][,pretty[=on|off]]\n"
 "                         configure a QMP monitor\n"
 "\n"
-- 
2.29.2


