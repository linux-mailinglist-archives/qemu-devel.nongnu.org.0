Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 809D22F921C
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jan 2021 12:51:37 +0100 (CET)
Received: from localhost ([::1]:50330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l16am-0003FY-1K
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 06:51:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l16Vn-0001UV-Pd
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 06:46:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l16Vk-00088C-2E
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 06:46:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610883981;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=X3tkpiOFeqlz1WB6GN2TGK/DlMbcUg6rkqqpPZ74S3k=;
 b=Hepa0RFltljAlfldDycYA7K3YHi38u6gSO7aH2r+zwoZHg+wTkP0Abe0IL0yULuMN/T1Hy
 78bsahr7HVsWIN1IbU7DNfWq3EJUlKXhCmtsnFj4ilks3jUS516ru4ozHIMjg9HPEvYDZD
 YDMMk2kZ4S//6aj2kiXEIp3dqmHpsUc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-dkLDyJAOMIu9S6hUBY_sdA-1; Sun, 17 Jan 2021 06:46:20 -0500
X-MC-Unique: dkLDyJAOMIu9S6hUBY_sdA-1
Received: by mail-wr1-f71.google.com with SMTP id i4so6787069wrm.21
 for <qemu-devel@nongnu.org>; Sun, 17 Jan 2021 03:46:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=X3tkpiOFeqlz1WB6GN2TGK/DlMbcUg6rkqqpPZ74S3k=;
 b=MZ1f1GsHW4HZGCiMirX7pql4Vf3a2cDEVM+vrNvdKOaLlSD+UoRykoTj5z6BIsvILS
 ofrSteLwDU++QZo3v6S4T4JjOyfHW/+nyNfDLKtMnNMIYbMeQSUuposR5M1qslY4YA44
 5tXLpPx7hhJz2tP29m4EDceo3wR18bz2ZostyhCOdYFhkHMrjUEWmJFTLk2DNYDRYmTd
 FO+qR/LChxoHj9JpDbeyz95po+qDOHSyGwwy3Z4EwTJU46XCmED4fIWkTgxKUaQ5w7dx
 wPrm5YbujRHeFzAbndDKKv85DTWQSpeOo6SXzTmbhCnevjyxN7dlDynj6/9+kyzIMAW1
 fXkA==
X-Gm-Message-State: AOAM530QF8Ww8AA2sRWQStXieBwHISwC0mGQJPbhUtxjyBwo+ayBgsaX
 qioJZMUo4TS9bKFac8EHxMKdQwlXrU2hwLbnIt0kgi13HInqnHTmON20STwP5tbjXeOfhbJ/9rv
 RWVBXyVnC3V+pYD7zhPRahGOOJYpUq360oxoBnVtfMBl9k5BJsKaDOrSGIUsW
X-Received: by 2002:adf:e410:: with SMTP id g16mr21575203wrm.364.1610883978586; 
 Sun, 17 Jan 2021 03:46:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwHLR6YhrZzglX3ulERUHkeLdy+DkeIB+ltzvkAY8A4oHn1xKcO+BQz1QqSCie+zeUJrXJF+g==
X-Received: by 2002:adf:e410:: with SMTP id g16mr21575198wrm.364.1610883978377; 
 Sun, 17 Jan 2021 03:46:18 -0800 (PST)
Received: from redhat.com (bzq-79-176-30-58.red.bezeqint.net. [79.176.30.58])
 by smtp.gmail.com with ESMTPSA id
 h15sm22247949wru.4.2021.01.17.03.46.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jan 2021 03:46:17 -0800 (PST)
Date: Sun, 17 Jan 2021 06:46:16 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/10] pc,pci,virtio: fixes, features
Message-ID: <20210117114519.539647-1-mst@redhat.com>
MIME-Version: 1.0
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

The following changes since commit f8e1d8852e393b3fd524fb005e38590063d99bc0:

  Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20210112-1' into staging (2021-01-12 21:23:25 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream

for you to fetch changes up to ccee1a8140211c569156ae649474cc520eb2a36b:

  acpi: Update _DSM method in expected files (2021-01-17 06:42:54 -0500)

----------------------------------------------------------------
pc,pci,virtio: fixes, features

Fixes all over the place.
PXB support for ARM.
boot index for vhost-user-fs.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

----------------------------------------------------------------
Jiahui Cen (8):
      acpi: Allow DSDT acpi table changes
      acpi: Fix unmatched expected DSDT.pxb file
      acpi: Add addr offset in build_crs
      acpi/gpex: Inform os to keep firmware resource map
      acpi/gpex: Exclude pxb's resources from PCI0
      Kconfig: Compile PXB for ARM_VIRT
      acpi: Enable pxb unit-test for ARM virt machine
      acpi: Update _DSM method in expected files

Laszlo Ersek (1):
      vhost-user-fs: add the "bootindex" property

Roman Kagan (1):
      pci/shpc: don't push attention button when ejecting powered-off device

 include/hw/acpi/aml-build.h       |   4 +-
 include/hw/virtio/vhost-user-fs.h |   1 +
 hw/acpi/aml-build.c               |  18 ++++----
 hw/i386/acpi-build.c              |   3 +-
 hw/pci-host/gpex-acpi.c           |  87 +++++++++++++++++++++++++++-----------
 hw/pci/shpc.c                     |   4 +-
 hw/virtio/vhost-user-fs-pci.c     |   2 +
 hw/virtio/vhost-user-fs.c         |  10 +++++
 tests/qtest/bios-tables-test.c    |   4 --
 hw/pci-bridge/Kconfig             |   2 +-
 tests/data/acpi/microvm/DSDT.pcie | Bin 3023 -> 3031 bytes
 tests/data/acpi/virt/DSDT         | Bin 5196 -> 5204 bytes
 tests/data/acpi/virt/DSDT.memhp   | Bin 6557 -> 6565 bytes
 tests/data/acpi/virt/DSDT.numamem | Bin 5196 -> 5204 bytes
 tests/data/acpi/virt/DSDT.pxb     | Bin 7802 -> 7689 bytes
 15 files changed, 94 insertions(+), 41 deletions(-)


