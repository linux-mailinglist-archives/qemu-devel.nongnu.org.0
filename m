Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 196E939E5E2
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 19:50:54 +0200 (CEST)
Received: from localhost ([::1]:35770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqJOl-0002W5-NO
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 13:50:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lqIyC-0002Tz-Ds
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 13:23:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41220)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lqIy7-0001Lj-IQ
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 13:23:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623086598;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=i1TVAADkI/cdPTRzvsXFG0rl+ETi8JbcrWDKPqHFnvE=;
 b=I+e27/gaqgPVUwQ5JbcxtP0Cf9JjJfGZTG+DFOfol8FBXMkj9jTep2N8LtBsHDBy8pIKnv
 VBZ3QQtXeyoNE+Wmm1gglgBA1ZwAlmOLAQ4T9x3VJMMJVVbdzxYJwZzxhXbS7ov4ZuZX6u
 QePtApS4pOVpxND/9urHrmmGzzAA01o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-318-Fap85uZAPfyqIj_j8Wxysg-1; Mon, 07 Jun 2021 13:23:16 -0400
X-MC-Unique: Fap85uZAPfyqIj_j8Wxysg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C11D6180FD64;
 Mon,  7 Jun 2021 17:23:15 +0000 (UTC)
Received: from thuth.com (ovpn-112-83.ams2.redhat.com [10.36.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B5A1C5D6D3;
 Mon,  7 Jun 2021 17:23:14 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] docs/interop/live-block-operations: Do not hard-code the QEMU
 binary name
Date: Mon,  7 Jun 2021 19:23:11 +0200
Message-Id: <20210607172311.915385-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
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
Cc: qemu-trivial@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In downstream, we want to use a different name for the QEMU binary,
and some people might also use the docs for non-x86 binaries, that's
why we already created the |qemu_system| placeholder in the past.
Use it now in the live-block-operations doc, too.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/interop/live-block-operations.rst | 32 +++++++++++++++-----------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/docs/interop/live-block-operations.rst b/docs/interop/live-block-operations.rst
index 1073b930dc..477d085f54 100644
--- a/docs/interop/live-block-operations.rst
+++ b/docs/interop/live-block-operations.rst
@@ -127,13 +127,15 @@ Interacting with a QEMU instance
 
 To show some example invocations of command-line, we will use the
 following invocation of QEMU, with a QMP server running over UNIX
-socket::
+socket:
 
-    $ ./qemu-system-x86_64 -display none -no-user-config \
-        -M q35 -nodefaults -m 512 \
-        -blockdev node-name=node-A,driver=qcow2,file.driver=file,file.node-name=file,file.filename=./a.qcow2 \
-        -device virtio-blk,drive=node-A,id=virtio0 \
-        -monitor stdio -qmp unix:/tmp/qmp-sock,server=on,wait=off
+.. parsed-literal::
+
+  $ |qemu_system| -display none -no-user-config -nodefaults \\
+    -m 512 -blockdev \\
+    node-name=node-A,driver=qcow2,file.driver=file,file.node-name=file,file.filename=./a.qcow2 \\
+    -device virtio-blk,drive=node-A,id=virtio0 \\
+    -monitor stdio -qmp unix:/tmp/qmp-sock,server=on,wait=off
 
 The ``-blockdev`` command-line option, used above, is available from
 QEMU 2.9 onwards.  In the above invocation, notice the ``node-name``
@@ -692,14 +694,16 @@ And start the destination QEMU (we already have the source QEMU running
 -- discussed in the section: `Interacting with a QEMU instance`_)
 instance, with the following invocation.  (As noted earlier, for
 simplicity's sake, the destination QEMU is started on the same host, but
-it could be located elsewhere)::
-
-    $ ./qemu-system-x86_64 -display none -no-user-config \
-        -M q35 -nodefaults -m 512 \
-        -blockdev node-name=node-TargetDisk,driver=qcow2,file.driver=file,file.node-name=file,file.filename=./target-disk.qcow2 \
-        -device virtio-blk,drive=node-TargetDisk,id=virtio0 \
-        -S -monitor stdio -qmp unix:./qmp-sock2,server=on,wait=off \
-        -incoming tcp:localhost:6666
+it could be located elsewhere):
+
+.. parsed-literal::
+
+  $ |qemu_system| -display none -no-user-config -nodefaults \\
+    -m 512 -blockdev \\
+    node-name=node-TargetDisk,driver=qcow2,file.driver=file,file.node-name=file,file.filename=./target-disk.qcow2 \\
+    -device virtio-blk,drive=node-TargetDisk,id=virtio0 \\
+    -S -monitor stdio -qmp unix:./qmp-sock2,server=on,wait=off \\
+    -incoming tcp:localhost:6666
 
 Given the disk image chain on source QEMU::
 
-- 
2.27.0


