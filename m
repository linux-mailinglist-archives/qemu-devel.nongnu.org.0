Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE7D14D26E
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jan 2020 22:25:19 +0100 (CET)
Received: from localhost ([::1]:51472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iwupq-0005q5-5N
	for lists+qemu-devel@lfdr.de; Wed, 29 Jan 2020 16:25:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59302)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iwuoc-0004KB-M1
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 16:24:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iwuoa-0008Hj-L5
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 16:24:01 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:46626
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iwuoa-0008Fy-HW
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 16:24:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580333039;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zCdw8bpuNLpskNiGQbk+FqhXE7WRP45E/07OHocJ4yo=;
 b=PaP/+Q0O8jf1dH0ceKR+ENkhSfV3VBSF5PLUN8yz/5oSjcHUgOprmZ+WSsCy209AaoFFYp
 DyWVJzsHTWiY+GvgAchbvlth6zqDHNeIB6bQy6xZr19SwLl9ignyxQFX14txrbSi1nWFIq
 IY8JKhMeQsUvv6mbOM7i+gr35TRRBek=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-377-uo--bfQ0OAm9XC4SM2Y-bw-1; Wed, 29 Jan 2020 16:23:55 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A61901005510;
 Wed, 29 Jan 2020 21:23:54 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-184.brq.redhat.com [10.40.205.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A9BF460BF3;
 Wed, 29 Jan 2020 21:23:47 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Denis Plotnikov <dplotnikov@virtuozzo.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v2 00/29] tests/acceptance/virtio_seg_max_adjust: Restrict it
 to Linux/X86
Date: Wed, 29 Jan 2020 22:23:16 +0100
Message-Id: <20200129212345.20547-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: uo--bfQ0OAm9XC4SM2Y-bw-1
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
 Eduardo Habkost <ehabkost@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently our CI is mostly restricted to Linux/X86.
We want to have more, but until there we have to run these tests
manually, which is why we didn't noticed earlier this test was
failing on OSX.

This series contains the patches I used to debug why the
virtio_seg_max_adjust had broken the OSX CI, but then I
kept testing on other archs, thus added more patches...

Currently our CI is mostly restricted to Linux/X86.
We want to have more, but until there we have to run these tests
manually, which is why we didn't noticed earlier some tests are
failing (on OSX, using --without-default-devices, ...).

Tested on Linux/FreeBSD/OSX, X86/Aarch64.

Regards,

Phil.

Supersedes: <20200122223247.30419-1-philmd@redhat.com>
"tests/acceptance/virtio_seg_max_adjust: Restrict it to Linux/X86"

Denis Plotnikov (1):
  tests: rename virtio_seg_max_adjust to virtio_check_params

Philippe Mathieu-Daud=C3=A9 (28):
  hw/core: Allow setting 'virtio-blk-device.scsi' property on OSX host
  accel/accel: Make TYPE_ACCEL abstract
  python/qemu: Add binutils::binary_get_version()
  tests/acceptance: Use 'version-min' tag to verify QEMU binary version
  tests/acceptance: Restrict X86CPUModelAliases test to QEMU >=3D 4.1
  python/qemu: Add binutils::binary_get_arch()
  tests/acceptance: Use the 'arch' tag to verify QEMU binary target
  python/qemu: Add binutils::binary_get_machines()
  tests/acceptance: Use 'machine' tag to check if available in QEMU
    binary
  python/qemu: Add binutils::binary_get_qom_implementations()
  python/qemu: Add binutils::binary_get_accels()
  python/qemu/accel: Use binutils::binary_get_accels()
  python/qemu: Add binutils::binary_get_devices()
  tests/acceptance: Use 'device' tags to check availability in QEMU
    binary
  tests/acceptance/virtio_check_params: Only remove listed machines
  tests/acceptance/virtio_check_params: Improve exception logging
  tests/acceptance/virtio_check_params: List machine being tested
  tests/acceptance/virtio_check_params: Only test Xen as superuser
  tests/acceptance/virtio_check_params: Skip test if arch is not
    supported
  tests/acceptance/virtio_check_params: Kludge to skip tests on MIPS
  tests/acceptance/virtio_check_params: Support the s390x architecture
  tests/acceptance/virtio_check_params: Support the ppc architecture
  tests/acceptance/virtio_check_params: Default to -nodefaults
  tests/acceptance/virtio_check_params: Require a virtio-scsi-pci device
  tests/acceptance/boot_linux_console: Do not use VGA on Clipper machine
  tests/acceptance/migration: Default to -nodefaults
  tests/acceptance/version: Default to -nodefaults
  MAINTAINERS: Add Acceptance tests reviewers

 accel/accel.c                                 |   1 +
 hw/core/machine.c                             |   3 +-
 MAINTAINERS                                   |   6 +
 python/qemu/accel.py                          |  26 +----
 python/qemu/binutils.py                       | 107 ++++++++++++++++++
 tests/acceptance/avocado_qemu/__init__.py     |  51 ++++++++-
 tests/acceptance/boot_linux_console.py        |   2 +-
 tests/acceptance/core_scripts.py              |  79 +++++++++++++
 tests/acceptance/migration.py                 |   4 +-
 tests/acceptance/version.py                   |   1 +
 ...g_max_adjust.py =3D> virtio_check_params.py} |  70 +++++++++---
 tests/acceptance/x86_cpu_model_versions.py    |   1 +
 12 files changed, 306 insertions(+), 45 deletions(-)
 create mode 100644 python/qemu/binutils.py
 create mode 100644 tests/acceptance/core_scripts.py
 rename tests/acceptance/{virtio_seg_max_adjust.py =3D> virtio_check_params=
.py} (64%)

--=20
2.21.1


