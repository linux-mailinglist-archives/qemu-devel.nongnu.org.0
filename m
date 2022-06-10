Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF15545E03
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 10:01:01 +0200 (CEST)
Received: from localhost ([::1]:33706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzZZk-0001DY-Mi
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 04:01:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZWP-0006QC-Ad
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:57:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZWM-0006CN-9W
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:57:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654847849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=5BVS1//AFhHYzV76TrNn9RIOePkPQ+C6P5xATHZw2LM=;
 b=ZpanUrggUrCFdCDhpC3Ra0OpNGozpSBhBYckm+1ybXB1NGfBuNyH7/bXaovDjSnheaJSYm
 rUJJsT7BWKj7C/yv4YlM34Bguy6djBLf+GdIrJjTpkcVJ6qlzqHKfvIdJon+Hw50FJSrrS
 Nc95Dz8ySpYHDKbmRkcl3/JpSsWM+x0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-222-6xWubGiVOSGyndDZMowVaQ-1; Fri, 10 Jun 2022 03:57:04 -0400
X-MC-Unique: 6xWubGiVOSGyndDZMowVaQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 o23-20020a05600c511700b0039743cd8093so953021wms.6
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 00:57:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=5BVS1//AFhHYzV76TrNn9RIOePkPQ+C6P5xATHZw2LM=;
 b=Re6DfNChyBaCvRzfhrqHfVyCNwE4k9xebjNMtOvpJdnucAv4aMOXifWOM0v2x7Zs00
 FyzpGZCQLIEnHsrK6Me+Jo0vlUYHBC0ztA4L4F8MQLa94bAnjjUJbrBeDJMAi09AoA40
 Gemwe6N3a6N5RBwLDNVXRRKeQvs0Z9QZfz/rs7k1LmeSn9b/T3giVk5wUjGkQWE/aO6T
 /pcVSJEpyQjJ0/L2IggqLS+rVRO86tIAkK+MMItcInH6iei/jKaMp6S+5rjFDa27i499
 TTvj47g+wMBHuX1YJ9ZAoGelFUavH8Udmr59/IpbknvZtwmmebtp+MRyLi+oF7JAxwhI
 uhOA==
X-Gm-Message-State: AOAM532wNOOoYhcXe8/kBLqA5FtkzRnfYXBZntYFnnbiSjUh2Je/Vhz0
 PPo3DrT17fYLUkkMaZJhoqwCjOslmV5Bq26+qsG1bAVYxUb88sOzev6OPSPOFo1V/zzHuNYWV86
 LfSUbp6MRgD+ZblJPPcUx8Vp5w9KrvciZjFNNQTF9eaL38LJc/mrHo3Sl3nrD
X-Received: by 2002:a05:600c:3d8e:b0:39c:573b:3079 with SMTP id
 bi14-20020a05600c3d8e00b0039c573b3079mr7687081wmb.131.1654847823015; 
 Fri, 10 Jun 2022 00:57:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxdyZsnNbyye2Enf72/ixhW7hFJydoMMSGuHt9nQHSCOW+RInW9ypF7kJgzTlJZkM4pvonW+g==
X-Received: by 2002:a05:600c:3d8e:b0:39c:573b:3079 with SMTP id
 bi14-20020a05600c3d8e00b0039c573b3079mr7687047wmb.131.1654847822596; 
 Fri, 10 Jun 2022 00:57:02 -0700 (PDT)
Received: from redhat.com ([212.116.178.142]) by smtp.gmail.com with ESMTPSA id
 o17-20020a5d6711000000b00218453adaefsm12568822wru.101.2022.06.10.00.57.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 00:57:02 -0700 (PDT)
Date: Fri, 10 Jun 2022 03:56:59 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 00/54] virtio,pc,pci: fixes,cleanups,features
Message-ID: <20220610075631.367501-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 6d940eff4734bcb40b1a25f62d7cec5a396f994a:

  Merge tag 'pull-tpm-2022-06-07-1' of https://github.com/stefanberger/qemu-tpm into staging (2022-06-07 19:22:18 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream

for you to fetch changes up to 397c2901bfd9ee531243b38b6a318edccb88ed65:

  crypto: Introduce RSA algorithm (2022-06-09 19:32:49 -0400)

----------------------------------------------------------------
virtio,pc,pci: fixes,cleanups,features

more CXL patches
VIOT
Igor's huge AML rework
fixes, cleanups all over the place

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

----------------------------------------------------------------
Changpeng Liu (2):
      hw/virtio/vhost-user: don't use uninitialized variable
      hw/vhost-user-scsi|blk: set `supports_config` flag correctly

Claudio Fontana (1):
      pci: fix overflow in snprintf string formatting

Igor Mammedov (35):
      acpi: add interface to build device specific AML
      acpi: make isa_build_aml() support AcpiDevAmlIf interface
      acpi: fdc-isa: replace ISADeviceClass::build_aml with AcpiDevAmlIfClass:build_dev_aml
      acpi: parallel port: replace ISADeviceClass::build_aml with AcpiDevAmlIfClass:build_dev_aml
      acpi: serial-is: replace ISADeviceClass::build_aml with AcpiDevAmlIfClass:build_dev_aml
      acpi: mc146818rtc: replace ISADeviceClass::build_aml with AcpiDevAmlIfClass:build_dev_aml
      acpi: pckbd: replace ISADeviceClass::build_aml with AcpiDevAmlIfClass:build_dev_aml
      isa-bus: drop no longer used ISADeviceClass::build_aml
      tests: acpi: add and whitelist DSDT.ipmismbus expected blob
      tests: acpi: q35: add test for smbus-ipmi device
      tests: acpi: update expected blob DSDT.ipmismbus
      tests: acpi: whitelist DSDT.ipmismbus expected blob
      ipmi: acpi: use relative path to resource source
      tests: acpi: update expected DSDT.ipmismbus blob
      acpi: ich9-smb: add support for AcpiDevAmlIf interface
      acpi: ipmi: use AcpiDevAmlIf interface to build IPMI device descriptors
      q35: acpi: drop not needed PCMachineClass::do_not_add_smb_acpi
      tests: acpi: white-list to be re-factored pc/q35 DSDT
      acpi: pc: isa bridge: use AcpiDevAmlIf interface to build ISA device descriptors
      acpi: q35: isa bridge: use AcpiDevAmlIf interface to build ISA device descriptors
      tests: acpi: update expected blobs
      tests: acpi: add and white-list DSDT.applesmc expected blob
      tests: acpi: add applesmc testcase
      acpi: applesmc: use AcpiDevAmlIfClass:build_dev_aml to provide device's AML
      tests: acpi: update expected blobs
      tests: acpi: white-lists expected DSDT.pvpanic-isa blob
      tests: acpi: add pvpanic-isa: testcase
      acpi: pvpanic-isa: use AcpiDevAmlIfClass:build_dev_aml to provide device's AML
      tests: acpi: update expected DSDT.pvpanic-isa blob
      tests: acpi: white-list DSDT.tis.tpm2/DSDT.tis.tpm12 expected blobs
      acpi: pc/q35: tpm-tis: fix TPM device scope
      acpi: pc/q35: remove not needed 'if' condition on pci bus
      acpi: tpm-tis: use AcpiDevAmlIfClass:build_dev_aml to provide device's AML
      tests: acpi: update expected DSDT.tis.tpm2/DSDT.tis.tpm12 blobs
      x86: acpi-build: do not include hw/isa/isa.h directly

Jonathan Cameron (9):
      hw/cxl: Make the CXL fixed memory window setup a machine parameter.
      hw/acpi/cxl: Pass in the CXLState directly rather than MachineState
      hw/cxl: Push linking of CXL targets into i386/pc rather than in machine.c
      tests/acpi: Allow modification of q35 CXL CEDT table.
      pci/pci_expander_bridge: For CXL HB delay the HB register memory region setup.
      tests/acpi: Update q35/CEDT.cxl for new memory addresses.
      hw/cxl: Move the CXLState from MachineState to machine type specific state.
      hw/machine: Drop cxl_supported flag as no longer useful
      hw/cxl: Fix missing write mask for HDM decoder target list registers

Mark Cave-Ayland (6):
      hw/acpi/viot: rename build_pci_range_node() to enumerate_pci_host_bridges()
      hw/acpi/viot: move the individual PCI host bridge entry generation to a new function
      hw/acpi/viot: build array of PCI host bridges before generating VIOT ACPI table
      tests/acpi: virt: allow VIOT acpi table changes
      hw/acpi/viot: sort VIOT ACPI table entries by PCI host bridge min_bus
      tests/acpi: virt: update golden masters for VIOT

Zhenwei Pi (1):
      crypto: Introduce RSA algorithm

 qapi/machine.json                           |  13 ++
 include/hw/acpi/acpi_aml_interface.h        |  40 ++++
 include/hw/acpi/cxl.h                       |   5 +-
 include/hw/acpi/ipmi.h                      |   9 +-
 include/hw/boards.h                         |   3 +-
 include/hw/cxl/cxl.h                        |   9 +-
 include/hw/cxl/cxl_host.h                   |  23 ++
 include/hw/i386/pc.h                        |   3 +-
 include/hw/isa/isa.h                        |  15 --
 include/hw/misc/pvpanic.h                   |   9 -
 include/hw/pci-bridge/pci_expander_bridge.h |  12 ++
 include/hw/virtio/virtio-crypto.h           |   5 +-
 include/sysemu/cryptodev.h                  |  83 ++++++--
 backends/cryptodev-builtin.c                | 274 ++++++++++++++++++++----
 backends/cryptodev-vhost-user.c             |  34 ++-
 backends/cryptodev.c                        |  32 ++-
 hw/acpi/acpi_interface.c                    |   8 +
 hw/acpi/cxl.c                               |   9 +-
 hw/acpi/ipmi-stub.c                         |   2 +-
 hw/acpi/ipmi.c                              |  53 ++---
 hw/acpi/viot.c                              | 109 ++++++----
 hw/block/fdc-isa.c                          |  16 +-
 hw/block/vhost-user-blk.c                   |   1 +
 hw/char/parallel.c                          |  14 +-
 hw/char/serial-isa.c                        |  14 +-
 hw/core/machine.c                           |  28 ---
 hw/cxl/cxl-component-utils.c                |  13 +-
 hw/cxl/cxl-host-stubs.c                     |   9 +-
 hw/cxl/cxl-host.c                           | 100 ++++++++-
 hw/i2c/smbus_ich9.c                         |  15 ++
 hw/i386/acpi-build.c                        | 179 ++++------------
 hw/i386/pc.c                                |  31 ++-
 hw/i386/pc_piix.c                           |   1 -
 hw/i386/pc_q35.c                            |   1 -
 hw/input/pckbd.c                            |  14 +-
 hw/ipmi/isa_ipmi_bt.c                       |   4 +
 hw/ipmi/isa_ipmi_kcs.c                      |   4 +
 hw/ipmi/smbus_ipmi.c                        |   4 +
 hw/isa/isa-bus.c                            |   9 +-
 hw/isa/lpc_ich9.c                           |  19 ++
 hw/isa/piix3.c                              |  17 ++
 hw/misc/applesmc.c                          |  29 +++
 hw/misc/pvpanic-isa.c                       |  42 ++++
 hw/pci-bridge/pci_expander_bridge.c         |  32 +--
 hw/pci-bridge/pci_expander_bridge_stubs.c   |  14 ++
 hw/pci/pci.c                                |  16 +-
 hw/rtc/mc146818rtc.c                        |  14 +-
 hw/scsi/vhost-user-scsi.c                   |   1 -
 hw/tpm/tpm_tis_isa.c                        |  32 +++
 hw/virtio/vhost-user.c                      |   8 +-
 hw/virtio/virtio-crypto.c                   | 319 ++++++++++++++++++++++------
 softmmu/vl.c                                |  46 ----
 tests/qtest/bios-tables-test.c              |  44 +++-
 tests/qtest/cxl-test.c                      |   4 +-
 docs/system/devices/cxl.rst                 |   4 +-
 hw/acpi/meson.build                         |   2 +-
 hw/pci-bridge/meson.build                   |   5 +-
 qemu-options.hx                             |  73 +++----
 tests/data/acpi/pc/DSDT                     | Bin 6002 -> 5987 bytes
 tests/data/acpi/pc/DSDT.acpierst            | Bin 5969 -> 5954 bytes
 tests/data/acpi/pc/DSDT.acpihmat            | Bin 7327 -> 7312 bytes
 tests/data/acpi/pc/DSDT.bridge              | Bin 8668 -> 8653 bytes
 tests/data/acpi/pc/DSDT.cphp                | Bin 6466 -> 6451 bytes
 tests/data/acpi/pc/DSDT.dimmpxm             | Bin 7656 -> 7641 bytes
 tests/data/acpi/pc/DSDT.hpbridge            | Bin 5969 -> 5954 bytes
 tests/data/acpi/pc/DSDT.hpbrroot            | Bin 3084 -> 3069 bytes
 tests/data/acpi/pc/DSDT.ipmikcs             | Bin 6074 -> 6059 bytes
 tests/data/acpi/pc/DSDT.memhp               | Bin 7361 -> 7346 bytes
 tests/data/acpi/pc/DSDT.nohpet              | Bin 5860 -> 5845 bytes
 tests/data/acpi/pc/DSDT.numamem             | Bin 6008 -> 5993 bytes
 tests/data/acpi/pc/DSDT.roothp              | Bin 6210 -> 6195 bytes
 tests/data/acpi/q35/CEDT.cxl                | Bin 184 -> 184 bytes
 tests/data/acpi/q35/DSDT                    | Bin 8289 -> 8274 bytes
 tests/data/acpi/q35/DSDT.acpierst           | Bin 8306 -> 8291 bytes
 tests/data/acpi/q35/DSDT.acpihmat           | Bin 9614 -> 9599 bytes
 tests/data/acpi/q35/DSDT.applesmc           | Bin 0 -> 8320 bytes
 tests/data/acpi/q35/DSDT.bridge             | Bin 11003 -> 10988 bytes
 tests/data/acpi/q35/DSDT.cphp               | Bin 8753 -> 8738 bytes
 tests/data/acpi/q35/DSDT.cxl                | Bin 9615 -> 9600 bytes
 tests/data/acpi/q35/DSDT.dimmpxm            | Bin 9943 -> 9928 bytes
 tests/data/acpi/q35/DSDT.ipmibt             | Bin 8364 -> 8349 bytes
 tests/data/acpi/q35/DSDT.ipmismbus          | Bin 0 -> 8363 bytes
 tests/data/acpi/q35/DSDT.ivrs               | Bin 8306 -> 8291 bytes
 tests/data/acpi/q35/DSDT.memhp              | Bin 9648 -> 9633 bytes
 tests/data/acpi/q35/DSDT.mmio64             | Bin 9419 -> 9404 bytes
 tests/data/acpi/q35/DSDT.multi-bridge       | Bin 8583 -> 8568 bytes
 tests/data/acpi/q35/DSDT.nohpet             | Bin 8147 -> 8132 bytes
 tests/data/acpi/q35/DSDT.numamem            | Bin 8295 -> 8280 bytes
 tests/data/acpi/q35/DSDT.pvpanic-isa        | Bin 0 -> 8375 bytes
 tests/data/acpi/q35/DSDT.tis.tpm12          | Bin 8900 -> 8880 bytes
 tests/data/acpi/q35/DSDT.tis.tpm2           | Bin 8921 -> 8906 bytes
 tests/data/acpi/q35/DSDT.viot               | Bin 9398 -> 9383 bytes
 tests/data/acpi/q35/DSDT.xapic              | Bin 35652 -> 35637 bytes
 tests/data/acpi/q35/VIOT.viot               | Bin 112 -> 112 bytes
 94 files changed, 1313 insertions(+), 615 deletions(-)
 create mode 100644 include/hw/acpi/acpi_aml_interface.h
 create mode 100644 include/hw/cxl/cxl_host.h
 create mode 100644 include/hw/pci-bridge/pci_expander_bridge.h
 create mode 100644 hw/pci-bridge/pci_expander_bridge_stubs.c
 create mode 100644 tests/data/acpi/q35/DSDT.applesmc
 create mode 100644 tests/data/acpi/q35/DSDT.ipmismbus
 create mode 100644 tests/data/acpi/q35/DSDT.pvpanic-isa


