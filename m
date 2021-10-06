Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A87423C73
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 13:16:16 +0200 (CEST)
Received: from localhost ([::1]:36840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY4uF-0003EX-7t
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 07:16:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mY4ee-0000hE-52
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 07:00:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mY4ec-0006NW-ET
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 07:00:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633518005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+B649WEzI0G6/ODAbe7CsmuY7chayWN5NHzHA7+oT/A=;
 b=BV9MSba/bWKRN+tO8NaFPe0bWAoAVsxc/IIe/C1LoY9Jn4/ozhRrsteVarSNsqjI4hRwtZ
 YIygRgnkiIBgIl0flbZD3tpgACQgxv1vrxhu5W4DTjlrOV9LSE07FqXYdVBdFsTFfRirVv
 Ppmxg97cuzLlEZBIHmKJAAlQ9rfZ1UU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-353-dnh8onMJPTqJykdyl7O82A-1; Wed, 06 Oct 2021 07:00:04 -0400
X-MC-Unique: dnh8onMJPTqJykdyl7O82A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 06DD0180830C;
 Wed,  6 Oct 2021 11:00:03 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.113])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0617B60BE5;
 Wed,  6 Oct 2021 10:59:59 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 11/13] iotests/mirror-top-perms: Adjust imports
Date: Wed,  6 Oct 2021 12:59:21 +0200
Message-Id: <20211006105923.223549-12-kwolf@redhat.com>
In-Reply-To: <20211006105923.223549-1-kwolf@redhat.com>
References: <20211006105923.223549-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Snow <jsnow@redhat.com>

We need to import subpackages from the qemu namespace package; importing
the namespace package alone doesn't bring the subpackages with it --
unless someone else (like iotests.py) imports them too.

Adjust the imports.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20210923180715.4168522-5-jsnow@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/tests/mirror-top-perms | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tests/qemu-iotests/tests/mirror-top-perms b/tests/qemu-iotests/tests/mirror-top-perms
index 73138a0ef9..3d475aa3a5 100755
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


