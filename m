Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F182F82EC
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 18:50:27 +0100 (CET)
Received: from localhost ([::1]:59732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0TEw-0001Wj-Mc
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 12:50:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l0T8T-0003ka-A3
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 12:43:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l0T8F-0001QA-IX
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 12:43:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610732609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZF3tntK42JP7X0vMNoMurUIRKkPBP9BO0WMAJBjckhA=;
 b=fqZ5twKWfEDdyKJ3gngTb8jTrFtoq1s3Fzdwk6Japc+8tQk5e1MqsbXghPlz7oqK+5POaF
 rp+LOYtjpkxZldCrp0+ZwhctVRMVFi0g8loavtMauoCkgePhlrkwOvs8IJRLhlZHc3NcCY
 rTbkPOmx/oSmLRmPp2yLvywPfez6rLY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-546-4edrrx1hMz6skb9lbEwzmA-1; Fri, 15 Jan 2021 12:43:28 -0500
X-MC-Unique: 4edrrx1hMz6skb9lbEwzmA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2503C879500;
 Fri, 15 Jan 2021 17:43:27 +0000 (UTC)
Received: from localhost (ovpn-114-144.ams2.redhat.com [10.36.114.144])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B9A2F5D74F;
 Fri, 15 Jan 2021 17:43:26 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 04/10] iotests/129: Remove test images in tearDown()
Date: Fri, 15 Jan 2021 18:43:09 +0100
Message-Id: <20210115174315.30949-5-mreitz@redhat.com>
In-Reply-To: <20210115174315.30949-1-mreitz@redhat.com>
References: <20210115174315.30949-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
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


