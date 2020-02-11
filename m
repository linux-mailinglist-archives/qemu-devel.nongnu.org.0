Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D0B158CF0
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Feb 2020 11:52:00 +0100 (CET)
Received: from localhost ([::1]:47574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j1T94-0002vh-K0
	for lists+qemu-devel@lfdr.de; Tue, 11 Feb 2020 05:51:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34979)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j1T73-0001kl-Ta
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 05:49:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j1T71-0000rV-Pq
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 05:49:52 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:35628
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j1T71-0000rJ-Jn
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 05:49:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581418190;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=yG7GZnEZiTgPzO/hq8F2wYhXWA1CzL4SiqguRtYuf9c=;
 b=TcBYsWL5AFwg4sb13QWlUqKKmbFbzaA2afgnUwPIgY9SMeqM0qW9njEUgrIdLq5pIL6z9w
 Pvv8DANDAXEh0pDrJwnkkiu99Knnyy4FpD9AEuC6CzT4cIn/GVTkqTdCLqponqz2T4hux+
 nrMwvhJMafz0fZAFseB6gZ+GScHrdSg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-Mtay8WJzNDSG7REtC7F_5Q-1; Tue, 11 Feb 2020 05:49:49 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 085F68017DF;
 Tue, 11 Feb 2020 10:49:48 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-81.brq.redhat.com [10.40.205.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1057389F31;
 Tue, 11 Feb 2020 10:49:40 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] tests/acceptance/virtio_check_params: Only disable the test
 on CI
Date: Tue, 11 Feb 2020 11:49:38 +0100
Message-Id: <20200211104938.12068-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: Mtay8WJzNDSG7REtC7F_5Q-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: Denis Plotnikov <dplotnikov@virtuozzo.com>,
 Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 2d6a6e238a incorrectly totally disabled this test.
The original intention was to only disable on continuous integration.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 tests/acceptance/virtio_check_params.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/acceptance/virtio_check_params.py b/tests/acceptance/vir=
tio_check_params.py
index 87e6c839d1..015582cf9c 100644
--- a/tests/acceptance/virtio_check_params.py
+++ b/tests/acceptance/virtio_check_params.py
@@ -25,7 +25,7 @@ import logging
 sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'pytho=
n'))
 from qemu.machine import QEMUMachine
 from avocado_qemu import Test
-from avocado import skip
+from avocado import skipIf
=20
 #list of machine types and virtqueue properties to test
 VIRTIO_SCSI_PROPS =3D {'seg_max_adjust': 'seg_max_adjust'}
@@ -117,7 +117,7 @@ class VirtioMaxSegSettingsCheck(Test):
             return True
         return False
=20
-    @skip("break multi-arch CI")
+    @skipIf(os.getenv('CONTINUOUS_INTEGRATION'), 'Break multi-arch CI')
     def test_machine_types(self):
         # collect all machine types except 'none', 'isapc', 'microvm'
         with QEMUMachine(self.qemu_bin) as vm:
--=20
2.21.1


