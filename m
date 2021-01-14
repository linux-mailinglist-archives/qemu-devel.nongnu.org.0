Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D55BF2F677B
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 18:29:22 +0100 (CET)
Received: from localhost ([::1]:35984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l06Qz-0000rL-S6
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 12:29:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l0620-0007R9-8G
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 12:03:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l061r-0006tu-1B
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 12:03:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610643802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LxANx+Rz2agcyu5X1D3Ejr1ptPnBeUWQBvphznPKVvk=;
 b=LkxClfwyKFFB5PrppLihuQpYjqoPbw+oU0Vg4u1F2DfRjibF7loecW1h5Znn9IJOS1akmk
 CiXVPkz7ae8tzn18ncYdic26tMAVeKtr8+o9chedQGOUelYLAExzhx7xFEBZMMcgusDUUS
 d8DYSZ/EKBmYCuB040Y8OPGl9lG2kWA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-PH-KRbE5Pt6QOUtF9rHWIQ-1; Thu, 14 Jan 2021 12:03:19 -0500
X-MC-Unique: PH-KRbE5Pt6QOUtF9rHWIQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B5E12107ACF7;
 Thu, 14 Jan 2021 17:03:18 +0000 (UTC)
Received: from localhost (ovpn-115-31.ams2.redhat.com [10.36.115.31])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D95D86F439;
 Thu, 14 Jan 2021 17:03:15 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 04/10] iotests/129: Remove test images in tearDown()
Date: Thu, 14 Jan 2021 18:02:58 +0100
Message-Id: <20210114170304.87507-5-mreitz@redhat.com>
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
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
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
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 tests/qemu-iotests/129 | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/qemu-iotests/129 b/tests/qemu-iotests/129
index 0e13244d85..2fc65ada6a 100755
--- a/tests/qemu-iotests/129
+++ b/tests/qemu-iotests/129
@@ -47,6 +47,8 @@ class TestStopWithBlockJob(iotests.QMPTestCase):
         result = self.vm.qmp("block_set_io_throttle", conv_keys=False,
                              **params)
         self.vm.shutdown()
+        for img in (self.test_img, self.target_img, self.base_img):
+            iotests.try_remove(img)
 
     def do_test_stop(self, cmd, **args):
         """Test 'stop' while block job is running on a throttled drive.
-- 
2.29.2


