Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2417B3FDF6C
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 18:09:51 +0200 (CEST)
Received: from localhost ([::1]:37058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLSoA-00005L-6r
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 12:09:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mLS08-0006sO-Iu
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 11:18:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mLS05-0004Px-Af
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 11:18:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630509484;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EpXF3XggS1tC1/gh/OURymTrPQsBGWJ9VNmyaS+8iN8=;
 b=cv4gRfpL8vZ1bXWeqQx3I35mKVQF4UG0eXByIrVGSSr9fANlDoqbkENPnebBo7UyTXgzgn
 CXWYfRf5sK0wmFfL5FnlV0nSxDO5WvRUpFvOS2dsfYSb5IMtDSOT8AJUzfaCR9sScJjJno
 LooN6YhvNIsJXwmY5LeToCBl0c/udFg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-331-t7MalZOtN3-im-OaJej2xA-1; Wed, 01 Sep 2021 11:18:03 -0400
X-MC-Unique: t7MalZOtN3-im-OaJej2xA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3B060107ACC7;
 Wed,  1 Sep 2021 15:18:02 +0000 (UTC)
Received: from localhost (unknown [10.39.193.250])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D4EB71F4;
 Wed,  1 Sep 2021 15:18:01 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 47/56] iotests/222: constantly use single quotes for strings
Date: Wed,  1 Sep 2021 17:16:10 +0200
Message-Id: <20210901151619.689075-48-hreitz@redhat.com>
In-Reply-To: <20210901151619.689075-1-hreitz@redhat.com>
References: <20210901151619.689075-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

The file use both single and double quotes for strings. Let's be
consistent.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20210824083856.17408-28-vsementsov@virtuozzo.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/222 | 68 +++++++++++++++++++++---------------------
 1 file changed, 34 insertions(+), 34 deletions(-)

diff --git a/tests/qemu-iotests/222 b/tests/qemu-iotests/222
index 5e2556f8df..799369e290 100755
--- a/tests/qemu-iotests/222
+++ b/tests/qemu-iotests/222
@@ -30,23 +30,23 @@ iotests.script_initialize(
     supported_platforms=['linux'],
 )
 
-patterns = [("0x5d", "0",         "64k"),
-            ("0xd5", "1M",        "64k"),
-            ("0xdc", "32M",       "64k"),
-            ("0xcd", "0x3ff0000", "64k")]  # 64M - 64K
+patterns = [('0x5d', '0',         '64k'),
+            ('0xd5', '1M',        '64k'),
+            ('0xdc', '32M',       '64k'),
+            ('0xcd', '0x3ff0000', '64k')]  # 64M - 64K
 
-overwrite = [("0xab", "0",         "64k"), # Full overwrite
-             ("0xad", "0x00f8000", "64k"), # Partial-left (1M-32K)
-             ("0x1d", "0x2008000", "64k"), # Partial-right (32M+32K)
-             ("0xea", "0x3fe0000", "64k")] # Adjacent-left (64M - 128K)
+overwrite = [('0xab', '0',         '64k'), # Full overwrite
+             ('0xad', '0x00f8000', '64k'), # Partial-left (1M-32K)
+             ('0x1d', '0x2008000', '64k'), # Partial-right (32M+32K)
+             ('0xea', '0x3fe0000', '64k')] # Adjacent-left (64M - 128K)
 
-zeroes = [("0", "0x00f8000", "32k"), # Left-end of partial-left (1M-32K)
-          ("0", "0x2010000", "32k"), # Right-end of partial-right (32M+64K)
-          ("0", "0x3fe0000", "64k")] # overwrite[3]
+zeroes = [('0', '0x00f8000', '32k'), # Left-end of partial-left (1M-32K)
+          ('0', '0x2010000', '32k'), # Right-end of partial-right (32M+64K)
+          ('0', '0x3fe0000', '64k')] # overwrite[3]
 
-remainder = [("0xd5", "0x108000",  "32k"), # Right-end of partial-left [1]
-             ("0xdc", "32M",       "32k"), # Left-end of partial-right [2]
-             ("0xcd", "0x3ff0000", "64k")] # patterns[3]
+remainder = [('0xd5', '0x108000',  '32k'), # Right-end of partial-left [1]
+             ('0xdc', '32M',       '32k'), # Left-end of partial-right [2]
+             ('0xcd', '0x3ff0000', '64k')] # patterns[3]
 
 with iotests.FilePath('base.img') as base_img_path, \
      iotests.FilePath('fleece.img') as fleece_img_path, \
@@ -58,7 +58,7 @@ with iotests.FilePath('base.img') as base_img_path, \
     log('')
 
     assert qemu_img('create', '-f', iotests.imgfmt, base_img_path, '64M') == 0
-    assert qemu_img('create', '-f', "qcow2", fleece_img_path, '64M') == 0
+    assert qemu_img('create', '-f', 'qcow2', fleece_img_path, '64M') == 0
 
     for p in patterns:
         qemu_io('-f', iotests.imgfmt,
@@ -78,43 +78,43 @@ with iotests.FilePath('base.img') as base_img_path, \
     log('--- Setting up Fleecing Graph ---')
     log('')
 
-    src_node = "drive0"
-    tgt_node = "fleeceNode"
+    src_node = 'drive0'
+    tgt_node = 'fleeceNode'
 
     # create tgt_node backed by src_node
-    log(vm.qmp("blockdev-add", {
-        "driver": "qcow2",
-        "node-name": tgt_node,
-        "file": {
-            "driver": "file",
-            "filename": fleece_img_path,
+    log(vm.qmp('blockdev-add', {
+        'driver': 'qcow2',
+        'node-name': tgt_node,
+        'file': {
+            'driver': 'file',
+            'filename': fleece_img_path,
         },
-        "backing": src_node,
+        'backing': src_node,
     }))
 
     # Establish COW from source to fleecing node
-    log(vm.qmp("blockdev-backup",
+    log(vm.qmp('blockdev-backup',
                device=src_node,
                target=tgt_node,
-               sync="none"))
+               sync='none'))
 
     log('')
     log('--- Setting up NBD Export ---')
     log('')
 
     nbd_uri = 'nbd+unix:///%s?socket=%s' % (tgt_node, nbd_sock_path)
-    log(vm.qmp("nbd-server-start",
-               {"addr": { "type": "unix",
-                          "data": { "path": nbd_sock_path } } }))
+    log(vm.qmp('nbd-server-start',
+               {'addr': { 'type': 'unix',
+                          'data': { 'path': nbd_sock_path } } }))
 
-    log(vm.qmp("nbd-server-add", device=tgt_node))
+    log(vm.qmp('nbd-server-add', device=tgt_node))
 
     log('')
     log('--- Sanity Check ---')
     log('')
 
     for p in patterns + zeroes:
-        cmd = "read -P%s %s %s" % p
+        cmd = 'read -P%s %s %s' % p
         log(cmd)
         assert qemu_io_silent('-r', '-f', 'raw', '-c', cmd, nbd_uri) == 0
 
@@ -123,7 +123,7 @@ with iotests.FilePath('base.img') as base_img_path, \
     log('')
 
     for p in overwrite:
-        cmd = "write -P%s %s %s" % p
+        cmd = 'write -P%s %s %s' % p
         log(cmd)
         log(vm.hmp_qemu_io(src_node, cmd))
 
@@ -132,7 +132,7 @@ with iotests.FilePath('base.img') as base_img_path, \
     log('')
 
     for p in patterns + zeroes:
-        cmd = "read -P%s %s %s" % p
+        cmd = 'read -P%s %s %s' % p
         log(cmd)
         assert qemu_io_silent('-r', '-f', 'raw', '-c', cmd, nbd_uri) == 0
 
@@ -153,7 +153,7 @@ with iotests.FilePath('base.img') as base_img_path, \
     log('')
 
     for p in overwrite + remainder:
-        cmd = "read -P%s %s %s" % p
+        cmd = 'read -P%s %s %s' % p
         log(cmd)
         assert qemu_io_silent(base_img_path, '-c', cmd) == 0
 
-- 
2.31.1


