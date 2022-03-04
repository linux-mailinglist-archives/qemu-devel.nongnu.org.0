Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C674CD5D0
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 15:02:55 +0100 (CET)
Received: from localhost ([::1]:47078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ8WD-0002UO-LF
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 09:02:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ87M-0006OM-8g
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:37:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ87J-0000GI-0Z
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:37:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646401028;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=BIWAMB1exp+9GN9ZWf5HtAKrgA6ogOAzGxCdCapR1is=;
 b=Ev7VEZtDetHlWdOlOu8Vu7NXp+Rg+A1duff063hPEHQqvf7Mj1NURxerp8tlXoERqc73ab
 oyur/jyGLcKKq4waHheAM3kHqDYgZYqxraCZvdhXXu6fLuTWqYcJhE1lRX8CGXn/PnaNk/
 Qc/AnFW4y2yl0wOiOf1RUXz9NY4ByZw=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-530-mSOt8JZjOsOMrdZscc-XEg-1; Fri, 04 Mar 2022 08:37:05 -0500
X-MC-Unique: mSOt8JZjOsOMrdZscc-XEg-1
Received: by mail-ej1-f69.google.com with SMTP id
 sa22-20020a1709076d1600b006ce78cacb85so4421401ejc.2
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 05:37:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:content-transfer-encoding;
 bh=BIWAMB1exp+9GN9ZWf5HtAKrgA6ogOAzGxCdCapR1is=;
 b=3QsUx1FL4Yux5eGC+siyOHLzc3whS0BQTiJzbpMcKNByLkMpUoWdDbieIjxu8gjRGM
 2lAjA/catbhyCS7U1FZsgAkgy3X14BoCfF1VwfJPWnd7Ca+gH+A9ySFzcSfGUS8CAJgE
 JXn8d8Qzl7o2Ni7/GO3hZ84Tp+USetwF6+S/m4INA4495a2iPllFll8s7cZhwfPlqOZ4
 WuryhzXmP9BZ1qNoBXKMj3DUBWLLTi24Uq4gaGGg3A3s/j3lpu6Wfp3I5jzxsRsQGGCW
 eGLswr1cyWwmkXvb7GVW9MU1q7PEBV2F71gGuGwWjCs2O4zFC19wtYjsmf219CubyJFh
 Xr5Q==
X-Gm-Message-State: AOAM531OuiypZUH0ti6rnTJhBSRBqX5AvCCD0nAqjsC9hVIOF7w5rDpW
 c15Hsgl4c96M0T/kyzqeqBNuU5ta7+eY4w+DqN/xAtciQ4zKlZ1Q4/sgnH9IVx1zrm/vR1/H8CZ
 RTnEiq7x25a0x0iK4o9C99ZcYjBPfy14qJrAON/50VDREP2QUBw68/7Jd2t9x
X-Received: by 2002:a05:6402:26d0:b0:413:bfbc:8343 with SMTP id
 x16-20020a05640226d000b00413bfbc8343mr23226232edd.211.1646401023716; 
 Fri, 04 Mar 2022 05:37:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy6wLbn2fGzFEjg8PQRoxnIp/aweqgwfWuUfemHaUpiWxVTll7MKc5Sa95WGHXIzv2WsPfP2g==
X-Received: by 2002:a05:6402:26d0:b0:413:bfbc:8343 with SMTP id
 x16-20020a05640226d000b00413bfbc8343mr23226205edd.211.1646401023355; 
 Fri, 04 Mar 2022 05:37:03 -0800 (PST)
Received: from redhat.com ([2.52.16.157]) by smtp.gmail.com with ESMTPSA id
 g2-20020aa7c842000000b0041314b98872sm2088534edt.22.2022.03.04.05.36.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 05:36:27 -0800 (PST)
Date: Fri, 4 Mar 2022 08:36:11 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/45] virtio,pc,pci: features, cleanups, fixes
Message-ID: <20220304133556.233983-1-mst@redhat.com>
MIME-Version: 1.0
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

The following changes since commit 6629bf78aac7e53f83fd0bcbdbe322e2302dfd1f:

  Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20220302' into staging (2022-03-03 14:46:48 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream

for you to fetch changes up to 74bc2c502da74191a34fb61b4c890061368269c8:

  docs: vhost-user: add subsection for non-Linux platforms (2022-03-04 08:30:53 -0500)

----------------------------------------------------------------
virtio,pc,pci: features, cleanups, fixes

vhost-user enabled on non-linux systems
beginning of nvme sriov support
bigger tx queue for vdpa
virtio iommu bypass
pci tests for arm

Fixes, cleanups all over the place

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

----------------------------------------------------------------
Ani Sinha (6):
      MAINTAINERS: no need to add my name explicitly as a reviewer for VIOT tables
      docs/acpi/erst: add device id for ACPI ERST device in pci-ids.txt
      hw/acpi/erst: clean up unused IS_UEFI_CPER_RECORD macro
      hw/smbios: code cleanup - use macro definitions for table header handles
      hw/smbios: fix overlapping table handle numbers with large memory vms
      hw/smbios: add assertion to ensure handles of tables 19 and 32 do not collide

Dov Murik (2):
      hw/i386: Improve bounds checking in OVMF table parsing
      hw/i386: Replace magic number with field length calculation

Eric Auger (4):
      tests/qtest/libqos/pci: Introduce pio_limit
      tests/qtest/libqos: Skip hotplug tests if pci root bus is not hotpluggable
      tests/qtest/vhost-user-blk-test: Temporary hack to get tests passing on aarch64
      tests/qtest/libqos: Add generic pci host bridge in arm-virt machine

Eric DeVolder (1):
      ACPI ERST: specification for ERST support

Eugenio Pérez (1):
      virtio-net: Unlimit tx queue size if peer is vdpa

Halil Pasic (1):
      virtio: fix the condition for iommu_platform not supported

Igor Mammedov (3):
      pci: expose TYPE_XIO3130_DOWNSTREAM name
      acpi: pcihp: pcie: set power on cap on parent slot
      x86: cleanup unused compat_apic_id_mode

Jason Wang (1):
      intel_iommu: support snoop control

Jean-Philippe Brucker (3):
      virtio-iommu: Default to bypass during boot
      virtio-iommu: Support bypass domain
      tests/qtest/virtio-iommu-test: Check bypass config

Joelle van Dyne (1):
      pc: add option to disable PS/2 mouse/keyboard

Jonathan Cameron (3):
      hw/pci-bridge/pxb: Fix missing swizzle
      pci-bridge/xio3130_upstream: Fix error handling
      pci-bridge/xio3130_downstream: Fix error handling

Knut Omang (2):
      pcie: Add support for Single Root I/O Virtualization (SR/IOV)
      pcie: Add some SR/IOV API documentation in docs/pcie_sriov.txt

Laurent Vivier (2):
      hw/virtio: vdpa: Fix leak of host-notifier memory-region
      vhost-vdpa: make notifiers _init()/_uninit() symmetric

Michael S. Tsirkin (1):
      qom: assert integer does not overflow

Sergio Lopez (4):
      event_notifier: add event_notifier_get_wfd()
      vhost: use wfd on functions setting vring call fd
      configure, meson: allow enabling vhost-user on all POSIX systems
      docs: vhost-user: add subsection for non-Linux platforms

Stefano Garzarella (1):
      vhost-vsock: detach the virqueue element in case of error

Thomas Huth (1):
      hw/i386/pc_piix: Mark the machine types from version 1.4 to 1.7 as deprecated

Viresh Kumar (1):
      hw/vhost-user-i2c: Add support for VIRTIO_I2C_F_ZERO_LENGTH_REQUEST

Xueming Li (2):
      vhost-user: remove VirtQ notifier restore
      vhost-user: fix VirtQ notifier cleanup

Zhenwei Pi (2):
      headers: Add pvpanic.h
      hw/misc/pvpanic: Use standard headers instead

Zhenzhong Duan (1):
      pci: show id info when pci BDF conflict

Łukasz Gieryk (2):
      pcie: Add a helper to the SR/IOV API
      pcie: Add 1.2 version token for the Power Management Capability

 docs/pcie_sriov.txt                        | 115 +++++++++++
 docs/specs/pci-ids.txt                     |   1 +
 configure                                  |   4 +-
 hw/i386/intel_iommu_internal.h             |   1 +
 include/hw/i386/intel_iommu.h              |   1 +
 include/hw/i386/pc.h                       |   2 +
 include/hw/i386/x86.h                      |   2 -
 include/hw/misc/pvpanic.h                  |   8 -
 include/hw/pci-bridge/xio3130_downstream.h |  15 ++
 include/hw/pci/pci.h                       |  12 +-
 include/hw/pci/pci_regs.h                  |   1 +
 include/hw/pci/pcie.h                      |   7 +
 include/hw/pci/pcie_sriov.h                |  77 ++++++++
 include/hw/virtio/vhost-user-i2c.h         |   3 +
 include/hw/virtio/vhost-user.h             |   3 +-
 include/hw/virtio/virtio-iommu.h           |   1 +
 include/qemu/event_notifier.h              |   1 +
 include/qemu/typedefs.h                    |   2 +
 include/standard-headers/linux/pvpanic.h   |   9 +
 tests/qtest/libqos/generic-pcihost.h       |  54 ++++++
 tests/qtest/libqos/pci.h                   |   6 +-
 hw/acpi/erst.c                             |   5 -
 hw/acpi/pcihp.c                            |  12 +-
 hw/i386/intel_iommu.c                      |  14 +-
 hw/i386/pc.c                               |  28 ++-
 hw/i386/pc_piix.c                          |   1 +
 hw/i386/pc_sysfw_ovmf.c                    |  18 +-
 hw/i386/x86.c                              |  16 +-
 hw/misc/pvpanic-isa.c                      |   4 +-
 hw/misc/pvpanic-pci.c                      |   4 +-
 hw/misc/pvpanic.c                          |   5 +-
 hw/net/virtio-net.c                        |  13 +-
 hw/pci-bridge/pci_expander_bridge.c        |   6 +
 hw/pci-bridge/xio3130_downstream.c         |   5 +-
 hw/pci-bridge/xio3130_upstream.c           |   2 +-
 hw/pci/pci.c                               | 104 +++++++---
 hw/pci/pcie.c                              |  16 ++
 hw/pci/pcie_sriov.c                        | 302 +++++++++++++++++++++++++++++
 hw/smbios/smbios.c                         |  61 ++++--
 hw/virtio/vhost-user-i2c.c                 |  11 +-
 hw/virtio/vhost-user.c                     |  61 +++---
 hw/virtio/vhost-vdpa.c                     |  21 +-
 hw/virtio/vhost-vsock-common.c             |  10 +-
 hw/virtio/vhost.c                          |   6 +-
 hw/virtio/virtio-bus.c                     |  12 +-
 hw/virtio/virtio-iommu.c                   |  99 ++++++++--
 qom/object.c                               |   6 +-
 tests/qtest/e1000e-test.c                  |   6 +
 tests/qtest/libqos/arm-virt-machine.c      |  19 +-
 tests/qtest/libqos/generic-pcihost.c       | 231 ++++++++++++++++++++++
 tests/qtest/libqos/pci-pc.c                |   1 +
 tests/qtest/libqos/pci-spapr.c             |   1 +
 tests/qtest/libqos/pci.c                   |  78 +++++---
 tests/qtest/vhost-user-blk-test.c          |  16 ++
 tests/qtest/virtio-blk-test.c              |   5 +
 tests/qtest/virtio-iommu-test.c            |   2 +
 tests/qtest/virtio-net-test.c              |   5 +
 tests/qtest/virtio-rng-test.c              |   5 +
 util/event_notifier-posix.c                |   5 +
 MAINTAINERS                                |   1 -
 docs/about/deprecated.rst                  |   8 +
 docs/interop/vhost-user.rst                |  20 ++
 docs/specs/acpi_erst.rst                   | 200 +++++++++++++++++++
 docs/specs/index.rst                       |   1 +
 hw/pci/meson.build                         |   1 +
 hw/pci/trace-events                        |   5 +
 hw/virtio/trace-events                     |   4 +-
 meson.build                                |   2 +-
 scripts/update-linux-headers.sh            |   3 +-
 tests/qtest/libqos/meson.build             |   1 +
 70 files changed, 1581 insertions(+), 206 deletions(-)
 create mode 100644 docs/pcie_sriov.txt
 create mode 100644 include/hw/pci-bridge/xio3130_downstream.h
 create mode 100644 include/hw/pci/pcie_sriov.h
 create mode 100644 include/standard-headers/linux/pvpanic.h
 create mode 100644 tests/qtest/libqos/generic-pcihost.h
 create mode 100644 hw/pci/pcie_sriov.c
 create mode 100644 tests/qtest/libqos/generic-pcihost.c
 create mode 100644 docs/specs/acpi_erst.rst


