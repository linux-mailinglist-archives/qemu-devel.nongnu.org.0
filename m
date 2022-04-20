Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 373045089F8
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 16:02:30 +0200 (CEST)
Received: from localhost ([::1]:40734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhAub-0003d2-2Q
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 10:02:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhALt-0005BU-0i
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 09:26:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54174)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhALn-0004JI-TO
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 09:26:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650461190;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=c9efyoCsLk9UFvdOFiXD4JCpq11VHONmebAX3nuxpko=;
 b=LLvn39P3AjBTvEqlkLX83ebW6MDcr27BxoUWi0jXgPAjpIISz9uygXAKEbcK2bR8+ZRuWY
 XXJFqHJFYNJ6YQWaKD/lFPOIVSu79pXTt7SgKIQMOgcu5x8qRMpzXzAqNL1NVQwFB/QJ3i
 F9lFEDdMgO4YY9IIznkiR+dzJaZLgrw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-248-dmqtvMDFPNKaHFB0w4qMdA-1; Wed, 20 Apr 2022 09:26:28 -0400
X-MC-Unique: dmqtvMDFPNKaHFB0w4qMdA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A46D218AE943
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 13:26:28 +0000 (UTC)
Received: from localhost (unknown [10.39.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5E09C112131E;
 Wed, 20 Apr 2022 13:26:27 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 00/41] Misc cleanups
Date: Wed, 20 Apr 2022 17:25:43 +0400
Message-Id: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Another batch of cleanup patches, mostly while working on moving the common code
in some future subprojects. (a few patches have been posted and reviewed
earlier)

Marc-André Lureau (41):
  qga: use fixed-length for usecs formatting
  glib-compat: isolate g_date_time_format_iso8601 version-bypass
  scripts/analyze-inclusions: drop qemu-common.h from analysis
  Simplify softmmu/main.c
  hw/hyperv: remove needless qemu-common.h include
  include: rename qemu-common.h qemu/copyright.h
  build-sys: remove MSI's QEMU_GA_MSI_MINGW_DLL_PATH
  build-sys: simplify MSI's QEMU_GA_MANUFACTURER
  build-sys: simplify MSI's QEMU_GA_VERSION
  build-sys: drop MSI's QEMU_GA_DISTRO
  qga: replace usleep() with g_usleep()
  docs: trace-events-all is installed without renaming
  arm/digic: replace snprintf() with g_strdup_printf()
  arm/allwinner-a10: replace snprintf() with g_strdup_printf()
  intc/exynos4210_gic: replace snprintf() with g_strdup_printf()
  doc/style: CLang -> Clang
  doc/build-platforms: document supported compilers
  osdep.h: move qemu_build_not_reached()
  compiler.h: replace QEMU_NORETURN with G_NORETURN
  include: move qemu_msync() to osdep
  include: move qemu_fdatasync() to osdep
  include: move qemu_*_exec_dir() to cutils
  include: add qemu/keyval.h
  include: move qdict_{crumple,flatten} declarations
  tests: remove block/qdict checks from check-qobject.c
  compiler.h: add QEMU_SANITIZE_{ADDRESS,THREAD}
  Use QEMU_SANITIZE_THREAD
  Use QEMU_SANITIZE_ADDRESS
  tests: run-time skip test-qga if TSAN is enabled
  Move error_printf_unless_qmp() with monitor unit
  qga: move qga_get_host_name()
  qtest: simplify socket_send()
  tests: move libqtest.c under libqos/
  libqtest: split QMP part in libqmp
  util: simplify write in signal handler
  util: use qemu_write_full() in qemu_write_pidfile()
  util: use qemu_create() in qemu_write_pidfile()
  util: replace qemu_get_local_state_pathname()
  qga: remove need for QEMU atomic.h
  migration/ram: fix clang warning
  tests/fuzz: fix warning

 docs/about/build-platforms.rst               |  10 +
 docs/devel/qtest.rst                         |   4 +-
 docs/devel/style.rst                         |   2 +-
 docs/devel/tracing.rst                       |   2 +-
 configure                                    |  16 --
 accel/tcg/internal.h                         |   3 +-
 include/block/qdict.h                        |   3 +
 include/exec/exec-all.h                      |  20 +-
 include/exec/helper-head.h                   |   2 +-
 include/glib-compat.h                        |  12 +-
 include/hw/core/cpu.h                        |   2 +-
 include/hw/core/tcg-cpu-ops.h                |   6 +-
 include/hw/hw.h                              |   2 +-
 include/monitor/monitor.h                    |   3 +
 include/qapi/qmp/qdict.h                     |   3 -
 include/qemu-main.h                          |  10 +
 include/qemu/atomic.h                        |   8 +-
 include/qemu/compiler.h                      |  26 +--
 include/{qemu-common.h => qemu/copyright.h}  |   5 -
 include/qemu/cutils.h                        |   9 +-
 include/qemu/error-report.h                  |   2 -
 include/qemu/keyval.h                        |  14 ++
 include/qemu/option.h                        |   6 -
 include/qemu/osdep.h                         |  51 ++--
 include/qemu/thread.h                        |   2 +-
 include/tcg/tcg-ldst.h                       |   4 +-
 include/tcg/tcg.h                            |   2 +-
 linux-user/user-internals.h                  |   2 +-
 qga/commands-common.h                        |  11 +
 scripts/cocci-macro-file.h                   |   2 +-
 subprojects/libvhost-user/include/compiler.h |   1 +
 target/alpha/cpu.h                           |  10 +-
 target/arm/internals.h                       |  12 +-
 target/hppa/cpu.h                            |   2 +-
 target/i386/tcg/helper-tcg.h                 |  24 +-
 target/microblaze/cpu.h                      |   6 +-
 target/mips/tcg/tcg-internal.h               |  17 +-
 target/nios2/cpu.h                           |   6 +-
 target/openrisc/exception.h                  |   2 +-
 target/ppc/cpu.h                             |  14 +-
 target/ppc/internal.h                        |   6 +-
 target/riscv/cpu.h                           |  10 +-
 target/s390x/s390x-internal.h                |   6 +-
 target/s390x/tcg/tcg_s390x.h                 |  12 +-
 target/sh4/cpu.h                             |   6 +-
 target/sparc/cpu.h                           |  10 +-
 target/xtensa/cpu.h                          |   6 +-
 tests/qtest/libqos/libqmp.h                  |  50 ++++
 tests/qtest/libqos/libqtest.h                |  29 +--
 accel/stubs/tcg-stub.c                       |   4 +-
 bsd-user/main.c                              |   2 +-
 bsd-user/signal.c                            |   3 +-
 hw/arm/allwinner-a10.c                       |   4 +-
 hw/arm/digic.c                               |   5 +-
 hw/hyperv/syndbg.c                           |   1 -
 hw/intc/exynos4210_gic.c                     |   9 +-
 hw/misc/mips_itu.c                           |   3 +-
 linux-user/main.c                            |   2 +-
 linux-user/signal.c                          |   3 +-
 migration/ram.c                              |   2 +-
 monitor/hmp.c                                |   4 +-
 monitor/monitor.c                            |  10 +
 qapi/qobject-input-visitor.c                 |   2 +-
 qemu-img.c                                   |  14 +-
 qemu-io.c                                    |   3 +-
 qemu-nbd.c                                   |   2 +-
 qga/commands-posix.c                         |  35 +++
 qga/commands-win32.c                         |  13 ++
 qga/commands.c                               |  14 +-
 qga/main.c                                   |  19 +-
 qom/object_interfaces.c                      |   1 +
 scsi/qemu-pr-helper.c                        |   8 +-
 softmmu/main.c                               |  25 +-
 softmmu/vl.c                                 |   4 +-
 storage-daemon/qemu-storage-daemon.c         |   3 +-
 stubs/error-printf.c                         |   1 +
 target/alpha/helper.c                        |  10 +-
 target/arm/pauth_helper.c                    |   4 +-
 target/arm/tlb_helper.c                      |   7 +-
 target/hexagon/op_helper.c                   |   9 +-
 target/hppa/cpu.c                            |   8 +-
 target/hppa/op_helper.c                      |   4 +-
 target/i386/tcg/bpt_helper.c                 |   2 +-
 target/i386/tcg/excp_helper.c                |  31 +--
 target/i386/tcg/misc_helper.c                |   6 +-
 target/i386/tcg/sysemu/misc_helper.c         |   7 +-
 target/openrisc/exception.c                  |   2 +-
 target/openrisc/exception_helper.c           |   3 +-
 target/riscv/op_helper.c                     |   4 +-
 target/rx/op_helper.c                        |  22 +-
 target/s390x/tcg/excp_helper.c               |  22 +-
 target/sh4/op_helper.c                       |   5 +-
 target/sparc/mmu_helper.c                    |   8 +-
 target/tricore/op_helper.c                   |   6 +-
 tcg/tcg.c                                    |   3 +-
 tests/fp/fp-bench.c                          |   3 +-
 tests/fp/fp-test.c                           |   3 +-
 tests/qtest/fdc-test.c                       |   2 +-
 tests/qtest/fuzz/fuzz.c                      |   1 +
 tests/qtest/fuzz/generic_fuzz.c              |   2 -
 tests/qtest/libqos/libqmp.c                  | 230 +++++++++++++++++++
 tests/qtest/{ => libqos}/libqtest.c          | 222 +-----------------
 tests/unit/check-qobject.c                   |   7 -
 tests/unit/check-qom-proplist.c              |   1 +
 tests/unit/test-forward-visitor.c            |   2 +-
 tests/unit/test-keyval.c                     |   2 +-
 tests/unit/test-qga.c                        |   7 +
 tools/virtiofsd/fuse_virtio.c                |   4 +-
 tools/virtiofsd/passthrough_ll.c             |   2 +-
 ui/vnc.c                                     |   1 +
 util/compatfd.c                              |  18 +-
 util/coroutine-ucontext.c                    |   2 +-
 util/cutils.c                                | 163 ++++++++-----
 util/error-report.c                          |  17 +-
 util/keyval.c                                |   2 +-
 util/osdep.c                                 |  16 ++
 util/oslib-posix.c                           | 146 ++----------
 util/oslib-win32.c                           |  64 +-----
 qga/installer/qemu-ga.wxs                    |  24 +-
 qga/meson.build                              |   5 +-
 scripts/analyze-inclusions                   |   4 -
 scripts/checkpatch.pl                        |   2 +-
 tests/qtest/libqos/meson.build               |   5 +-
 tests/unit/meson.build                       |   4 +-
 ui/cocoa.m                                   |   3 +-
 125 files changed, 914 insertions(+), 882 deletions(-)
 create mode 100644 include/qemu-main.h
 rename include/{qemu-common.h => qemu/copyright.h} (80%)
 create mode 100644 include/qemu/keyval.h
 create mode 120000 subprojects/libvhost-user/include/compiler.h
 create mode 100644 tests/qtest/libqos/libqmp.h
 create mode 100644 tests/qtest/libqos/libqmp.c
 rename tests/qtest/{ => libqos}/libqtest.c (87%)

-- 
2.35.1.693.g805e0a68082a


