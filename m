Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD79D35B9A2
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 06:52:14 +0200 (CEST)
Received: from localhost ([::1]:55134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVoYX-00076K-Lp
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 00:52:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lVoUQ-0002UM-AB
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 00:47:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lVoUO-0003l1-Jp
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 00:47:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618202875;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5BZjFkL7Z+gsuFaPLk6wJhHDqN5BILsbgfhp8WPWPnk=;
 b=GoCAX8xil2U0DV1LWmMp8jdg1SoICfKRof+YwZ0TP+A1rXNC81iyOyQG6mItu1d81n++dj
 1+66crLH/VthAf7Yuh8nmiBkpkWveaP4bJC9edw/2s71n5xqib1uGZmI7seXpjwg2qi2U3
 AcFzRGeO90pxceKGneTgLUpqcFztAqY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-252-XJB-HutgP0W7bolcLNvASw-1; Mon, 12 Apr 2021 00:47:54 -0400
X-MC-Unique: XJB-HutgP0W7bolcLNvASw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3AB71801814;
 Mon, 12 Apr 2021 04:47:53 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-113-108.rdu2.redhat.com
 [10.10.113.108])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 95CA810016FD;
 Mon, 12 Apr 2021 04:47:51 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 08/11] tests/acceptance/virtiofs_submounts.py: remove
 launch_vm()
Date: Mon, 12 Apr 2021 00:46:41 -0400
Message-Id: <20210412044644.55083-9-crosa@redhat.com>
In-Reply-To: <20210412044644.55083-1-crosa@redhat.com>
References: <20210412044644.55083-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 John Snow <jsnow@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The LinuxTest class' launch_and_wait() method now behaves the same way
as this test's custom launch_vm(), so let's just use the upper layer
(common) method.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
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
2.30.2


