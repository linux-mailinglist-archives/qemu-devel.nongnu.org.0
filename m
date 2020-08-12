Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE20B242A83
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Aug 2020 15:42:03 +0200 (CEST)
Received: from localhost ([::1]:40814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k5r10-0005E1-Vr
	for lists+qemu-devel@lfdr.de; Wed, 12 Aug 2020 09:42:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhaolichang@huawei.com>)
 id 1k5nnM-0007j2-70; Wed, 12 Aug 2020 06:15:44 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:56816 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhaolichang@huawei.com>)
 id 1k5nnJ-0002py-VL; Wed, 12 Aug 2020 06:15:43 -0400
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 73D8A765E23514832B4E;
 Wed, 12 Aug 2020 18:15:28 +0800 (CST)
Received: from localhost (10.174.187.253) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.487.0; Wed, 12 Aug 2020
 18:15:20 +0800
From: zhaolichang <zhaolichang@huawei.com>
To: <qemu-trivial@nongnu.org>
Subject: [PATCH RFC 00/10] fix some comment spelling errors
Date: Wed, 12 Aug 2020 18:14:50 +0800
Message-ID: <20200812101500.2066-1-zhaolichang@huawei.com>
X-Mailer: git-send-email 2.26.2.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [10.174.187.253]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35;
 envelope-from=zhaolichang@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/12 06:15:29
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 12 Aug 2020 09:40:49 -0400
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
Cc: zhaolichang <zhaolichang@huawei.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I found that there are many spelling errors in the comments of qemu,=0D
so I used the spellcheck tool to check the spelling errors, this series fix=
ed this=0D
spelling errors.

zhaolichang (10):
  qemu/: fix some comment spelling errors
  migration/: fix some comment spelling errors
  docs/: fix some comment spelling errors
  scripts/: fix some comment spelling errors
  util/: fix some comment spelling errors
  linux-user/: fix some comment spelling errors
  block/: fix some comment spelling errors
  disas/: fix some comment spelling errors
  qapi/: fix some comment spelling errors
  contrib/: fix some comment spelling errors

 Changelog                                 |  2 +-
 accel/tcg/user-exec.c                     |  2 +-
 audio/audio.c                             |  2 +-
 block.c                                   |  2 +-
 block/block-copy.c                        |  2 +-
 block/linux-aio.c                         |  2 +-
 block/mirror.c                            |  2 +-
 block/vhdx.c                              |  2 +-
 block/vhdx.h                              |  4 ++--
 configure                                 |  2 +-
 contrib/gitdm/filetypes.txt               |  6 +++---
 contrib/ivshmem-client/ivshmem-client.h   |  2 +-
 contrib/libvhost-user/libvhost-user.c     |  4 ++--
 contrib/libvhost-user/libvhost-user.h     |  2 +-
 disas/hppa.c                              |  2 +-
 disas/libvixl/vixl/a64/constants-a64.h    |  2 +-
 disas/libvixl/vixl/a64/decoder-a64.h      |  2 +-
 disas/libvixl/vixl/a64/instructions-a64.h |  2 +-
 disas/libvixl/vixl/globals.h              |  2 +-
 disas/m68k.c                              |  8 ++++----
 disas/ppc.c                               |  2 +-
 docs/COLO-FT.txt                          |  6 +++---
 docs/devel/blkdebug.txt                   |  2 +-
 docs/devel/migration.rst                  |  2 +-
 docs/devel/testing.rst                    |  2 +-
 docs/devel/tracing.txt                    |  2 +-
 docs/interop/bitmaps.rst                  |  2 +-
 docs/interop/dbus.rst                     |  4 ++--
 docs/interop/nbd.txt                      |  2 +-
 docs/interop/vhost-user-gpu.rst           |  2 +-
 docs/interop/vhost-user.rst               |  4 ++--
 docs/rdma.txt                             |  2 +-
 docs/specs/ppc-spapr-hotplug.txt          |  4 ++--
 docs/specs/ppc-spapr-xive.rst             |  4 ++--
 docs/system/arm/aspeed.rst                |  2 +-
 docs/system/deprecated.rst                |  8 ++++----
 docs/system/target-avr.rst                |  4 ++--
 docs/tools/virtiofsd.rst                  |  2 +-
 fsdev/virtfs-proxy-helper.c               |  2 +-
 gdbstub.c                                 |  2 +-
 hmp-commands.hx                           |  2 +-
 libdecnumber/decNumber.c                  |  2 +-
 linux-user/aarch64/signal.c               |  2 +-
 linux-user/cris/target_syscall.h          |  4 ++--
 linux-user/flat.h                         |  2 +-
 linux-user/flatload.c                     |  4 ++--
 linux-user/host/ppc64/safe-syscall.inc.S  |  2 +-
 linux-user/syscall.c                      |  4 ++--
 migration/colo-failover.c                 |  2 +-
 migration/colo.c                          |  2 +-
 migration/multifd.c                       |  4 ++--
 migration/postcopy-ram.c                  |  4 ++--
 migration/postcopy-ram.h                  |  2 +-
 migration/ram.c                           | 10 +++++-----
 migration/rdma.c                          |  8 ++++----
 migration/savevm.c                        |  4 ++--
 qapi/block-core.json                      |  4 ++--
 qapi/crypto.json                          |  4 ++--
 qemu-img.c                                |  2 +-
 qobject/qdict.c                           |  2 +-
 rules.mak                                 |  2 +-
 scripts/checkpatch.pl                     |  2 +-
 scripts/clean-header-guards.pl            |  2 +-
 scripts/decodetree.py                     |  6 +++---
 scripts/oss-fuzz/build.sh                 |  2 +-
 scripts/tracetool/__init__.py             |  2 +-
 scsi/pr-manager-helper.c                  |  2 +-
 util/osdep.c                              |  2 +-
 util/qemu-progress.c                      |  2 +-
 util/qemu-sockets.c                       |  2 +-
 util/qemu-thread-win32.c                  |  2 +-
 util/qht.c                                |  2 +-
 util/trace-events                         |  2 +-
 73 files changed, 107 insertions(+), 107 deletions(-)

--=20
2.26.2.windows.1



