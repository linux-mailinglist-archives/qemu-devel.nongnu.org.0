Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3CD9687062
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 22:13:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNKPe-0001Jf-3E; Wed, 01 Feb 2023 16:13:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pNKPb-0001CT-SW
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 16:12:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pNKPW-0003bi-Q0
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 16:12:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675285974;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y5wYHOszkMSH4MPcMrCHnqX4jCL6PCb/Iyd63wcqVs4=;
 b=S3G9Cxo4iGJqDmYPC4S5d+J/Ng1lLVUoa85w+JnzFfBOAipEyQJ0dmb7jHivIRrAoGOw/E
 9XMGaSg5oUr5Z7NodZmR7jCWchslYVq77FSFQ/yvb9rbtuvI7Dgwd2nryvLwT/wJcubDF+
 OkAjNy9k1rX7YZybtmJwZcqlVi9s1xA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-180-b-ipRZ4CPKiW4H1N1yDK3g-1; Wed, 01 Feb 2023 16:12:52 -0500
X-MC-Unique: b-ipRZ4CPKiW4H1N1yDK3g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9FE721C05AD6;
 Wed,  1 Feb 2023 21:12:51 +0000 (UTC)
Received: from localhost (unknown [10.39.192.164])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 29C93140EBF4;
 Wed,  1 Feb 2023 21:12:38 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: <qemu-devel@nongnu.org>
Cc: <qemu-block@nongnu.org>, Kevin Wolf <kwolf@redhat.com>, mjt@tls.msk.ru,
 Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH 1/5] docs: expand introduction to disk images
Date: Wed,  1 Feb 2023 16:12:30 -0500
Message-Id: <20230201211234.301918-2-stefanha@redhat.com>
In-Reply-To: <20230201211234.301918-1-stefanha@redhat.com>
References: <20230201211234.301918-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Explain --blockdev, the graph, protocols, formats, and filters. Also
mention the relationship between --blockdev and --drive, since new users
are likely to hit both syntaxes.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 docs/system/images.rst | 35 ++++++++++++++++++++++++++++++++---
 1 file changed, 32 insertions(+), 3 deletions(-)

diff --git a/docs/system/images.rst b/docs/system/images.rst
index d000bd6b6f..dc73acf8c9 100644
--- a/docs/system/images.rst
+++ b/docs/system/images.rst
@@ -3,9 +3,38 @@
 Disk Images
 -----------
 
-QEMU supports many disk image formats, including growable disk images
-(their size increase as non empty sectors are written), compressed and
-encrypted disk images.
+QEMU supports many different types of storage protocols, disk image file
+formats, and filter block drivers. *Protocols* provide access to storage such
+as local files or NBD exports. *Formats* implement file formats that are useful
+for sharing disk image files and add functionality like snapshots. *Filters*
+add behavior like I/O throttling.
+
+These features are composable in a graph. Each graph node is called a
+*blockdev*. This makes it possible to construct many different storage
+configurations. The simplest example is accessing a raw image file::
+
+   --blockdev file,filename=test.img,node-name=drive0
+
+A qcow2 image file throttled to 10 MB/s is specified like this::
+
+   --object throttle-group,x-bps-total=10485760,id=tg0 \
+   --blockdev file,filename=vm.qcow2,node-name=file0 \
+   --blockdev qcow2,file=file0,node-name=qcow0 \
+   --blockdev throttle,file=qcow0,throttle-group=tg0,node-name=drive0
+
+Blockdevs are not directly visible to guests. Guests use emulated storage
+controllers like a virtio-blk device to access a blockdev::
+
+   --device virtio-blk-pci,drive=drive0
+
+Note that QEMU has an older ``--drive`` syntax that is somewhat similar to
+``--blockdev``. ``--blockdev`` is preferred because ``--drive`` mixes storage
+controller and blockdev definitions in a single option that cannot express
+everything. When a "drive" or "device" is required by a command-line option or
+QMP command, a blockdev node-name can be used.
+
+The remainder of this chapter covers the block drivers and how to work with
+disk images.
 
 .. _disk_005fimages_005fquickstart:
 
-- 
2.39.1


