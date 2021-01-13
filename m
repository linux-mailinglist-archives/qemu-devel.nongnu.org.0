Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 866772F51AB
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 19:06:49 +0100 (CET)
Received: from localhost ([::1]:59904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzkXg-0007sk-EG
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 13:06:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kzkPU-00021d-3h
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 12:58:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kzkPR-00012D-QO
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 12:58:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610560697;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zAr8NGcSB0K1UzQorV+b3CqRa/5TFojC7jgHvo+KKeY=;
 b=UxBevN+ggYAMcOaoIfboKRT4CujOA5HEn3seRoBsWkPRJGARBG2+WnVP5hlVQh3uKsM/Hh
 H/KgKYi730af4aMyp+iB1CeURTdRG6C4XukCKtUrv4SchvpmP1Afu9ncM/ggs4DMTBdkJv
 4tThi1kTmZi7yBYFkoML6an5j/9y4Ag=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-221-02efRLyENhin50p0EmhsDA-1; Wed, 13 Jan 2021 12:58:15 -0500
X-MC-Unique: 02efRLyENhin50p0EmhsDA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 762F41081B32;
 Wed, 13 Jan 2021 17:58:14 +0000 (UTC)
Received: from localhost (ovpn-113-103.ams2.redhat.com [10.36.113.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D2B75C3E0;
 Wed, 13 Jan 2021 17:58:13 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 8/8] iotests/129: Clean up pylint and mypy complaints
Date: Wed, 13 Jan 2021 18:57:52 +0100
Message-Id: <20210113175752.403022-9-mreitz@redhat.com>
In-Reply-To: <20210113175752.403022-1-mreitz@redhat.com>
References: <20210113175752.403022-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/129     | 6 ++++--
 tests/qemu-iotests/297     | 2 +-
 tests/qemu-iotests/297.out | 1 +
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/tests/qemu-iotests/129 b/tests/qemu-iotests/129
index 6d21470cd7..64578493c1 100755
--- a/tests/qemu-iotests/129
+++ b/tests/qemu-iotests/129
@@ -20,9 +20,10 @@
 
 import os
 import iotests
-import time
 
 class TestStopWithBlockJob(iotests.QMPTestCase):
+    assert iotests.test_dir is not None
+
     test_img = os.path.join(iotests.test_dir, 'test.img')
     target_img = os.path.join(iotests.test_dir, 'target.img')
     base_img = os.path.join(iotests.test_dir, 'base.img')
@@ -32,7 +33,8 @@ class TestStopWithBlockJob(iotests.QMPTestCase):
         iotests.qemu_img('create', '-f', iotests.imgfmt, self.base_img, "1G")
         iotests.qemu_img('create', '-f', iotests.imgfmt, self.test_img,
                          "-b", self.base_img, '-F', iotests.imgfmt)
-        iotests.qemu_io('-f', iotests.imgfmt, '-c', 'write -P0x5d 1M 128M', self.test_img)
+        iotests.qemu_io('-f', iotests.imgfmt, '-c', 'write -P0x5d 1M 128M',
+                        self.test_img)
         self.vm = iotests.VM()
         self.vm.add_object('throttle-group,id=tg0,x-bps-total=1024')
 
diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
index b1a7d6d5e8..88f00415c8 100755
--- a/tests/qemu-iotests/297
+++ b/tests/qemu-iotests/297
@@ -32,7 +32,7 @@ fi
 
 # TODO: Empty this list!
 skip_files=(
-    030 040 041 044 045 055 056 057 065 093 096 118 124 129 132 136 139 147 148
+    030 040 041 044 045 055 056 057 065 093 096 118 124 132 136 139 147 148
     149 151 152 155 163 165 169 194 196 199 202 203 205 206 207 208 210 211 212
     213 216 218 219 222 224 228 234 235 236 237 238 240 242 245 246 248 255 256
     257 258 260 262 264 266 274 277 280 281 295 296 298 299 300 302 303 304 307
diff --git a/tests/qemu-iotests/297.out b/tests/qemu-iotests/297.out
index c5ebbf6a17..92cae940c5 100644
--- a/tests/qemu-iotests/297.out
+++ b/tests/qemu-iotests/297.out
@@ -1,5 +1,6 @@
 QA output created by 297
 Files to be checked:
+  129
   209
   254
   283
-- 
2.29.2


