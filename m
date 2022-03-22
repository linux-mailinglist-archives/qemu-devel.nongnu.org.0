Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1FF14E3E9A
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 13:38:52 +0100 (CET)
Received: from localhost ([::1]:56264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWdml-0000MW-3o
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 08:38:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nWdaY-00055x-HD
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 08:26:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nWdaW-0002V7-3w
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 08:26:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647951970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=e1KBnroHaza0U+QSqv5QnzRJ+jYjrJAG7j84y5Wq+YQ=;
 b=CtQE010vyYjYIF3/L1gdjeVZrFUmbZFHpwT/UKye9UO0Gmi4Sw+qmiCRqmFkhndFluZjBi
 NMr9fUQOwJedGsKrspmkZeR0ZbiBWXi6q3OR6cWWeWT+X39O+2XF5H9dsNTOlIgvwuUX68
 5dS851doR+Gu3z5Q5dzfkqQ+p5xNP04=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-441-9ntrBKlGM8KJnD-NKD0czQ-1; Tue, 22 Mar 2022 08:26:05 -0400
X-MC-Unique: 9ntrBKlGM8KJnD-NKD0czQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 970871044561;
 Tue, 22 Mar 2022 12:26:05 +0000 (UTC)
Received: from localhost (unknown [10.39.208.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 420EF43E8F0;
 Tue, 22 Mar 2022 12:26:03 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL 00/21] Fixes patches
Date: Tue, 22 Mar 2022 16:25:40 +0400
Message-Id: <20220322122601.927238-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The following changes since commit 48fb0a826eea2e7b0135f49e7fa63e7efe2b7677:

  Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging (2022-03-21 21:27:14 +0000)

are available in the Git repository at:

  git@gitlab.com:marcandre.lureau/qemu.git tags/fixes-pull-request

for you to fetch changes up to 4ea4bec6f459ff1af6af01677d5bfac240db0201:

  qapi: remove needless include (2022-03-22 14:46:18 +0400)

----------------------------------------------------------------
Fixes and cleanups for 7.0

Hi,

A collection of fixes & cleanup patches that should be safe for 7.0 inclusion.

----------------------------------------------------------------

Marc-André Lureau (21):
  qemu-options: define -spice only #ifdef CONFIG_SPICE
  vl: typo fix in a comment
  m68k/nios2-semi: fix gettimeofday() result check
  Drop qemu_foo() socket API wrapper
  Replace GCC_FMT_ATTR with G_GNUC_PRINTF
  compiler.h: replace QEMU_WARN_UNUSED_RESULT with
    G_GNUC_WARN_UNUSED_RESULT
  compiler.h: replace QEMU_SENTINEL with G_GNUC_NULL_TERMINATED
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
  error: use GLib to remember the program name
  tests: remove needless include
  Remove trailing ; after G_DEFINE_AUTO macro
  qapi: remove needless include

 configure                               | 49 +------------------------
 meson.build                             | 48 +++++++++++++++++++++---
 audio/audio.h                           |  4 +-
 block/qcow2.h                           |  2 +-
 bsd-user/qemu.h                         |  2 +-
 hw/display/qxl.h                        |  2 +-
 hw/net/rocker/rocker.h                  |  2 +-
 hw/xen/xen_pt.h                         |  2 +-
 include/chardev/char-fe.h               |  2 +-
 include/disas/dis-asm.h                 |  2 +-
 include/hw/acpi/aml-build.h             | 12 +++---
 include/hw/core/cpu.h                   |  2 +-
 include/hw/hw.h                         |  2 +-
 include/hw/virtio/virtio.h              |  2 +-
 include/hw/xen/xen-bus-helper.h         |  4 +-
 include/hw/xen/xen-bus.h                |  4 +-
 include/hw/xen/xen_common.h             |  2 +-
 include/hw/xen/xen_pvdev.h              |  2 +-
 include/monitor/monitor.h               |  4 +-
 include/qapi/error.h                    | 20 +++++-----
 include/qapi/qmp/qjson.h                |  8 ++--
 include/qemu-common.h                   | 22 +----------
 include/qemu/buffer.h                   |  2 +-
 include/qemu/compiler.h                 | 20 ++++------
 include/qemu/error-report.h             | 26 ++++++-------
 include/qemu/log-for-trace.h            |  2 +-
 include/qemu/log.h                      |  2 +-
 include/qemu/osdep.h                    |  9 -----
 include/qemu/qemu-print.h               |  8 ++--
 include/qemu/range.h                    |  4 +-
 include/qemu/readline.h                 |  2 +-
 include/qom/object.h                    |  6 +--
 qga/guest-agent-core.h                  |  2 +-
 qga/vss-win32/requester.h               |  2 +-
 scripts/cocci-macro-file.h              |  6 +--
 tests/qtest/libqos/libqtest.h           | 42 ++++++++++-----------
 tests/qtest/libqtest-single.h           |  2 +-
 tests/qtest/migration-helpers.h         |  6 +--
 audio/alsaaudio.c                       |  4 +-
 audio/dsoundaudio.c                     |  4 +-
 audio/ossaudio.c                        |  4 +-
 audio/paaudio.c                         |  2 +-
 audio/sdlaudio.c                        |  2 +-
 block/blkverify.c                       |  2 +-
 block/qcow2-refcount.c                  | 20 +++++-----
 block/ssh.c                             |  4 +-
 crypto/cipher-afalg.c                   |  4 +-
 crypto/hash-afalg.c                     |  4 +-
 fsdev/9p-marshal.c                      |  2 +-
 fsdev/virtfs-proxy-helper.c             |  2 +-
 gdbstub.c                               |  2 +-
 hw/9pfs/9p.c                            |  2 +-
 hw/acpi/aml-build.c                     |  4 +-
 hw/mips/fuloong2e.c                     |  2 +-
 hw/mips/malta.c                         |  2 +-
 hw/net/rtl8139.c                        |  2 +-
 hw/virtio/virtio.c                      |  2 +-
 io/channel-socket.c                     |  6 +--
 io/channel-websock.c                    |  2 +-
 monitor/hmp.c                           |  4 +-
 nbd/server.c                            | 12 +++---
 net/announce.c                          | 13 +++++++
 net/socket.c                            | 24 ++++++------
 qapi/qapi-forward-visitor.c             |  1 -
 qapi/qmp-dispatch.c                     |  1 -
 qapi/string-output-visitor.c            |  1 -
 qemu-img.c                              |  4 +-
 qemu-io.c                               | 12 +++---
 qga/main.c                              |  1 -
 qobject/json-parser.c                   |  2 +-
 softmmu/qtest.c                         |  4 +-
 softmmu/vl.c                            |  6 ++-
 storage-daemon/qemu-storage-daemon.c    |  2 +-
 target/m68k/m68k-semi.c                 |  2 +-
 target/nios2/nios2-semi.c               |  2 +-
 tests/qtest/e1000e-test.c               |  4 +-
 tests/qtest/libqtest.c                  |  6 +--
 tests/qtest/npcm7xx_emc-test.c          |  4 +-
 tests/qtest/test-filter-mirror.c        |  4 +-
 tests/qtest/test-filter-redirector.c    |  8 ++--
 tests/qtest/virtio-net-test.c           | 10 ++---
 tests/unit/check-qobject.c              |  1 -
 tests/unit/socket-helpers.c             |  2 +-
 tests/unit/test-qobject-input-visitor.c |  4 +-
 trace/control.c                         |  2 +-
 util/cutils.c                           | 16 --------
 util/osdep.c                            |  4 +-
 util/qemu-error.c                       | 24 +++---------
 util/qemu-sockets.c                     | 10 ++---
 audio/coreaudio.m                       |  4 +-
 qemu-options.hx                         |  2 +
 scripts/checkpatch.pl                   |  6 +--
 scripts/modinfo-collect.py              |  5 ---
 93 files changed, 278 insertions(+), 347 deletions(-)

-- 
2.35.1.273.ge6ebfd0e8cbb


