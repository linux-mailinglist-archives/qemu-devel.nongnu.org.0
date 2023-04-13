Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5776E6E15E4
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 22:33:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pn3bp-0003e3-2n; Thu, 13 Apr 2023 16:31:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pn3bi-0003di-VQ; Thu, 13 Apr 2023 16:31:51 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pn3bg-0003h4-Ow; Thu, 13 Apr 2023 16:31:50 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id F075C40126;
 Thu, 13 Apr 2023 23:31:44 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id 7D48F95;
 Thu, 13 Apr 2023 23:31:43 +0300 (MSK)
Received: (nullmailer pid 2344322 invoked by uid 1000);
 Thu, 13 Apr 2023 20:31:43 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [PATCH 00/21] Patch Round-up for stable 7.2.2, freeze on 2023-04-20
Date: Thu, 13 Apr 2023 23:31:12 +0300
Message-Id: <20230413203051.2344192-1-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Despite 8.0 release is almost here, I'd love to make another 7.2.x
release, adding more fixes which has been collected so far.

The following new patches are queued for QEMU stable v7.2.2:

  https://gitlab.com/mjt0k/qemu/-/commits/stable-7.2-staging/

Patch freeze is 2023-04-20, and the release is planned for 2023-04-22.

Please respond here or CC qemu-stable@nongnu.org on any additional patches
you think should (or shouldn't) be included in the release.

Thanks!

/mjt

----------------------------------------------------------------
Bernhard Beschow (1):
      qemu/osdep: Switch position of "extern" and "G_NORETURN"

Cédric Le Goater (1):
      target/s390x: Fix float_comp_to_cc() prototype

Fiona Ebner (1):
      hw/net/vmxnet3: allow VMXNET3_MAX_MTU itself as a value

Ilya Leoshkevich (2):
      target/s390x: Fix EXECUTE of relative long instructions
      linux-user: Fix unaligned memory access in prlimit64 syscall

Klaus Jensen (1):
      hw/nvme: fix memory leak in nvme_dsm

Konstantin Kostiuk (1):
      qga/win32: Remove change action from MSI installer

Lukas Tschoke (1):
      block/vhdx: fix dynamic VHDX BAT corruption

Marc-André Lureau (1):
      ui: fix crash on serial reset, during init

Markus Armbruster (2):
      qga: Drop dangling reference to QERR_QGA_LOGGING_DISABLED
      hw/arm: do not free machine->fdt in arm_load_dtb()

Mathis Marion (2):
      linux-user: fix sockaddr_in6 endianness
      linux-user: fix timerfd read endianness conversion

Nina Schoetterl-Glausch (1):
      target/s390x: Fix emulation of C(G)HRL

Peter Xu (1):
      io: tls: Inherit QIO_CHANNEL_FEATURE_SHUTDOWN on server side

Pierrick Bouvier (1):
      qga/vss-win32: fix warning for clang++-15

Richard Henderson (2):
      target/s390x: Split out gen_ri2
      target/arm: Handle m-profile in arm_is_secure

Stefan Hajnoczi (1):
      aio-posix: fix race between epoll upgrade and aio_set_fd_handler()

Thomas Huth (1):
      target/s390x/arch_dump: Fix memory corruption in s390x_write_elf64_notes()

Yuval Shaia (1):
      hw/pvrdma: Protect against buggy or malicious guest driver

 block/vhdx-log.c                     |  2 +-
 hw/arm/boot.c                        |  5 ++++-
 hw/net/vmxnet3.c                     |  2 +-
 hw/nvme/ctrl.c                       |  3 +++
 hw/rdma/vmw/pvrdma_cmd.c             |  6 ++++++
 include/qemu/osdep.h                 |  2 +-
 io/channel-tls.c                     |  3 +++
 linux-user/fd-trans.c                | 10 ++++++---
 linux-user/fd-trans.h                |  1 +
 linux-user/generic/target_resource.h |  4 ++--
 linux-user/syscall.c                 | 21 ++++++++++++------
 qga/commands.c                       |  5 ++---
 qga/installer/qemu-ga.wxs            |  1 +
 qga/vss-win32/install.cpp            |  2 +-
 target/arm/cpu.h                     |  3 +++
 target/s390x/arch_dump.c             |  2 +-
 target/s390x/cpu.h                   |  1 +
 target/s390x/s390x-internal.h        |  3 ++-
 target/s390x/tcg/insn-data.h.inc     |  4 ++--
 target/s390x/tcg/mem_helper.c        |  1 +
 target/s390x/tcg/translate.c         | 41 ++++++++++++++++++++++++++++--------
 ui/gtk.c                             |  4 +++-
 util/fdmon-epoll.c                   | 25 ++++++++++++++++------
 23 files changed, 111 insertions(+), 40 deletions(-)

