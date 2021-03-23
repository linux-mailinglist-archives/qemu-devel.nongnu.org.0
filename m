Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39548346D24
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 23:33:24 +0100 (CET)
Received: from localhost ([::1]:41286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOpaV-0007rn-9k
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 18:33:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lOpK1-0007FQ-RQ
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 18:16:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lOpJx-0002uk-3v
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 18:16:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616537776;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XVajM2muatNuYxwQApJ+cMuC2tYvS+qML4X+hN2+rlo=;
 b=IWsPkOYG/qBHGtHfcXa4FbMEv7AEWCnRLJ42EkOzEQdPgAhxJeP1DxS/6Hh9lLEQyIIIGP
 vWPC3hITdxAD9OGEE/w0FUvDhTMz5kkVfeYidFwZNPq51TrWB5ffhK1AqGLfJukp0j0IDP
 7wVz0+RfzyV7c1zceFnhtjd1pt1+/7I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-111-SoB-ic90Pr6Y1JoOniMJrA-1; Tue, 23 Mar 2021 18:16:14 -0400
X-MC-Unique: SoB-ic90Pr6Y1JoOniMJrA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 31CB4800D53;
 Tue, 23 Mar 2021 22:16:13 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-119-39.rdu2.redhat.com
 [10.10.119.39])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F9236087C;
 Tue, 23 Mar 2021 22:16:11 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/10] tests/acceptance/virtiofs_submounts.py: remove
 launch_vm()
Date: Tue, 23 Mar 2021 18:15:37 -0400
Message-Id: <20210323221539.3532660-9-crosa@redhat.com>
In-Reply-To: <20210323221539.3532660-1-crosa@redhat.com>
References: <20210323221539.3532660-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <willianr@redhat.com>,
 Eric Auger <eauger@redhat.com>, John Snow <jsnow@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The LinuxTest class' launch_and_wait() method now behaves the same way
as this test's custom launch_vm(), so let's just use the upper layer
(common) method.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/acceptance/virtiofs_submounts.py | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/tests/acceptance/virtiofs_submounts.py b/tests/acceptance/virtiofs_submounts.py
index e019d3b896..d77ee35674 100644
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
2.25.4


