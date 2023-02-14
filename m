Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08DDD696265
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 12:25:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRtNn-00078i-LF; Tue, 14 Feb 2023 06:21:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pRtNl-000760-2l
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 06:21:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pRtNj-0002Fv-DP
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 06:21:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676373714;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=N1KgPrqCiDV7ZqAB3kMc47eGZHZ6TgItF7l8VtMcAUs=;
 b=bK6xNRBRsp/QSU/btDHwjg8tp5KXMV/AMAJRrYPRZFcAXDnWFHCqCNbAo4Ixmb6zPoqs0O
 oi+ZzbCZU2zz2ZLtMncZUv0MDDR5v5TA+dX1f7YwnCwawUHGIsnfsoMajX/u4e8vQBgaG7
 E/TI8pq8H9l5wbMvt9Vz2hJLUKWY7ak=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-159-PctKJhGjPd2Fwd1LmOuMlg-1; Tue, 14 Feb 2023 06:21:51 -0500
X-MC-Unique: PctKJhGjPd2Fwd1LmOuMlg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1BFE0800B24;
 Tue, 14 Feb 2023 11:21:51 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.14])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6C1A640B40C9;
 Tue, 14 Feb 2023 11:21:50 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 00/22] qtest, s390x and misc patches
Date: Tue, 14 Feb 2023 12:21:26 +0100
Message-Id: <20230214112148.646077-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

 Hi Peter!

The following changes since commit f670b3eec7f5d1ed8c4573ef244e7b8c6b32001b:

  Merge tag 'migration-20230213-pull-request' of https://gitlab.com/juan.quintela/qemu into staging (2023-02-13 11:54:05 +0000)

are available in the Git repository at:

  https://gitlab.com/thuth/qemu.git tags/pull-request-2023-02-14

for you to fetch changes up to b1d1d468cabfa800950e1ecb6006df619687c269:

  hw/s390x/event-facility: Replace DO_UPCAST(SCLPEvent) by SCLP_EVENT() (2023-02-14 09:11:27 +0100)

----------------------------------------------------------------
* Bump minimum Clang version to 10.0
* Improve the handling of the libdw library
* Deprecate --enable-gprof builds and remove them from CI
* Remove the deprecated "sga" device
* Some header #include clean-ups
* Make qtests more flexible with regards to missing devices
* Some small s390x-related fixes/improvements

----------------------------------------------------------------
Alex Bennée (1):
      build: deprecate --enable-gprof builds and remove from CI

Fabiano Rosas (12):
      tests/qtest: Skip PXE tests for missing devices
      tests/qtest: Do not run lsi53c895a test if device is not present
      tests/qtest: Add dependence on PCIE_PORT for virtio-net-failover.c
      tests/qtest: hd-geo-test: Check for missing devices
      test/qtest: Fix coding style in device-plug-test.c
      tests/qtest: Skip unplug tests that use missing devices
      tests/qtest: drive_del-test: Skip tests that require missing devices
      tests/qtest: Check for devices in bios-tables-test
      tests/qtest: Do not include hexloader-test if loader device is not present
      tests/qemu-iotests: Require virtio-scsi-pci
      tests/qtest: bios-tables-test: Skip if missing configs
      tests/qtest: Don't build virtio-serial-test.c if device not present

Ilya Leoshkevich (3):
      meson: Add missing libdw knobs
      meson: Disable libdw for static builds by default
      tests/tcg/s390x: Use -nostdlib for softmmu tests

Peter Maydell (1):
      tests/qtest/npcm7xx_pwm-test: Be less verbose unless V=2

Philippe Mathieu-Daudé (1):
      hw/s390x/event-facility: Replace DO_UPCAST(SCLPEvent) by SCLP_EVENT()

Thomas Huth (4):
      configure: Bump minimum Clang version to 10.0
      hw/misc/sga: Remove the deprecated "sga" device
      include/hw: Do not include "hw/registerfields.h" in headers that don't need it
      Do not include "qemu/error-report.h" in headers that do not need it

 MAINTAINERS                             |   1 -
 docs/about/deprecated.rst               |  23 ++++++----
 docs/about/removed-features.rst         |  10 +++++
 configure                               |  25 +++--------
 meson.build                             |  19 +++++---
 include/hw/arm/allwinner-a10.h          |   1 -
 include/hw/arm/smmuv3.h                 |   1 -
 include/hw/char/ibex_uart.h             |   1 -
 include/hw/ssi/ibex_spi_host.h          |   1 -
 include/qemu/vhost-user-server.h        |   1 -
 include/ui/console.h                    |   1 -
 hw/char/ibex_uart.c                     |   1 +
 hw/display/vhost-user-gpu.c             |   1 +
 hw/display/virtio-gpu-udmabuf.c         |   1 +
 hw/display/virtio-gpu-virgl.c           |   1 +
 hw/misc/applesmc.c                      |   1 +
 hw/misc/sga.c                           |  71 ------------------------------
 hw/s390x/event-facility.c               |   3 +-
 hw/ssi/ibex_spi_host.c                  |   1 +
 tests/qtest/bios-tables-test.c          |  75 ++++++++++++++++++++++++++++++--
 tests/qtest/device-plug-test.c          |  41 +++++++++++++----
 tests/qtest/drive_del-test.c            |  65 +++++++++++++++++++++++++++
 tests/qtest/fuzz-lsi53c895a-test.c      |   4 ++
 tests/qtest/hd-geo-test.c               |  38 ++++++++++------
 tests/qtest/npcm7xx_pwm-test.c          |  27 +++++++++---
 tests/qtest/pxe-test.c                  |   4 ++
 ui/console.c                            |   1 +
 ui/dbus-clipboard.c                     |   1 +
 ui/dbus-console.c                       |   1 +
 ui/dbus-listener.c                      |   1 +
 ui/dbus.c                               |   1 +
 ui/egl-headless.c                       |   1 +
 ui/gtk.c                                |   1 +
 ui/spice-app.c                          |   1 +
 ui/spice-display.c                      |   1 +
 ui/udmabuf.c                            |   1 +
 ui/vdagent.c                            |   1 +
 util/vhost-user-server.c                |   1 +
 .gitlab-ci.d/buildtest.yml              |  19 ++------
 .gitmodules                             |   3 --
 hw/i386/Kconfig                         |   1 -
 hw/misc/Kconfig                         |   4 --
 hw/misc/meson.build                     |   1 -
 meson_options.txt                       |   5 ++-
 pc-bios/README                          |   6 ---
 pc-bios/meson.build                     |   1 -
 pc-bios/sgabios.bin                     | Bin 4096 -> 0 bytes
 roms/Makefile                           |   9 +---
 roms/sgabios                            |   1 -
 scripts/meson-buildoptions.sh           |   3 ++
 tests/migration/guestperf/engine.py     |   2 +-
 tests/qemu-iotests/186                  |   1 +
 tests/qtest/meson.build                 |  17 +++++---
 tests/tcg/s390x/Makefile.softmmu-target |   2 +-
 54 files changed, 312 insertions(+), 193 deletions(-)
 delete mode 100644 hw/misc/sga.c
 delete mode 100644 pc-bios/sgabios.bin
 delete mode 160000 roms/sgabios


