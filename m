Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A53962F4CE7
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 15:15:50 +0100 (CET)
Received: from localhost ([::1]:55384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzgw9-0002bv-OV
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 09:15:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kzgnO-0002yl-13
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 09:06:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kzgnD-0003Z5-OB
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 09:06:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610546787;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V6YovqJlAnwf7EP/WjZzOYpPOQgUK31iO/9OlrSMdgE=;
 b=LskIXL1xnOLuTRbSO7eFxxYncA3Ruiex/GRL8OmN3MDgblvEA6APFKxnlrnADgA769Ldzk
 e+Z56XN/BnvJ5cuCiAah+cvAAM5+dRzfERJuvvsH5lxA0Nb4UlMGqENyFYK5fbBOuW2FjZ
 XuhuvUsLVhXCOUwNGCWhTjLniyI7qoY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-520-UtzIfTBCPMSd85pk7v-1IQ-1; Wed, 13 Jan 2021 09:06:23 -0500
X-MC-Unique: UtzIfTBCPMSd85pk7v-1IQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 871BE1005D50;
 Wed, 13 Jan 2021 14:06:22 +0000 (UTC)
Received: from localhost (ovpn-113-103.ams2.redhat.com [10.36.113.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 26E5460C5D;
 Wed, 13 Jan 2021 14:06:21 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 2/7] iotests/129: Remove test images in tearDown()
Date: Wed, 13 Jan 2021 15:06:11 +0100
Message-Id: <20210113140616.150283-3-mreitz@redhat.com>
In-Reply-To: <20210113140616.150283-1-mreitz@redhat.com>
References: <20210113140616.150283-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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


