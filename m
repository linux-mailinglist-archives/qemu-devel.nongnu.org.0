Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF60304057
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 15:32:29 +0100 (CET)
Received: from localhost ([::1]:36164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4POO-0005HU-S9
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 09:32:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l4PDf-0000Lo-8y
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:21:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l4PDW-0006A0-Dk
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:21:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611670873;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gHUSCROXHChEH8rx6FJb3pCXw0RlDjLpJ8m0WGjxGKg=;
 b=J3LvUERdWmvxSdd7+j0x18hD/Iyrk4PXO3BXnunXTegyh7d1BmxzKWALn5GWm3t0xOs2i+
 VniUqEBZZv8d7jt1UF4TF6vDMlz61TA3ZsDHVAPZpixMF64X8v523kT4c/fZLJ2s9M7qwd
 7jcqpWY85dxb+S6Z7Ci8qpZyPlgSJtc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-545-wKcuKvUjPSGhQwpf7dlynQ-1; Tue, 26 Jan 2021 09:21:09 -0500
X-MC-Unique: wKcuKvUjPSGhQwpf7dlynQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 03F3519611C1;
 Tue, 26 Jan 2021 14:21:00 +0000 (UTC)
Received: from localhost (ovpn-114-175.ams2.redhat.com [10.36.114.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 977026F439;
 Tue, 26 Jan 2021 14:20:59 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 18/53] iotests/129: Remove test images in tearDown()
Date: Tue, 26 Jan 2021 15:19:41 +0100
Message-Id: <20210126142016.806073-19-mreitz@redhat.com>
In-Reply-To: <20210126142016.806073-1-mreitz@redhat.com>
References: <20210126142016.806073-1-mreitz@redhat.com>
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
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Message-Id: <20210118105720.14824-5-mreitz@redhat.com>
---
 tests/qemu-iotests/129 | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/qemu-iotests/129 b/tests/qemu-iotests/129
index f57a2e19f6..bd29c54af8 100755
--- a/tests/qemu-iotests/129
+++ b/tests/qemu-iotests/129
@@ -48,6 +48,8 @@ class TestStopWithBlockJob(iotests.QMPTestCase):
         result = self.vm.qmp("block_set_io_throttle", conv_keys=False,
                              **params)
         self.vm.shutdown()
+        for img in (self.test_img, self.target_img, self.base_img):
+            iotests.try_remove(img)
 
     def do_test_stop(self, cmd, **args):
         """Test 'stop' while block job is running on a throttled drive.
-- 
2.29.2


