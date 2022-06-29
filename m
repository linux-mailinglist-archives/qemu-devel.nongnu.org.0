Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 737C555FB71
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 11:12:57 +0200 (CEST)
Received: from localhost ([::1]:49850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6Tkk-0003kQ-8k
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 05:12:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1o6Th0-0000fi-4B; Wed, 29 Jun 2022 05:09:02 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:55345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1o6Tgy-0003Wy-2l; Wed, 29 Jun 2022 05:09:01 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MdeOl-1nXh2I412X-00ZfzS; Wed, 29
 Jun 2022 11:08:52 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 00/11] Trivial branch for 7.1 patches
Date: Wed, 29 Jun 2022 11:08:38 +0200
Message-Id: <20220629090849.1350227-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:gb3sCFyzwkALJP/DFYVXsVRbj6UO8HF3jp7TjRqfXt8fy1W/6GZ
 ruW7vW4acbxGthDm3DRtlIQgttb6z/gqmHEYsggE2LE6WDayxogcGnmB/7cpPPDS0m16gB/
 Zs/C/7hS1IuVea0qoWSrBa1yi3Rv/YrHexegb7vibQPBQUwa9C6UcEqS5aBqDxMeCA/yCtd
 pYCcfJKNOaAl297nMj8GQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:5A886fuqHvU=:hyr69LegdfQnoQnD3Vc7Rs
 MO3/mS9Xh5drXZSvxEETpVGzuxhPPItYVWTb1pKtyTDcluGAxjqBLeGjCTlhxnXhv0i4CBE6h
 QFVJlgXDHURAVCNlYJ+flf8Jb0dflSmmm1xZzia6spYJWR8vz2zxejLJLlWe+xl/pJKr/wu/H
 pB3uYBaRA2TsTgM80XkPQCIkX7uEdMvNzuvXhacUS5G9PXIA/12u96+PpQ5rHbMxs86eYk7B+
 PLXKHody+BuSNFIt2n51beTi8H+bl0+D6zdTYYswugJLn7bQfNCPcvnqMyJK4ZKnT8X2NjNeb
 /r9pi7EfHQLXocCDNiWWEswxc70L8vRuLrhs4NaNP/DABMiPhPa7e/Eu3UXjNZKnHrC9JtxkQ
 wMoJYT1rgyL9xTAG4orvbmX2QEMLB9Zw8Y7VGxOJ6vh2IIy2pQWJWILF9/ynBiaSvfzEXBVvO
 84CXcmsY3i+HsVuK1fGFr93ELzh6CIcAes+1CKu8z1AhM9/2sd6CHzJik6FbPnHA3vu77svqB
 nO5w5dNs09rateqHDzmnpI7g8fySPoizAso5dRcw79WLIbKlcc5BjkMKPD7axir370T7Yo99H
 CWEdrM3/5NPpeCWE16MkyzH9xpH/7swxK1YAdq88qp1ikOhr6SNKfAzdMbAOETnZg7fb1stKY
 RxLmzzXTEqTGOodWDusykrolULlC0+R0Dj8NZXHOOMCiGyqN1Ktxhh8o7RrJrDqzh5m7XVutt
 wVEhoAPCWI45YeXDqLSHimD/ZQYwOSo2wzQStg==
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The following changes since commit ad4c7f529a279685da84297773b4ec8080153c2d:

  Merge tag 'pull-semi-20220628' of https://gitlab.com/rth7680/qemu into staging (2022-06-28 10:24:31 +0530)

are available in the Git repository at:

  https://gitlab.com/laurent_vivier/qemu.git tags/trivial-branch-for-7.1-pull-request

for you to fetch changes up to c379bd7551f34e42c4c935783c0c08bab41d70c1:

  hw/i386/xen/xen-hvm: Inline xen_piix_pci_write_config_client() and remove it (2022-06-29 00:24:59 +0200)

----------------------------------------------------------------
trivial patches pull request 20220629

----------------------------------------------------------------

Bernhard Beschow (3):
  hw/pci-host/i440fx: Remove unused parameter from i440fx_init()
  hw/i386/xen/xen-hvm: Allow for stubbing xen_set_pci_link_route()
  hw/i386/xen/xen-hvm: Inline xen_piix_pci_write_config_client() and
    remove it

Dr. David Alan Gilbert (2):
  Trivial: 3 char repeat typos
  trivial typos: namesapce

Eugenio Pérez (1):
  util: Return void on iova_tree_remove

Guo Zhi (1):
  vga: avoid crash if no default vga card

Lev Kujawski (1):
  hw/ide/atapi.c: Correct typos (CD-CDROM -> CD-ROM)

Markus Armbruster (1):
  MAINTAINERS: Add softmmu/runstate.c to "Main loop"

Philippe Mathieu-Daudé (1):
  qom/object: Remove circular include dependency

Thomas Huth (1):
  common-user: Only compile the common user code if have_user is set

 MAINTAINERS                      |  1 +
 common-user/meson.build          |  4 ++++
 hw/9pfs/9p-xattr-user.c          |  8 ++++----
 hw/acpi/nvdimm.c                 |  2 +-
 hw/i386/pc_piix.c                |  3 ---
 hw/i386/xen/xen-hvm.c            | 17 ++---------------
 hw/ide/atapi.c                   |  4 ++--
 hw/intc/openpic.c                |  2 +-
 hw/isa/piix3.c                   | 15 ++++++++++++++-
 hw/net/imx_fec.c                 |  2 +-
 hw/nvme/ctrl.c                   |  2 +-
 hw/pci-host/i440fx.c             |  4 +---
 hw/pci/pcie_aer.c                |  2 +-
 hw/pci/shpc.c                    |  3 ++-
 hw/ppc/spapr_caps.c              |  2 +-
 hw/scsi/spapr_vscsi.c            |  2 +-
 include/hw/pci-host/i440fx.h     |  1 -
 include/hw/xen/xen.h             |  2 +-
 include/hw/xen/xen_common.h      |  6 ------
 include/qemu/iova-tree.h         |  4 +---
 include/qom/object.h             |  1 -
 qapi/net.json                    |  2 +-
 softmmu/vl.c                     |  3 ++-
 stubs/xen-hw-stub.c              |  3 ++-
 tools/virtiofsd/passthrough_ll.c |  2 +-
 ui/input.c                       |  2 +-
 util/iova-tree.c                 |  4 +---
 27 files changed, 47 insertions(+), 56 deletions(-)

-- 
2.36.1


