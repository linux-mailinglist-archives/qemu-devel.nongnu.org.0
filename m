Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3BAB6715A7
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 08:57:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI3FX-0001rD-5h; Wed, 18 Jan 2023 02:52:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pI3FU-0001qD-GW; Wed, 18 Jan 2023 02:52:44 -0500
Received: from mout.kundenserver.de ([212.227.17.24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pI3FS-00021r-E8; Wed, 18 Jan 2023 02:52:43 -0500
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MI5cP-1pTJ002ltv-00FATo; Wed, 18
 Jan 2023 08:52:35 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 00/15] Trivial branch for 8.0 patches
Date: Wed, 18 Jan 2023 08:52:19 +0100
Message-Id: <20230118075234.2322131-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:l8oTSfpH2JV+D8pBIAImd5OORcbGOJiS/TvY1IsaK7TPEXNfNFH
 JuhxMY37K2SPx684uh1/CrsQtjz8DKNTATlpIgebj7eT6xXNp2B2NhF43EUkLJT5SMaAY//
 lCOXxPVxldy3xpkjFhoHVneVDGH9Y64xBTNBXABg3E/bclJs3dErWRlibO/NGdyM9PjprcO
 Q7InW0emLYLcVvvi79zRQ==
UI-OutboundReport: notjunk:1;M01:P0:wSygYuEdees=;qWU+GZ/gYoyyfuIIA6Xqh+QbkJQ
 ZTDMHnPwx4MlnTdbI/rxhFgWHyKDyRUBZGlb/1qs5xhki1fAXx2pCKXJEn23N6BOD/JLSmMx/
 fLjUQlJzLuizso5OMRAFz67jKEyG8Ny8g+iWaS07cYz3pcbsbihD1EELmDp4DmTCpCqMnPKpZ
 Xo3oUfHfa+QNL/xJv+IuRXm17j7ZZwKhp37HgJ2X5e8z1HRH5jXWgGtAbU4w/+ymoeJwfqLDm
 5e07ADT5kNHO3RZ2mD7kK/SrM/6WENvNf77FrzlcAZ9fPBiYOq8IsRUaA0ydw1bmyxzfOrK9Y
 qSmdXezVhQuzLOMcm6axa1ZPzbtDN5l3u/INcIKoLDSSXtPm+yk1QnL0DmWC81WPqZRrmJmRk
 hqAM8D82CuiCkLwjbxXI2Mo6ZDfeMpJTwApdxaMM9xsLhSjLw2dES7BsfJmqw+e/2VenK0MC2
 YuvlObi3G1uUYHyUhvK7uBxo/F8vdoI++JWt4DDwALFOy46bo11RbCwbzJKffsZlD33xQQtyE
 Clk+7dr0O4Teg4ro6ykBd8s9e/vBX5kk0v+eL/FHEr6lVgy6T5yjVoZih3sFBHgbV9TddXFmm
 h9jcxa/Nw4rJ72RFedNuKomNEToFYMe94rCjt82Q4adAvYtduyQcwdWKexIYeYDc4xkTmE0gv
 5qLHwQxjOSA+TzplGTWILdqq1tkHOqdes0ej11SzDA==
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

The following changes since commit a8d6abe1292e1db1ad9be5b2b124b9c01bcda094:

  Merge tag 'mips-20230113' of https://github.com/philmd/qemu into staging (2023-01-16 11:24:11 +0000)

are available in the Git repository at:

  https://gitlab.com/laurent_vivier/qemu.git tags/trivial-branch-for-8.0-pull-request

for you to fetch changes up to b93b3cb1bb72f313d8c33791e0a82a25da780cf0:

  hw/ssi/sifive_spi.c: spelling: reigster (2023-01-17 10:02:37 +0100)

----------------------------------------------------------------
trivial branch pull request 20230118

----------------------------------------------------------------

Guoyi Tu (1):
  Call qemu_socketpair() instead of socketpair() when possible

Hoa Nguyen (1):
  hw/cxl/cxl-host: Fix an error message typo

Marc-André Lureau (1):
  ccid-card-emulated: fix cast warning/error

Michael Tokarev (2):
  hw/cxl/cxl-cdat.c: spelling: missmatch
  hw/ssi/sifive_spi.c: spelling: reigster

Philippe Mathieu-Daudé (5):
  hw/display: Move omap_lcdc.c out of target-specific source set
  hw/intc: Move some files out of the target-specific source set
  hw/tpm: Move tpm_ppi.c out of target-specific source set
  hw/arm: Move various units to softmmu_ss[]
  hw/i386/pc: Remove unused 'owner' argument from pc_pci_as_mapping_init

Thomas Huth (4):
  hw/cpu: Mark arm11 and realview mpcore as target-independent code
  hw/intc: Mark more interrupt-controller files as target independent
  hw/usb: Mark the XLNX_VERSAL-related files as target-independent
  tests/qtest/test-hmp: Improve the check for verbose mode

Yuval Shaia (1):
  hw/pvrdma: Protect against buggy or malicious guest driver

 backends/tpm/tpm_emulator.c         |  2 +-
 hw/arm/meson.build                  | 11 +++++++----
 hw/cpu/meson.build                  |  4 ++--
 hw/cxl/cxl-cdat.c                   |  2 +-
 hw/cxl/cxl-host.c                   |  2 +-
 hw/display/meson.build              |  2 +-
 hw/i386/pc.c                        |  2 +-
 hw/intc/meson.build                 | 12 ++++++------
 hw/pci-host/i440fx.c                |  3 +--
 hw/pci-host/q35.c                   |  3 +--
 hw/rdma/vmw/pvrdma_cmd.c            |  6 ++++++
 hw/ssi/sifive_spi.c                 |  2 +-
 hw/tpm/meson.build                  |  4 ++--
 hw/usb/ccid-card-emulated.c         |  2 +-
 hw/usb/meson.build                  |  4 ++--
 include/hw/i386/pc.h                |  2 +-
 tests/qtest/dbus-display-test.c     |  5 +++--
 tests/qtest/migration-test.c        |  2 +-
 tests/qtest/test-hmp.c              |  2 +-
 tests/unit/test-crypto-tlssession.c |  4 ++--
 tests/unit/test-io-channel-tls.c    |  2 +-
 21 files changed, 43 insertions(+), 35 deletions(-)

-- 
2.38.1


