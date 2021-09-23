Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49687415493
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 02:19:27 +0200 (CEST)
Received: from localhost ([::1]:55296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTCSU-0005HW-Ai
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 20:19:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mTCPn-0001e0-Rg
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 20:16:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58105)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mTCPl-0000vu-4D
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 20:16:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632356196;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CgzOlYuQ2C4BKVmMAal1eWQcAlSTvPVlEid5eTvaag8=;
 b=X8nfrN6EFiJ/VH9V1fchdHV6ag4o+2ynfAsDzEYwYs9b8MEneszu0hFg1ggAjWI/cnbzfN
 N/MKkVnd5YzxiNguZu2WbAcgki93peza6kovDetzVPiMF3aqB6j+VYRBZggyYdW8Ps8mjO
 orUSPbNRNcPN8rQxzS5irjk7PZpcEGA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-28-j5UDWuaJPoms1ACandYZQA-1; Wed, 22 Sep 2021 20:16:35 -0400
X-MC-Unique: j5UDWuaJPoms1ACandYZQA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5CE2F802921;
 Thu, 23 Sep 2021 00:16:34 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.9.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0B76710023AB;
 Thu, 23 Sep 2021 00:16:32 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/6] iotests/mirror-top-perms: Adjust imports
Date: Wed, 22 Sep 2021 20:16:23 -0400
Message-Id: <20210923001625.3996451-5-jsnow@redhat.com>
In-Reply-To: <20210923001625.3996451-1-jsnow@redhat.com>
References: <20210923001625.3996451-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 John Snow <jsnow@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We need to import things from the qemu namespace; importing the
namespace alone doesn't bring the submodules with it -- unless someone
else (like iotests.py) imports them too.

Adjust the imports.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/tests/mirror-top-perms | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tests/qemu-iotests/tests/mirror-top-perms b/tests/qemu-iotests/tests/mirror-top-perms
index 73138a0ef91..3d475aa3a54 100755
--- a/tests/qemu-iotests/tests/mirror-top-perms
+++ b/tests/qemu-iotests/tests/mirror-top-perms
@@ -21,7 +21,8 @@
 
 import os
 
-import qemu
+from qemu import qmp
+from qemu.machine import machine
 
 import iotests
 from iotests import qemu_img
@@ -46,7 +47,7 @@ class TestMirrorTopPerms(iotests.QMPTestCase):
     def tearDown(self):
         try:
             self.vm.shutdown()
-        except qemu.machine.machine.AbnormalShutdown:
+        except machine.AbnormalShutdown:
             pass
 
         if self.vm_b is not None:
@@ -101,7 +102,7 @@ class TestMirrorTopPerms(iotests.QMPTestCase):
             self.vm_b.launch()
             print('ERROR: VM B launched successfully, this should not have '
                   'happened')
-        except qemu.qmp.QMPConnectError:
+        except qmp.QMPConnectError:
             assert 'Is another process using the image' in self.vm_b.get_log()
 
         result = self.vm.qmp('block-job-cancel',
-- 
2.31.1


