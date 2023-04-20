Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 158796E8F98
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 12:13:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppRHP-0000ct-CI; Thu, 20 Apr 2023 06:12:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ppRHN-0000cZ-4x
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:12:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ppRHD-0007zO-SH
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:12:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681985542;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=EvquEffA/4KUPIo7lVefCiZExHYUC9bYpQShfaW34ns=;
 b=Xz7p2ucjFA11mkABInFxwdxRhCTglxpu5PyEYYMkQSvpc/BIdR3gd7RhiEbCNIU6o8iehi
 OSRiYNO9BlheXIPGYiMA45Z1XL4VVDjDtPRt1ukaYh3J/T8mgPOKvVBaKMMULe3s46Jhkf
 WTB/2Rze1eIH6Im9RNqdTA1EV2CqLPw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-575-XyBK_DFTPwyx1Nd_LWCQ2A-1; Thu, 20 Apr 2023 06:12:18 -0400
X-MC-Unique: XyBK_DFTPwyx1Nd_LWCQ2A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 653F929324BE;
 Thu, 20 Apr 2023 10:12:18 +0000 (UTC)
Received: from thuth.com (unknown [10.39.194.14])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A708C5AB7A;
 Thu, 20 Apr 2023 10:12:17 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 00/23] First batch of testing and misc patches for 8.1
Date: Thu, 20 Apr 2023 12:11:53 +0200
Message-Id: <20230420101216.786304-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

 Hi!

The following changes since commit c1eb2ddf0f8075faddc5f7c3d39feae3e8e9d6b4:

  Update version for v8.0.0 release (2023-04-19 17:27:13 +0100)

are available in the Git repository at:

  https://gitlab.com/thuth/qemu.git tags/pull-request-2023-04-20

for you to fetch changes up to ec6fb1c8cd8d55c3d2a34cacfea6df0fe6c76057:

  tests/vm/freebsd: Update to FreeBSD 13.2 (2023-04-20 11:28:16 +0200)

----------------------------------------------------------------
* Compat machines for version 8.1
* Allow setting a chardev input file on the command line
* Fix .travis.yml to work with non-public Travis instances, too
* Move a lot of code from specifc_ss into softmmu_ss
* Add a test case for TPM TIS I2C connected to Aspeed I2C controller
* Update tests/vm/freebsd to version 13
* Some more misc minor fixes here and there

----------------------------------------------------------------
Cornelia Huck (1):
      hw: Add compat machines for 8.1

Juan Quintela (3):
      test: Fix test-crypto-secret when compiling without keyring support
      tests/migration: Only run auto_converge in slow mode
      MAINTAINERS: Add Juan Quintela to developer guides review

Peter Maydell (2):
      qtest: Don't assert on "-qtest chardev:myid"
      chardev: Allow setting file chardev input file on the command line

Stefan Berger (3):
      qtest: Add functions for accessing devices on Aspeed I2C controller
      qtest: Move tpm_util_tis_transmit() into tpm-tis-utils.c and rename it
      qtest: Add a test case for TPM TIS I2C connected to Aspeed I2C controller

Stefan Weil (2):
      docs: Fix typo (wphx => whpx)
      docs/cxl: Fix sentence

Thomas Huth (10):
      target/i386: Set family/model/stepping of the "max" CPU according to LM bit
      hw/char: Move two more files from specific_ss to softmmu_ss
      softmmu/qtest: Move the target-specific pseries RTAS code out of qtest.c
      include/exec: Provide the tswap() functions for target independent code, too
      softmmu: Make qtest.c target independent
      hw/display: Compile vga.c as target-independent code
      softmmu: Move dirtylimit.c into the target independent source set
      hw/core: Move numa.c into the target independent source set
      cpu: Remove parameter of list_cpus()
      tests/vm/freebsd: Update to FreeBSD 13.2

Vaibhav Jain (2):
      travis.yml: Add missing clang-10 package to the 'Clang (disable-tcg)' job
      travis.yml: Add missing 'flex', 'bison' packages to 'GCC (user)' job

 MAINTAINERS                             |   1 +
 docs/system/devices/cxl.rst             |   2 +-
 docs/system/introduction.rst            |   2 +-
 include/exec/cpu-all.h                  |  64 +--
 include/exec/cpu-common.h               |   2 +-
 include/exec/tswap.h                    |  72 ++++
 include/hw/boards.h                     |   3 +
 include/hw/i2c/aspeed_i2c.h             |   7 +
 include/hw/i386/pc.h                    |   3 +
 include/sysemu/qtest.h                  |   4 +
 tests/qtest/qtest_aspeed.h              |  41 ++
 tests/qtest/tpm-tis-util.h              |   4 +
 tests/qtest/tpm-util.h                  |   3 -
 chardev/char-file.c                     |   8 +
 chardev/char.c                          |   3 +
 cpu.c                                   |   2 +-
 hw/arm/virt.c                           |   9 +-
 hw/core/machine.c                       |   3 +
 hw/display/vga.c                        |  31 +-
 hw/i386/pc.c                            |   3 +
 hw/i386/pc_piix.c                       |  16 +-
 hw/i386/pc_q35.c                        |  14 +-
 hw/m68k/virt.c                          |   9 +-
 hw/ppc/spapr.c                          |  15 +-
 hw/ppc/spapr_rtas.c                     |  29 ++
 hw/s390x/s390-virtio-ccw.c              |  14 +-
 softmmu/dirtylimit.c                    |   3 +-
 softmmu/qtest.c                         |  53 +--
 softmmu/vl.c                            |   2 +-
 target/i386/cpu.c                       |  31 +-
 tests/qtest/migration-test.c            |  23 +-
 tests/qtest/qtest_aspeed.c              | 117 ++++++
 tests/qtest/tpm-crb-swtpm-test.c        |   3 -
 tests/qtest/tpm-crb-test.c              |   3 -
 tests/qtest/tpm-tis-device-swtpm-test.c |   5 +-
 tests/qtest/tpm-tis-i2c-test.c          | 663 ++++++++++++++++++++++++++++++++
 tests/qtest/tpm-tis-swtpm-test.c        |   5 +-
 tests/qtest/tpm-tis-util.c              |  47 ++-
 tests/qtest/tpm-util.c                  |  45 ---
 tests/unit/test-crypto-secret.c         |  10 +-
 .travis.yml                             |   5 +-
 hw/char/meson.build                     |   5 +-
 hw/core/meson.build                     |   2 +-
 hw/display/meson.build                  |   2 +-
 qemu-options.hx                         |  10 +-
 softmmu/meson.build                     |   4 +-
 tests/qtest/meson.build                 |   3 +
 tests/vm/freebsd                        | 101 ++---
 48 files changed, 1224 insertions(+), 282 deletions(-)
 create mode 100644 include/exec/tswap.h
 create mode 100644 tests/qtest/qtest_aspeed.h
 create mode 100644 tests/qtest/qtest_aspeed.c
 create mode 100644 tests/qtest/tpm-tis-i2c-test.c


