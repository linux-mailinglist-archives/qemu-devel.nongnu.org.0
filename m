Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96FA15A6C84
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 20:45:02 +0200 (CEST)
Received: from localhost ([::1]:45132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oT6EO-0004WH-VN
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 14:45:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oT6A2-0007L0-5z
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 14:40:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59195)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oT69t-00051Y-Mk
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 14:40:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661884819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=BLg+27tJuULr+t2qwnsI+6mSUBm9TnlfWJuQngiL3fs=;
 b=hgCLblIAWsVZ7FpMCoF8kpG4Fvjt6HUDzYPHl0kKqNfB9EhaOEnt+jsKMxaLm2LQ49jedO
 XK51nul9WA+GMLxv7pvVvmfmHWZkRhjV2ibvoJs1NXbkn9ZWTwWtR+4yXmvEB2H9WkRfem
 WhZUz0DVP2T5x9BZ28/Nh7tjAKnOLS4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-191-9fgmuc60MXmzYyucUIIF-g-1; Tue, 30 Aug 2022 14:40:16 -0400
X-MC-Unique: 9fgmuc60MXmzYyucUIIF-g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F063D185A7B2;
 Tue, 30 Aug 2022 18:40:15 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.125])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E9ED31410F37;
 Tue, 30 Aug 2022 18:40:14 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 00/23] First testing patches for QEMU 7.2
Date: Tue, 30 Aug 2022 20:39:49 +0200
Message-Id: <20220830184012.77978-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

 Hi Peter, hi Richard,

sorry for flooding you with so many pull request mails right after
QEMU 7.1 has been tagged, but I'll be away from keyboard starting
tomorrow, and I still wanted to get these out before I'm away...

The following changes since commit 9a99f964b152f8095949bbddca7841744ad418da:

  Update version for v7.1.0-rc4 release (2022-08-24 19:27:56 -0700)

are available in the Git repository at:

  https://gitlab.com/thuth/qemu.git tags/testing-pull-request-2022-08-30

for you to fetch changes up to da55be562ea2b082da5d55cc12730fe8fe118852:

  tests/avocado/migration: Get find_free_port() from the ports (2022-08-30 07:55:43 +0200)

----------------------------------------------------------------
* First batch of patches to get qtests adapted for Windows
* Two preparation patches for the upcoming removal of the slirp submodule
* Some other small test fixes (typos, etc.)

----------------------------------------------------------------
Akihiko Odaki (1):
      tests/qtest/ac97-test: Correct reference to driver

Bin Meng (14):
      tests/qtest: Use g_setenv()
      tests/qtest: Use g_mkdtemp()
      tests: Use g_mkdir_with_parents()
      tests/qtest: migration-test: Handle link() for win32
      backends/tpm: Exclude headers and macros that don't exist on win32
      tests/qtest: Adapt {m48t59,rtc}-test cases for win32
      tests/qtest: Build e1000e-test for posix only
      tests/qtest: Build cases that use memory-backend-file for posix only
      tests/qtest: i440fx-test: Skip running request_{bios, pflash} for win32
      tests/qtest: migration-test: Skip running test_migrate_fd_proto on win32
      tests/qtest: device-plug-test: Reverse the usage of double/single quotes
      tests/qtest: machine-none-test: Use double quotes to pass the cpu option
      tests/qtest: npcm7xx_emc-test: Skip running test_{tx, rx} on win32
      tests/qtest: prom-env-test: Use double quotes to pass the prom-env option

Matheus Tavares Bernardino (1):
      docs/devel/testing: fix minor typo

Thomas Huth (5):
      tests/vm: Add libslirp to the VM tests
      tests/avocado: Do not run tests that require libslirp if it is not available
      tests/avocado: Fix trivial typo
      gitlab-ci: Only use one process in Windows jobs for compilation
      tests/avocado/migration: Get find_free_port() from the ports

Xuzhou Cheng (2):
      tests/qtest: libqos: Drop inclusion of <sys/wait.h>
      tests/qtest: libqos: Rename malloc.h to libqos-malloc.h

 docs/devel/testing.rst                           |  2 +-
 backends/tpm/tpm_ioctl.h                         |  4 ++++
 tests/qtest/fuzz/generic_fuzz_configs.h          |  2 +-
 tests/qtest/libqos/generic-pcihost.h             |  2 +-
 tests/qtest/libqos/{malloc.h => libqos-malloc.h} |  0
 tests/qtest/libqos/libqos.h                      |  2 +-
 tests/qtest/libqos/malloc-pc.h                   |  2 +-
 tests/qtest/libqos/malloc-spapr.h                |  2 +-
 tests/qtest/libqos/pci-pc.h                      |  2 +-
 tests/qtest/libqos/pci-spapr.h                   |  2 +-
 tests/qtest/libqos/qgraph.h                      |  2 +-
 tests/qtest/libqos/qos_external.h                |  2 +-
 tests/qtest/libqos/rtas.h                        |  2 +-
 tests/qtest/libqos/virtio.h                      |  2 +-
 tests/qtest/migration-helpers.h                  |  2 ++
 tests/migration/stress.c                         |  2 +-
 tests/qtest/ac97-test.c                          |  2 +-
 tests/qtest/bios-tables-test.c                   | 10 ++++++++++
 tests/qtest/cdrom-test.c                         |  2 +-
 tests/qtest/cxl-test.c                           | 10 +++++++---
 tests/qtest/device-plug-test.c                   |  2 +-
 tests/qtest/e1000e-test.c                        |  2 +-
 tests/qtest/fuzz/generic_fuzz.c                  |  8 ++++----
 tests/qtest/fuzz/qos_fuzz.c                      |  2 +-
 tests/qtest/i440fx-test.c                        |  6 ++++++
 tests/qtest/ivshmem-test.c                       |  4 ++--
 tests/qtest/libqos/aarch64-xlnx-zcu102-machine.c |  2 +-
 tests/qtest/libqos/arm-imx25-pdk-machine.c       |  2 +-
 tests/qtest/libqos/arm-n800-machine.c            |  2 +-
 tests/qtest/libqos/arm-raspi2-machine.c          |  2 +-
 tests/qtest/libqos/arm-sabrelite-machine.c       |  2 +-
 tests/qtest/libqos/arm-smdkc210-machine.c        |  2 +-
 tests/qtest/libqos/arm-virt-machine.c            |  2 +-
 tests/qtest/libqos/arm-xilinx-zynq-a9-machine.c  |  2 +-
 tests/qtest/libqos/e1000e.c                      |  2 +-
 tests/qtest/libqos/{malloc.c => libqos-malloc.c} |  2 +-
 tests/qtest/libqos/libqos.c                      |  2 --
 tests/qtest/libqos/qos_external.c                |  2 +-
 tests/qtest/libqos/virtio-9p.c                   |  4 ++--
 tests/qtest/libqos/virtio-mmio.c                 |  2 +-
 tests/qtest/libqos/virtio-pci.c                  |  2 +-
 tests/qtest/libqtest.c                           |  4 ++--
 tests/qtest/m48t59-test.c                        |  2 +-
 tests/qtest/machine-none-test.c                  |  2 +-
 tests/qtest/migration-helpers.c                  |  2 ++
 tests/qtest/migration-test.c                     | 22 +++++++++++++++++-----
 tests/qtest/npcm7xx_emc-test.c                   |  8 ++++++++
 tests/qtest/prom-env-test.c                      |  4 ++--
 tests/qtest/qmp-test.c                           |  4 ++--
 tests/qtest/qos-test.c                           |  2 +-
 tests/qtest/rtc-test.c                           |  2 +-
 tests/qtest/vhost-user-test.c                    |  4 ++--
 tests/unit/test-crypto-tlscredsx509.c            |  4 ++--
 tests/unit/test-crypto-tlssession.c              |  6 +++---
 tests/unit/test-io-channel-tls.c                 |  6 +++---
 tests/unit/test-qga.c                            |  2 +-
 .gitlab-ci.d/windows.yml                         |  4 ++--
 tests/avocado/avocado_qemu/__init__.py           |  9 ++++++++-
 tests/avocado/info_usernet.py                    |  1 +
 tests/avocado/migration.py                       |  4 ++--
 tests/avocado/replay_linux.py                    |  1 +
 tests/qtest/libqos/meson.build                   |  2 +-
 tests/qtest/meson.build                          |  7 +++++--
 tests/vm/freebsd                                 |  3 +++
 tests/vm/haiku.x86_64                            |  3 ++-
 tests/vm/netbsd                                  |  3 +++
 66 files changed, 144 insertions(+), 79 deletions(-)
 rename tests/qtest/libqos/{malloc.h => libqos-malloc.h} (100%)
 rename tests/qtest/libqos/{malloc.c => libqos-malloc.c} (99%)


