Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 384F8138606
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Jan 2020 12:30:27 +0100 (CET)
Received: from localhost ([::1]:37182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iqbRo-0007Rg-TA
	for lists+qemu-devel@lfdr.de; Sun, 12 Jan 2020 06:30:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42966)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iqbQE-0006OY-6M
 for qemu-devel@nongnu.org; Sun, 12 Jan 2020 06:28:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iqbQB-0008Mp-Hu
 for qemu-devel@nongnu.org; Sun, 12 Jan 2020 06:28:46 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:49552
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1iqbQB-0008Kr-Cf
 for qemu-devel@nongnu.org; Sun, 12 Jan 2020 06:28:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578828522;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=pbipSiJqMOTN3kezn3WTsFnOsw13fsPyE8JKYnL/Ng4=;
 b=YilenJZkP0BU7Z0rWafx3LTrR1UYmYwOmwOT7xNeDB1KOc7NOOuIVA1K3tbp7oOa4tVEkm
 Lz6ahqHJfT45aBT6SOysynqctHKWpgBaWbskZfnNINv2IYHVCfu6CY5W3LM2CVrpubA3yX
 7VcNZH19EcTqY7Q6xvzRtPJeJBoW/oI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45-lP0Fc3-cM0G2NzVaiKarNg-1; Sun, 12 Jan 2020 06:28:40 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD50F1800D6B;
 Sun, 12 Jan 2020 11:28:39 +0000 (UTC)
Received: from thuth.com (ovpn-116-70.ams2.redhat.com [10.36.116.70])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1BF428177F;
 Sun, 12 Jan 2020 11:28:35 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL v2 0/8] qtests and docs
Date: Sun, 12 Jan 2020 12:28:29 +0100
Message-Id: <20200112112832.9450-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: lP0Fc3-cM0G2NzVaiKarNg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

 Hi Peter!

The following changes since commit dc65a5bdc9fa543690a775b50d4ffbeb22c56d6d=
:

  Merge remote-tracking branch 'remotes/dgibson/tags/ppc-for-5.0-20200108'
  into staging (2020-01-10 16:15:04 +0000)

are available in the Git repository at:

  https://gitlab.com/huth/qemu.git tags/pull-request-2020-01-12

for you to fetch changes up to 22108f333d16cbfbd5808bb4f661c394b08fe698:

  docs: build an index page for the HTML docs (2020-01-12 11:42:41 +0100)

----------------------------------------------------------------
* Move qtests into a separate directory
* Build index.html for docs
----------------------------------------------------------------

v2: Rebased and fixed conflicts in tests/Makefile.include

Stefan Hajnoczi (1):
      docs: build an index page for the HTML docs

Thomas Huth (7):
      tests/Makefile: test-char does not need libqtest
      tests/ptimer: Remove unnecessary inclusion of libqtest.h
      tests/Makefile: Remove 'tests/' and '$(EXESUF)' from the check-qtest =
variables
      tests/Makefile: Separate unit test dependencies from qtest dependenci=
es
      test: Move qtests to a separate directory
      tests/Makefile: Move qtest-related settings to a separate Makefile.in=
clude
      tests/libqos: Move the libqos files under tests/qtest/

 .gitlab-ci.yml                                     |  11 +-
 MAINTAINERS                                        |  88 +++--
 Makefile                                           |   6 +
 configure                                          |   4 +-
 docs/index.html.in                                 |  17 +
 tests/Makefile.include                             | 356 ++---------------=
----
 tests/ptimer-test.c                                |   1 -
 tests/qtest/Makefile.include                       | 318 +++++++++++++++++=
+
 tests/{ =3D> qtest}/ac97-test.c                      |   0
 tests/{ =3D> qtest}/acpi-utils.c                     |   0
 tests/{ =3D> qtest}/acpi-utils.h                     |   0
 tests/{ =3D> qtest}/ahci-test.c                      |   0
 tests/{ =3D> qtest}/arm-cpu-features.c               |   0
 tests/{ =3D> qtest}/bios-tables-test-allowed-diff.h  |   0
 tests/{ =3D> qtest}/bios-tables-test.c               |   0
 tests/{ =3D> qtest}/boot-order-test.c                |   0
 tests/{ =3D> qtest}/boot-sector.c                    |   0
 tests/{ =3D> qtest}/boot-sector.h                    |   0
 tests/{ =3D> qtest}/boot-serial-test.c               |   0
 tests/{ =3D> qtest}/cdrom-test.c                     |   0
 tests/{ =3D> qtest}/cpu-plug-test.c                  |   0
 tests/{ =3D> qtest}/dbus-vmstate-test.c              |   0
 tests/{ =3D> qtest}/dbus-vmstate1.xml                |   0
 tests/{ =3D> qtest}/device-introspect-test.c         |   0
 tests/{ =3D> qtest}/device-plug-test.c               |   0
 tests/{ =3D> qtest}/display-vga-test.c               |   0
 tests/{ =3D> qtest}/drive_del-test.c                 |   0
 tests/{ =3D> qtest}/ds1338-test.c                    |   0
 tests/{ =3D> qtest}/e1000-test.c                     |   0
 tests/{ =3D> qtest}/e1000e-test.c                    |   0
 tests/{ =3D> qtest}/eepro100-test.c                  |   0
 tests/{ =3D> qtest}/endianness-test.c                |   0
 tests/{ =3D> qtest}/es1370-test.c                    |   0
 tests/{ =3D> qtest}/fdc-test.c                       |   0
 tests/{ =3D> qtest}/fw_cfg-test.c                    |   0
 tests/{ =3D> qtest}/hd-geo-test.c                    |   0
 tests/{ =3D> qtest}/hexloader-test.c                 |   0
 tests/{ =3D> qtest}/i440fx-test.c                    |   0
 tests/{ =3D> qtest}/i82801b11-test.c                 |   0
 tests/{ =3D> qtest}/ide-test.c                       |   0
 tests/{ =3D> qtest}/intel-hda-test.c                 |   0
 tests/{ =3D> qtest}/ioh3420-test.c                   |   0
 tests/{ =3D> qtest}/ipmi-bt-test.c                   |   0
 tests/{ =3D> qtest}/ipmi-kcs-test.c                  |   0
 tests/{ =3D> qtest}/ipoctal232-test.c                |   0
 tests/{ =3D> qtest}/ivshmem-test.c                   |   0
 .../libqos/aarch64-xlnx-zcu102-machine.c           |   0
 tests/{ =3D> qtest}/libqos/ahci.c                    |   0
 tests/{ =3D> qtest}/libqos/ahci.h                    |   0
 tests/{ =3D> qtest}/libqos/arm-imx25-pdk-machine.c   |   0
 tests/{ =3D> qtest}/libqos/arm-n800-machine.c        |   0
 tests/{ =3D> qtest}/libqos/arm-raspi2-machine.c      |   0
 tests/{ =3D> qtest}/libqos/arm-sabrelite-machine.c   |   0
 tests/{ =3D> qtest}/libqos/arm-smdkc210-machine.c    |   0
 tests/{ =3D> qtest}/libqos/arm-virt-machine.c        |   0
 .../libqos/arm-xilinx-zynq-a9-machine.c            |   0
 tests/{ =3D> qtest}/libqos/e1000e.c                  |   0
 tests/{ =3D> qtest}/libqos/e1000e.h                  |   0
 tests/{ =3D> qtest}/libqos/fw_cfg.c                  |   0
 tests/{ =3D> qtest}/libqos/fw_cfg.h                  |   0
 tests/{ =3D> qtest}/libqos/i2c-imx.c                 |   0
 tests/{ =3D> qtest}/libqos/i2c-omap.c                |   0
 tests/{ =3D> qtest}/libqos/i2c.c                     |   0
 tests/{ =3D> qtest}/libqos/i2c.h                     |   0
 tests/{ =3D> qtest}/libqos/libqos-pc.c               |   0
 tests/{ =3D> qtest}/libqos/libqos-pc.h               |   0
 tests/{ =3D> qtest}/libqos/libqos-spapr.c            |   0
 tests/{ =3D> qtest}/libqos/libqos-spapr.h            |   0
 tests/{ =3D> qtest}/libqos/libqos.c                  |   0
 tests/{ =3D> qtest}/libqos/libqos.h                  |   0
 tests/{ =3D> qtest}/libqos/malloc-pc.c               |   0
 tests/{ =3D> qtest}/libqos/malloc-pc.h               |   0
 tests/{ =3D> qtest}/libqos/malloc-spapr.c            |   0
 tests/{ =3D> qtest}/libqos/malloc-spapr.h            |   0
 tests/{ =3D> qtest}/libqos/malloc.c                  |   0
 tests/{ =3D> qtest}/libqos/malloc.h                  |   0
 tests/{ =3D> qtest}/libqos/pci-pc.c                  |   0
 tests/{ =3D> qtest}/libqos/pci-pc.h                  |   0
 tests/{ =3D> qtest}/libqos/pci-spapr.c               |   0
 tests/{ =3D> qtest}/libqos/pci-spapr.h               |   0
 tests/{ =3D> qtest}/libqos/pci.c                     |   0
 tests/{ =3D> qtest}/libqos/pci.h                     |   0
 tests/{ =3D> qtest}/libqos/ppc64_pseries-machine.c   |   0
 tests/{ =3D> qtest}/libqos/qgraph.c                  |   0
 tests/{ =3D> qtest}/libqos/qgraph.h                  |   0
 tests/{ =3D> qtest}/libqos/qgraph_internal.h         |   0
 tests/{ =3D> qtest}/libqos/rtas.c                    |   0
 tests/{ =3D> qtest}/libqos/rtas.h                    |   0
 tests/{ =3D> qtest}/libqos/sdhci.c                   |   0
 tests/{ =3D> qtest}/libqos/sdhci.h                   |   0
 tests/{ =3D> qtest}/libqos/tpci200.c                 |   0
 tests/{ =3D> qtest}/libqos/usb.c                     |   0
 tests/{ =3D> qtest}/libqos/usb.h                     |   0
 tests/{ =3D> qtest}/libqos/virtio-9p.c               |   0
 tests/{ =3D> qtest}/libqos/virtio-9p.h               |   0
 tests/{ =3D> qtest}/libqos/virtio-balloon.c          |   0
 tests/{ =3D> qtest}/libqos/virtio-balloon.h          |   0
 tests/{ =3D> qtest}/libqos/virtio-blk.c              |   0
 tests/{ =3D> qtest}/libqos/virtio-blk.h              |   0
 tests/{ =3D> qtest}/libqos/virtio-mmio.c             |   0
 tests/{ =3D> qtest}/libqos/virtio-mmio.h             |   0
 tests/{ =3D> qtest}/libqos/virtio-net.c              |   0
 tests/{ =3D> qtest}/libqos/virtio-net.h              |   0
 tests/{ =3D> qtest}/libqos/virtio-pci-modern.c       |   0
 tests/{ =3D> qtest}/libqos/virtio-pci-modern.h       |   0
 tests/{ =3D> qtest}/libqos/virtio-pci.c              |   0
 tests/{ =3D> qtest}/libqos/virtio-pci.h              |   0
 tests/{ =3D> qtest}/libqos/virtio-rng.c              |   0
 tests/{ =3D> qtest}/libqos/virtio-rng.h              |   0
 tests/{ =3D> qtest}/libqos/virtio-scsi.c             |   0
 tests/{ =3D> qtest}/libqos/virtio-scsi.h             |   0
 tests/{ =3D> qtest}/libqos/virtio-serial.c           |   0
 tests/{ =3D> qtest}/libqos/virtio-serial.h           |   0
 tests/{ =3D> qtest}/libqos/virtio.c                  |   0
 tests/{ =3D> qtest}/libqos/virtio.h                  |   0
 tests/{ =3D> qtest}/libqos/x86_64_pc-machine.c       |   0
 tests/{ =3D> qtest}/libqtest-single.h                |   0
 tests/{ =3D> qtest}/libqtest.c                       |   0
 tests/{ =3D> qtest}/libqtest.h                       |   0
 tests/{ =3D> qtest}/m25p80-test.c                    |   0
 tests/{ =3D> qtest}/m48t59-test.c                    |   0
 tests/{ =3D> qtest}/machine-none-test.c              |   0
 tests/{ =3D> qtest}/megasas-test.c                   |   0
 tests/{ =3D> qtest}/microbit-test.c                  |   0
 tests/{ =3D> qtest}/migration-helpers.c              |   0
 tests/{ =3D> qtest}/migration-helpers.h              |   0
 tests/{ =3D> qtest}/migration-test.c                 |   0
 tests/{ =3D> qtest}/modules-test.c                   |   0
 tests/{ =3D> qtest}/ne2000-test.c                    |   0
 tests/{ =3D> qtest}/numa-test.c                      |   0
 tests/{ =3D> qtest}/nvme-test.c                      |   0
 tests/{ =3D> qtest}/pca9552-test.c                   |   0
 tests/{ =3D> qtest}/pci-test.c                       |   0
 tests/{ =3D> qtest}/pcnet-test.c                     |   0
 tests/{ =3D> qtest}/pflash-cfi02-test.c              |   0
 tests/{ =3D> qtest}/pnv-xscom-test.c                 |   0
 tests/{ =3D> qtest}/prom-env-test.c                  |   0
 tests/{ =3D> qtest}/pvpanic-test.c                   |   0
 tests/{ =3D> qtest}/pxe-test.c                       |   0
 tests/{ =3D> qtest}/q35-test.c                       |   0
 tests/{ =3D> qtest}/qmp-cmd-test.c                   |   0
 tests/{ =3D> qtest}/qmp-test.c                       |   0
 tests/{ =3D> qtest}/qom-test.c                       |   0
 tests/{ =3D> qtest}/qos-test.c                       |   0
 tests/{ =3D> qtest}/rtas-test.c                      |   0
 tests/{ =3D> qtest}/rtc-test.c                       |   0
 tests/{ =3D> qtest}/rtl8139-test.c                   |   0
 tests/{ =3D> qtest}/sdhci-test.c                     |   0
 tests/{ =3D> qtest}/spapr-phb-test.c                 |   0
 tests/{ =3D> qtest}/tco-test.c                       |   0
 tests/{ =3D> qtest}/test-arm-mptimer.c               |   0
 tests/{ =3D> qtest}/test-filter-mirror.c             |   0
 tests/{ =3D> qtest}/test-filter-redirector.c         |   0
 tests/{ =3D> qtest}/test-hmp.c                       |   0
 tests/{ =3D> qtest}/test-netfilter.c                 |   0
 tests/{ =3D> qtest}/test-x86-cpuid-compat.c          |   0
 tests/{ =3D> qtest}/tmp105-test.c                    |   0
 tests/{ =3D> qtest}/tpm-crb-swtpm-test.c             |   0
 tests/{ =3D> qtest}/tpm-crb-test.c                   |   0
 tests/{ =3D> qtest}/tpm-emu.c                        |   0
 tests/{ =3D> qtest}/tpm-emu.h                        |   0
 tests/{ =3D> qtest}/tpm-tests.c                      |   0
 tests/{ =3D> qtest}/tpm-tests.h                      |   0
 tests/{ =3D> qtest}/tpm-tis-swtpm-test.c             |   0
 tests/{ =3D> qtest}/tpm-tis-test.c                   |   0
 tests/{ =3D> qtest}/tpm-util.c                       |   0
 tests/{ =3D> qtest}/tpm-util.h                       |   0
 tests/{ =3D> qtest}/usb-hcd-ehci-test.c              |   0
 tests/{ =3D> qtest}/usb-hcd-ohci-test.c              |   0
 tests/{ =3D> qtest}/usb-hcd-uhci-test.c              |   0
 tests/{ =3D> qtest}/usb-hcd-xhci-test.c              |   0
 tests/{ =3D> qtest}/vhost-user-test.c                |   0
 tests/{ =3D> qtest}/virtio-9p-test.c                 |   0
 tests/{ =3D> qtest}/virtio-blk-test.c                |   0
 tests/{ =3D> qtest}/virtio-ccw-test.c                |   0
 tests/{ =3D> qtest}/virtio-net-test.c                |   0
 tests/{ =3D> qtest}/virtio-rng-test.c                |   0
 tests/{ =3D> qtest}/virtio-scsi-test.c               |   0
 tests/{ =3D> qtest}/virtio-serial-test.c             |   0
 tests/{ =3D> qtest}/virtio-test.c                    |   0
 tests/{ =3D> qtest}/vmgenid-test.c                   |   0
 tests/{ =3D> qtest}/vmxnet3-test.c                   |   0
 tests/{ =3D> qtest}/wdt_ib700-test.c                 |   0
 183 files changed, 413 insertions(+), 388 deletions(-)
 create mode 100644 docs/index.html.in
 create mode 100644 tests/qtest/Makefile.include
 rename tests/{ =3D> qtest}/ac97-test.c (100%)
 rename tests/{ =3D> qtest}/acpi-utils.c (100%)
 rename tests/{ =3D> qtest}/acpi-utils.h (100%)
 rename tests/{ =3D> qtest}/ahci-test.c (100%)
 rename tests/{ =3D> qtest}/arm-cpu-features.c (100%)
 rename tests/{ =3D> qtest}/bios-tables-test-allowed-diff.h (100%)
 rename tests/{ =3D> qtest}/bios-tables-test.c (100%)
 rename tests/{ =3D> qtest}/boot-order-test.c (100%)
 rename tests/{ =3D> qtest}/boot-sector.c (100%)
 rename tests/{ =3D> qtest}/boot-sector.h (100%)
 rename tests/{ =3D> qtest}/boot-serial-test.c (100%)
 rename tests/{ =3D> qtest}/cdrom-test.c (100%)
 rename tests/{ =3D> qtest}/cpu-plug-test.c (100%)
 rename tests/{ =3D> qtest}/dbus-vmstate-test.c (100%)
 rename tests/{ =3D> qtest}/dbus-vmstate1.xml (100%)
 rename tests/{ =3D> qtest}/device-introspect-test.c (100%)
 rename tests/{ =3D> qtest}/device-plug-test.c (100%)
 rename tests/{ =3D> qtest}/display-vga-test.c (100%)
 rename tests/{ =3D> qtest}/drive_del-test.c (100%)
 rename tests/{ =3D> qtest}/ds1338-test.c (100%)
 rename tests/{ =3D> qtest}/e1000-test.c (100%)
 rename tests/{ =3D> qtest}/e1000e-test.c (100%)
 rename tests/{ =3D> qtest}/eepro100-test.c (100%)
 rename tests/{ =3D> qtest}/endianness-test.c (100%)
 rename tests/{ =3D> qtest}/es1370-test.c (100%)
 rename tests/{ =3D> qtest}/fdc-test.c (100%)
 rename tests/{ =3D> qtest}/fw_cfg-test.c (100%)
 rename tests/{ =3D> qtest}/hd-geo-test.c (100%)
 rename tests/{ =3D> qtest}/hexloader-test.c (100%)
 rename tests/{ =3D> qtest}/i440fx-test.c (100%)
 rename tests/{ =3D> qtest}/i82801b11-test.c (100%)
 rename tests/{ =3D> qtest}/ide-test.c (100%)
 rename tests/{ =3D> qtest}/intel-hda-test.c (100%)
 rename tests/{ =3D> qtest}/ioh3420-test.c (100%)
 rename tests/{ =3D> qtest}/ipmi-bt-test.c (100%)
 rename tests/{ =3D> qtest}/ipmi-kcs-test.c (100%)
 rename tests/{ =3D> qtest}/ipoctal232-test.c (100%)
 rename tests/{ =3D> qtest}/ivshmem-test.c (100%)
 rename tests/{ =3D> qtest}/libqos/aarch64-xlnx-zcu102-machine.c (100%)
 rename tests/{ =3D> qtest}/libqos/ahci.c (100%)
 rename tests/{ =3D> qtest}/libqos/ahci.h (100%)
 rename tests/{ =3D> qtest}/libqos/arm-imx25-pdk-machine.c (100%)
 rename tests/{ =3D> qtest}/libqos/arm-n800-machine.c (100%)
 rename tests/{ =3D> qtest}/libqos/arm-raspi2-machine.c (100%)
 rename tests/{ =3D> qtest}/libqos/arm-sabrelite-machine.c (100%)
 rename tests/{ =3D> qtest}/libqos/arm-smdkc210-machine.c (100%)
 rename tests/{ =3D> qtest}/libqos/arm-virt-machine.c (100%)
 rename tests/{ =3D> qtest}/libqos/arm-xilinx-zynq-a9-machine.c (100%)
 rename tests/{ =3D> qtest}/libqos/e1000e.c (100%)
 rename tests/{ =3D> qtest}/libqos/e1000e.h (100%)
 rename tests/{ =3D> qtest}/libqos/fw_cfg.c (100%)
 rename tests/{ =3D> qtest}/libqos/fw_cfg.h (100%)
 rename tests/{ =3D> qtest}/libqos/i2c-imx.c (100%)
 rename tests/{ =3D> qtest}/libqos/i2c-omap.c (100%)
 rename tests/{ =3D> qtest}/libqos/i2c.c (100%)
 rename tests/{ =3D> qtest}/libqos/i2c.h (100%)
 rename tests/{ =3D> qtest}/libqos/libqos-pc.c (100%)
 rename tests/{ =3D> qtest}/libqos/libqos-pc.h (100%)
 rename tests/{ =3D> qtest}/libqos/libqos-spapr.c (100%)
 rename tests/{ =3D> qtest}/libqos/libqos-spapr.h (100%)
 rename tests/{ =3D> qtest}/libqos/libqos.c (100%)
 rename tests/{ =3D> qtest}/libqos/libqos.h (100%)
 rename tests/{ =3D> qtest}/libqos/malloc-pc.c (100%)
 rename tests/{ =3D> qtest}/libqos/malloc-pc.h (100%)
 rename tests/{ =3D> qtest}/libqos/malloc-spapr.c (100%)
 rename tests/{ =3D> qtest}/libqos/malloc-spapr.h (100%)
 rename tests/{ =3D> qtest}/libqos/malloc.c (100%)
 rename tests/{ =3D> qtest}/libqos/malloc.h (100%)
 rename tests/{ =3D> qtest}/libqos/pci-pc.c (100%)
 rename tests/{ =3D> qtest}/libqos/pci-pc.h (100%)
 rename tests/{ =3D> qtest}/libqos/pci-spapr.c (100%)
 rename tests/{ =3D> qtest}/libqos/pci-spapr.h (100%)
 rename tests/{ =3D> qtest}/libqos/pci.c (100%)
 rename tests/{ =3D> qtest}/libqos/pci.h (100%)
 rename tests/{ =3D> qtest}/libqos/ppc64_pseries-machine.c (100%)
 rename tests/{ =3D> qtest}/libqos/qgraph.c (100%)
 rename tests/{ =3D> qtest}/libqos/qgraph.h (100%)
 rename tests/{ =3D> qtest}/libqos/qgraph_internal.h (100%)
 rename tests/{ =3D> qtest}/libqos/rtas.c (100%)
 rename tests/{ =3D> qtest}/libqos/rtas.h (100%)
 rename tests/{ =3D> qtest}/libqos/sdhci.c (100%)
 rename tests/{ =3D> qtest}/libqos/sdhci.h (100%)
 rename tests/{ =3D> qtest}/libqos/tpci200.c (100%)
 rename tests/{ =3D> qtest}/libqos/usb.c (100%)
 rename tests/{ =3D> qtest}/libqos/usb.h (100%)
 rename tests/{ =3D> qtest}/libqos/virtio-9p.c (100%)
 rename tests/{ =3D> qtest}/libqos/virtio-9p.h (100%)
 rename tests/{ =3D> qtest}/libqos/virtio-balloon.c (100%)
 rename tests/{ =3D> qtest}/libqos/virtio-balloon.h (100%)
 rename tests/{ =3D> qtest}/libqos/virtio-blk.c (100%)
 rename tests/{ =3D> qtest}/libqos/virtio-blk.h (100%)
 rename tests/{ =3D> qtest}/libqos/virtio-mmio.c (100%)
 rename tests/{ =3D> qtest}/libqos/virtio-mmio.h (100%)
 rename tests/{ =3D> qtest}/libqos/virtio-net.c (100%)
 rename tests/{ =3D> qtest}/libqos/virtio-net.h (100%)
 rename tests/{ =3D> qtest}/libqos/virtio-pci-modern.c (100%)
 rename tests/{ =3D> qtest}/libqos/virtio-pci-modern.h (100%)
 rename tests/{ =3D> qtest}/libqos/virtio-pci.c (100%)
 rename tests/{ =3D> qtest}/libqos/virtio-pci.h (100%)
 rename tests/{ =3D> qtest}/libqos/virtio-rng.c (100%)
 rename tests/{ =3D> qtest}/libqos/virtio-rng.h (100%)
 rename tests/{ =3D> qtest}/libqos/virtio-scsi.c (100%)
 rename tests/{ =3D> qtest}/libqos/virtio-scsi.h (100%)
 rename tests/{ =3D> qtest}/libqos/virtio-serial.c (100%)
 rename tests/{ =3D> qtest}/libqos/virtio-serial.h (100%)
 rename tests/{ =3D> qtest}/libqos/virtio.c (100%)
 rename tests/{ =3D> qtest}/libqos/virtio.h (100%)
 rename tests/{ =3D> qtest}/libqos/x86_64_pc-machine.c (100%)
 rename tests/{ =3D> qtest}/libqtest-single.h (100%)
 rename tests/{ =3D> qtest}/libqtest.c (100%)
 rename tests/{ =3D> qtest}/libqtest.h (100%)
 rename tests/{ =3D> qtest}/m25p80-test.c (100%)
 rename tests/{ =3D> qtest}/m48t59-test.c (100%)
 rename tests/{ =3D> qtest}/machine-none-test.c (100%)
 rename tests/{ =3D> qtest}/megasas-test.c (100%)
 rename tests/{ =3D> qtest}/microbit-test.c (100%)
 rename tests/{ =3D> qtest}/migration-helpers.c (100%)
 rename tests/{ =3D> qtest}/migration-helpers.h (100%)
 rename tests/{ =3D> qtest}/migration-test.c (100%)
 rename tests/{ =3D> qtest}/modules-test.c (100%)
 rename tests/{ =3D> qtest}/ne2000-test.c (100%)
 rename tests/{ =3D> qtest}/numa-test.c (100%)
 rename tests/{ =3D> qtest}/nvme-test.c (100%)
 rename tests/{ =3D> qtest}/pca9552-test.c (100%)
 rename tests/{ =3D> qtest}/pci-test.c (100%)
 rename tests/{ =3D> qtest}/pcnet-test.c (100%)
 rename tests/{ =3D> qtest}/pflash-cfi02-test.c (100%)
 rename tests/{ =3D> qtest}/pnv-xscom-test.c (100%)
 rename tests/{ =3D> qtest}/prom-env-test.c (100%)
 rename tests/{ =3D> qtest}/pvpanic-test.c (100%)
 rename tests/{ =3D> qtest}/pxe-test.c (100%)
 rename tests/{ =3D> qtest}/q35-test.c (100%)
 rename tests/{ =3D> qtest}/qmp-cmd-test.c (100%)
 rename tests/{ =3D> qtest}/qmp-test.c (100%)
 rename tests/{ =3D> qtest}/qom-test.c (100%)
 rename tests/{ =3D> qtest}/qos-test.c (100%)
 rename tests/{ =3D> qtest}/rtas-test.c (100%)
 rename tests/{ =3D> qtest}/rtc-test.c (100%)
 rename tests/{ =3D> qtest}/rtl8139-test.c (100%)
 rename tests/{ =3D> qtest}/sdhci-test.c (100%)
 rename tests/{ =3D> qtest}/spapr-phb-test.c (100%)
 rename tests/{ =3D> qtest}/tco-test.c (100%)
 rename tests/{ =3D> qtest}/test-arm-mptimer.c (100%)
 rename tests/{ =3D> qtest}/test-filter-mirror.c (100%)
 rename tests/{ =3D> qtest}/test-filter-redirector.c (100%)
 rename tests/{ =3D> qtest}/test-hmp.c (100%)
 rename tests/{ =3D> qtest}/test-netfilter.c (100%)
 rename tests/{ =3D> qtest}/test-x86-cpuid-compat.c (100%)
 rename tests/{ =3D> qtest}/tmp105-test.c (100%)
 rename tests/{ =3D> qtest}/tpm-crb-swtpm-test.c (100%)
 rename tests/{ =3D> qtest}/tpm-crb-test.c (100%)
 rename tests/{ =3D> qtest}/tpm-emu.c (100%)
 rename tests/{ =3D> qtest}/tpm-emu.h (100%)
 rename tests/{ =3D> qtest}/tpm-tests.c (100%)
 rename tests/{ =3D> qtest}/tpm-tests.h (100%)
 rename tests/{ =3D> qtest}/tpm-tis-swtpm-test.c (100%)
 rename tests/{ =3D> qtest}/tpm-tis-test.c (100%)
 rename tests/{ =3D> qtest}/tpm-util.c (100%)
 rename tests/{ =3D> qtest}/tpm-util.h (100%)
 rename tests/{ =3D> qtest}/usb-hcd-ehci-test.c (100%)
 rename tests/{ =3D> qtest}/usb-hcd-ohci-test.c (100%)
 rename tests/{ =3D> qtest}/usb-hcd-uhci-test.c (100%)
 rename tests/{ =3D> qtest}/usb-hcd-xhci-test.c (100%)
 rename tests/{ =3D> qtest}/vhost-user-test.c (100%)
 rename tests/{ =3D> qtest}/virtio-9p-test.c (100%)
 rename tests/{ =3D> qtest}/virtio-blk-test.c (100%)
 rename tests/{ =3D> qtest}/virtio-ccw-test.c (100%)
 rename tests/{ =3D> qtest}/virtio-net-test.c (100%)
 rename tests/{ =3D> qtest}/virtio-rng-test.c (100%)
 rename tests/{ =3D> qtest}/virtio-scsi-test.c (100%)
 rename tests/{ =3D> qtest}/virtio-serial-test.c (100%)
 rename tests/{ =3D> qtest}/virtio-test.c (100%)
 rename tests/{ =3D> qtest}/vmgenid-test.c (100%)
 rename tests/{ =3D> qtest}/vmxnet3-test.c (100%)
 rename tests/{ =3D> qtest}/wdt_ib700-test.c (100%)


