Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA417392DB
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jun 2019 19:13:41 +0200 (CEST)
Received: from localhost ([::1]:49682 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hZIQu-0007tj-Qr
	for lists+qemu-devel@lfdr.de; Fri, 07 Jun 2019 13:13:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48829)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <crosa@redhat.com>) id 1hZGhu-00059l-Jr
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 11:23:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <crosa@redhat.com>) id 1hZGht-0006HA-Ny
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 11:23:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57019)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <crosa@redhat.com>) id 1hZGhr-0006BU-07
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 11:23:03 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id AACAE3079B8E;
 Fri,  7 Jun 2019 15:22:58 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-122-62.rdu2.redhat.com
 [10.10.122.62])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A089682708;
 Fri,  7 Jun 2019 15:22:56 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri,  7 Jun 2019 11:22:21 -0400
Message-Id: <20190607152223.9467-7-crosa@redhat.com>
In-Reply-To: <20190607152223.9467-1-crosa@redhat.com>
References: <20190607152223.9467-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Fri, 07 Jun 2019 15:22:58 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 6/8] VNC Acceptance test: simplify test names
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
Cc: Fam Zheng <fam@euphon.net>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The test name is composed of the class name and method name, so it
looks like there's some redundancy here that we can eliminate.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/acceptance/vnc.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/acceptance/vnc.py b/tests/acceptance/vnc.py
index 675fd507ed..d32ae46685 100644
--- a/tests/acceptance/vnc.py
+++ b/tests/acceptance/vnc.py
@@ -45,7 +45,7 @@ class VncUnixSocket(Test):
         self.socket_dir =3D tempfile.mkdtemp()
         self.socket_path =3D os.path.join(self.socket_dir, 'vnc-socket')
=20
-    def test_vnc_change_password_requires_a_password(self):
+    def test_change_password_requires_a_password(self):
         self.vm.add_args('-nodefaults', '-S',
                          '-vnc', 'unix:%s' % self.socket_path)
         self.vm.launch()
@@ -60,7 +60,7 @@ class VncUnixSocket(Test):
         self.assertEqual(set_password_response['error']['desc'],
                          'Could not set password')
=20
-    def test_vnc_change_password(self):
+    def test_change_password(self):
         self.vm.add_args('-nodefaults', '-S',
                          '-vnc', 'unix:%s,password' % self.socket_path)
         self.vm.launch()
--=20
2.21.0


