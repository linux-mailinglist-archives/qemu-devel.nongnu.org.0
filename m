Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0763B145EB5
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jan 2020 23:40:43 +0100 (CET)
Received: from localhost ([::1]:47892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iuOfx-0000pI-VM
	for lists+qemu-devel@lfdr.de; Wed, 22 Jan 2020 17:40:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34106)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iuOZ5-00023p-Aw
 for qemu-devel@nongnu.org; Wed, 22 Jan 2020 17:33:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iuOZ3-0001s5-EG
 for qemu-devel@nongnu.org; Wed, 22 Jan 2020 17:33:35 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:33890
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iuOZ3-0001r8-8x
 for qemu-devel@nongnu.org; Wed, 22 Jan 2020 17:33:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579732412;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6BfEXEJk/FNg8im5gWHkwQZ/daMJUMlm2g5Q0qhEjXk=;
 b=Nv+YDu+Dq3DXmv0/oBsRYlL2gwiroboqomRgTeoTfl6NIvcOumdbO1EeS9umTBnRr2iSwU
 ch+RUQMXYNqXdMptHIXPsA7aNkvI7jdfhOShCUwp7SkunElL1P9M00VOP+FxFTUe+o/IS9
 4JvW7WMy+h4xxIDkcKjKMc/20iaNoFs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-111-ArhIvvKeM3uEB4XKBW0mRQ-1; Wed, 22 Jan 2020 17:33:29 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1AAE0DB60;
 Wed, 22 Jan 2020 22:33:28 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-78.brq.redhat.com [10.40.204.78])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B2CE8845A5;
 Wed, 22 Jan 2020 22:33:25 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: "Michael S . Tsirkin" <mst@redhat.com>,
 Denis Plotnikov <dplotnikov@virtuozzo.com>, qemu-devel@nongnu.org
Subject: [PATCH 5/6] tests/acceptance/virtio_seg_max_adjust: Restrict to X86
 architecture
Date: Wed, 22 Jan 2020 23:32:46 +0100
Message-Id: <20200122223247.30419-6-philmd@redhat.com>
In-Reply-To: <20200122223247.30419-1-philmd@redhat.com>
References: <20200122223247.30419-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: ArhIvvKeM3uEB4XKBW0mRQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Running on mainstream KVM architectures, we get:

- Aarch64

  Timeout.

  job.log:
  -------
  No machine specified, and there is no default
  Use -machine help to list supported machines

- MIPS:

   (1/1) VirtioMaxSegSettingsCheck.test_machine_types: ERROR: argument of t=
ype 'NoneType' is not iterable (0.14 s)

  job.log:
  -------
  Could not load MIPS bios 'mipsel_bios.bin', and no -kernel argument was s=
pecified

- PowerPC

   (1/1) VirtioMaxSegSettingsCheck.test_machine_types: ERROR: invalid liter=
al for int() with base 10: 'sxxm' (0.16 s)

  job.log:
  -------
  >>> {'execute': 'query-machines'}
  <<< {'return': [{'hotpluggable-cpus': True, 'name': 'pseries-2.12-sxxm', =
'numa-mem-supported': True, 'default-cpu-type': 'power8_v2.0-powerpc64-cpu'=
, 'cpu-max': 1024, 'deprecated': False}, ...

- S390X:

   (1/1) VirtioMaxSegSettingsCheck.test_machine_types: ERROR: invalid liter=
al for int() with base 10: 'virtio' (0.14 s)

  job.log:
  -------
  Traceback (most recent call last):
    File "virtio_seg_max_adjust.py", line 139, in test_machine_types
      if self.seg_max_adjust_enabled(m):
    File "virtio_seg_max_adjust.py", line 113, in seg_max_adjust_enabled
      major =3D int(ver[0])
  ValueError: invalid literal for int() with base 10: 'virtio'
  >>> {'execute': 'query-machines'}
  <<< {'return': [{'hotpluggable-cpus': True, 'name': 's390-ccw-virtio-4.0'=
, 'numa-mem-supported': False, 'default-cpu-type': 'qemu-s390x-cpu', 'cpu-m=
ax': 248, 'deprecated': False}, ...

Assuming this test is only expected to run on the X86 architecture,
restrict the test to this particular architecture.

When this test is run on other architecture, the tests will be skipped.

Examples:

- running on S390X:

 (1/1) tests/acceptance/virtio_seg_max_adjust.py:VirtioMaxSegSettingsCheck.=
test_machine_types: SKIP: Architecture 's390' unsupported

- running on Aarch64 setting the QEMU binary path:

  $ uname -m && avocado --show=3Dapp run -p qemu_bin=3Dx86_64-softmmu/qemu-=
system-x86_64 tests/acceptance/virtio_seg_max_adjust.py
  aarch64
  JOB ID     : 92b7fae8868920aada0cb143f9571dffdf60931d
  JOB LOG    : job-results/job-2020-01-22T17.54-92b7fae/job.log
   (1/1) tests/acceptance/virtio_seg_max_adjust.py:VirtioMaxSegSettingsChec=
k.test_machine_types: PASS (25.99 s)
  RESULTS    : PASS 1 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | =
CANCEL 0
  JOB TIME   : 26.13 s

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 tests/acceptance/virtio_seg_max_adjust.py | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tests/acceptance/virtio_seg_max_adjust.py b/tests/acceptance/v=
irtio_seg_max_adjust.py
index ad736bcda3..2fc6bfcbd8 100755
--- a/tests/acceptance/virtio_seg_max_adjust.py
+++ b/tests/acceptance/virtio_seg_max_adjust.py
@@ -26,6 +26,7 @@ import logging
 sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'pytho=
n'))
 from qemu.machine import QEMUMachine
 from avocado_qemu import Test
+from avocado.core.exceptions import TestSkipError
=20
 #list of machine types and virtqueue properties to test
 VIRTIO_SCSI_PROPS =3D {'seg_max_adjust': 'seg_max_adjust'}
@@ -117,12 +118,22 @@ class VirtioMaxSegSettingsCheck(Test):
         return False
=20
     def test_machine_types(self):
+        """
+        :avocado: tags=3Darch:i386
+        :avocado: tags=3Darch:x86_64
+        """
         EXCLUDED_MACHINES =3D ['none', 'isapc', 'microvm']
         if os.geteuid() !=3D 0:
             EXCLUDED_MACHINES +=3D ['xenfv', 'xenpv']
         # collect all machine types except the ones in EXCLUDED_MACHINES
         with QEMUMachine(self.qemu_bin) as vm:
             vm.launch()
+            # Skip test if target is not X86
+            # TODO: Move this check to Avocado (based on the test tags)
+            target_arch =3D vm.command('query-target')['arch']
+            if target_arch not in ['i386', 'x86_64']:
+                errmsg =3D "Architecture '%s' unsupported" % target_arch
+                raise TestSkipError(errmsg)
             machines =3D [m['name'] for m in vm.command('query-machines')]
             vm.shutdown()
         for m in EXCLUDED_MACHINES:
--=20
2.21.1


