Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4982060C6B3
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 10:41:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onFTY-0002S9-6G; Tue, 25 Oct 2022 04:39:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1onElN-0005LA-PU; Tue, 25 Oct 2022 03:54:23 -0400
Received: from mout.kundenserver.de ([217.72.192.75])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1onElI-0005x6-7J; Tue, 25 Oct 2022 03:54:15 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1M8QJq-1oiouF4BGa-004Stp; Tue, 25
 Oct 2022 09:54:00 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 00/11] Trivial branch for 7.2 patches
Date: Tue, 25 Oct 2022 09:53:47 +0200
Message-Id: <20221025075358.3117373-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:/dMz+oyeDLMYBhdyptjAxx+F/JW0/4qXyyMIH8cghuboH21s1vm
 4f22HougajdxhZhI44wVUwo5FqlqGTXkAOaqUG6ib1m8nJu/18poOh3kVRsiC1V4xTwzu8U
 xfPlx3GjBG8Udp+S6mbaE/Edisdq8ZkYMFFgLEYPLQaDNCCQepkyCeiTlyx3Zlh9iNS4Jh7
 CdQxQPDM2dW/Ygs3orECA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:AX0JYpgHa2E=:x6rsbFZNiThNdL3ZjHK0R+
 qvdhk8VMe3xGKsXMvKA1Vy0h6uoIasgofo275F1aDe4/HguK5twQ/VKGWvWIQrZAvqv3LgLR1
 NVUIbSTg1gkIzWBB4Eoce7SYZSfyILeuwwVokd8BJUUwVhRQB1XYiPNc1hjJsSEva0NEfczxb
 nufOvhPxS9dQOhj8rowkVmKTVDDQubwFpAkSLHhP7ypArDvZF8W90Udl+vt30YacliJT0mt/a
 EgpODb+8a+gVHrSSVBOAOaWryjqyc5MsDmac6C3ZoyXkSss9yhpqWA9aL1A6ZJS9ankEoFozC
 NpjORuPWP8BgdP2yjJqlabNv8ijehU3cdxQ3Z+bGXqMUJKDelvRVAHaGyudoQHZObW2lZCFev
 LeT5NCI3ZQlrOtpFtnFVwg7hWiiaY3VF1BPx83Dc9+tip4ZbE6gw7fOdJ/L1O1ezAIjwOgNfL
 S2AONE0ER91fBhQWj8XG649wmu3g+dLUAcYzM3dFZNGqKSAXYi2bdeQ+kVpKSl5vMqsMitJd0
 psDdLfIyJwDW5lNk0a98/cKBgxXok8nAAdpV32S1ud7i+K4uI/MFLqctLabHkW8A1Bf8wxiWN
 p5GSl9liLaImezPhJ9sKgl8JdtZNdqUqfzCl7KV1yafXp7Tu9C4Q5Moc8QwS5dx5licKL+LMm
 2UcR9nz+CV3SUsxQAB9FmKDixoviJ/pWf/aSxAEf7kW1v+UFdNvMAm4lly8fin6GYZYAyCMLG
 reNrdysap0uMqN1/EyMMNy9A/71/zZFAJmu7r6aokO1e/Yon/4dxIkYfudcwJwMCGUQLt4Z3u
 ode0bxA
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
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
Pull request

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


