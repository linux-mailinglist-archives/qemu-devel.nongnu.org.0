Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B99F13080D
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Jan 2020 13:59:53 +0100 (CET)
Received: from localhost ([::1]:41780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1io5VX-0002CS-Qf
	for lists+qemu-devel@lfdr.de; Sun, 05 Jan 2020 07:59:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58008)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1io5TC-0000OJ-6k
 for qemu-devel@nongnu.org; Sun, 05 Jan 2020 07:57:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1io5TA-0003P0-Qa
 for qemu-devel@nongnu.org; Sun, 05 Jan 2020 07:57:26 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:53292
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1io5TA-0003Od-Mj
 for qemu-devel@nongnu.org; Sun, 05 Jan 2020 07:57:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578229043;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=NLtq8tcuCidh2HdeSN+7us4S9NcFxQ8tdfJz49Q1Iso=;
 b=ag4nMRaYv3anJmmdPC235BQ6rrirZQHjb++nU3RqLF6mvd3dOPr/2TjxGxLu1onInzFjBn
 rWd9vVMMVaF3Vhb6Z5RUrdzDEFewk8acFQPHgTBx/h/j2ZDj54Vo3jQwIPv6Px6JFauPtl
 w1Y6bUGIgrcfQJ20dy/v5hxwxJRx0HQ=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-pqK9eD-BPw-29O0gsUtq9w-1; Sun, 05 Jan 2020 07:57:22 -0500
Received: by mail-qk1-f198.google.com with SMTP id j16so23404097qkk.17
 for <qemu-devel@nongnu.org>; Sun, 05 Jan 2020 04:57:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:content-transfer-encoding;
 bh=cwoXyiCx9z7FkzYYUWrN+6Ehus6LwnZhptUX1uKPl8k=;
 b=P0Rnx0aoxR8l139krMDMnm4rFFsjFSCbnGIJtWLePH5c6bxgwnfDEu/AnHaZCEWRiL
 aFutbHjf6mfh5qP6hrgw9gy2/8okYFHNHb2ejOCKd0ZvoQwldFhMqVReeRmNOo2yWHlG
 12wY6cH8kebJS0uw7g+XlJ+nSgdcjnJHec1mI+1/6loSnWAmZ3ZWPsgZ4Yu5FbZz+08B
 d3HyCS+rGQE8lsONzTI3PUu6oH/qws9KBPkGqS4b+0zWX34mSH3iZKyqAm1EvTmpjjuK
 W9w+XFPDthPWZyeSxUu4racLQap7xQdmGKBOiRD4MAF3jXBZwVQkp6JSjLfuS2ZOr+w3
 b3WA==
X-Gm-Message-State: APjAAAVqisszZZjUMF+m1wCxMwb3wWwR5XyS3h0kYaEZPTMrF2so+r2s
 PAljFf4nD0Ici6SVskkEyyxCR13lCHt4T0hBv2GWR4bYgDmeaT1BuoQQIhM0L7dsdg9v89FtTND
 cPN6FQAFBpapn6zU=
X-Received: by 2002:a0c:ffc8:: with SMTP id h8mr76742521qvv.146.1578229041573; 
 Sun, 05 Jan 2020 04:57:21 -0800 (PST)
X-Google-Smtp-Source: APXvYqwqxagYk7zefqvI+2iQsnhB+yYGDItS6udPcIjSXrSfuxVRXLIMaNLKgR2qf/0jZt+jEtnPgw==
X-Received: by 2002:a0c:ffc8:: with SMTP id h8mr76742509qvv.146.1578229041250; 
 Sun, 05 Jan 2020 04:57:21 -0800 (PST)
Received: from redhat.com (bzq-79-183-34-164.red.bezeqint.net. [79.183.34.164])
 by smtp.gmail.com with ESMTPSA id d9sm21391737qth.34.2020.01.05.04.57.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jan 2020 04:57:20 -0800 (PST)
Date: Sun, 5 Jan 2020 07:57:17 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v3 00/32] virtio, pci, pc: fixes, features
Message-ID: <20200105125622.27231-1-mst@redhat.com>
MIME-Version: 1.0
X-Mailer: git-send-email 2.24.1.751.gd10ce2899c
X-Mutt-Fcc: =sent
X-MC-Unique: pqK9eD-BPw-29O0gsUtq9w-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Changes from v2:
- rebased on master
- a couple more bugfixes

The following changes since commit f0dcfddecee8b860e015bb07d67cfcbdfbfd51d9=
:

  Merge remote-tracking branch 'remotes/stefanha/tags/block-pull-request' i=
nto staging (2020-01-03 17:18:08 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream

for you to fetch changes up to 93ef96f3258f489f7bff28ca7b9e0dc74de2a75b:

  intel_iommu: add present bit check for pasid table entries (2020-01-05 07=
:41:10 -0500)

----------------------------------------------------------------
virtio, pci, pc: fixes, features

Bugfixes all over the place.
HMAT support.
New flags for vhost-user-blk utility.
Auto-tuning of seg max for virtio storage.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

----------------------------------------------------------------
Denis Plotnikov (4):
      hw: fix using 4.2 compat in 5.0 machine types for i440fx/q35
      virtio: make seg_max virtqueue size dependent
      tests: add virtio-scsi and virtio-blk seg_max_adjust test
      virtio-mmio: update queue size on guest write

Jean-Philippe Brucker (1):
      virtio-mmio: Clear v2 transport state on soft reset

Liu Jingqi (5):
      numa: Extend CLI to provide memory latency and bandwidth information
      numa: Extend CLI to provide memory side cache information
      hmat acpi: Build Memory Proximity Domain Attributes Structure(s)
      hmat acpi: Build System Locality Latency and Bandwidth Information St=
ructure(s)
      hmat acpi: Build Memory Side Cache Information Structure(s)

Liu Yi L (2):
      intel_iommu: a fix to vtd_find_as_from_bus_num()
      intel_iommu: add present bit check for pasid table entries

Michael Roth (1):
      virtio-pci: disable vring processing when bus-mastering is disabled

Michael S. Tsirkin (5):
      virtio: add ability to delete vq through a pointer
      virtio: make virtio_delete_queue idempotent
      virtio-input: convert to new virtio_delete_queue
      virtio: update queue size on guest write
      ACPI: add expected files for HMAT tests (acpihmat)

Micky Yun Chan (1):
      Implement backend program convention command for vhost-user-blk

Pan Nengyuan (2):
      virtio-balloon: fix memory leak while attach virtio-balloon device
      virtio-serial-bus: fix memory leak while attach virtio-serial-bus

Philippe Mathieu-Daud=C3=A9 (2):
      hw/pci/pci_host: Remove redundant PCI_DPRINTF()
      hw/pci/pci_host: Let pci_data_[read/write] use unsigned 'size' argume=
nt

Raphael Norwitz (2):
      vhost-user: add VHOST_USER_RESET_DEVICE to reset devices
      vhost-user-scsi: reset the device if supported

Stefan Hajnoczi (1):
      virtio: don't enable notifications during polling

Tao Xu (3):
      numa: Extend CLI to provide initiator information for numa nodes
      tests/numa: Add case for QMP build HMAT
      tests/bios-tables-test: add test cases for ACPI HMAT

Yi Sun (1):
      intel_iommu: fix bug to read DMAR_RTADDR_REG

Yuri Benditovich (2):
      virtio: reset region cache when on queue deletion
      virtio-net: delete also control queue when TX/RX deleted

 docs/interop/vhost-user.json              |  31 ++++
 qapi/machine.json                         | 180 +++++++++++++++++-
 hw/acpi/hmat.h                            |  42 +++++
 hw/i386/intel_iommu_internal.h            |   1 +
 include/hw/pci/pci_host.h                 |   4 +-
 include/hw/virtio/virtio-blk.h            |   1 +
 include/hw/virtio/virtio-scsi.h           |   1 +
 include/hw/virtio/virtio.h                |  18 ++
 include/sysemu/numa.h                     |  63 +++++++
 contrib/vhost-user-blk/vhost-user-blk.c   | 108 ++++++-----
 hw/acpi/hmat.c                            | 268 ++++++++++++++++++++++++++=
+
 hw/block/virtio-blk.c                     |  18 +-
 hw/char/virtio-serial-bus.c               |   8 +
 hw/core/machine.c                         |  68 +++++++
 hw/core/numa.c                            | 297 ++++++++++++++++++++++++++=
++++
 hw/i386/acpi-build.c                      |   5 +
 hw/i386/intel_iommu.c                     | 100 +++++++---
 hw/i386/pc_piix.c                         |   1 -
 hw/i386/pc_q35.c                          |   1 -
 hw/input/virtio-input.c                   |   5 +-
 hw/net/virtio-net.c                       |   3 +-
 hw/pci/pci_host.c                         |  25 +--
 hw/scsi/vhost-scsi.c                      |   2 +
 hw/scsi/vhost-user-scsi.c                 |  24 +++
 hw/scsi/virtio-scsi.c                     |  19 +-
 hw/virtio/vhost-user.c                    |   8 +-
 hw/virtio/virtio-balloon.c                |   7 +
 hw/virtio/virtio-mmio.c                   |  17 +-
 hw/virtio/virtio-pci.c                    |  14 +-
 hw/virtio/virtio.c                        |  64 +++++--
 tests/bios-tables-test.c                  |  44 +++++
 tests/numa-test.c                         | 213 +++++++++++++++++++++
 docs/interop/vhost-user.rst               |  32 ++++
 hw/acpi/Kconfig                           |   7 +-
 hw/acpi/Makefile.objs                     |   1 +
 qemu-options.hx                           |  95 +++++++++-
 tests/acceptance/virtio_seg_max_adjust.py | 134 ++++++++++++++
 tests/data/acpi/pc/APIC.acpihmat          | Bin 0 -> 128 bytes
 tests/data/acpi/pc/DSDT.acpihmat          | Bin 0 -> 6455 bytes
 tests/data/acpi/pc/HMAT.acpihmat          | Bin 0 -> 280 bytes
 tests/data/acpi/pc/SRAT.acpihmat          | Bin 0 -> 280 bytes
 tests/data/acpi/q35/APIC.acpihmat         | Bin 0 -> 128 bytes
 tests/data/acpi/q35/DSDT.acpihmat         | Bin 0 -> 9203 bytes
 tests/data/acpi/q35/HMAT.acpihmat         | Bin 0 -> 280 bytes
 tests/data/acpi/q35/SRAT.acpihmat         | Bin 0 -> 280 bytes
 45 files changed, 1796 insertions(+), 133 deletions(-)
 create mode 100644 hw/acpi/hmat.h
 create mode 100644 hw/acpi/hmat.c
 create mode 100755 tests/acceptance/virtio_seg_max_adjust.py
 create mode 100644 tests/data/acpi/pc/APIC.acpihmat
 create mode 100644 tests/data/acpi/pc/DSDT.acpihmat
 create mode 100644 tests/data/acpi/pc/HMAT.acpihmat
 create mode 100644 tests/data/acpi/pc/SRAT.acpihmat
 create mode 100644 tests/data/acpi/q35/APIC.acpihmat
 create mode 100644 tests/data/acpi/q35/DSDT.acpihmat
 create mode 100644 tests/data/acpi/q35/HMAT.acpihmat
 create mode 100644 tests/data/acpi/q35/SRAT.acpihmat


