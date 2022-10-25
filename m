Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7BF60C685
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 10:33:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onFN3-0001KC-2Z; Tue, 25 Oct 2022 04:33:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1onEa8-0003vY-7w; Tue, 25 Oct 2022 03:42:41 -0400
Received: from mout.kundenserver.de ([212.227.126.134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1onEa5-0004CV-Sj; Tue, 25 Oct 2022 03:42:39 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MHXWL-1orNJB2dJB-00DYLD; Tue, 25
 Oct 2022 09:42:32 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 00/11] Trivial branch for 7.2 patches
Date: Tue, 25 Oct 2022 09:42:29 +0200
Message-Id: <20221025074229.3115835-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:p2XZdtTRYD9vT86hTlVGoQY9utxhfP6+5g4KaKtDwnSVnvTyW0c
 v6WbEVa2N9pmyp/2KQS8HPRDaqMh5nyISjKGJU9N/oSM09iEGeNZDb24SJrlR4zSgTS7I5m
 7rUkbiWUuwIXPTeVaSB3bU5kG8XX+O0N9RH6CbLJ95sdIqoUVuxPCbacHUsUQlXS6CmEK8k
 F2SuCJ8Y/auSe0m1bE+fw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:F5n45sj8KLM=:F8uEbvrQZoPUnLDJMDSpP1
 6ToK+3IdoJv7/Mxb1Ro3yrrdwiT0niWvmuB4+4FHmMy8B0pjEZxxr4cmkJnVqIhrxto3sWO69
 tFf0YMKJtu4fPqULxW279v1VH0ztTqVAiVnSffF2eZMQ6RGCragTsEp76c2w2XY+ET71CY9wN
 bMHLpSwYOWZrk7krNYvSUFMJBrYhrPFFCxoeu2bpm/HTByj28IUcVCld+HwCInkepqPFpnPO3
 R7sbQGeSO58YCMcuwTM0rzwQlLvudcGSJiqqrjfz41wdHJT2172X/Y4CgWJzJhgpbMvQvqzqP
 bfruoTZEGoqp/ZwpbCg4qLZDxcRUPGuxpevAlbMmy9DyOIU40tER0owd8jIN0KSxuPeAD1xhX
 k0X6pyGSkFmf5KayLE+t8WOVBZ3xl153/9lAV1umSyWNGVgbWBFeZQdZ7eeDhv7kk07Bw7TyN
 uh8Zk+XYE3LV8p2MOk7tQThwM0Z0rADo42ClkBjkn1tdKrwcrADuLK5XZ+Iuvzbwg4TU/Lq4z
 Oexw7xjdkI5JYwLcLzlMbUPgu2toelGYPbHFJdtszw5tBI7pQR9M12xvyIWd/KlQEDNqhaZkM
 csE0mFtCkB/Q6s6KQWkgBFj0eSWeWFDDsONFwTWg7G9MAN9I2jWLb1Yz4gJOMqficMWQMlW2Z
 +4AbDeAW+Bw8dmg6htpIdv8icLU18zGfqlNFwUziDm08HEwQ+HpAf/w6lQaUMQNufvfhnI1j1
 J25kEM9vdminEpBPSAGSZPNLg8MMAbGvbRruWZeoxFUx9ugHXV80tkbp+AfdQNgU1RBLfIg2s
 a/g+8MY
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
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


