Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 270E8393B7C
	for <lists+qemu-devel@lfdr.de>; Fri, 28 May 2021 04:38:53 +0200 (CEST)
Received: from localhost ([::1]:36654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmSOi-0006Gn-5c
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 22:38:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lmSJU-0000Vr-KC
 for qemu-devel@nongnu.org; Thu, 27 May 2021 22:33:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lmSJS-00089e-Qw
 for qemu-devel@nongnu.org; Thu, 27 May 2021 22:33:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622169206;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cBEDEnNMRMCu4H3MnJ01dG8m7nsiX+etOucYL6GLmQ4=;
 b=AUVMWYyA2nlq6Sb1JDUUnQNo7C5hdLAu5xh3HHUKwMuiFurxTjkNSrt49zaN862qZ19vgb
 QWgs3LwcS8YMYVLkN06izbhFrb9taNGkUy5ukLkoYSS2METtmCYNpS5lXtBXl9UfCr6NMk
 jsVtDnYqQ2nLGEE2bTK78rJPQcyWP1M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-190-B3iMego4MhCdVUfsDKwMvQ-1; Thu, 27 May 2021 22:33:24 -0400
X-MC-Unique: B3iMego4MhCdVUfsDKwMvQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F2C72501E1;
 Fri, 28 May 2021 02:33:22 +0000 (UTC)
Received: from scv.redhat.com (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 05B0519D9B;
 Fri, 28 May 2021 02:33:17 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/44] tests/acceptance/virtiofs_submounts.py: remove
 launch_vm()
Date: Thu, 27 May 2021 22:31:45 -0400
Message-Id: <20210528023220.417057-10-jsnow@redhat.com>
In-Reply-To: <20210528023220.417057-1-jsnow@redhat.com>
References: <20210528023220.417057-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <willianr@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cleber Rosa <crosa@redhat.com>

The LinuxTest class' launch_and_wait() method now behaves the same way
as this test's custom launch_vm(), so let's just use the upper layer
(common) method.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Message-Id: <20210412044644.55083-9-crosa@redhat.com>
Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/acceptance/virtiofs_submounts.py | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/tests/acceptance/virtiofs_submounts.py b/tests/acceptance/virtiofs_submounts.py
index e019d3b896b..d77ee356740 100644
--- a/tests/acceptance/virtiofs_submounts.py
+++ b/tests/acceptance/virtiofs_submounts.py
@@ -134,9 +134,6 @@ def set_up_virtiofs(self):
                          '-numa',
                          'node,memdev=mem')
 
-    def launch_vm(self):
-        self.launch_and_wait()
-
     def set_up_nested_mounts(self):
         scratch_dir = os.path.join(self.shared_dir, 'scratch')
         try:
@@ -225,7 +222,7 @@ def test_pre_virtiofsd_set_up(self):
         self.set_up_nested_mounts()
 
         self.set_up_virtiofs()
-        self.launch_vm()
+        self.launch_and_wait()
         self.mount_in_guest()
         self.check_in_guest()
 
@@ -235,14 +232,14 @@ def test_pre_launch_set_up(self):
 
         self.set_up_nested_mounts()
 
-        self.launch_vm()
+        self.launch_and_wait()
         self.mount_in_guest()
         self.check_in_guest()
 
     def test_post_launch_set_up(self):
         self.set_up_shared_dir()
         self.set_up_virtiofs()
-        self.launch_vm()
+        self.launch_and_wait()
 
         self.set_up_nested_mounts()
 
@@ -252,7 +249,7 @@ def test_post_launch_set_up(self):
     def test_post_mount_set_up(self):
         self.set_up_shared_dir()
         self.set_up_virtiofs()
-        self.launch_vm()
+        self.launch_and_wait()
         self.mount_in_guest()
 
         self.set_up_nested_mounts()
@@ -265,7 +262,7 @@ def test_two_runs(self):
         self.set_up_nested_mounts()
 
         self.set_up_virtiofs()
-        self.launch_vm()
+        self.launch_and_wait()
         self.mount_in_guest()
         self.check_in_guest()
 
-- 
2.31.1


