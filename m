Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9A7433497
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 13:23:21 +0200 (CEST)
Received: from localhost ([::1]:44156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcnDF-0002xG-0U
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 07:23:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcn9p-0008GC-M9
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 07:19:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcn9n-0001gX-OX
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 07:19:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634642385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=KH5bye/VoLjSG34IFM9ih+WCkf3rOMLp0kqSp1YxNo8=;
 b=PJUzqOHh2BhUvOqm72C5HAoA9unx6H/FNIJgJU2gXlQwP6vPPDO+hYhwhoDcRpvHrGgFJS
 pHOP2daAIge44zBLTxlLUqvMbLSgCVSOAh3dWQRyXsTU5S5QmUx+hYxwxTeY1x7ffTnMx9
 6zymdgM8Mc2kNQ5pl0d0lsuJ4GhDV9I=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-30-QYo0boF_M322_GZycJcdVA-1; Tue, 19 Oct 2021 07:19:42 -0400
X-MC-Unique: QYo0boF_M322_GZycJcdVA-1
Received: by mail-ed1-f71.google.com with SMTP id
 v2-20020a50f082000000b003db24e28d59so17253193edl.5
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 04:19:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:content-transfer-encoding;
 bh=KH5bye/VoLjSG34IFM9ih+WCkf3rOMLp0kqSp1YxNo8=;
 b=Fgw6CKIMLnG4AEDfhAZQ5h3fZOutJHqL7cUC8gw99GVfgqFoWJQfug+c9xx+OTrc02
 ojr2a9mCRIqRNaARHmp15TWQCKncBYoLglYcm8zWLVhzE8O3wGAHbr/UffdDqOmIyMay
 rQ2IlLp4Zcc+FHE237GQYnyidnFECKF9ipECsPHfkiWC9u/QswoRbGSQOvQ6PumPSOjq
 5vfpZ9bXvWvEae8CSmZLQVJOhe56zOSoQbrerk1gOCTICNcoIwfpydwcr2X34M2W+ewl
 pE83pDWgkLngXGAnQ7Isujbg+B80Xx4qYvwoFsmNDPqXS9GOD76zja9qB5f23PJLAqA2
 QMtA==
X-Gm-Message-State: AOAM530KyC6MQ05qsYpurf9MESQohRGUu6ZdauBXd58P+b2dREqtafYD
 4SEQzu7eQD/RAr8yQSmDZP1EQxjJ1Dh1m098NC0jxP7xFdtxnKoFHMOVT7vioPybB3Bq41wR2+7
 Eb+aKYd9Wuza4g1SoQ1dtbDGz07SkFjdo06qnGn7vPGP3ojP2nSfqOKhF++n+
X-Received: by 2002:a17:907:9687:: with SMTP id
 hd7mr35481934ejc.535.1634642380496; 
 Tue, 19 Oct 2021 04:19:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwIc2bkZdz1VmVLAk5oWaTZmjpHh9p1b5IzBCcLiWhK1w2mu5A+p6NVbzpzoZZClV1835/+LA==
X-Received: by 2002:a17:907:9687:: with SMTP id
 hd7mr35481906ejc.535.1634642380215; 
 Tue, 19 Oct 2021 04:19:40 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id b7sm1561098ejl.10.2021.10.19.04.19.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 04:19:39 -0700 (PDT)
Date: Tue, 19 Oct 2021 07:19:37 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/29] pc,pci,virtio: features, fixes
Message-ID: <20211019111923.679826-1-mst@redhat.com>
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
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The following changes since commit 9c050b661d3a43dfe2fd44106e559b39706d1296:

  Merge remote-tracking branch 'remotes/philmd/tags/mips-20211018' into staging (2021-10-18 09:16:51 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream

for you to fetch changes up to bf2dd99b7d536cdba157fd6687810ce7b8340ccc:

  failover: fix a regression introduced by JSON'ification of -device (2021-10-19 07:15:34 -0400)

----------------------------------------------------------------
pc,pci,virtio: features, fixes

vhost user rng
Fixes, cleanups all over the place.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

----------------------------------------------------------------
Ani Sinha (3):
      tests/acpi/bios-tables-test: add and allow changes to a new q35 DSDT table blob
      tests/acpi/pcihp: add unit tests for hotplug on multifunction bridges for q35
      tests/acpi/bios-tables-test: update DSDT blob for multifunction bridge test

David Hildenbrand (1):
      libvhost-user: fix VHOST_USER_REM_MEM_REG skipping mmap_addr

Eric Auger (2):
      virtio-iommu: Remove the non transitional name
      virtio-iommu: Drop base_name and change generic_name

Eugenio Pérez (3):
      vdpa: Skip protected ram IOMMU mappings
      vdpa: Add vhost_vdpa_section_end
      vdpa: Check for iova range at mappings changes

Igor Mammedov (15):
      tests: acpi: dump table with failed checksum
      tests: qtest: add qtest_has_accel() to check if tested binary supports accelerator
      tests: acpi: whitelist expected tables for acpi/q35/xapic testcase
      tests: acpi: q35: test for x2APIC entries in SRAT
      tests: acpi: update expected tables blobs
      tests: acpi: whitelist new expected table tests/data/acpi/q35/DMAR.dmar
      tests: acpi: add testcase for intel_iommu (DMAR table)
      tests: acpi: add expected blob for DMAR table
      tests: acpi: whitelist expected blobs for new acpi/q35/ivrs testcase
      tests: acpi: add testcase for amd-iommu (IVRS table)
      tests: acpi: update expected blobs
      tests: acpi: arm/virt: drop redundant test_acpi_one() in test_acpi_virt_tcg()
      tests: arm-cpu-features: use qtest_has_kvm() API
      tests: migration-test: use qtest_has_accel() API
      tests: bios-tables-test: use qtest_has_accel() API to register TCG only tests

Laurent Vivier (1):
      failover: fix a regression introduced by JSON'ification of -device

Mathieu Poirier (3):
      vhost-user-rng: Add vhost-user-rng implementation
      vhost-user-rng-pci: Add vhost-user-rng-pci implementation
      docs: Add documentation for vhost based RNG implementation

Xueming Li (1):
      vhost-user: fix duplicated notifier MR init

 include/hw/virtio/vhost-user-rng.h        |  33 ++++
 include/hw/virtio/vhost-vdpa.h            |   2 +
 include/hw/virtio/virtio-iommu.h          |   2 +-
 tests/qtest/libqos/libqtest.h             |   8 +
 hw/net/virtio-net.c                       |  24 ++-
 hw/virtio/vhost-user-rng-pci.c            |  79 ++++++++
 hw/virtio/vhost-user-rng.c                | 289 ++++++++++++++++++++++++++++++
 hw/virtio/vhost-user.c                    |   5 +-
 hw/virtio/vhost-vdpa.c                    |  81 ++++++---
 hw/virtio/virtio-iommu-pci.c              |   4 +-
 subprojects/libvhost-user/libvhost-user.c |   1 +
 tests/qtest/acpi-utils.c                  |  14 ++
 tests/qtest/arm-cpu-features.c            |  29 +--
 tests/qtest/bios-tables-test.c            |  90 ++++++++--
 tests/qtest/libqtest.c                    |  27 +++
 tests/qtest/migration-test.c              |  15 +-
 docs/system/device-emulation.rst          |   1 +
 docs/system/devices/vhost-user-rng.rst    |  39 ++++
 hw/virtio/Kconfig                         |   5 +
 hw/virtio/meson.build                     |   2 +
 hw/virtio/trace-events                    |   1 +
 meson.build                               |   6 +
 tests/data/acpi/q35/APIC.xapic            | Bin 0 -> 2686 bytes
 tests/data/acpi/q35/DMAR.dmar             | Bin 0 -> 120 bytes
 tests/data/acpi/q35/DSDT.ivrs             | Bin 0 -> 8306 bytes
 tests/data/acpi/q35/DSDT.multi-bridge     | Bin 0 -> 8583 bytes
 tests/data/acpi/q35/DSDT.xapic            | Bin 0 -> 35652 bytes
 tests/data/acpi/q35/FACP.xapic            | Bin 0 -> 244 bytes
 tests/data/acpi/q35/IVRS.ivrs             | Bin 0 -> 104 bytes
 tests/data/acpi/q35/SRAT.xapic            | Bin 0 -> 5080 bytes
 30 files changed, 672 insertions(+), 85 deletions(-)
 create mode 100644 include/hw/virtio/vhost-user-rng.h
 create mode 100644 hw/virtio/vhost-user-rng-pci.c
 create mode 100644 hw/virtio/vhost-user-rng.c
 create mode 100644 docs/system/devices/vhost-user-rng.rst
 create mode 100644 tests/data/acpi/q35/APIC.xapic
 create mode 100644 tests/data/acpi/q35/DMAR.dmar
 create mode 100644 tests/data/acpi/q35/DSDT.ivrs
 create mode 100644 tests/data/acpi/q35/DSDT.multi-bridge
 create mode 100644 tests/data/acpi/q35/DSDT.xapic
 create mode 100644 tests/data/acpi/q35/FACP.xapic
 create mode 100644 tests/data/acpi/q35/IVRS.ivrs
 create mode 100644 tests/data/acpi/q35/SRAT.xapic


