Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A881B5FA2F7
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 19:53:02 +0200 (CEST)
Received: from localhost ([::1]:53002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohwxZ-00038w-Nh
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 13:53:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwaB-0007Tx-Ia
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:28:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwa5-0006Na-Kn
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:28:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665422924;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=QFauEX/kutNIpxz+du/GsjxftxR7fqz3Pxd+Ookhkfs=;
 b=fGrIty5s4+wFtCLvSyYB0M3gE5vCLtSkLTSUl4Kg/4Z3lljbwao3CoKQYlDc1yCGfVx+wW
 +KsjRqqm6YUSLOUx9CQOSsE7U/3w8z9AVUSgFroMYbNZu+N4XfY1de5lrkxWvYWBXh+8I7
 JMiFhsjWM5IioBJDl+e/Mi9FuReGmJw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-371-6SqPlEEaNE-yM7pmmrweyw-1; Mon, 10 Oct 2022 13:28:43 -0400
X-MC-Unique: 6SqPlEEaNE-yM7pmmrweyw-1
Received: by mail-wr1-f72.google.com with SMTP id
 i26-20020adfaada000000b0022e2f38ffccso2974642wrc.14
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 10:28:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:content-disposition:mime-version
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QFauEX/kutNIpxz+du/GsjxftxR7fqz3Pxd+Ookhkfs=;
 b=bvTOpGFjgp2OlRQQ8zXZg6QekGeTqQGu6tkbM/9ugCV3gN3tQ6YfJnZjxP2NhP7+IV
 7xHrUZmOSqEdu/w3ApfYT8SbzDB0GyyH0IUK7MVHXhJuvI1Z5F3av8kyNzpQ9/Y3s82x
 3u0rwYek6QOiw197eNHoR57QTjMPwAZ1dCnogZuUOOO8D1qJ6i7K2wDdkOxgf2pBWKbL
 5XLiESQ7ovuiJlkd0BtCN/rAV9/OaQMJtxx1j7EzJi2RL1l3c944uzD9UHf7743rBUcX
 o0rlJXOdaQNQLm0T6SNh+186MfwlnZyHgWuIHZSbD8frIkLv7Ht0rkWDOrLHvFNGH7lW
 G0mg==
X-Gm-Message-State: ACrzQf3HDmru1pt7//QoTRzUQtWE5elKYYlyA0bzj+cWx5onWyGo/K2d
 EAztQbH4qejuQKasmtMBgEXgaBjSBdKGtX9EXJspxFBRI0/0fmY/7L8GxOV+eLjTuDCOepSrS1O
 crSfeXch03IJ3StxP1YdCpn7QyuVIrRlvLXsvHcC+9b4PQZ+dcU8/z/RbAZm0
X-Received: by 2002:a5d:4950:0:b0:230:cc5a:f6b0 with SMTP id
 r16-20020a5d4950000000b00230cc5af6b0mr2766587wrs.656.1665422921961; 
 Mon, 10 Oct 2022 10:28:41 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4IHfmHsZ4hdZeUwx3b/FIWke5QUMjQD/JjbhOmltzVW9CcjLVt5I3ZIYPjvySA4Nizu9zj/w==
X-Received: by 2002:a5d:4950:0:b0:230:cc5a:f6b0 with SMTP id
 r16-20020a5d4950000000b00230cc5af6b0mr2766566wrs.656.1665422921523; 
 Mon, 10 Oct 2022 10:28:41 -0700 (PDT)
Received: from redhat.com ([2.55.183.131]) by smtp.gmail.com with ESMTPSA id
 l10-20020adfe9ca000000b002286670bafasm9286963wrn.48.2022.10.10.10.28.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 10:28:41 -0700 (PDT)
Date: Mon, 10 Oct 2022 13:28:38 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 00/55] pc,virtio: features, tests, fixes, cleanups
Message-ID: <20221010172813.204597-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The following changes since commit f1d33f55c47dfdaf8daacd618588ad3ae4c452d1:

  Merge tag 'pull-testing-gdbstub-plugins-gitdm-061022-3' of https://github.com/stsquad/qemu into staging (2022-10-06 07:11:56 -0400)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream

for you to fetch changes up to 3216ab2acb08b47d4ff83e709406690d37e44aff:

  x86: pci: acpi: consolidate PCI slots creation (2022-10-09 16:38:46 -0400)

----------------------------------------------------------------
pc,virtio: features, tests, fixes, cleanups

virtio introspection
new serial number opton for cxl
vhost user blk dynamic config size
virtio-gpio vhost user backend

Tests fixes cleanups all over the place

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

----------------------------------------------------------------
Alex Bennée (17):
      hw/virtio: incorporate backend features in features
      include/hw/virtio: more comment for VIRTIO_F_BAD_FEATURE
      include/hw: document vhost_dev feature life-cycle
      hw/virtio: fix some coding style issues
      hw/virtio: log potentially buggy guest drivers
      hw/virtio: add some vhost-user trace events
      hw/virtio: move vm_running check to virtio_device_started
      hw/virtio: move vhd->started check into helper and add FIXME
      tests/qtest: pass stdout/stderr down to subtests
      tests/qtest: add a timeout for subprocess_run_one_test
      tests/qtest: use qos_printf instead of g_test_message
      tests/qtest: catch unhandled vhost-user messages
      tests/qtest: plain g_assert for VHOST_USER_F_PROTOCOL_FEATURES
      tests/qtest: add assert to catch bad features
      tests/qtest: implement stub for VHOST_USER_GET_CONFIG
      tests/qtest: add a get_features op to vhost-user-test
      tests/qtest: enable tests for virtio-gpio

Daniil Tatianin (5):
      virtio: introduce VirtIOConfigSizeParams & virtio_get_config_size
      virtio-blk: move config size params to virtio-blk-common
      vhost-user-blk: make it possible to disable write-zeroes/discard
      vhost-user-blk: make 'config_wce' part of 'host_features'
      vhost-user-blk: dynamically resize config space based on features

Hal Martin (1):
      hw/smbios: support for type 8 (port connector)

Igor Mammedov (17):
      tests: acpi: whitelist pc/q35 DSDT due to HPET AML move
      acpi: x86: deduplicate HPET AML building
      tests: acpi: update expected blobs after HPET move
      tests: acpi: whitelist pc/q35 DSDT due to HPET AML move
      acpi: x86: refactor PDSM method to reduce nesting
      x86: acpi: _DSM: use Package to pass parameters
      tests: acpi: update expected blobs
      tests: acpi: whitelist pc/q35 DSDT before switching _DSM to use ASUN
      x86: acpi: cleanup PCI device _DSM duplication
      tests: acpi: update expected blobs
      tests: acpi: whitelist pc/q35 DSDT before moving _ADR field
      x86: pci: acpi: reorder Device's _ADR and _SUN fields
      tests: acpi: update expected blobs
      tests: acpi: whitelist pc/q35 DSDT before moving _ADR field
      x86: pci: acpi: reorder Device's _DSM method
      tests: acpi: update expected blobs
      x86: pci: acpi: consolidate PCI slots creation

Jonathan Cameron (1):
      mem/cxl-type3: Add sn option to provide serial number for PCI ecap

Laurent Vivier (6):
      qmp: add QMP command x-query-virtio
      qmp: add QMP command x-query-virtio-status
      qmp: decode feature & status bits in virtio-status
      qmp: add QMP commands for virtio/vhost queue-status
      qmp: add QMP command x-query-virtio-queue-element
      hmp: add virtio commands

Miguel Luis (3):
      tests/acpi: virt: allow acpi GTDT changes
      acpi: arm/virt: build_gtdt: fix invalid 64-bit physical addresses
      tests/acpi: virt: update ACPI GTDT binaries

Peter Maydell (2):
      pci: Remove unused pci_get_*_by_mask() functions
      pci: Sanity check mask argument to pci_set_*_by_mask()

Peter Xu (1):
      Revert "intel_iommu: Fix irqchip / X2APIC configuration checks"

Viresh Kumar (2):
      hw/virtio: add boilerplate for vhost-user-gpio device
      hw/virtio: add vhost-user-gpio-pci boilerplate

 qapi/qapi-schema.json                 |    1 +
 qapi/virtio.json                      |  954 ++++++++++++++++++++++++++++++
 include/hw/cxl/cxl_device.h           |    1 +
 include/hw/firmware/smbios.h          |   10 +
 include/hw/pci/pci.h                  |   48 +-
 include/hw/virtio/vhost-user-blk.h    |    1 -
 include/hw/virtio/vhost-user-gpio.h   |   35 ++
 include/hw/virtio/vhost.h             |   18 +
 include/hw/virtio/virtio-blk-common.h |   20 +
 include/hw/virtio/virtio.h            |   28 +-
 include/monitor/hmp.h                 |    5 +
 tests/qtest/libqos/virtio-gpio.h      |   35 ++
 hw/arm/virt-acpi-build.c              |    5 +-
 hw/block/vhost-user-blk.c             |   39 +-
 hw/block/virtio-blk-common.c          |   39 ++
 hw/block/virtio-blk.c                 |   28 +-
 hw/i386/acpi-build.c                  |  300 +++++-----
 hw/i386/intel_iommu.c                 |    5 +
 hw/mem/cxl_type3.c                    |   14 +-
 hw/net/virtio-net.c                   |    9 +-
 hw/scsi/vhost-scsi.c                  |    4 +-
 hw/scsi/vhost-user-scsi.c             |    2 +-
 hw/smbios/smbios.c                    |   63 ++
 hw/virtio/vhost-user-fs.c             |    9 +-
 hw/virtio/vhost-user-gpio-pci.c       |   69 +++
 hw/virtio/vhost-user-gpio.c           |  411 +++++++++++++
 hw/virtio/vhost-user-i2c.c            |   10 +-
 hw/virtio/vhost-user-rng.c            |   10 +-
 hw/virtio/vhost-user-vsock.c          |    8 +-
 hw/virtio/vhost-user.c                |   16 +-
 hw/virtio/vhost-vsock-common.c        |    3 +-
 hw/virtio/vhost-vsock.c               |    8 +-
 hw/virtio/vhost.c                     |    6 +
 hw/virtio/virtio-stub.c               |   42 ++
 hw/virtio/virtio.c                    | 1049 ++++++++++++++++++++++++++++++++-
 monitor/hmp-cmds.c                    |  310 ++++++++++
 tests/qtest/libqos/virtio-gpio.c      |  171 ++++++
 tests/qtest/libqos/virtio.c           |    4 +-
 tests/qtest/qmp-cmd-test.c            |    1 +
 tests/qtest/qos-test.c                |    9 +-
 tests/qtest/vhost-user-test.c         |  177 +++++-
 MAINTAINERS                           |   12 +
 hmp-commands-info.hx                  |   70 +++
 hw/block/meson.build                  |    4 +-
 hw/virtio/Kconfig                     |    5 +
 hw/virtio/meson.build                 |    4 +
 hw/virtio/trace-events                |    9 +
 qapi/meson.build                      |    1 +
 qemu-options.hx                       |    2 +
 tests/data/acpi/pc/DSDT               |  Bin 5987 -> 6422 bytes
 tests/data/acpi/pc/DSDT.acpierst      |  Bin 5954 -> 6382 bytes
 tests/data/acpi/pc/DSDT.acpihmat      |  Bin 7312 -> 7747 bytes
 tests/data/acpi/pc/DSDT.bridge        |  Bin 8653 -> 9496 bytes
 tests/data/acpi/pc/DSDT.cphp          |  Bin 6451 -> 6886 bytes
 tests/data/acpi/pc/DSDT.dimmpxm       |  Bin 7641 -> 8076 bytes
 tests/data/acpi/pc/DSDT.hpbridge      |  Bin 5954 -> 6382 bytes
 tests/data/acpi/pc/DSDT.hpbrroot      |  Bin 3069 -> 3069 bytes
 tests/data/acpi/pc/DSDT.ipmikcs       |  Bin 6059 -> 6494 bytes
 tests/data/acpi/pc/DSDT.memhp         |  Bin 7346 -> 7781 bytes
 tests/data/acpi/pc/DSDT.nohpet        |  Bin 5845 -> 6280 bytes
 tests/data/acpi/pc/DSDT.numamem       |  Bin 5993 -> 6428 bytes
 tests/data/acpi/pc/DSDT.roothp        |  Bin 6195 -> 6656 bytes
 tests/data/acpi/q35/DSDT              |  Bin 8274 -> 8320 bytes
 tests/data/acpi/q35/DSDT.acpierst     |  Bin 8291 -> 8337 bytes
 tests/data/acpi/q35/DSDT.acpihmat     |  Bin 9599 -> 9645 bytes
 tests/data/acpi/q35/DSDT.applesmc     |  Bin 8320 -> 8366 bytes
 tests/data/acpi/q35/DSDT.bridge       |  Bin 10988 -> 11449 bytes
 tests/data/acpi/q35/DSDT.cphp         |  Bin 8738 -> 8784 bytes
 tests/data/acpi/q35/DSDT.cxl          |  Bin 9600 -> 9646 bytes
 tests/data/acpi/q35/DSDT.dimmpxm      |  Bin 9928 -> 9974 bytes
 tests/data/acpi/q35/DSDT.ipmibt       |  Bin 8349 -> 8395 bytes
 tests/data/acpi/q35/DSDT.ipmismbus    |  Bin 8363 -> 8409 bytes
 tests/data/acpi/q35/DSDT.ivrs         |  Bin 8291 -> 8337 bytes
 tests/data/acpi/q35/DSDT.memhp        |  Bin 9633 -> 9679 bytes
 tests/data/acpi/q35/DSDT.mmio64       |  Bin 9404 -> 9450 bytes
 tests/data/acpi/q35/DSDT.multi-bridge |  Bin 8568 -> 8640 bytes
 tests/data/acpi/q35/DSDT.nohpet       |  Bin 8132 -> 8178 bytes
 tests/data/acpi/q35/DSDT.numamem      |  Bin 8280 -> 8326 bytes
 tests/data/acpi/q35/DSDT.pvpanic-isa  |  Bin 8375 -> 8421 bytes
 tests/data/acpi/q35/DSDT.tis.tpm12    |  Bin 8880 -> 8926 bytes
 tests/data/acpi/q35/DSDT.tis.tpm2     |  Bin 8906 -> 8952 bytes
 tests/data/acpi/q35/DSDT.viot         |  Bin 9383 -> 9429 bytes
 tests/data/acpi/q35/DSDT.xapic        |  Bin 35637 -> 35683 bytes
 tests/data/acpi/virt/GTDT             |  Bin 96 -> 96 bytes
 tests/data/acpi/virt/GTDT.memhp       |  Bin 96 -> 96 bytes
 tests/data/acpi/virt/GTDT.numamem     |  Bin 96 -> 96 bytes
 tests/qtest/libqos/meson.build        |    1 +
 87 files changed, 3796 insertions(+), 289 deletions(-)
 create mode 100644 qapi/virtio.json
 create mode 100644 include/hw/virtio/vhost-user-gpio.h
 create mode 100644 include/hw/virtio/virtio-blk-common.h
 create mode 100644 tests/qtest/libqos/virtio-gpio.h
 create mode 100644 hw/block/virtio-blk-common.c
 create mode 100644 hw/virtio/vhost-user-gpio-pci.c
 create mode 100644 hw/virtio/vhost-user-gpio.c
 create mode 100644 hw/virtio/virtio-stub.c
 create mode 100644 tests/qtest/libqos/virtio-gpio.c


