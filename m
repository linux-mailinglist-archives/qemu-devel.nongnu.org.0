Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5E230414A
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 16:02:00 +0100 (CET)
Received: from localhost ([::1]:34976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4Pqx-00074m-EN
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 10:01:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l4PEg-0001Tl-Dl
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:22:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l4PEd-0006eG-IQ
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:22:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611670942;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZefFo3/5sZ8Heis3k9JcmSqklHkULbhCLO2F93kibLk=;
 b=Q1CBCtFKds0UGAE11AGlJF1U5LcALWJvrshsk/L85Vt0qxHmAua2XLAwiqLroSMAHR61Rj
 lWkhMUcWcdAZvIDGDyx1255rteQFcH0UKJqgTw96+jYF4Mg02bLtpOwcCpItio68krM51H
 vYjyGHzKAyFtQETgJtE09FberZdqpUs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-597-J5p6rnlvP2ebThyXBi1f7A-1; Tue, 26 Jan 2021 09:22:18 -0500
X-MC-Unique: J5p6rnlvP2ebThyXBi1f7A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 950BD801AAB;
 Tue, 26 Jan 2021 14:22:17 +0000 (UTC)
Received: from localhost (ovpn-114-175.ams2.redhat.com [10.36.114.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 329805D9C2;
 Tue, 26 Jan 2021 14:22:17 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 52/53] iotests/118: Drop 'change' test
Date: Tue, 26 Jan 2021 15:20:15 +0100
Message-Id: <20210126142016.806073-53-mreitz@redhat.com>
In-Reply-To: <20210126142016.806073-1-mreitz@redhat.com>
References: <20210126142016.806073-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 0afec75734331 removed the 'change' QMP command, so we can no
longer test it in 118.

Fixes: 0afec75734331a0b52fa3aa4235220eda8c7846f
       ('qmp: remove deprecated "change" command')
Signed-off-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20210126104833.57026-1-mreitz@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/qemu-iotests/118     | 20 +-------------------
 tests/qemu-iotests/118.out |  4 ++--
 2 files changed, 3 insertions(+), 21 deletions(-)

diff --git a/tests/qemu-iotests/118 b/tests/qemu-iotests/118
index 1a2e219057..cae52ffa5e 100755
--- a/tests/qemu-iotests/118
+++ b/tests/qemu-iotests/118
@@ -1,8 +1,7 @@
 #!/usr/bin/env python3
 # group: rw
 #
-# Test case for the QMP 'change' command and all other associated
-# commands
+# Test case for media change monitor commands
 #
 # Copyright (C) 2015 Red Hat, Inc.
 #
@@ -74,23 +73,6 @@ class ChangeBaseClass(iotests.QMPTestCase):
 
 class GeneralChangeTestsBaseClass(ChangeBaseClass):
 
-    def test_change(self):
-        # 'change' requires a drive name, so skip the test for blockdev
-        if not self.use_drive:
-            return
-
-        result = self.vm.qmp('change', device='drive0', target=new_img,
-                                       arg=iotests.imgfmt)
-        self.assert_qmp(result, 'return', {})
-
-        self.wait_for_open()
-        self.wait_for_close()
-
-        result = self.vm.qmp('query-block')
-        if self.has_real_tray:
-            self.assert_qmp(result, 'return[0]/tray_open', False)
-        self.assert_qmp(result, 'return[0]/inserted/image/filename', new_img)
-
     def test_blockdev_change_medium(self):
         result = self.vm.qmp('blockdev-change-medium',
                              id=self.device_name, filename=new_img,
diff --git a/tests/qemu-iotests/118.out b/tests/qemu-iotests/118.out
index bf5bfd5aca..0a70391105 100644
--- a/tests/qemu-iotests/118.out
+++ b/tests/qemu-iotests/118.out
@@ -1,5 +1,5 @@
-.......................................................................................................................................................................
+...........................................................................................................................................................
 ----------------------------------------------------------------------
-Ran 167 tests
+Ran 155 tests
 
 OK
-- 
2.29.2


