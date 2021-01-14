Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C93D62F67E0
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 18:40:39 +0100 (CET)
Received: from localhost ([::1]:33446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l06bs-0003dR-3Y
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 12:40:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l0624-0007bQ-Ao
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 12:03:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l0622-0006wt-6N
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 12:03:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610643813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=88jW508my9YkqN6iINXbulZF2jhBRgtWFg2K4BkF2YI=;
 b=euu5fCT38WolIHmuWhIgUmqpqSbsaLU2QoWAQg4z+/InkkDgwKRbNZOhMwvLWUUK4jIMvV
 JQwqQjL5iVrA7q1rcO7Xs6z/bwe3QN2AkYJ+Tt48nBu9m7Kky7hHRZVwj70TWPcTU5Yu5z
 wehNNSywZmy/rqeqH2KpYCxhZZFf/88=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-481-ya5ixl4yPIC_g1C76bl75A-1; Thu, 14 Jan 2021 12:03:31 -0500
X-MC-Unique: ya5ixl4yPIC_g1C76bl75A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AE812100D671;
 Thu, 14 Jan 2021 17:03:30 +0000 (UTC)
Received: from localhost (ovpn-115-31.ams2.redhat.com [10.36.115.31])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 468AB6F439;
 Thu, 14 Jan 2021 17:03:30 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 09/10] iotests/129: Clean up pylint and mypy complaints
Date: Thu, 14 Jan 2021 18:03:03 +0100
Message-Id: <20210114170304.87507-10-mreitz@redhat.com>
In-Reply-To: <20210114170304.87507-1-mreitz@redhat.com>
References: <20210114170304.87507-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 tests/qemu-iotests/129 | 4 ++--
 tests/qemu-iotests/297 | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/qemu-iotests/129 b/tests/qemu-iotests/129
index 6d21470cd7..201d9e0a0b 100755
--- a/tests/qemu-iotests/129
+++ b/tests/qemu-iotests/129
@@ -20,7 +20,6 @@
 
 import os
 import iotests
-import time
 
 class TestStopWithBlockJob(iotests.QMPTestCase):
     test_img = os.path.join(iotests.test_dir, 'test.img')
@@ -32,7 +31,8 @@ class TestStopWithBlockJob(iotests.QMPTestCase):
         iotests.qemu_img('create', '-f', iotests.imgfmt, self.base_img, "1G")
         iotests.qemu_img('create', '-f', iotests.imgfmt, self.test_img,
                          "-b", self.base_img, '-F', iotests.imgfmt)
-        iotests.qemu_io('-f', iotests.imgfmt, '-c', 'write -P0x5d 1M 128M', self.test_img)
+        iotests.qemu_io('-f', iotests.imgfmt, '-c', 'write -P0x5d 1M 128M',
+                        self.test_img)
         self.vm = iotests.VM()
         self.vm.add_object('throttle-group,id=tg0,x-bps-total=1024')
 
diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
index bfa26d280b..1dce1d1b1c 100755
--- a/tests/qemu-iotests/297
+++ b/tests/qemu-iotests/297
@@ -27,7 +27,7 @@ import iotests
 # TODO: Empty this list!
 SKIP_FILES = (
     '030', '040', '041', '044', '045', '055', '056', '057', '065', '093',
-    '096', '118', '124', '129', '132', '136', '139', '147', '148', '149',
+    '096', '118', '124', '132', '136', '139', '147', '148', '149',
     '151', '152', '155', '163', '165', '169', '194', '196', '199', '202',
     '203', '205', '206', '207', '208', '210', '211', '212', '213', '216',
     '218', '219', '222', '224', '228', '234', '235', '236', '237', '238',
-- 
2.29.2


