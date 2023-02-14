Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9FE6971F1
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 00:44:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pS4xH-0005BA-3b; Tue, 14 Feb 2023 18:43:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1pS4xF-0005Al-I8
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 18:43:21 -0500
Received: from dfw.source.kernel.org ([139.178.84.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1pS4xD-0003hB-Qe
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 18:43:21 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AD84E61927;
 Tue, 14 Feb 2023 23:43:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 986BFC433EF;
 Tue, 14 Feb 2023 23:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676418190;
 bh=XKs9ASBb7bqLJ2SUuFDAAjNjg/h8aJ+h+8BSZhmQ70o=;
 h=Date:From:To:cc:Subject:From;
 b=VYqkNCi0bFRuSs3LV6A3rIXtQ6cEBYDGBWsDEGr0E4qWvgmb07RQabCSb/PiUEy+H
 Cvi0DdjuK+2PBfiLnO2qCF9gG/pKeAavIoBSurAIDsb2PDRgFLnqlechEpA8P6X3Xr
 pvub031Xmz9MSO7sxkeX/KlVp3B7g40gDA5bpIivwE+GpOZrOOfK9SC+zaDPAuPuzs
 s0A/X0kKDcgGX1mll7WgcrUhRHNgn7VZ7h28PZ7oSRsr9Wsva88aaOS45Te8WOCwcK
 72y4lyXPFOGTgJVI2i1lPwlDrmrSd0sGHJHdpWQno3mTxoqRL6BzljnxNP2gljF9Y8
 ZTmrs1H7UkmtA==
Date: Tue, 14 Feb 2023 15:43:08 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: peter.maydell@linaro.org
cc: sstabellini@kernel.org, qemu-devel@nongnu.org
Subject: [PULL v2 0/10] xenpvh
Message-ID: <alpine.DEB.2.22.394.2302141541100.2025117@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=sstabellini@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The following changes since commit 6a50f64ca01d0a7b97f14f069762bfd88160f31e:

  Merge tag 'pull-request-2023-02-14' of https://gitlab.com/thuth/qemu into staging (2023-02-14 14:46:10 +0000)

are available in the Git repository at:

  https://gitlab.com/sstabellini/qemu xenpvh2

for you to fetch changes up to 86b01d58ca2840bea6e4e7260aad450a660fbd46:

  meson.build: enable xenpv machine build for ARM (2023-02-14 15:39:25 -0800)

----------------------------------------------------------------
Stefano Stabellini (5):
      hw/i386/xen/xen-hvm: move x86-specific fields out of XenIOState
      xen-hvm: reorganize xen-hvm and move common function to xen-hvm-common
      include/hw/xen/xen_common: return error from xen_create_ioreq_server
      hw/xen/xen-hvm-common: skip ioreq creation on ioreq registration failure
      meson.build: do not set have_xen_pci_passthrough for aarch64 targets

Vikram Garhwal (5):
      hw/i386/xen/: move xen-mapcache.c to hw/xen/
      hw/i386/xen: rearrange xen_hvm_init_pc
      hw/xen/xen-hvm-common: Use g_new and error_report
      hw/arm: introduce xenpvh machine
      meson.build: enable xenpv machine build for ARM

 docs/system/arm/xenpvh.rst       |   34 ++
 docs/system/target-arm.rst       |    1 +
 hw/arm/meson.build               |    2 +
 hw/arm/xen_arm.c                 |  182 +++++++
 hw/i386/meson.build              |    1 +
 hw/i386/xen/meson.build          |    1 -
 hw/i386/xen/trace-events         |   19 -
 hw/i386/xen/xen-hvm.c            | 1078 ++++----------------------------------
 hw/xen/meson.build               |    7 +
 hw/xen/trace-events              |   19 +
 hw/xen/xen-hvm-common.c          |  893 +++++++++++++++++++++++++++++++
 hw/{i386 => }/xen/xen-mapcache.c |    0
 include/hw/arm/xen_arch_hvm.h    |    9 +
 include/hw/i386/xen_arch_hvm.h   |   11 +
 include/hw/xen/arch_hvm.h        |    5 +
 include/hw/xen/xen-hvm-common.h  |   98 ++++
 include/hw/xen/xen_common.h      |   13 +-
 meson.build                      |    4 +-
 18 files changed, 1364 insertions(+), 1013 deletions(-)
 create mode 100644 docs/system/arm/xenpvh.rst
 create mode 100644 hw/arm/xen_arm.c
 create mode 100644 hw/xen/xen-hvm-common.c
 rename hw/{i386 => }/xen/xen-mapcache.c (100%)
 create mode 100644 include/hw/arm/xen_arch_hvm.h
 create mode 100644 include/hw/i386/xen_arch_hvm.h
 create mode 100644 include/hw/xen/arch_hvm.h
 create mode 100644 include/hw/xen/xen-hvm-common.h

