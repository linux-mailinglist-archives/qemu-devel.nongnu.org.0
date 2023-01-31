Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 946E7682A08
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 11:13:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMnd0-0002Hi-TK; Tue, 31 Jan 2023 05:12:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMncb-0002H7-7I
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 05:12:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMncZ-0002Rr-Dg
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 05:12:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675159930;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=R4iBpMSFj8Ove6ZrFROJUf4VBp3+2Skud8BNyrfi7i8=;
 b=B750jVjf0BcPOmTd0fSeE4r3MycCmV0Gl0fP3iVlcwkIrDS0TgbJZ9LM1POMbSx7ujYdwk
 RBiEyQauXoU/2SdoI7VK3n+wUm+4sG5CwUwYb4kN+8CJNPOnqkgr5SZ+PJsQA5pd6wvi8F
 YMR/adMGNabfkxLYXm8k/W+VlCagcyU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-643-V_9ysChXNS-IYWAKFX7hWQ-1; Tue, 31 Jan 2023 05:12:08 -0500
X-MC-Unique: V_9ysChXNS-IYWAKFX7hWQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 32B4D3806624;
 Tue, 31 Jan 2023 10:12:08 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.188])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 91763C15BAD;
 Tue, 31 Jan 2023 10:12:07 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 00/27] qtest and misc patches
Date: Tue, 31 Jan 2023 11:11:38 +0100
Message-Id: <20230131101205.1499867-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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

The following changes since commit 13356edb87506c148b163b8c7eb0695647d00c2a:

  Merge tag 'block-pull-request' of https://gitlab.com/stefanha/qemu into staging (2023-01-24 09:45:33 +0000)

are available in the Git repository at:

  https://gitlab.com/thuth/qemu.git tags/pull-request-2023-01-31

for you to fetch changes up to e030d08c2fc02743dd37e3d2e6e28fdd739590b9:

  gitlab-ci.d/buildtest: Merge the --without-default-* jobs (2023-01-31 09:05:26 +0100)

----------------------------------------------------------------
* qtest improvements
* Remove the deprecated OTP config of sifive_u
* Add libfdt to some of our CI jobs that were still missing it
* Use __builtin_bswap() everywhere (all compiler versions support it now)
* Deprecate the HAXM accelerator
* Document PCI devices handling on s390x
* Make Audiodev introspectable
* Improve the runtime of some CI jobs

----------------------------------------------------------------
Daniel P. Berrangé (2):
      qapi, audio: add query-audiodev command
      qapi, audio: Make introspection reflect build configuration more closely

Fabiano Rosas (1):
      tests/tcg: Do not build/run TCG tests if TCG is disabled

Laurent Vivier (1):
      tests/qtest: netdev: test stream and dgram backends

Philippe Mathieu-Daudé (10):
      qemu/bswap: Replace bswapXX() by compiler __builtin_bswap()
      qemu/bswap: Replace bswapXXs() by compiler __builtin_bswap()
      qemu/bswap: Remove <byteswap.h> dependency
      qemu/bswap: Use compiler __builtin_bswap() on Haiku
      qemu/bswap: Use compiler __builtin_bswap() on FreeBSD
      qemu/bswap: Use compiler __builtin_bswap() on NetBSD
      tests/qtest/vnc-display-test: Suppress build warnings on Windows
      tests/qtest/vnc-display-test: Use the 'none' machine
      tests/qtest/vnc-display-test: Disable on Darwin
      tests/qtest/boot-serial-test: Constify tests[] array

Sebastian Mitterle (1):
      docs/s390x/pcidevices: document pci devices on s390x

Thomas Huth (11):
      tests/qtest/qom-test: Stop spamming the test log
      tests/qtest/bios-tables-test: Make the test less verbose by default
      hw/misc/sifive_u_otp: Remove the deprecated OTP config with '-drive if=none'
      configs/targets/nios2-softmmu: Add TARGET_NEED_FDT=y to the nios2 config
      travis.yml: Use the libfdt from the distro instead of the submodule
      travis.yml: Remove the generic addons section
      tests/docker/dockerfiles: Add libfdt to the i386 and to the riscv64 container
      docs/about/deprecated: Mark HAXM in QEMU as deprecated
      gitlab-ci.d/buildtest: Remove ppc-softmmu from the clang-system job
      tests/qtest/display-vga-test: Add proper checks if a device is available
      gitlab-ci.d/buildtest: Merge the --without-default-* jobs

Wenchao Wang (1):
      MAINTAINERS: Abort HAXM maintenance

 MAINTAINERS                                        |   5 +-
 docs/about/deprecated.rst                          |  12 +-
 docs/about/removed-features.rst                    |   7 +
 docs/system/s390x/pcidevices.rst                   |  41 ++
 docs/system/target-s390x.rst                       |   1 +
 configure                                          |   6 +-
 configs/targets/nios2-softmmu.mak                  |   1 +
 meson.build                                        |   6 -
 qapi/audio.json                                    |  57 ++-
 audio/audio_template.h                             |  20 +
 include/qemu/bswap.h                               |  83 +---
 audio/audio.c                                      |  32 ++
 audio/audio_legacy.c                               |  41 +-
 hw/misc/sifive_u_otp.c                             |   7 -
 target/i386/hax/hax-all.c                          |   3 +
 tests/qtest/bios-tables-test.c                     |  17 +-
 tests/qtest/boot-serial-test.c                     |   2 +-
 tests/qtest/display-vga-test.c                     |  65 ++-
 tests/qtest/netdev-socket.c                        | 448 +++++++++++++++++++++
 tests/qtest/qom-test.c                             |  12 +-
 tests/qtest/vnc-display-test.c                     |   9 +-
 .gitlab-ci.d/buildtest.yml                         |  20 +-
 .travis.yml                                        |  59 +--
 .../docker/dockerfiles/debian-riscv64-cross.docker |   1 +
 tests/docker/dockerfiles/fedora-i386-cross.docker  |   1 +
 tests/qtest/meson.build                            |   2 +
 26 files changed, 743 insertions(+), 215 deletions(-)
 create mode 100644 docs/system/s390x/pcidevices.rst
 create mode 100644 tests/qtest/netdev-socket.c


