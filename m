Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B670350A141
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 15:54:02 +0200 (CEST)
Received: from localhost ([::1]:58458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhXFx-0007ek-LB
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 09:54:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhXBx-0002D4-KF
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 09:49:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhXBq-0005iV-Sr
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 09:49:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650548986;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=QMVB7bih8070LELlFe0G1fSg4IC1NhWnavZGD8R+wOM=;
 b=GrP1qYCXj3k5s5wDf5mOU83SO1ON/djizg047i64/zjouBnDCpXm0IsuwaVaLZfyyt2uLJ
 JyYYCv+nlWZiFp5YC80ukeLO0Ad9WmUvhg/DU7xJKkQuEoP47Ddhk0VeCePgAvVrka5dRz
 IqiYMDXUEBquoTr2tCjwQkwYzXWzAVU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-16-qCe5TLuGPNGhCwLvXy3sXQ-1; Thu, 21 Apr 2022 09:49:44 -0400
X-MC-Unique: qCe5TLuGPNGhCwLvXy3sXQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7D9A03C37F24;
 Thu, 21 Apr 2022 13:49:44 +0000 (UTC)
Received: from localhost (unknown [10.39.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3F42F145BA52;
 Thu, 21 Apr 2022 13:49:42 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL 00/30] Misc patches
Date: Thu, 21 Apr 2022 17:49:10 +0400
Message-Id: <20220421134940.2887768-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The following changes since commit 9c125d17e9402c232c46610802e5931b3639d77b:

  Merge tag 'pull-tcg-20220420' of https://gitlab.com/rth7680/qemu into staging (2022-04-20 16:43:11 -0700)

are available in the Git repository at:

  git@gitlab.com:marcandre.lureau/qemu.git tags/misc-pull-request

for you to fetch changes up to 55fa0170721e827c1701db3a66a54d44b5660d53:

  qga: use fixed-length and GDateTime for log timestamp (2022-04-21 17:37:16 +0400)

----------------------------------------------------------------
Misc cleanups

----------------------------------------------------------------

Marc-André Lureau (30):
  glib-compat: isolate g_date_time_format_iso8601 version-bypass
  scripts/analyze-inclusions: drop qemu-common.h from analysis
  Simplify softmmu/main.c
  hw/hyperv: remove needless qemu-common.h include
  include: rename qemu-common.h qemu/help-texts.h
  qga: replace usleep() with g_usleep()
  docs: trace-events-all is installed without renaming
  arm/digic: replace snprintf() with g_strdup_printf()
  arm/allwinner-a10: replace snprintf() with g_strdup_printf()
  intc/exynos4210_gic: replace snprintf() with g_strdup_printf()
  doc/style: CLang -> Clang
  osdep.h: move qemu_build_not_reached()
  compiler.h: replace QEMU_NORETURN with G_NORETURN
  include: move qemu_msync() to osdep
  include: move qemu_fdatasync() to osdep
  include: add qemu/keyval.h
  include: move qdict_{crumple,flatten} declarations
  tests: remove block/qdict checks from check-qobject.c
  compiler.h: add QEMU_SANITIZE_{ADDRESS,THREAD}
  tests: run-time skip test-qga if TSAN is enabled
  Move error_printf_unless_qmp() with monitor unit
  qga: move qga_get_host_name()
  qtest: simplify socket_send()
  util: simplify write in signal handler
  util: use qemu_write_full() in qemu_write_pidfile()
  util: use qemu_create() in qemu_write_pidfile()
  util: replace qemu_get_local_state_pathname()
  qga: remove need for QEMU atomic.h
  tests/fuzz: fix warning
  qga: use fixed-length and GDateTime for log timestamp

 docs/devel/style.rst                         |  2 +-
 docs/devel/tracing.rst                       |  2 +-
 accel/tcg/internal.h                         |  3 +-
 include/block/qdict.h                        |  3 +
 include/exec/exec-all.h                      | 20 +++---
 include/exec/helper-head.h                   |  2 +-
 include/glib-compat.h                        | 12 +---
 include/hw/core/cpu.h                        |  2 +-
 include/hw/core/tcg-cpu-ops.h                |  6 +-
 include/hw/hw.h                              |  2 +-
 include/monitor/monitor.h                    |  3 +
 include/qapi/qmp/qdict.h                     |  3 -
 include/qemu-main.h                          | 10 +++
 include/qemu/compiler.h                      | 26 +++-----
 include/qemu/cutils.h                        |  2 -
 include/qemu/error-report.h                  |  2 -
 include/{qemu-common.h => qemu/help-texts.h} |  5 --
 include/qemu/keyval.h                        | 14 +++++
 include/qemu/option.h                        |  6 --
 include/qemu/osdep.h                         | 43 +++++++++----
 include/qemu/thread.h                        |  2 +-
 include/tcg/tcg-ldst.h                       |  4 +-
 include/tcg/tcg.h                            |  2 +-
 linux-user/user-internals.h                  |  2 +-
 qga/commands-common.h                        | 11 ++++
 scripts/cocci-macro-file.h                   |  2 +-
 target/alpha/cpu.h                           | 10 +--
 target/arm/internals.h                       | 12 ++--
 target/hppa/cpu.h                            |  2 +-
 target/i386/tcg/helper-tcg.h                 | 24 ++++----
 target/microblaze/cpu.h                      |  6 +-
 target/mips/tcg/tcg-internal.h               | 17 ++---
 target/nios2/cpu.h                           |  6 +-
 target/openrisc/exception.h                  |  2 +-
 target/ppc/cpu.h                             | 14 ++---
 target/ppc/internal.h                        |  6 +-
 target/riscv/cpu.h                           | 10 +--
 target/s390x/s390x-internal.h                |  6 +-
 target/s390x/tcg/tcg_s390x.h                 | 12 ++--
 target/sh4/cpu.h                             |  6 +-
 target/sparc/cpu.h                           | 10 +--
 target/xtensa/cpu.h                          |  6 +-
 accel/stubs/tcg-stub.c                       |  4 +-
 bsd-user/main.c                              |  2 +-
 bsd-user/signal.c                            |  3 +-
 hw/arm/allwinner-a10.c                       |  4 +-
 hw/arm/digic.c                               |  5 +-
 hw/hyperv/syndbg.c                           |  1 -
 hw/intc/exynos4210_gic.c                     |  9 +--
 hw/misc/mips_itu.c                           |  3 +-
 linux-user/main.c                            |  2 +-
 linux-user/signal.c                          |  3 +-
 monitor/hmp.c                                |  4 +-
 monitor/monitor.c                            | 10 +++
 qapi/qobject-input-visitor.c                 |  2 +-
 qemu-img.c                                   | 14 +++--
 qemu-io.c                                    |  2 +-
 qemu-nbd.c                                   |  2 +-
 qga/commands-posix.c                         | 35 +++++++++++
 qga/commands-win32.c                         | 13 ++++
 qga/commands.c                               | 14 ++---
 qga/main.c                                   | 20 +++---
 qom/object_interfaces.c                      |  1 +
 scsi/qemu-pr-helper.c                        |  8 ++-
 softmmu/main.c                               | 25 +++-----
 softmmu/vl.c                                 |  4 +-
 storage-daemon/qemu-storage-daemon.c         |  2 +-
 stubs/error-printf.c                         |  1 +
 target/alpha/helper.c                        | 10 +--
 target/arm/pauth_helper.c                    |  4 +-
 target/arm/tlb_helper.c                      |  7 ++-
 target/hexagon/op_helper.c                   |  9 +--
 target/hppa/cpu.c                            |  8 +--
 target/hppa/op_helper.c                      |  4 +-
 target/i386/tcg/bpt_helper.c                 |  2 +-
 target/i386/tcg/excp_helper.c                | 31 +++++-----
 target/i386/tcg/misc_helper.c                |  6 +-
 target/i386/tcg/sysemu/misc_helper.c         |  7 ++-
 target/openrisc/exception.c                  |  2 +-
 target/openrisc/exception_helper.c           |  3 +-
 target/riscv/op_helper.c                     |  4 +-
 target/rx/op_helper.c                        | 22 ++++---
 target/s390x/tcg/excp_helper.c               | 22 ++++---
 target/sh4/op_helper.c                       |  5 +-
 target/sparc/mmu_helper.c                    |  8 +--
 target/tricore/op_helper.c                   |  6 +-
 tcg/tcg.c                                    |  3 +-
 tests/fp/fp-bench.c                          |  3 +-
 tests/fp/fp-test.c                           |  3 +-
 tests/qtest/fuzz/generic_fuzz.c              |  2 -
 tests/qtest/libqtest.c                       | 16 +----
 tests/unit/check-qobject.c                   |  7 ---
 tests/unit/check-qom-proplist.c              |  1 +
 tests/unit/test-forward-visitor.c            |  2 +-
 tests/unit/test-keyval.c                     |  2 +-
 tests/unit/test-qga.c                        |  7 +++
 tools/virtiofsd/fuse_virtio.c                |  4 +-
 tools/virtiofsd/passthrough_ll.c             |  2 +-
 ui/vnc.c                                     |  1 +
 util/compatfd.c                              | 18 +-----
 util/cutils.c                                | 54 ----------------
 util/error-report.c                          | 17 ++---
 util/keyval.c                                |  2 +-
 util/osdep.c                                 | 16 +++++
 util/oslib-posix.c                           | 65 +++++++-------------
 util/oslib-win32.c                           | 28 ++++-----
 scripts/analyze-inclusions                   |  4 --
 scripts/checkpatch.pl                        |  2 +-
 tests/unit/meson.build                       |  2 +-
 ui/cocoa.m                                   |  3 +-
 110 files changed, 475 insertions(+), 482 deletions(-)
 create mode 100644 include/qemu-main.h
 rename include/{qemu-common.h => qemu/help-texts.h} (80%)
 create mode 100644 include/qemu/keyval.h

-- 
2.36.0


