Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3229F4450C1
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 09:59:56 +0100 (CET)
Received: from localhost ([::1]:53000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miYbD-0005aX-C7
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 04:59:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1miYa7-0003xE-V6
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 04:58:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39241)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1miYa5-00012F-SE
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 04:58:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636016325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wtrLwbDg3AhhAwqIBZjITEGs8OHrx6AIMtzMLUlesNE=;
 b=ET2/RjFQSq0EpISboMmf7qUqhDSf/RGn43nsAfFV8BxJAlq/iEuri0bvJR0CBer+uZ8Cda
 EbXixvBrFV4SDr/j5vn8i79EtXrrG4gaP38vld2AC4dzMNwwThsFf+wVZVCzDfUWHSsy2P
 05rophWnbNnE0C6cueqgPYtVTTVpAOs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-600-iWzlQQCCNX6kHXDhMQ32Bw-1; Thu, 04 Nov 2021 04:58:42 -0400
X-MC-Unique: iWzlQQCCNX6kHXDhMQ32Bw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E2A2419057A1;
 Thu,  4 Nov 2021 08:58:40 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3072E5D740;
 Thu,  4 Nov 2021 08:58:13 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BE6E111380BA; Thu,  4 Nov 2021 09:58:11 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 3/3] qapi: deprecate drive-backup
Date: Thu,  4 Nov 2021 09:58:11 +0100
Message-Id: <20211104085811.1736654-4-armbru@redhat.com>
In-Reply-To: <20211104085811.1736654-1-armbru@redhat.com>
References: <20211104085811.1736654-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: vsementsov@virtuozzo.com, qemu-block@nongnu.org, kchamart@redhat.com,
 libvir-list@redhat.com, jsnow@redhat.com, xiechanglong.d@gmail.com,
 wencongyang2@huawei.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Modern way is using blockdev-add + blockdev-backup, which provides a
lot more control on how target is opened.

As example of drive-backup problems consider the following:

User of drive-backup expects that target will be opened in the same
cache and aio mode as source. Corresponding logic is in
drive_backup_prepare(), where we take bs->open_flags of source.

It works rather bad if source was added by blockdev-add. Assume source
is qcow2 image. On blockdev-add we should specify aio and cache options
for file child of qcow2 node. What happens next:

drive_backup_prepare() looks at bs->open_flags of qcow2 source node.
But there no BDRV_O_NOCAHE neither BDRV_O_NATIVE_AIO: BDRV_O_NOCAHE is
places in bs->file->bs->open_flags, and BDRV_O_NATIVE_AIO is nowhere,
as file-posix parse options and simply set s->use_linux_aio.

The documentation is updated in a minimal way, so that drive-backup is
noted only as a deprecated command, and blockdev-backup used in most of
places.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Kashyap Chamarthy <kchamart@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 docs/about/deprecated.rst              | 11 ++++++
 docs/interop/live-block-operations.rst | 47 +++++++++++++++++---------
 qapi/block-core.json                   |  5 ++-
 qapi/transaction.json                  |  6 +++-
 4 files changed, 51 insertions(+), 18 deletions(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 56f9ad15ab..e3bdb89c65 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -239,6 +239,17 @@ single ``bitmap``, the new ``block-export-add`` uses a list of ``bitmaps``.
 Member ``values`` in return value elements with meta-type ``enum`` is
 deprecated.  Use ``members`` instead.
 
+``drive-backup`` (since 6.2)
+''''''''''''''''''''''''''''
+
+Use ``blockdev-backup`` in combination with ``blockdev-add`` instead.
+This change primarily separates the creation/opening process of the backup
+target with explicit, separate steps. ``blockdev-backup`` uses mostly the
+same arguments as ``drive-backup``, except the ``format`` and ``mode``
+options are removed in favor of using explicit ``blockdev-create`` and
+``blockdev-add`` calls. See :doc:`/interop/live-block-operations` for
+details.
+
 System accelerators
 -------------------
 
diff --git a/docs/interop/live-block-operations.rst b/docs/interop/live-block-operations.rst
index 9e3635b233..d403d96f58 100644
--- a/docs/interop/live-block-operations.rst
+++ b/docs/interop/live-block-operations.rst
@@ -116,8 +116,8 @@ QEMU block layer supports.
 (3) ``drive-mirror`` (and ``blockdev-mirror``): Synchronize a running
     disk to another image.
 
-(4) ``drive-backup`` (and ``blockdev-backup``): Point-in-time (live) copy
-    of a block device to a destination.
+(4) ``blockdev-backup`` (and the deprecated ``drive-backup``):
+    Point-in-time (live) copy of a block device to a destination.
 
 
 .. _`Interacting with a QEMU instance`:
@@ -555,13 +555,14 @@ Currently, there are four different kinds:
 
 (3) ``none`` -- Synchronize only the new writes from this point on.
 
-    .. note:: In the case of ``drive-backup`` (or ``blockdev-backup``),
-              the behavior of ``none`` synchronization mode is different.
-              Normally, a ``backup`` job consists of two parts: Anything
-              that is overwritten by the guest is first copied out to
-              the backup, and in the background the whole image is
-              copied from start to end. With ``sync=none``, it's only
-              the first part.
+    .. note:: In the case of ``blockdev-backup`` (or deprecated
+              ``drive-backup``), the behavior of ``none``
+              synchronization mode is different.  Normally, a
+              ``backup`` job consists of two parts: Anything that is
+              overwritten by the guest is first copied out to the
+              backup, and in the background the whole image is copied
+              from start to end. With ``sync=none``, it's only the
+              first part.
 
 (4) ``incremental`` -- Synchronize content that is described by the
     dirty bitmap
@@ -928,19 +929,22 @@ Shutdown the guest, by issuing the ``quit`` QMP command::
     }
 
 
-Live disk backup --- ``drive-backup`` and ``blockdev-backup``
--------------------------------------------------------------
+Live disk backup --- ``blockdev-backup`` and the deprecated``drive-backup``
+---------------------------------------------------------------------------
 
-The ``drive-backup`` (and its newer equivalent ``blockdev-backup``) allows
+The ``blockdev-backup`` (and the deprecated ``drive-backup``) allows
 you to create a point-in-time snapshot.
 
-In this case, the point-in-time is when you *start* the ``drive-backup``
-(or its newer equivalent ``blockdev-backup``) command.
+In this case, the point-in-time is when you *start* the
+``blockdev-backup`` (or deprecated ``drive-backup``) command.
 
 
 QMP invocation for ``drive-backup``
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
+Note that ``drive-backup`` command is deprecated since QEMU 6.1 and
+will be removed in future.
+
 Yet again, starting afresh with our example disk image chain::
 
     [A] <-- [B] <-- [C] <-- [D]
@@ -965,11 +969,22 @@ will be issued, indicating the live block device job operation has
 completed, and no further action is required.
 
 
+Moving from the deprecated ``drive-backup`` to newer ``blockdev-backup``
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+``blockdev-backup`` differs from ``drive-backup`` in how you specify
+the backup target. With ``blockdev-backup`` you can't specify filename
+as a target.  Instead you use ``node-name`` of existing block node,
+which you may add by ``blockdev-add`` or ``blockdev-create`` commands.
+Correspondingly, ``blockdev-backup`` doesn't have ``mode`` and
+``format`` arguments which don't apply to an existing block node. See
+following sections for details and examples.
+
+
 Notes on ``blockdev-backup``
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-The ``blockdev-backup`` command is equivalent in functionality to
-``drive-backup``, except that it operates at node-level in a Block Driver
+The ``blockdev-backup`` command operates at node-level in a Block Driver
 State (BDS) graph.
 
 E.g. the sequence of actions to create a point-in-time backup
diff --git a/qapi/block-core.json b/qapi/block-core.json
index b290782bf2..f4968d6404 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -1709,6 +1709,9 @@
 # The operation can be stopped before it has completed using the
 # block-job-cancel command.
 #
+# Features:
+# @deprecated: This command is deprecated. Use @blockdev-backup instead.
+#
 # Returns: - nothing on success
 #          - If @device is not a valid block device, GenericError
 #
@@ -1724,7 +1727,7 @@
 #
 ##
 { 'command': 'drive-backup', 'boxed': true,
-  'data': 'DriveBackup' }
+  'data': 'DriveBackup', 'features': ['deprecated'] }
 
 ##
 # @blockdev-backup:
diff --git a/qapi/transaction.json b/qapi/transaction.json
index d175b5f863..381a2df782 100644
--- a/qapi/transaction.json
+++ b/qapi/transaction.json
@@ -54,6 +54,10 @@
 # @blockdev-snapshot-sync: since 1.1
 # @drive-backup: Since 1.6
 #
+# Features:
+# @deprecated: Member @drive-backup is deprecated.  Use member
+#              @blockdev-backup instead.
+#
 # Since: 1.1
 ##
 { 'enum': 'TransactionActionKind',
@@ -62,7 +66,7 @@
             'block-dirty-bitmap-disable', 'block-dirty-bitmap-merge',
             'blockdev-backup', 'blockdev-snapshot',
             'blockdev-snapshot-internal-sync', 'blockdev-snapshot-sync',
-            'drive-backup' ] }
+            { 'name': 'drive-backup', 'features': [ 'deprecated' ] } ] }
 
 ##
 # @AbortWrapper:
-- 
2.31.1


