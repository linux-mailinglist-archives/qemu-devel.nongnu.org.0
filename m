Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7FE2F4CF2
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 15:18:14 +0100 (CET)
Received: from localhost ([::1]:59560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzgyT-0004RR-M2
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 09:18:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kzgnP-00030b-U2
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 09:06:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kzgnH-0003a8-QJ
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 09:06:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610546798;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z6T2BrQaqrAjhN9ZRSnvCvnpzziIT41wGc78Gzp+vJc=;
 b=P99XNIsMaBJdsijtjt8soDyGAQ2As0EGgKUojGRNLo3uvBLo+NO27OsdSVlDEmf1dUTCHk
 czbAeCI4I9vxm+JPTsOp6yBTr1QhvZ9Ynxl4HoktraBjZSRjF9eyiSGt/td9AFCRydXB4i
 VD4FBKWKLNc4/z+zT416T+STmXonDGc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-474-WEXWLfyrPG6lkBAi15zKxw-1; Wed, 13 Jan 2021 09:06:34 -0500
X-MC-Unique: WEXWLfyrPG6lkBAi15zKxw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9FA2A192CC40;
 Wed, 13 Jan 2021 14:06:33 +0000 (UTC)
Received: from localhost (ovpn-113-103.ams2.redhat.com [10.36.113.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4110E60C0F;
 Wed, 13 Jan 2021 14:06:33 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 7/7] iotests/129: Clean up pylint and mypy complaints
Date: Wed, 13 Jan 2021 15:06:16 +0100
Message-Id: <20210113140616.150283-8-mreitz@redhat.com>
In-Reply-To: <20210113140616.150283-1-mreitz@redhat.com>
References: <20210113140616.150283-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 tests/qemu-iotests/129 | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/129 b/tests/qemu-iotests/129
index c3ad584ba2..ec303069e9 100755
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
 
-- 
2.29.2


