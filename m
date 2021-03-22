Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D68CB3449C9
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 16:53:15 +0100 (CET)
Received: from localhost ([::1]:48350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOMri-0004ml-LA
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 11:53:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lOMjS-0004Me-RH
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 11:44:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lOMjQ-0006o1-Pj
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 11:44:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616427880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=AIouO5BhupgHndoFVCtKtwQr/XbvtxuQGxaW73eOwqM=;
 b=EOW1ulNCYctowYVwy+qnHu0lOrE89WjNxSvwQlyM+nkVglrxJIw+lRrQGMc+F18/CMjvGW
 iKxOf5rZUTiwjahe8sQK/MCAoFbiGLhC2S1VAlaQIwxJFSW8t1DcOwyQ+6QACwwG83I76v
 vf37njfeCNvtekRjzC7RJXw61O2UMOs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-LJoPenUJPqmYxPamATer7Q-1; Mon, 22 Mar 2021 11:44:38 -0400
X-MC-Unique: LJoPenUJPqmYxPamATer7Q-1
Received: by mail-wr1-f69.google.com with SMTP id h30so26369528wrh.10
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 08:44:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=AIouO5BhupgHndoFVCtKtwQr/XbvtxuQGxaW73eOwqM=;
 b=avezPqgTf9pWbkk/HMp5gHhDf1ow+kJzZwsV6sCPdpqP2xgT+jfou1dh2fALUgDisI
 ZT4u3vn4inoT1qOONy7mUl4Ay9/l0zPM/tkAkXzDQiB+C6hMMNQY1N8c+fpk0ZglRRTP
 AffHTs8ZNA/D2VSgS06aAGx9CBiIgOXY/ZEEk5FcBg5u5EnrrA57YLvzIRt+PIIAB3ch
 iKQdxH17jUmys/GE+PlaeM+EiAFoBFPDantz84VWyyTu+kgqwd++M5EnY6vrJO/WjkCd
 65PDoH+fsIg30wSG7M8LsZobAX75KT4Dvevm/3U91nHIb+HHUE0gJb0GuynsvsZAeRSV
 n8wg==
X-Gm-Message-State: AOAM5307u45NrtKMxUHBg9xz6VevhYcBS9fG4BlBXFEvdGk3hza8yodQ
 Mzc7JsGeurUF0MSsQOJsmFlLPFXde3w03uYoeEPYcOsHaz08UG7gQTJqo+KBHEqRKX1NdDS1wwY
 2W0Mg3AdV++e+4gubpEG9pjTyMmm0b/6s6H0O72CS4Ig7dBzdqeEbtplGG8fo
X-Received: by 2002:a5d:6304:: with SMTP id i4mr140090wru.155.1616427876856;
 Mon, 22 Mar 2021 08:44:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyz93HfVPzLz5n7l43dbSIk66dEAqbY6Cn5L22OFWkHmnR+BPv7f00R52ul+qk/immWUl6R7A==
X-Received: by 2002:a5d:6304:: with SMTP id i4mr140072wru.155.1616427876678;
 Mon, 22 Mar 2021 08:44:36 -0700 (PDT)
Received: from redhat.com ([2a10:800e:f0d3:0:b69b:9fb8:3947:5636])
 by smtp.gmail.com with ESMTPSA id j20sm16154446wmp.30.2021.03.22.08.44.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 08:44:36 -0700 (PDT)
Date: Mon, 22 Mar 2021 11:44:34 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/20] pc,virtio,pci: fixes, features
Message-ID: <20210322154417.524229-1-mst@redhat.com>
MIME-Version: 1.0
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

The following changes since commit f0f20022a0c744930935fdb7020a8c18347d391a:

  Merge remote-tracking branch 'remotes/thuth-gitlab/tags/pull-request-2021-03-21' into staging (2021-03-22 10:05:45 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream

for you to fetch changes up to 5971d4a968d51a80daaad53ddaec2b285115af62:

  acpi: Move setters/getters of oem fields to X86MachineState (2021-03-22 11:39:02 -0400)

----------------------------------------------------------------
pc,virtio,pci: fixes, features

Fixes all over the place.
ACPI index support.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

----------------------------------------------------------------
David Hildenbrand (4):
      acpi: Set proper maximum size for "etc/table-loader" blob
      microvm: Don't open-code "etc/table-loader"
      acpi: Move maximum size logic into acpi_add_rom_blob()
      acpi: Set proper maximum size for "etc/acpi/rsdp" blob

Greg Kurz (6):
      vhost-user: Drop misleading EAGAIN checks in slave_read()
      vhost-user: Fix double-close on slave_read() error path
      vhost-user: Factor out duplicated slave_fd teardown code
      vhost-user: Convert slave channel to QIOChannelSocket
      vhost-user: Introduce nested event loop in vhost_user_read()
      vhost-user: Monitor slave channel in vhost_user_read()

Igor Mammedov (6):
      tests: acpi: temporary whitelist DSDT changes
      pci: introduce acpi-index property for PCI device
      pci: acpi: ensure that acpi-index is unique
      acpi: add aml_to_decimalstring() and aml_call6() helpers
      pci: acpi: add _DSM method to PCI devices
      tests: acpi: update expected blobs

Isaku Yamahata (1):
      acpi:piix4, vt82c686: reinitialize acpi PM device on reset

Laurent Vivier (1):
      virtio: Fix virtio_mmio_read()/virtio_mmio_write()

Marian Postevca (1):
      acpi: Move setters/getters of oem fields to X86MachineState

Wang Liang (1):
      virtio-pmem: fix virtio_pmem_resp assign problem

 include/hw/acpi/aml-build.h      |   6 +-
 include/hw/acpi/pci.h            |   1 +
 include/hw/acpi/pcihp.h          |   9 +-
 include/hw/acpi/utils.h          |   3 +-
 include/hw/i386/microvm.h        |   4 -
 include/hw/i386/pc.h             |   4 -
 include/hw/i386/x86.h            |   4 +
 include/hw/pci/pci.h             |   1 +
 hw/acpi/aml-build.c              |  28 +++++
 hw/acpi/pci.c                    |   1 -
 hw/acpi/pcihp.c                  | 104 ++++++++++++++++++-
 hw/acpi/piix4.c                  |  10 +-
 hw/acpi/utils.c                  |  17 ++-
 hw/arm/virt-acpi-build.c         |  12 +--
 hw/i386/acpi-build.c             | 173 +++++++++++++++++++++++++------
 hw/i386/acpi-microvm.c           |  32 +++---
 hw/i386/microvm.c                |  66 ------------
 hw/i386/pc.c                     |  63 ------------
 hw/i386/x86.c                    |  64 ++++++++++++
 hw/isa/vt82c686.c                |   5 +
 hw/pci/pci.c                     |   1 +
 hw/virtio/vhost-user.c           | 217 +++++++++++++++++++++++++--------------
 hw/virtio/virtio-mmio.c          |  74 +++++++++----
 hw/virtio/virtio-pmem.c          |   2 +-
 hw/acpi/trace-events             |   2 +
 tests/data/acpi/pc/DSDT          | Bin 5065 -> 6002 bytes
 tests/data/acpi/pc/DSDT.acpihmat | Bin 6390 -> 7327 bytes
 tests/data/acpi/pc/DSDT.bridge   | Bin 6924 -> 8668 bytes
 tests/data/acpi/pc/DSDT.cphp     | Bin 5529 -> 6466 bytes
 tests/data/acpi/pc/DSDT.dimmpxm  | Bin 6719 -> 7656 bytes
 tests/data/acpi/pc/DSDT.hpbridge | Bin 5026 -> 5969 bytes
 tests/data/acpi/pc/DSDT.ipmikcs  | Bin 5137 -> 6074 bytes
 tests/data/acpi/pc/DSDT.memhp    | Bin 6424 -> 7361 bytes
 tests/data/acpi/pc/DSDT.nohpet   | Bin 4923 -> 5860 bytes
 tests/data/acpi/pc/DSDT.numamem  | Bin 5071 -> 6008 bytes
 tests/data/acpi/pc/DSDT.roothp   | Bin 5261 -> 6210 bytes
 36 files changed, 595 insertions(+), 308 deletions(-)


