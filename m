Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D374DADF8
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 10:56:24 +0100 (CET)
Received: from localhost ([::1]:33720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUQOF-0002BU-4n
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 05:56:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nUQKM-0008Pd-B2
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 05:52:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nUQKJ-0007ea-Vp
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 05:52:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647424338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Jj6K6mkBAiEnVY9njg8npjTaW9/RHf56ZGoYUXw0Sgk=;
 b=Kbg/I754MlBTsZV22HgQH3Vg+QapaUKG1Qtd7VTgerHzkkc8LkCxfPZ09K9tewixV5PlVm
 GlOau958TuZmRDxfvG1IlTwhkZ3Nn2KwJAJMI1nTZ8VwtmeQRNY35DgZS14damVu+gKCvr
 pS0wGOXKJsQvdEHBx7SMQkwNxQs4J0g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-605-OHOg7wGzNbW1ohNiMxTGrQ-1; Wed, 16 Mar 2022 05:52:15 -0400
X-MC-Unique: OHOg7wGzNbW1ohNiMxTGrQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F361685A5A8
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 09:52:14 +0000 (UTC)
Received: from localhost (unknown [10.39.208.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 76AA12EFA3;
 Wed, 16 Mar 2022 09:52:00 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 00/27] Misc fixes and cleanups for 7.0?
Date: Wed, 16 Mar 2022 13:51:56 +0400
Message-Id: <20220316095156.2613419-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Hi,

Various clean-up and fixes patches that might be worth it for 7.0.
Some of the patches have been posted and reviewed before.

Marc-André Lureau (27):
  m68k/nios2-semi: fix gettimeofday() result check
  meson: remove bsd_oses
  meson: use chardev_ss dependencies
  meson: add util dependency for oslib-posix on freebsd
  char: move qemu_openpty_raw from util/ to char/
  Drop qemu_foo() socket API wrapper
  Replace GCC_FMT_ATTR with G_GNUC_PRINTF
  compiler.h: replace QEMU_WARN_UNUSED_RESULT with
    G_GNUC_WARN_UNUSED_RESULT
  compiler.h: replace QEMU_SENTINEL with G_GNUC_NULL_TERMINATED
  Replace config-time define HOST_WORDS_BIGENDIAN
  osdep: poison HOST_WORDS_BIGENDIAN
  Simplify HOST_LONG_BITS
  Move HOST_LONG_BITS to compiler.h
  scripts/modinfo-collect: remove unused/dead code
  util: remove needless includes
  util: remove the net/net.h dependency
  qapi: remove needless include
  meson: move int128 checks from configure
  meson: fix CONFIG_ATOMIC128 check
  qapi: remove needless include
  qga: remove bswap.h include
  error-report: replace error progname with glib functions
  tests: remove needless include
  Remove trailing ; after G_DEFINE_AUTO macro
  include/qapi: add g_autoptr support for qobject types
  tests: replace free_all() usage with g_auto
  qapi: remove needless include

 configure                               |  49 +--------
 meson.build                             |  52 +++++++--
 accel/tcg/atomic_template.h             |   4 +-
 audio/audio.h                           |   6 +-
 block/qcow2.h                           |   2 +-
 bsd-user/qemu.h                         |   2 +-
 hw/display/pl110_template.h             |   6 +-
 hw/display/qxl.h                        |   2 +-
 hw/net/can/ctucan_core.h                |   2 +-
 hw/net/rocker/rocker.h                  |   2 +-
 hw/net/vmxnet3.h                        |   4 +-
 hw/xen/xen_pt.h                         |   2 +-
 include/chardev/char-fe.h               |   2 +-
 include/disas/dis-asm.h                 |   2 +-
 include/exec/cpu-all.h                  |   4 +-
 include/exec/cpu-common.h               |   2 +-
 include/exec/memop.h                    |   2 +-
 include/exec/memory.h                   |   2 +-
 include/fpu/softfloat-types.h           |   2 +-
 include/hw/acpi/aml-build.h             |  12 +-
 include/hw/core/cpu.h                   |   4 +-
 include/hw/hw.h                         |   2 +-
 include/hw/i386/intel_iommu.h           |   6 +-
 include/hw/i386/x86-iommu.h             |   4 +-
 include/hw/virtio/virtio-access.h       |   6 +-
 include/hw/virtio/virtio-gpu-bswap.h    |   2 +-
 include/hw/virtio/virtio.h              |   2 +-
 include/hw/xen/xen-bus-helper.h         |   4 +-
 include/hw/xen/xen-bus.h                |   4 +-
 include/hw/xen/xen_common.h             |   2 +-
 include/hw/xen/xen_pvdev.h              |   2 +-
 include/libdecnumber/dconfig.h          |   2 +-
 include/monitor/monitor.h               |   4 +-
 include/net/eth.h                       |   2 +-
 include/qapi/error.h                    |  20 ++--
 include/qapi/qmp/qbool.h                |   6 +
 include/qapi/qmp/qdict.h                |   6 +
 include/qapi/qmp/qjson.h                |   8 +-
 include/qapi/qmp/qlist.h                |   8 +-
 include/qapi/qmp/qnull.h                |   6 +
 include/qapi/qmp/qnum.h                 |   6 +
 include/qapi/qmp/qstring.h              |   6 +
 include/qemu-common.h                   |  24 +---
 include/qemu/bswap.h                    |   8 +-
 include/qemu/buffer.h                   |   2 +-
 include/qemu/compiler.h                 |  20 ++--
 include/qemu/error-report.h             |  26 ++---
 include/qemu/host-utils.h               |   2 +-
 include/qemu/int128.h                   |   2 +-
 include/qemu/log-for-trace.h            |   2 +-
 include/qemu/log.h                      |   2 +-
 include/qemu/osdep.h                    |  15 +--
 include/qemu/qemu-print.h               |   8 +-
 include/qemu/range.h                    |   4 +-
 include/qemu/readline.h                 |   2 +-
 include/qom/object.h                    |   6 +-
 include/ui/qemu-pixman.h                |   2 +-
 net/util.h                              |   2 +-
 qga/guest-agent-core.h                  |   2 +-
 qga/vss-win32/requester.h               |   2 +-
 scripts/cocci-macro-file.h              |   6 +-
 target/arm/cpu.h                        |   8 +-
 target/arm/translate-a64.h              |   2 +-
 target/arm/vec_internal.h               |   2 +-
 target/i386/cpu.h                       |   2 +-
 target/mips/cpu.h                       |   2 +-
 target/ppc/cpu.h                        |   2 +-
 target/s390x/tcg/vec.h                  |   2 +-
 target/xtensa/cpu.h                     |   2 +-
 tests/fp/platform.h                     |   4 +-
 tests/qtest/libqos/libqtest.h           |  42 +++----
 tests/qtest/libqtest-single.h           |   2 +-
 tests/qtest/migration-helpers.h         |   6 +-
 accel/kvm/kvm-all.c                     |   4 +-
 audio/alsaaudio.c                       |   4 +-
 audio/dbusaudio.c                       |   2 +-
 audio/dsoundaudio.c                     |   4 +-
 audio/ossaudio.c                        |   4 +-
 audio/paaudio.c                         |   2 +-
 audio/sdlaudio.c                        |   2 +-
 block/blkverify.c                       |   2 +-
 block/qcow2-refcount.c                  |  20 ++--
 block/ssh.c                             |   4 +-
 chardev/char-pty.c                      | 111 +++++++++++++++++++
 crypto/cipher-afalg.c                   |   4 +-
 crypto/hash-afalg.c                     |   4 +-
 disas.c                                 |   2 +-
 fsdev/9p-marshal.c                      |   2 +-
 fsdev/virtfs-proxy-helper.c             |   2 +-
 gdbstub.c                               |   2 +-
 hw/9pfs/9p.c                            |   2 +-
 hw/acpi/aml-build.c                     |   4 +-
 hw/core/loader.c                        |   4 +-
 hw/display/artist.c                     |   6 +-
 hw/display/pxa2xx_lcd.c                 |   2 +-
 hw/display/vga.c                        |  12 +-
 hw/display/virtio-gpu-gl.c              |   2 +-
 hw/mips/fuloong2e.c                     |   2 +-
 hw/mips/malta.c                         |   2 +-
 hw/net/rtl8139.c                        |   2 +-
 hw/s390x/event-facility.c               |   2 +-
 hw/virtio/vhost.c                       |   2 +-
 hw/virtio/virtio.c                      |   2 +-
 io/channel-socket.c                     |   6 +-
 io/channel-websock.c                    |   2 +-
 linux-user/arm/nwfpe/double_cpdo.c      |   4 +-
 linux-user/arm/nwfpe/fpa11_cpdt.c       |   4 +-
 linux-user/ppc/signal.c                 |   3 +-
 linux-user/syscall.c                    |   6 +-
 monitor/hmp.c                           |   4 +-
 nbd/server.c                            |  12 +-
 net/announce.c                          |  13 +++
 net/net.c                               |   4 +-
 net/socket.c                            |  24 ++--
 qapi/qapi-forward-visitor.c             |   1 -
 qapi/qmp-dispatch.c                     |   1 -
 qapi/string-output-visitor.c            |   1 -
 qemu-img.c                              |   4 +-
 qemu-io.c                               |  12 +-
 qga/main.c                              |   1 -
 qobject/json-parser.c                   |   2 +-
 softmmu/qtest.c                         |   4 +-
 softmmu/vl.c                            |   2 +-
 storage-daemon/qemu-storage-daemon.c    |   2 +-
 target/alpha/translate.c                |   2 +-
 target/arm/crypto_helper.c              |   2 +-
 target/arm/helper.c                     |   2 +-
 target/arm/kvm64.c                      |   4 +-
 target/arm/neon_helper.c                |   2 +-
 target/arm/sve_helper.c                 |   4 +-
 target/arm/translate-sve.c              |   6 +-
 target/arm/translate-vfp.c              |   2 +-
 target/arm/translate.c                  |   2 +-
 target/hppa/translate.c                 |   2 +-
 target/i386/tcg/translate.c             |   2 +-
 target/m68k/m68k-semi.c                 |   2 +-
 target/mips/tcg/lmmi_helper.c           |   2 +-
 target/mips/tcg/msa_helper.c            |  54 ++++-----
 target/nios2/nios2-semi.c               |   2 +-
 target/ppc/arch_dump.c                  |   2 +-
 target/ppc/int_helper.c                 |  22 ++--
 target/ppc/kvm.c                        |   4 +-
 target/ppc/mem_helper.c                 |   2 +-
 target/riscv/vector_helper.c            |   2 +-
 target/s390x/tcg/translate.c            |   2 +-
 target/sparc/vis_helper.c               |   4 +-
 tcg/tcg-op.c                            |   4 +-
 tcg/tcg.c                               |  12 +-
 tests/qtest/e1000e-test.c               |   4 +-
 tests/qtest/libqtest.c                  |   6 +-
 tests/qtest/npcm7xx_emc-test.c          |   4 +-
 tests/qtest/test-filter-mirror.c        |   4 +-
 tests/qtest/test-filter-redirector.c    |   8 +-
 tests/qtest/vhost-user-blk-test.c       |   2 +-
 tests/qtest/virtio-blk-test.c           |   2 +-
 tests/qtest/virtio-net-test.c           |  10 +-
 tests/unit/check-qobject.c              | 128 +++++++---------------
 tests/unit/socket-helpers.c             |   2 +-
 tests/unit/test-qobject-input-visitor.c |   4 +-
 trace/control.c                         |   2 +-
 ui/vdagent.c                            |   2 +-
 ui/vnc.c                                |   2 +-
 util/bitmap.c                           |   2 +-
 util/cutils.c                           |  16 ---
 util/host-utils.c                       |   2 +-
 util/osdep.c                            |   4 +-
 util/qemu-error.c                       |  24 +---
 util/qemu-openpty.c                     | 139 ------------------------
 util/qemu-sockets.c                     |  10 +-
 target/ppc/translate/vmx-impl.c.inc     |   4 +-
 target/ppc/translate/vsx-impl.c.inc     |   2 +-
 target/riscv/insn_trans/trans_rvv.c.inc |   4 +-
 target/s390x/tcg/translate_vx.c.inc     |   2 +-
 tcg/aarch64/tcg-target.c.inc            |   4 +-
 tcg/arm/tcg-target.c.inc                |   4 +-
 tcg/mips/tcg-target.c.inc               |   2 +-
 tcg/ppc/tcg-target.c.inc                |  10 +-
 tcg/riscv/tcg-target.c.inc              |   4 +-
 audio/coreaudio.m                       |   4 +-
 chardev/meson.build                     |   4 +-
 scripts/checkpatch.pl                   |   6 +-
 scripts/modinfo-collect.py              |   5 -
 util/meson.build                        |   7 +-
 183 files changed, 646 insertions(+), 754 deletions(-)
 delete mode 100644 util/qemu-openpty.c

-- 
2.35.1.273.ge6ebfd0e8cbb


