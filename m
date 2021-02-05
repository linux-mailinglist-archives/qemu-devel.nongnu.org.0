Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13EEB310CE4
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 16:06:41 +0100 (CET)
Received: from localhost ([::1]:40642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l82gy-0005N5-14
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 10:06:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l82e1-0003Za-Mz
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 10:03:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l82dz-0002ol-CE
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 10:03:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612537414;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rqGDpBpl3hqfHpecbHFzEjzaGjnP6XmeDGdr4yepCIE=;
 b=hMOL6BKAFR9TaN/gL1rv2AA+In7TnuufCU60MUzZpcm2/ls9zjY0FR5yIvV/vcTCxqGyoa
 pxNVItA2HaTO72V7x/Y9RrsfDyiPFRGhxqLXXFDELI6ESFMd5DTTO/HxNgys4QTGpUDvWp
 8uDWbMHg0dpCWRX5CzqufNajT3ZUa6g=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-348-PNkFicJiNn6n1ZSfOTaQBw-1; Fri, 05 Feb 2021 10:03:33 -0500
X-MC-Unique: PNkFicJiNn6n1ZSfOTaQBw-1
Received: by mail-ej1-f72.google.com with SMTP id dc21so6942215ejb.19
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 07:03:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:content-transfer-encoding;
 bh=rqGDpBpl3hqfHpecbHFzEjzaGjnP6XmeDGdr4yepCIE=;
 b=DO+jy0zW6HktGoV5B03q3td91tcvN871gZpPi0PypBW/iKrP/tvMDoDvetkZ2nlYh0
 s2wy5SdWwrN9nR+hF2ygY5iJm8AFu1kKBuDV7qwMmi/oBfz66TIDAKb7V1VI6wdXJdXc
 YHJZqdFTS8DRpFCW4g9ht3zW+wwd8lCUjKFpyr333FngTO0ZQotOpauKiVx7KsWqJkaV
 wjVRyivJCI9oFazMlYF3wVKeDOz8QY0OW60C81FD06WT4j870cM0Bhab1x+f/Ahqz4dD
 2uQCfpEpmNXaOnNnhqAgz5kw8rE/kbs9DNrgc6PwezQ61EVt3O7n8QjOFOcjavKPnI/1
 8Tzw==
X-Gm-Message-State: AOAM531inP33hqBL2w/5D+Tk+gGKh1zZo5VWtCsJFlcSAUam1d7fVEnV
 qq4Tu+pQ1QU1GN+KuQ8brWkFXyPMoTQB3vFGmjc7nobVdt6ltoAkO4emtABYyQGsuvPW+n2/lI5
 VwL3QjpXxqzM9OOEkG51zm5K5qMSdHH2PGbH/irLhOUxDLmDerfEH/h25a+p/
X-Received: by 2002:a17:906:3e14:: with SMTP id
 k20mr4381195eji.42.1612537411483; 
 Fri, 05 Feb 2021 07:03:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyA73anOOwppDmN6rrh+d6JaSY/8LepCZqHyb2pQ6nENtbA1YTqUyG5l7nOHbOGofCqD590yw==
X-Received: by 2002:a17:906:3e14:: with SMTP id
 k20mr4381160eji.42.1612537411121; 
 Fri, 05 Feb 2021 07:03:31 -0800 (PST)
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
 by smtp.gmail.com with ESMTPSA id t3sm4118664eds.89.2021.02.05.07.03.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 07:03:30 -0800 (PST)
Date: Fri, 5 Feb 2021 10:03:28 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 00/16] pc,virtio,pci: fixes, features,code removal
Message-ID: <20210205150135.94643-1-mst@redhat.com>
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
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.352,
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

changes from v1:
    - fix build warning on latest gcc
    - add rom size feature
    - more bugfixes

The following changes since commit 923abdb4bdfb6d93bfe6c941ead70f3ea6707e40:

  Merge remote-tracking branch 'remotes/kraxel/tags/vga-ui-20210205-pull-request' into staging (2021-02-05 10:09:16 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream

for you to fetch changes up to 277a582bf88a3058fa094e078a5310a2deb37da6:

  tests/acpi: disallow updates for expected data files (2021-02-05 08:52:59 -0500)

----------------------------------------------------------------
pc,virtio,pci: fixes, features,code removal

Fixes all over the place.
Ability to control ACPI OEM ID's.
Ability to control rom BAR size.
Removal of deprecated pc machine types.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

----------------------------------------------------------------
Eugenio Pérez (2):
      virtio: Add corresponding memory_listener_unregister to unrealize
      vhost: Check for valid vdev in vhost_backend_handle_iotlb_msg

Laurent Vivier (1):
      virtio-mmio: fix guest kernel crash with SHM regions

Marian Postevca (5):
      tests/acpi: allow updates for expected data files
      acpi: Permit OEM ID and OEM table ID fields to be changed
      tests/acpi: add OEM ID and OEM TABLE ID test
      tests/acpi: update expected data files
      tests/acpi: disallow updates for expected data files

Michael S. Tsirkin (1):
      acpi: use constants as strncpy limit

Pankaj Gupta (1):
      virtio-pmem: add trace events

Paolo Bonzini (2):
      pci: reject too large ROMs
      pci: add romsize property

Peter Xu (1):
      vhost: Unbreak SMMU and virtio-iommu on dev-iotlb support

Stefano Garzarella (1):
      virtio: move 'use-disabled-flag' property to hw_compat_4_2

Thomas Huth (2):
      hw/i386: Remove the deprecated pc-1.x machine types
      hw/virtio/virtio-balloon: Remove the "class" property

 hw/acpi/hmat.h                       |   3 +-
 hw/i386/acpi-common.h                |   3 +-
 include/hw/acpi/acpi-defs.h          |   2 +-
 include/hw/acpi/aml-build.h          |   8 +-
 include/hw/acpi/ghes.h               |   3 +-
 include/hw/acpi/pci.h                |   3 +-
 include/hw/acpi/vmgenid.h            |   2 +-
 include/hw/arm/virt.h                |   2 +
 include/hw/i386/microvm.h            |   4 +
 include/hw/i386/pc.h                 |   5 +-
 include/hw/mem/nvdimm.h              |   3 +-
 include/hw/pci/pci.h                 |   1 +
 hw/acpi/aml-build.c                  |  29 +++---
 hw/acpi/ghes.c                       |   5 +-
 hw/acpi/hmat.c                       |   5 +-
 hw/acpi/nvdimm.c                     |  18 ++--
 hw/acpi/pci.c                        |   5 +-
 hw/acpi/vmgenid.c                    |   4 +-
 hw/arm/smmuv3.c                      |   5 ++
 hw/arm/virt-acpi-build.c             |  40 ++++++---
 hw/arm/virt.c                        |  63 +++++++++++++
 hw/core/machine.c                    |   2 +-
 hw/i386/acpi-build.c                 |  86 ++++++++++++------
 hw/i386/acpi-common.c                |   5 +-
 hw/i386/acpi-microvm.c               |  13 +--
 hw/i386/microvm.c                    |  66 ++++++++++++++
 hw/i386/pc.c                         |  64 +++++++++++++
 hw/i386/pc_piix.c                    |  94 -------------------
 hw/pci/pci.c                         |  29 +++++-
 hw/virtio/vhost-backend.c            |   5 ++
 hw/virtio/vhost.c                    |  13 ++-
 hw/virtio/virtio-balloon-pci.c       |  11 +--
 hw/virtio/virtio-iommu.c             |   5 ++
 hw/virtio/virtio-mmio.c              |   8 ++
 hw/virtio/virtio-pmem.c              |   4 +
 hw/virtio/virtio.c                   |   2 +-
 hw/xen/xen_pt_load_rom.c             |  14 ++-
 tests/qtest/bios-tables-test.c       | 170 ++++++++++++++++++++++++++++++-----
 docs/system/deprecated.rst           |   6 --
 docs/system/removed-features.rst     |   6 ++
 hw/virtio/trace-events               |   5 ++
 tests/data/acpi/microvm/APIC         | Bin 70 -> 70 bytes
 tests/data/acpi/microvm/APIC.ioapic2 | Bin 82 -> 82 bytes
 tests/data/acpi/microvm/APIC.pcie    | Bin 110 -> 110 bytes
 tests/data/acpi/microvm/DSDT         | Bin 365 -> 365 bytes
 tests/data/acpi/microvm/DSDT.ioapic2 | Bin 365 -> 365 bytes
 tests/data/acpi/microvm/DSDT.pcie    | Bin 3031 -> 3031 bytes
 tests/data/acpi/microvm/DSDT.rtc     | Bin 404 -> 404 bytes
 tests/data/acpi/microvm/DSDT.usb     | Bin 414 -> 414 bytes
 tests/data/acpi/microvm/FACP         | Bin 268 -> 268 bytes
 tests/data/acpi/pc/APIC              | Bin 120 -> 120 bytes
 tests/data/acpi/pc/APIC.acpihmat     | Bin 128 -> 128 bytes
 tests/data/acpi/pc/APIC.cphp         | Bin 160 -> 160 bytes
 tests/data/acpi/pc/APIC.dimmpxm      | Bin 144 -> 144 bytes
 tests/data/acpi/pc/DSDT              | Bin 5065 -> 5065 bytes
 tests/data/acpi/pc/DSDT.acpihmat     | Bin 6390 -> 6390 bytes
 tests/data/acpi/pc/DSDT.bridge       | Bin 6924 -> 6924 bytes
 tests/data/acpi/pc/DSDT.cphp         | Bin 5529 -> 5529 bytes
 tests/data/acpi/pc/DSDT.dimmpxm      | Bin 6719 -> 6719 bytes
 tests/data/acpi/pc/DSDT.hpbridge     | Bin 5026 -> 5026 bytes
 tests/data/acpi/pc/DSDT.hpbrroot     | Bin 3084 -> 3084 bytes
 tests/data/acpi/pc/DSDT.ipmikcs      | Bin 5137 -> 5137 bytes
 tests/data/acpi/pc/DSDT.memhp        | Bin 6424 -> 6424 bytes
 tests/data/acpi/pc/DSDT.numamem      | Bin 5071 -> 5071 bytes
 tests/data/acpi/pc/DSDT.roothp       | Bin 5261 -> 5261 bytes
 tests/data/acpi/pc/FACP              | Bin 116 -> 116 bytes
 tests/data/acpi/pc/HMAT.acpihmat     | Bin 280 -> 280 bytes
 tests/data/acpi/pc/HPET              | Bin 56 -> 56 bytes
 tests/data/acpi/pc/NFIT.dimmpxm      | Bin 240 -> 240 bytes
 tests/data/acpi/pc/SLIT.cphp         | Bin 48 -> 48 bytes
 tests/data/acpi/pc/SLIT.memhp        | Bin 48 -> 48 bytes
 tests/data/acpi/pc/SRAT.acpihmat     | Bin 280 -> 280 bytes
 tests/data/acpi/pc/SRAT.cphp         | Bin 304 -> 304 bytes
 tests/data/acpi/pc/SRAT.dimmpxm      | Bin 392 -> 392 bytes
 tests/data/acpi/pc/SRAT.memhp        | Bin 264 -> 264 bytes
 tests/data/acpi/pc/SRAT.numamem      | Bin 224 -> 224 bytes
 tests/data/acpi/pc/SSDT.dimmpxm      | Bin 734 -> 734 bytes
 tests/data/acpi/pc/WAET              | Bin 40 -> 40 bytes
 tests/data/acpi/q35/APIC             | Bin 120 -> 120 bytes
 tests/data/acpi/q35/APIC.acpihmat    | Bin 128 -> 128 bytes
 tests/data/acpi/q35/APIC.cphp        | Bin 160 -> 160 bytes
 tests/data/acpi/q35/APIC.dimmpxm     | Bin 144 -> 144 bytes
 tests/data/acpi/q35/DSDT             | Bin 7801 -> 7801 bytes
 tests/data/acpi/q35/DSDT.acpihmat    | Bin 9126 -> 9126 bytes
 tests/data/acpi/q35/DSDT.bridge      | Bin 7819 -> 7819 bytes
 tests/data/acpi/q35/DSDT.cphp        | Bin 8265 -> 8265 bytes
 tests/data/acpi/q35/DSDT.dimmpxm     | Bin 9455 -> 9455 bytes
 tests/data/acpi/q35/DSDT.ipmibt      | Bin 7876 -> 7876 bytes
 tests/data/acpi/q35/DSDT.memhp       | Bin 9160 -> 9160 bytes
 tests/data/acpi/q35/DSDT.mmio64      | Bin 8932 -> 8932 bytes
 tests/data/acpi/q35/DSDT.numamem     | Bin 7807 -> 7807 bytes
 tests/data/acpi/q35/DSDT.tis         | Bin 8407 -> 8407 bytes
 tests/data/acpi/q35/FACP             | Bin 244 -> 244 bytes
 tests/data/acpi/q35/HMAT.acpihmat    | Bin 280 -> 280 bytes
 tests/data/acpi/q35/HPET             | Bin 56 -> 56 bytes
 tests/data/acpi/q35/MCFG             | Bin 60 -> 60 bytes
 tests/data/acpi/q35/NFIT.dimmpxm     | Bin 240 -> 240 bytes
 tests/data/acpi/q35/SLIT.cphp        | Bin 48 -> 48 bytes
 tests/data/acpi/q35/SLIT.memhp       | Bin 48 -> 48 bytes
 tests/data/acpi/q35/SRAT.acpihmat    | Bin 280 -> 280 bytes
 tests/data/acpi/q35/SRAT.cphp        | Bin 304 -> 304 bytes
 tests/data/acpi/q35/SRAT.dimmpxm     | Bin 392 -> 392 bytes
 tests/data/acpi/q35/SRAT.memhp       | Bin 264 -> 264 bytes
 tests/data/acpi/q35/SRAT.mmio64      | Bin 224 -> 224 bytes
 tests/data/acpi/q35/SRAT.numamem     | Bin 224 -> 224 bytes
 tests/data/acpi/q35/SSDT.dimmpxm     | Bin 734 -> 734 bytes
 tests/data/acpi/q35/TPM2.tis         | Bin 76 -> 76 bytes
 tests/data/acpi/q35/WAET             | Bin 40 -> 40 bytes
 tests/data/acpi/virt/APIC            | Bin 168 -> 168 bytes
 tests/data/acpi/virt/APIC.memhp      | Bin 168 -> 168 bytes
 tests/data/acpi/virt/APIC.numamem    | Bin 168 -> 168 bytes
 tests/data/acpi/virt/DSDT            | Bin 5204 -> 5204 bytes
 tests/data/acpi/virt/DSDT.memhp      | Bin 6565 -> 6565 bytes
 tests/data/acpi/virt/DSDT.numamem    | Bin 5204 -> 5204 bytes
 tests/data/acpi/virt/DSDT.pxb        | Bin 7689 -> 7689 bytes
 tests/data/acpi/virt/FACP            | Bin 268 -> 268 bytes
 tests/data/acpi/virt/FACP.memhp      | Bin 268 -> 268 bytes
 tests/data/acpi/virt/FACP.numamem    | Bin 268 -> 268 bytes
 tests/data/acpi/virt/GTDT            | Bin 96 -> 96 bytes
 tests/data/acpi/virt/GTDT.memhp      | Bin 96 -> 96 bytes
 tests/data/acpi/virt/GTDT.numamem    | Bin 96 -> 96 bytes
 tests/data/acpi/virt/MCFG            | Bin 60 -> 60 bytes
 tests/data/acpi/virt/MCFG.memhp      | Bin 60 -> 60 bytes
 tests/data/acpi/virt/MCFG.numamem    | Bin 60 -> 60 bytes
 tests/data/acpi/virt/NFIT.memhp      | Bin 224 -> 224 bytes
 tests/data/acpi/virt/SLIT.memhp      | Bin 48 -> 48 bytes
 tests/data/acpi/virt/SPCR            | Bin 80 -> 80 bytes
 tests/data/acpi/virt/SPCR.memhp      | Bin 80 -> 80 bytes
 tests/data/acpi/virt/SPCR.numamem    | Bin 80 -> 80 bytes
 tests/data/acpi/virt/SRAT.memhp      | Bin 226 -> 226 bytes
 tests/data/acpi/virt/SRAT.numamem    | Bin 106 -> 106 bytes
 tests/data/acpi/virt/SSDT.memhp      | Bin 736 -> 736 bytes
 132 files changed, 585 insertions(+), 236 deletions(-)


