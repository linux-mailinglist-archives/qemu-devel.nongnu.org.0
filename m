Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E27D1FBC4
	for <lists+qemu-devel@lfdr.de>; Wed, 15 May 2019 22:53:06 +0200 (CEST)
Received: from localhost ([127.0.0.1]:42341 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hR0td-0007D0-CR
	for lists+qemu-devel@lfdr.de; Wed, 15 May 2019 16:53:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52488)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1hR0rG-0005lR-QU
	for qemu-devel@nongnu.org; Wed, 15 May 2019 16:50:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1hR0rF-000154-KD
	for qemu-devel@nongnu.org; Wed, 15 May 2019 16:50:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54862)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hR0rF-00014D-BC
	for qemu-devel@nongnu.org; Wed, 15 May 2019 16:50:37 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6EE3C37EEB
	for <qemu-devel@nongnu.org>; Wed, 15 May 2019 20:50:36 +0000 (UTC)
Received: from 640k.localdomain.com (ovpn-112-17.ams2.redhat.com
	[10.36.112.17])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B7E895C557
	for <qemu-devel@nongnu.org>; Wed, 15 May 2019 20:50:35 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 15 May 2019 22:50:12 +0200
Message-Id: <1557953433-19663-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Wed, 15 May 2019 20:50:36 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 00/21] Misc patches for 2019-05-15
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit e329ad2ab72c43b56df88b34954c2c7d839bb3=
73:

  Merge remote-tracking branch 'remotes/rth/tags/pull-tcg-20190513' into =
staging (2019-05-14 10:08:47 +0100)

are available in the git repository at:


  git://github.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to 88f1090e9020057022ac04531ca87d25f67f57ca:

  hw/net/ne2000: Extract the PCI device from the chipset common code (201=
9-05-15 11:56:54 +0200)

----------------------------------------------------------------
Mostly bugfixes and cleanups, the most important being
"megasas: fix mapped frame size" from Peter Lieven.
In addition, -realtime is marked as deprecated.

----------------------------------------------------------------
Chen Zhang via Qemu-devel (1):
      hvf: Add missing break statement

Igor Mammedov (1):
      roms: assert if max rom size is less than the used size

Laurent Vivier (5):
      trace: only include trace-event-subdirs when they are needed
      build: replace GENERATED_FILES by generated-files-y
      configure: qemu-ga is only needed with softmmu targets
      build: chardev is only needed for softmmu targets
      build: don't build hardware objects with linux-user

Marc-Andr=C3=A9 Lureau (1):
      vl: fix -sandbox parsing crash when seccomp support is disabled

Paolo Bonzini (2):
      mips-fulong2e: obey -vga none
      sun4m: obey -vga none

Peter Lieven (1):
      megasas: fix mapped frame size

Philippe Mathieu-Daud=C3=A9 (5):
      vl: Add missing descriptions to the VGA adapters list
      hw/acpi/piix4: Move TYPE_PIIX4_PM to a public header
      hw/i386/acpi: Add object_resolve_type_unambiguous to improve modula=
rity
      hw/i386/acpi: Assert a pointer is not null BEFORE using it
      hw/net/ne2000: Extract the PCI device from the chipset common code

Thomas Huth (3):
      hw/input: Add a CONFIG_PS2 switch for the ps2.c file
      Declare -realtime as deprecated
      hw/char: Move multi-serial devices into separate file

Vitaly Kuznetsov (1):
      ioapic: allow buggy guests mishandling level-triggered interrupts t=
o make progress

Wei Yang (1):
      memory: correct the comment to DIRTY_MEMORY_MIGRATION

 Makefile                          |  43 ++++----
 Makefile.objs                     |  22 ++--
 Makefile.target                   |   6 +-
 configure                         |   4 +-
 hw/acpi/piix4.c                   |  13 ---
 hw/char/Kconfig                   |   6 ++
 hw/char/Makefile.objs             |   1 +
 hw/char/serial-pci-multi.c        | 208 ++++++++++++++++++++++++++++++++=
++++++
 hw/char/serial-pci.c              | 170 -------------------------------
 hw/core/loader.c                  |   1 +
 hw/i386/acpi-build.c              |  22 +++-
 hw/input/Kconfig                  |   5 +
 hw/input/Makefile.objs            |   2 +-
 hw/intc/ioapic.c                  |  57 ++++++++++-
 hw/intc/trace-events              |   1 +
 hw/isa/lpc_ich9.c                 |  11 --
 hw/mips/mips_fulong2e.c           |  10 +-
 hw/net/Kconfig                    |   7 +-
 hw/net/Makefile.objs              |   3 +-
 hw/net/ne2000-pci.c               | 132 ++++++++++++++++++++++++
 hw/net/ne2000.c                   | 105 -------------------
 hw/scsi/megasas.c                 |   2 +-
 hw/sparc/sun4m.c                  |   6 +-
 include/hw/acpi/piix4.h           |   2 +-
 include/hw/i386/ich9.h            |   2 -
 include/hw/i386/ioapic_internal.h |   3 +
 memory.c                          |   4 +-
 qemu-deprecated.texi              |   5 +
 target/i386/hvf/hvf.c             |   1 +
 target/s390x/Makefile.objs        |   2 +-
 tests/Makefile.include            | 116 ++++++++++-----------
 vl.c                              |  22 ++--
 32 files changed, 568 insertions(+), 426 deletions(-)
 create mode 100644 hw/char/serial-pci-multi.c
 create mode 100644 hw/net/ne2000-pci.c
--=20
1.8.3.1


