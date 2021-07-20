Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFCEA3D005B
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 19:37:16 +0200 (CEST)
Received: from localhost ([::1]:57882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5tgB-0005ew-OQ
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 13:37:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1m5tcr-0005UW-8k
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 13:33:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1m5tcp-0005aF-Qu
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 13:33:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626802427;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oMuaF/gFmbTMw4UE38lpiG/uex5PNFomKE7sd81fMpQ=;
 b=CuPltIJFgbxRO11YwhC1aApcLJecYrfSm6IKF3tqtu2IWHK5hn/g/5JnPKkxgWAPUKNucN
 EUPlK++Vm0kwQ8de+bKEVUh+mUsVbrEfhZuJap1vTByYm4mGc3LtOHYdXC387aUsrtauRc
 647pC8F9RU7P1zC/zHz0k4BtY3y1H0I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-538-W0CUG3dJPKGD3xmhMK69eQ-1; Tue, 20 Jul 2021 13:33:43 -0400
X-MC-Unique: W0CUG3dJPKGD3xmhMK69eQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A0BC7C73A1;
 Tue, 20 Jul 2021 17:33:42 +0000 (UTC)
Received: from scv.redhat.com (ovpn-119-193.rdu2.redhat.com [10.10.119.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A5EE469CB4;
 Tue, 20 Jul 2021 17:33:41 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/17] iotests/mirror-top-perms: Adjust import paths
Date: Tue, 20 Jul 2021 13:33:22 -0400
Message-Id: <20210720173336.1876937-4-jsnow@redhat.com>
In-Reply-To: <20210720173336.1876937-1-jsnow@redhat.com>
References: <20210720173336.1876937-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Technically AbnormalShutdown isn't exported via
'qemu.machine.AbnormalShutdown', but instead from
'qemu.machine.machine.AbnormalShutdown'. Odd, I know, and it's on the
list to fix. For now, change the imports here.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/tests/mirror-top-perms | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tests/qemu-iotests/tests/mirror-top-perms b/tests/qemu-iotests/tests/mirror-top-perms
index 451a0666f81..de181825901 100755
--- a/tests/qemu-iotests/tests/mirror-top-perms
+++ b/tests/qemu-iotests/tests/mirror-top-perms
@@ -25,7 +25,8 @@ from iotests import qemu_img
 
 # Import qemu after iotests.py has amended sys.path
 # pylint: disable=wrong-import-order
-import qemu
+from qemu import qmp
+from qemu.machine import machine
 
 
 image_size = 1 * 1024 * 1024
@@ -47,7 +48,7 @@ class TestMirrorTopPerms(iotests.QMPTestCase):
     def tearDown(self):
         try:
             self.vm.shutdown()
-        except qemu.machine.AbnormalShutdown:
+        except machine.AbnormalShutdown:
             pass
 
         if self.vm_b is not None:
@@ -102,7 +103,7 @@ class TestMirrorTopPerms(iotests.QMPTestCase):
             self.vm_b.launch()
             print('ERROR: VM B launched successfully, this should not have '
                   'happened')
-        except qemu.qmp.QMPConnectError:
+        except qmp.QMPConnectError:
             assert 'Is another process using the image' in self.vm_b.get_log()
 
         result = self.vm.qmp('block-job-cancel',
-- 
2.31.1


