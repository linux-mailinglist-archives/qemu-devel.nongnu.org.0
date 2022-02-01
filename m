Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B954A60B9
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 16:52:10 +0100 (CET)
Received: from localhost ([::1]:57990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEvRy-0002gD-0U
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 10:52:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nEuRG-0002ie-S8
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 09:47:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51047)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nEuR6-00033n-Qg
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 09:47:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643726645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2sW42O4WbSGtiZVVHXKVJ30oeYi2esE3imjEpVkaKIY=;
 b=PTodWWRtDswSKwG4W2ktoJ8aNFEj5Oe67N9LU/lldRECb90oloIGURtIKHJc8mXfCmH2zu
 /r504YbW+e0aOEGPfTR3WfGom5xduglrywWNXY5M+tkmFs3ES8UvRx2W4sb4PP4aH3i4fZ
 2jxXYb8i4+3rhs0rZcyRjtHNZvSNdEo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-582-P_coUg61Px2ErTeqNKe0Dw-1; Tue, 01 Feb 2022 09:44:04 -0500
X-MC-Unique: P_coUg61Px2ErTeqNKe0Dw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA44C1091DA6;
 Tue,  1 Feb 2022 14:44:03 +0000 (UTC)
Received: from localhost (unknown [10.39.193.129])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5FA1B752D0;
 Tue,  1 Feb 2022 14:44:03 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 21/24] iotests: declare lack of support for compresion_type in
 IMGOPTS
Date: Tue,  1 Feb 2022 15:42:30 +0100
Message-Id: <20220201144233.617021-22-hreitz@redhat.com>
In-Reply-To: <20220201144233.617021-1-hreitz@redhat.com>
References: <20220201144233.617021-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

compression_type can't be used if we want to create image with
compat=0.10. So, skip these tests, not many of them.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20211223160144.1097696-20-vsementsov@virtuozzo.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/031 | 5 +++--
 tests/qemu-iotests/051 | 5 +++--
 tests/qemu-iotests/061 | 6 +++++-
 tests/qemu-iotests/112 | 3 ++-
 tests/qemu-iotests/290 | 2 +-
 5 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/tests/qemu-iotests/031 b/tests/qemu-iotests/031
index 648112f796..ee587b1606 100755
--- a/tests/qemu-iotests/031
+++ b/tests/qemu-iotests/031
@@ -42,8 +42,9 @@ trap "_cleanup; exit \$status" 0 1 2 3 15
 _supported_fmt qcow2
 _supported_proto file fuse
 # We want to test compat=0.10, which does not support external data
-# files or refcount widths other than 16
-_unsupported_imgopts data_file 'refcount_bits=\([^1]\|.\([^6]\|$\)\)'
+# files or refcount widths other than 16 or compression type
+_unsupported_imgopts data_file compression_type \
+    'refcount_bits=\([^1]\|.\([^6]\|$\)\)'
 
 CLUSTER_SIZE=65536
 
diff --git a/tests/qemu-iotests/051 b/tests/qemu-iotests/051
index e9042a6214..f1a506518b 100755
--- a/tests/qemu-iotests/051
+++ b/tests/qemu-iotests/051
@@ -41,8 +41,9 @@ _supported_fmt qcow2
 _supported_proto file
 # A compat=0.10 image is created in this test which does not support anything
 # other than refcount_bits=16;
-# it also will not support an external data file
-_unsupported_imgopts 'refcount_bits=\([^1]\|.\([^6]\|$\)\)' data_file
+# it also will not support an external data file and compression type
+_unsupported_imgopts 'refcount_bits=\([^1]\|.\([^6]\|$\)\)' data_file \
+    compression_type
 _require_drivers nbd
 
 if [ "$QEMU_DEFAULT_MACHINE" = "pc" ]; then
diff --git a/tests/qemu-iotests/061 b/tests/qemu-iotests/061
index 70edf1a163..513fbec14c 100755
--- a/tests/qemu-iotests/061
+++ b/tests/qemu-iotests/061
@@ -48,7 +48,11 @@ _supported_os Linux
 # not work with it;
 # we have explicit tests for various cluster sizes, the remaining tests
 # require the default 64k cluster
-_unsupported_imgopts 'refcount_bits=\([^1]\|.\([^6]\|$\)\)' data_file cluster_size
+# we don't have explicit tests for zstd qcow2 compression type, as zstd may be
+# not compiled in. And we can't create compat images with comression type
+# extension
+_unsupported_imgopts 'refcount_bits=\([^1]\|.\([^6]\|$\)\)' data_file \
+    cluster_size compression_type
 
 echo
 echo "=== Testing version downgrade with zero expansion ==="
diff --git a/tests/qemu-iotests/112 b/tests/qemu-iotests/112
index 07ac74fb2c..5333212993 100755
--- a/tests/qemu-iotests/112
+++ b/tests/qemu-iotests/112
@@ -43,7 +43,8 @@ _supported_proto file fuse
 # This test will set refcount_bits on its own which would conflict with the
 # manual setting; compat will be overridden as well;
 # and external data files do not work well with our refcount testing
-_unsupported_imgopts refcount_bits 'compat=0.10' data_file
+# also, compression type is not supported with compat=0.10 used in test
+_unsupported_imgopts refcount_bits 'compat=0.10' data_file compression_type
 
 print_refcount_bits()
 {
diff --git a/tests/qemu-iotests/290 b/tests/qemu-iotests/290
index ed80da2685..776b59de1b 100755
--- a/tests/qemu-iotests/290
+++ b/tests/qemu-iotests/290
@@ -41,7 +41,7 @@ trap "_cleanup; exit \$status" 0 1 2 3 15
 _supported_fmt qcow2
 _supported_proto file fuse
 _supported_os Linux
-_unsupported_imgopts 'compat=0.10' refcount_bits data_file
+_unsupported_imgopts 'compat=0.10' refcount_bits data_file compression_type
 
 echo
 echo "### Test 'qemu-io -c discard' on a QCOW2 image without a backing file"
-- 
2.34.1


