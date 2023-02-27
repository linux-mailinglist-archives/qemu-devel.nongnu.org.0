Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7292A6A40B9
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 12:37:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWboB-0005Vl-Nr; Mon, 27 Feb 2023 06:36:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pWbo0-0005Oi-T5
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:36:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pWbnx-0005cV-7f
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:36:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677497786;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=EE+tWHFlx6yGbLIN7d0vcJ0dXk8pASvP7plJOSLj8UY=;
 b=QidL4d1923Z1g1hEGkQehspNOas9LtViOjcuZNFNFHomh3F1T2RvHSL1u8nC5FOXDwt8oZ
 jxsXgTEk6T4hK6ZGB2AI8/YY1PJ1bPMlueFb/22A2dpN9GwUqfeEnqpNvDNUoz6pP6kiYO
 8CuxmL+Yw9NjG8NclmTQZnfFkSYN0Q0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-610-3lNUXxnUObqHNYZHOFGSFA-1; Mon, 27 Feb 2023 06:36:24 -0500
X-MC-Unique: 3lNUXxnUObqHNYZHOFGSFA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5072D85CBE6;
 Mon, 27 Feb 2023 11:36:24 +0000 (UTC)
Received: from thuth.com (unknown [10.45.227.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B10C71121314;
 Mon, 27 Feb 2023 11:36:23 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 00/33] s390x and testing related patches
Date: Mon, 27 Feb 2023 12:35:48 +0100
Message-Id: <20230227113621.58468-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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

The following changes since commit 1270a3f57c9221080f3205a15964814ff8359ca9:

  Merge tag 'for-upstream' of https://repo.or.cz/qemu/kevin into staging (2023-02-24 15:09:39 +0000)

are available in the Git repository at:

  https://gitlab.com/thuth/qemu.git tags/pull-request-2023-02-27

for you to fetch changes up to fffa36b68e2f266c8b03ef3fdd242aa9a9181a87:

  Deprecate the "-no-acpi" command line switch (2023-02-27 09:23:21 +0100)

----------------------------------------------------------------
* Simplify device casting in w/vfio/ccw.c
* Fix memory corruption in the s390x dump code
* Various s390x TCG clean-ups
* s390x PV support for asynchronous teardown for reboot
* qemu-keymap related fixes
* Improvements for the duration of the gitlab-CI
* Deprecate the "-no-acpi" command line switch

----------------------------------------------------------------
Claudio Imbrenda (1):
      s390x/pv: Add support for asynchronous teardown for reboot

Dinah Baum (1):
      configure: Add 'mkdir build' check

Ilya Leoshkevich (2):
      tests/tcg/s390x: Add bal.S
      tests/tcg/s390x: Add sam.S

Khadija Kamran (1):
      Updated the FSF address to <https://www.gnu.org/licenses/>

Philippe Mathieu-Daudé (5):
      hw/vfio/ccw: Simplify using DEVICE() macro
      hw/vfio/ccw: Use intermediate S390CCWDevice variable
      hw/vfio/ccw: Replace DO_UPCAST(S390CCWDevice) by S390_CCW_DEVICE()
      hw/vfio/ccw: Remove pointless S390CCWDevice variable
      hw/vfio/ccw: Replace DO_UPCAST(VFIOCCWDevice) by VFIO_CCW()

Richard Henderson (11):
      target/s390x: Fix s390_probe_access for user-only
      target/s390x: Pass S390Access pointer into access_prepare
      target/s390x: Use void* for haddr in S390Access
      target/s390x: Tidy access_prepare_nf
      target/s390x: Remove TLB_NOTDIRTY workarounds
      target/s390x: Inline do_access_{get,set}_byte
      target/s390x: Hoist some computation in access_memmove
      target/s390x: Use tcg_constant_* in local contexts
      target/s390x: Use tcg_constant_* for DisasCompare
      target/s390x: Use tcg_constant_i32 for fpinst_extract_m34
      target/s390x: Use tcg_constant_* in translate_vx.c.inc

Steve Sistare (1):
      meson: fix dependency on qemu-keymap

Thomas Huth (11):
      tests/qtest/rtl8139-test: Make the test less verbose by default
      Do not include hw/hw.h if it is not necessary
      target/s390x/arch_dump: Fix memory corruption in s390x_write_elf64_notes()
      target/s390x/arch_dump: Simplify memory allocation in s390x_write_elf64_notes()
      qemu-keymap: Silence memory leak warning from Clang's sanitizer
      gitlab-ci.d/buildtest: Remove aarch64-softmmu from the build-system-ubuntu job
      gitlab-ci.d/buildtest: Disintegrate the build-coroutine-sigaltstack job
      gitlab-ci.d/buildtest-template: Simplify the configure step
      gitlab-ci.d: Build with --enable-fdt=system by default
      gitlab-ci.d/base: Mark jobs as interruptible by default
      Deprecate the "-no-acpi" command line switch

 docs/about/deprecated.rst               |   6 +
 docs/devel/kconfig.rst                  |   2 +-
 configure                               |   8 +-
 hw/scsi/viosrp.h                        |   3 +-
 hw/sh4/sh7750_regs.h                    |   3 +-
 include/hw/arm/raspi_platform.h         |   3 +-
 include/hw/s390x/pv.h                   |   2 +
 include/hw/ssi/ibex_spi_host.h          |   1 -
 include/hw/tricore/tricore_testdevice.h |   1 -
 include/qemu/uri.h                      |   3 +-
 hw/pci-host/mv64361.c                   |   1 -
 hw/ppc/pegasos2.c                       |   1 -
 hw/s390x/pv.c                           |  28 ++
 hw/s390x/s390-virtio-ccw.c              |   5 +-
 hw/sensor/dps310.c                      |   1 -
 hw/vfio/ccw.c                           |  40 ++-
 qemu-keymap.c                           |   2 +
 softmmu/vl.c                            |   1 +
 target/s390x/arch_dump.c                |  22 +-
 target/s390x/tcg/mem_helper.c           | 287 +++++++++----------
 target/s390x/tcg/translate.c            | 480 +++++++++++---------------------
 tests/qtest/rtl8139-test.c              |  15 +-
 tests/unit/rcutorture.c                 |   3 +-
 tests/unit/test-rcu-list.c              |   3 +-
 util/uri.c                              |   3 +-
 target/s390x/tcg/translate_vx.c.inc     |  45 ++-
 .gitlab-ci.d/base.yml                   |   2 +
 .gitlab-ci.d/buildtest-template.yml     |  10 +-
 .gitlab-ci.d/buildtest.yml              |  24 +-
 .gitlab-ci.d/crossbuild-template.yml    |   5 +-
 .gitlab-ci.d/crossbuilds.yml            |   4 +-
 .gitlab-ci.d/windows.yml                |   7 +-
 contrib/gitdm/filetypes.txt             |   3 +-
 pc-bios/keymaps/meson.build             |   2 +-
 tests/qemu-iotests/022                  |   4 +-
 tests/tcg/s390x/Makefile.softmmu-target |   2 +
 tests/tcg/s390x/bal.S                   |  24 ++
 tests/tcg/s390x/sam.S                   |  67 +++++
 38 files changed, 527 insertions(+), 596 deletions(-)
 create mode 100644 tests/tcg/s390x/bal.S
 create mode 100644 tests/tcg/s390x/sam.S


