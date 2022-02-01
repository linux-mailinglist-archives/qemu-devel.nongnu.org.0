Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADC34A6076
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 16:48:14 +0100 (CET)
Received: from localhost ([::1]:50890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEvO9-00060y-Cl
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 10:48:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nEuQh-0002c7-4f
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 09:47:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nEuQX-0002xS-0l
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 09:46:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643726599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/HDA6Sm4559s8h86JTuF5LdO6hZSpNSfF193DVVvakg=;
 b=YPTL/FkeBhGZfrlIf6stuTnbiTRn3QkgSYmCFFZ1nK2AmK/rISoKu111LQVV8IGkTdqD0+
 jgpWp1+2u8ZiIR/DKoynhUrZpGfCkjcZKdMRUak6CvcG5sDvLPCAoTxe4/7/JdXYKtGsZ+
 8y9hS+HG6zngZBw3AMKmpTq9KkrdAlk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-377-DK0wL0dNPNSihl_ct9YnYA-1; Tue, 01 Feb 2022 09:43:18 -0500
X-MC-Unique: DK0wL0dNPNSihl_ct9YnYA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F2E326408E;
 Tue,  1 Feb 2022 14:43:16 +0000 (UTC)
Received: from localhost (unknown [10.39.193.129])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 06A067B9E1;
 Tue,  1 Feb 2022 14:43:10 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 03/24] iotests.py: img_info_log(): rename imgopts argument
Date: Tue,  1 Feb 2022 15:42:12 +0100
Message-Id: <20220201144233.617021-4-hreitz@redhat.com>
In-Reply-To: <20220201144233.617021-1-hreitz@redhat.com>
References: <20220201144233.617021-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

We are going to support IMGOPTS environment variable like in bash
tests. Corresponding global variable in iotests.py should be called
imgopts. So to not interfere with function argument, rename it in
advance.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20211223160144.1097696-2-vsementsov@virtuozzo.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/210        | 8 ++++----
 tests/qemu-iotests/iotests.py | 5 +++--
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/tests/qemu-iotests/210 b/tests/qemu-iotests/210
index a4dcc5fe59..10b0a0b87c 100755
--- a/tests/qemu-iotests/210
+++ b/tests/qemu-iotests/210
@@ -62,7 +62,7 @@ with iotests.FilePath('t.luks') as disk_path, \
         'driver=luks,file.driver=file,file.filename=%s,key-secret=keysec0' % (disk_path),
         filter_path=disk_path,
         extra_args=['--object', 'secret,id=keysec0,data=foo'],
-        imgopts=True)
+        use_image_opts=True)
 
     #
     # Successful image creation (with non-default options)
@@ -96,7 +96,7 @@ with iotests.FilePath('t.luks') as disk_path, \
         'driver=luks,file.driver=file,file.filename=%s,key-secret=keysec0' % (disk_path),
         filter_path=disk_path,
         extra_args=['--object', 'secret,id=keysec0,data=foo'],
-        imgopts=True)
+        use_image_opts=True)
 
     #
     # Invalid BlockdevRef
@@ -132,7 +132,7 @@ with iotests.FilePath('t.luks') as disk_path, \
         'driver=luks,file.driver=file,file.filename=%s,key-secret=keysec0' % (disk_path),
         filter_path=disk_path,
         extra_args=['--object', 'secret,id=keysec0,data=foo'],
-        imgopts=True)
+        use_image_opts=True)
 
     #
     # Invalid sizes
@@ -176,4 +176,4 @@ with iotests.FilePath('t.luks') as disk_path, \
         'driver=luks,file.driver=file,file.filename=%s,key-secret=keysec0' % (disk_path),
         filter_path=disk_path,
         extra_args=['--object', 'secret,id=keysec0,data=foo'],
-        imgopts=True)
+        use_image_opts=True)
diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 1e2f2391d1..30a8837ea2 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -227,9 +227,10 @@ def qemu_img_log(*args):
     log(result, filters=[filter_testfiles])
     return result
 
-def img_info_log(filename, filter_path=None, imgopts=False, extra_args=()):
+def img_info_log(filename, filter_path=None, use_image_opts=False,
+                 extra_args=()):
     args = ['info']
-    if imgopts:
+    if use_image_opts:
         args.append('--image-opts')
     else:
         args += ['-f', imgfmt]
-- 
2.34.1


