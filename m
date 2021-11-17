Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA254549CA
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 16:19:54 +0100 (CET)
Received: from localhost ([::1]:53676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnMj3-0005Z5-E2
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 10:19:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mnMgg-0003Tn-KH
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 10:17:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44188)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mnMgf-0004v3-3D
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 10:17:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637162241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YjWqTZ9WqnWnWOQIRXBDxC4j5StRT3e4uMKPQWMjPbU=;
 b=GrKJsIxCfbGm4YP5kY1kdFVMt29bD4acqRNvcNen5IEFhOb/eaIu+CORbH13OvAIIteK14
 G5vv0lKyJHYCfuRouD+JsLsuM53sV/fw1XNRLT9PDK0JzZG2JkBgSiXdZQTizZcUCx5vtG
 SCBWURtXoqPpu9LKl4NsC6/WDnxh1gU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-kaIMpFXcNH-AyJTySs4YIQ-1; Wed, 17 Nov 2021 10:17:18 -0500
X-MC-Unique: kaIMpFXcNH-AyJTySs4YIQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3EFAAA40C1;
 Wed, 17 Nov 2021 15:17:17 +0000 (UTC)
Received: from localhost (unknown [10.39.195.120])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8012F1F450;
 Wed, 17 Nov 2021 15:17:14 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 2/2] iotests/149: Skip on unsupported ciphers
Date: Wed, 17 Nov 2021 16:17:07 +0100
Message-Id: <20211117151707.52549-3-hreitz@redhat.com>
In-Reply-To: <20211117151707.52549-1-hreitz@redhat.com>
References: <20211117151707.52549-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Whenever qemu-img or qemu-io report that some cipher is unsupported,
skip the whole test, because that is probably because qemu has been
configured with the gnutls crypto backend.

We could taylor the algorithm list to what gnutls supports, but this is
a test that is run rather rarely anyway (because it requires
password-less sudo), and so it seems better and easier to skip it.  When
this test is intentionally run to check LUKS compatibility, it seems
better not to limit the algorithms but keep the list extensive.

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/149 | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/tests/qemu-iotests/149 b/tests/qemu-iotests/149
index 328fd05a4c..d49646ca60 100755
--- a/tests/qemu-iotests/149
+++ b/tests/qemu-iotests/149
@@ -230,6 +230,18 @@ def create_image(config, size_mb):
         fn.truncate(size_mb * 1024 * 1024)
 
 
+def check_cipher_support(config, output):
+    """Check the output of qemu-img or qemu-io for mention of the respective
+    cipher algorithm being unsupported, and if so, skip this test.
+    (Returns `output` for convenience.)"""
+
+    if 'Unsupported cipher algorithm' in output:
+        iotests.notrun('Unsupported cipher algorithm '
+                       f'{config.cipher}-{config.keylen}-{config.mode}; '
+                       'consider configuring qemu with a different crypto '
+                       'backend')
+    return output
+
 def qemu_img_create(config, size_mb):
     """Create and format a disk image with LUKS using qemu-img"""
 
@@ -253,7 +265,8 @@ def qemu_img_create(config, size_mb):
             "%dM" % size_mb]
 
     iotests.log("qemu-img " + " ".join(args), filters=[iotests.filter_test_dir])
-    iotests.log(iotests.qemu_img_pipe(*args), filters=[iotests.filter_test_dir])
+    iotests.log(check_cipher_support(config, iotests.qemu_img_pipe(*args)),
+                filters=[iotests.filter_test_dir])
 
 def qemu_io_image_args(config, dev=False):
     """Get the args for access an image or device with qemu-io"""
@@ -279,8 +292,8 @@ def qemu_io_write_pattern(config, pattern, offset_mb, size_mb, dev=False):
     args = ["-c", "write -P 0x%x %dM %dM" % (pattern, offset_mb, size_mb)]
     args.extend(qemu_io_image_args(config, dev))
     iotests.log("qemu-io " + " ".join(args), filters=[iotests.filter_test_dir])
-    iotests.log(iotests.qemu_io(*args), filters=[iotests.filter_test_dir,
-                                                 iotests.filter_qemu_io])
+    iotests.log(check_cipher_support(config, iotests.qemu_io(*args)),
+                filters=[iotests.filter_test_dir, iotests.filter_qemu_io])
 
 
 def qemu_io_read_pattern(config, pattern, offset_mb, size_mb, dev=False):
@@ -291,8 +304,8 @@ def qemu_io_read_pattern(config, pattern, offset_mb, size_mb, dev=False):
     args = ["-c", "read -P 0x%x %dM %dM" % (pattern, offset_mb, size_mb)]
     args.extend(qemu_io_image_args(config, dev))
     iotests.log("qemu-io " + " ".join(args), filters=[iotests.filter_test_dir])
-    iotests.log(iotests.qemu_io(*args), filters=[iotests.filter_test_dir,
-                                                 iotests.filter_qemu_io])
+    iotests.log(check_cipher_support(config, iotests.qemu_io(*args)),
+                filters=[iotests.filter_test_dir, iotests.filter_qemu_io])
 
 
 def test_once(config, qemu_img=False):
-- 
2.33.1


