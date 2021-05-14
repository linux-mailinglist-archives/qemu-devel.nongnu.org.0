Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F48380DC5
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 18:09:12 +0200 (CEST)
Received: from localhost ([::1]:47796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhaND-0005tx-An
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 12:09:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lhaIQ-0005Yx-8s
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:04:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lhaIO-0005AN-K0
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:04:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621008252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=pOBliH+1NcHu4Boph9eF167LF/oPl1NQkz8j3KCRVoc=;
 b=EQZJ7pvJdT26dSFe7Q1I/z+2hPwbAHuSArEYqQZkCV74PdJYt7SB90GSeIoRJAcCpaYr4H
 s+0667uRF4DiyJ8uvRISQPJQ+P0UUAa2M+QC8MAeBGbeA7o+dx86qX5rMWsAmYjvhuZ71f
 qSRJIsPZBq6pli0GXIm6wraRDwG4yAE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-Go27_PYdPX2U4rTSZ5CXAA-1; Fri, 14 May 2021 12:04:10 -0400
X-MC-Unique: Go27_PYdPX2U4rTSZ5CXAA-1
Received: by mail-wm1-f72.google.com with SMTP id
 b206-20020a1c1bd70000b02901713122405eso24750wmb.1
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 09:04:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:content-transfer-encoding;
 bh=pOBliH+1NcHu4Boph9eF167LF/oPl1NQkz8j3KCRVoc=;
 b=EVzf6wunw5uO8HqQvKgc/jc5VxAlIYsqDSJZWSJyr5n2mBmOGsd7TRYdYYK+bH0nVf
 L9QSjhSiCoics4PuJp7NtOW8Gzb6awO+1MhAYsgg2iAVYdpdD3fgVlTUSTq+zVXPt4Kz
 eohGa4ANjQ0Bi+Hjesmkvatx4WO6gK+HUU3y59T/OaUNniybwTpqOCpNHkKvqp6KLgFB
 CUHhfSHtWaWzNYRU2WugIXZow7Zh4EUNV13ZX+oRDEXVXt8zn1JoprjhLtHLzVwEbAKD
 Ho++n35NKQk92owngG68o6acMejifXWisN74bAVYhm5LP7tOnDw1p0FxdTe+RYyq7Y7Z
 RDSg==
X-Gm-Message-State: AOAM531/YPH2IffZaOr97UaZYjLuRLz9DOdHmpAnDpqy0ZUANqe9ozBp
 cD/6Qna9sK5W05VjEku7mSnzjyIPAaBqQITxmmut1Qb8DpG1tsMA/qw7VSabO7wblJZ3+wJOfjL
 GNTws9ZwcWABUdz/VpZ81jVDSq9dm/NedA67vDC+JXGQxFaNT/ak4jMKgLHar
X-Received: by 2002:a5d:64e6:: with SMTP id g6mr58466656wri.216.1621008248844; 
 Fri, 14 May 2021 09:04:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7rKyaAVeGxrxSXB6QRoG7N4laWaVF0C5NSmLZmvRq14jQ1WGAp4sy2pyU/fmhqP6+SsKh8Q==
X-Received: by 2002:a5d:64e6:: with SMTP id g6mr58466625wri.216.1621008248528; 
 Fri, 14 May 2021 09:04:08 -0700 (PDT)
Received: from redhat.com ([2a10:800c:1fa6:0:3809:fe0c:bb87:250e])
 by smtp.gmail.com with ESMTPSA id y20sm380775wmi.0.2021.05.14.09.04.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 09:04:07 -0700 (PDT)
Date: Fri, 14 May 2021 12:04:05 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/16] pc,pci,virtio: bugfixes, improvements
Message-ID: <20210514160245.91918-1-mst@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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

The following changes since commit 609d7596524ab204ccd71ef42c9eee4c7c338ea4:

  Update version for v6.0.0 release (2021-04-29 18:05:29 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream

for you to fetch changes up to f7a6df5f5bf3acc219352a1b25573ae2082d7e42:

  Fix build with 64 bits time_t (2021-05-14 10:26:18 -0400)

----------------------------------------------------------------
pc,pci,virtio: bugfixes, improvements

Fixes all over the place. Faster boot for virtio. ioeventfd support for
mmio.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

----------------------------------------------------------------
Fabrice Fontaine (1):
      Fix build with 64 bits time_t

Greg Kurz (5):
      virtio-blk: Fix rollback path in virtio_blk_data_plane_start()
      virtio-blk: Configure all host notifiers in a single MR transaction
      virtio-scsi: Set host notifiers and callbacks separately
      virtio-scsi: Configure all host notifiers in a single MR transaction
      checkpatch: Fix use of uninitialized value

Igor Mammedov (1):
      x86: acpi: use offset instead of pointer when using build_header()

Jean-Philippe Brucker (1):
      amd_iommu: Fix pte_override_page_mask()

Maciej S. Szmigiero (1):
      pc-dimm: remove unnecessary get_vmstate_memory_region() method

Pavel Dovgalyuk (1):
      hw/virtio: enable ioeventfd configuring for mmio

Philippe Mathieu-Daudé (3):
      hw/virtio: Pass virtio_feature_get_config_size() a const argument
      virtio-blk: Constify VirtIOFeature feature_sizes[]
      virtio-net: Constify VirtIOFeature feature_sizes[]

Roman Kapl (1):
      amd_iommu: fix wrong MMIO operations

Vincent Bernat (1):
      hw/smbios: support for type 41 (onboard devices extended information)

Zenghui Yu (1):
      vhost-vdpa: Make vhost_vdpa_get_device_id() static

 include/hw/firmware/smbios.h    |  14 ++++-
 include/hw/mem/pc-dimm.h        |   5 --
 include/hw/virtio/vhost-vdpa.h  |   2 -
 include/hw/virtio/virtio-mmio.h |   5 ++
 include/hw/virtio/virtio.h      |   2 +-
 contrib/vhost-user-input/main.c |   8 ++-
 hw/acpi/aml-build.c             |  15 +++--
 hw/arm/virt.c                   |   7 ++-
 hw/block/dataplane/virtio-blk.c |  36 +++++++++++-
 hw/block/virtio-blk.c           |   2 +-
 hw/i386/acpi-build.c            |   8 ++-
 hw/i386/amd_iommu.c             |  10 ++--
 hw/i386/fw_cfg.c                |   4 +-
 hw/input/virtio-input-host.c    |   5 +-
 hw/mem/pc-dimm.c                |  33 +++++------
 hw/net/virtio-net.c             |   2 +-
 hw/scsi/virtio-scsi-dataplane.c |  56 ++++++++++++------
 hw/smbios/smbios.c              | 124 +++++++++++++++++++++++++++++++++++++++-
 hw/virtio/vhost-vdpa.c          |   4 +-
 hw/virtio/virtio-mmio.c         |  11 +++-
 hw/virtio/virtio.c              |   2 +-
 qemu-options.hx                 |  30 +++++++++-
 scripts/checkpatch.pl           |   1 +
 23 files changed, 311 insertions(+), 75 deletions(-)


