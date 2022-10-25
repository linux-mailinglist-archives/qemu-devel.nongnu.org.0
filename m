Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D280860C6BA
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 10:42:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onFOW-0006j5-Eu; Tue, 25 Oct 2022 04:34:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1onEg8-00011q-FH; Tue, 25 Oct 2022 03:48:52 -0400
Received: from mout.kundenserver.de ([212.227.17.10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1onEg6-0005AA-LJ; Tue, 25 Oct 2022 03:48:52 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue109
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MNKuK-1oSwth1tMo-00Oo1n; Tue, 25
 Oct 2022 09:48:47 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 00/11] Trivial branch for 7.2 patches
Date: Tue, 25 Oct 2022 09:48:34 +0200
Message-Id: <20221025074845.3116478-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:nZ8nJ+zT0JkzgMapCNvFLGyDVQ/8Sj4xdnPCiaEMFdTIYg6Nwcw
 CljAs87FeH5VOuEJrvYrYylUDY9TgfwMBB6KCwNYP8Y7BFY2TlD71j5Ie5xzfh0oiqwAkOg
 9ki6fTuXOiGcyzhXdM+uFErvNA81su2zI47AKaRHJpW8aIjmA1fE2HwjMo6tJxV/WwfheR1
 gVVRMtgMumWV2cicMiJLA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:VbQ/siUCqto=:55oAJqxXvbdzmTXa3MAQGo
 sE0MJhJWxfKAdoN5jS+Bb1Ea+omI5oZG0dAaE3NX/J2LFtrlhifvu0aS/HsclKfEaxMPnl/+9
 xuTfgIa5JHGMS/Q9ZI4zJp+kJdn/N0wMYrGx4ydm0HMu5ys8d05PHy8sWzoHrmSgHeG1KjdCx
 Ym0+tCZRyqm/iCLD3lcqFr1Lzww1XAg693Qk/yQohdwPpWaP8KYODGmxP5TVoaIFuEPU7afZQ
 /Fv9HErS89p2nkF1iOWemwgl00uCm+vjJJyzvc22LknYITXZyA1X86ZVCWj5reM0B6od8pWfL
 ao6hnlvK35Ez8s37cmRFEx/W4iB9Nu8JY8J/zB+fedYG/19ugJ+kvrzwZ2PyWde/Eqvj7tBbD
 0ZvbVMDCOVHx0MeOMAAUv83t4fyirKlj8JmwZIpM9XPAC+mbE1tRv/B1VVZsnhynY0D8YPbZc
 zw6XV9GVsMhmJCDjLNj2GVqIwl9HyW6AhT7dBSe7Nn4ehHBiybF7PsFmRGeZ/sj1Bgxd2QE6x
 TkFCetd51Zdz6W/oHgzxBTMQd/NQcE7E751rcfNGKOm/2jzVDBkHDDgIOINkYuIDBWk3+aKJ+
 IX/XColu6klYxPncDWiQrJ6OLblp69EuCh2B88ilIw7PVgdVZ53b4oRWLLklmX1t27NZ+dr6i
 m9mgjUZ4ZIBf1ZCms1F5DLy1VRnX0SpeaUiEMh4vw2RBBM8ok4ZgoWiKij1fMEFKS1R1yUoRW
 D5YCH2zc8rqUZyoquc9PNZ1E5Vcfse65nz5JF0+QdUmXkbY+5wq+2VEfVo1W1Mt1I2KAf6wQh
 PS2fKfL
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The following changes since commit 0529245488865038344d64fff7ee05864d3d17f6:

  Merge tag 'pull-target-arm-20221020' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2022-10-20 14:36:12 -0400)

are available in the Git repository at:

  https://gitlab.com/laurent_vivier/qemu.git tags/trivial-branch-for-7.2-pull-request

for you to fetch changes up to 046ab3b80891f4aa6d0cfd7db15c622b1933e598:

  accel/tcg/tcg-accel-ops-rr: fix trivial typo (2022-10-24 13:43:42 +0200)

----------------------------------------------------------------
Trivial branch pull request 20221025

----------------------------------------------------------------

Bin Meng (3):
  tests/qtest: migration-test: Fix [-Werror=format-overflow=] build
    warning
  tests/qtest: vhost-user-test: Fix [-Werror=format-overflow=] build
    warning
  treewide: Remove the unnecessary space before semicolon

Markus Armbruster (2):
  hw/core: Tidy up unnecessary casting away of const
  Drop useless casts from g_malloc() & friends to pointer

Matheus Tavares Bernardino (1):
  accel/tcg/tcg-accel-ops-rr: fix trivial typo

Peter Maydell (1):
  include/hw/scsi/scsi.h: Remove unused scsi_legacy_handle_cmdline()
    prototype

Volker Rümelin (1):
  ui: remove useless typecasts

Wang, Lei (1):
  .gitignore: add multiple items to .gitignore

dinglimin (1):
  vmstate-static-checker:remove this redundant return

lu zhipeng (1):
  elf2dmp: free memory in failure

 .gitignore                        | 3 +++
 accel/tcg/tcg-accel-ops-rr.c      | 2 +-
 contrib/elf2dmp/main.c            | 1 +
 hw/9pfs/9p.c                      | 2 +-
 hw/arm/nseries.c                  | 4 ++--
 hw/char/exynos4210_uart.c         | 2 +-
 hw/core/sysbus-fdt.c              | 5 +++--
 hw/display/blizzard.c             | 2 +-
 hw/dma/pl330.c                    | 2 +-
 hw/misc/cbus.c                    | 6 +++---
 hw/net/can/can_sja1000.c          | 2 +-
 hw/nvram/eeprom93xx.c             | 2 +-
 hw/timer/renesas_cmt.c            | 2 +-
 hw/timer/renesas_tmr.c            | 8 ++++----
 hw/usb/ccid-card-emulated.c       | 2 +-
 hw/virtio/virtio-pci.c            | 2 +-
 include/hw/elf_ops.h              | 2 +-
 include/hw/scsi/scsi.h            | 1 -
 scripts/vmstate-static-checker.py | 1 -
 target/i386/kvm/kvm.c             | 3 +--
 target/i386/whpx/whpx-all.c       | 5 ++---
 target/riscv/vector_helper.c      | 2 +-
 target/rx/op_helper.c             | 4 ++--
 target/s390x/kvm/kvm.c            | 2 +-
 tests/qtest/migration-test.c      | 4 ++--
 tests/qtest/vhost-user-test.c     | 4 ++--
 ui/console.c                      | 2 +-
 ui/gtk.c                          | 2 +-
 ui/vnc-enc-hextile.c              | 4 ++--
 ui/vnc-jobs.c                     | 2 +-
 ui/vnc.c                          | 2 +-
 31 files changed, 44 insertions(+), 43 deletions(-)

-- 
2.37.3


