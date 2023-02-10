Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF41D692A16
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 23:28:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQbra-0002Cc-Pb; Fri, 10 Feb 2023 17:27:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1pQbrY-0002CQ-8v
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 17:27:24 -0500
Received: from ams.source.kernel.org ([145.40.68.75])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1pQbrW-0007Wh-0F
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 17:27:23 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1D7E3B825FC;
 Fri, 10 Feb 2023 22:27:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66D21C433EF;
 Fri, 10 Feb 2023 22:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676068031;
 bh=rRv0xdCzFAKIzZZ+AQhtkDFcCCKYHz5v68d2WAeBPpg=;
 h=Date:From:To:cc:Subject:From;
 b=cTcOSOpJYYLjLe8tksGkR5S34ucCkxg1iOs9F1WEvegiPqJDCupkNrdfHvvOdFafj
 d5JilkPhRYN+utHbVE1dwe4pSrtMUB9qsq0tP71lvbhOdopZLpmXxlIb7Zv7y/ZuE4
 YOOiQLByl9nSCNPRWCRh/6iEVezkSDeaFUBDrop+nMK+ZVoNQG7LJ2Nqgfip5a/8gW
 31phu9Yyk2o8nT6FWDDBRrj9GgL0WIzksALgvEx0uBUP3rndTdvlvHKrcrJH+tLbek
 wLDFPQ7uSAGaT36PgYUssk9H1XtQlDepeBDiK+KHEctbsrH7MxlndV0rQY2Qebg5aR
 PezFUenfV9Ocg==
Date: Fri, 10 Feb 2023 14:27:09 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: qemu-devel@nongnu.org
cc: sstabellini@kernel.org, peter.maydell@linaro.org
Subject: [PULL 00/10] xenpvh machine
Message-ID: <alpine.DEB.2.22.394.2302101420510.4661@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=145.40.68.75; envelope-from=sstabellini@kernel.org;
 helo=ams.source.kernel.org
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

The following changes since commit 90595cc9396bb910b148391fea2e78dd8c6c8b27:

  Merge tag 'migration-20230209-pull-request' of https://gitlab.com/juan.quintela/qemu into staging (2023-02-10 10:50:21 +0000)

are available in the Git repository at:

  https://gitlab.com/sstabellini/qemu.git xenpvh

for you to fetch changes up to 3f8ee848693872e3783cdcf2862be5421bb9cbcb:

  meson.build: enable xenpv machine build for ARM (2023-02-10 14:23:47 -0800)

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

