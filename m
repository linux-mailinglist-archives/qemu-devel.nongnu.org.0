Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D656112B5
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 15:28:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooPKW-00010d-Ld; Fri, 28 Oct 2022 09:23:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ooPKK-0000tT-VI
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 09:23:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ooPKJ-0005GH-10
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 09:23:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666963389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/9kmyK+uusbfcULLaNeAap+Wb8dnSOywJ8jTFUfbQD4=;
 b=eMD1TTeN0xoHlUGhGnPQl86Um1bZJsDji0kWwyEHsHnRr6nnSvvRVTChjqHQWqkoWBe6jr
 zXqVtUVOwH7YGKbHmSrSI4rN9ocmFvZ9ij6mdF//XUjVpJnCBaCAz64v27tM7myugpLwVS
 uDl+4XnRijz61FBECP4vIpGXpckqxCw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-5-hL_iPKNpO7KwWDFILh3jwQ-1; Fri, 28 Oct 2022 09:23:08 -0400
X-MC-Unique: hL_iPKNpO7KwWDFILh3jwQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 491D83817A6D
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 13:23:08 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7264E1121319;
 Fri, 28 Oct 2022 13:23:07 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PULL 00/21] s390x and qtest patches
Date: Fri, 28 Oct 2022 15:22:43 +0200
Message-Id: <20221028132304.829103-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.516,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

 Hello Stefan!

The following changes since commit 344744e148e6e865f5a57e745b02a87e5ea534ad:

  Merge tag 'dump-pull-request' of https://gitlab.com/marcandre.lureau/qemu into staging (2022-10-26 10:53:49 -0400)

are available in the Git repository at:

  https://gitlab.com/thuth/qemu.git tags/pull-request-2022-10-28

for you to fetch changes up to db8fca024fa98241ed40470f87b8ecfb82c57d32:

  tests/qtest: libqtest: Correct the timeout unit of blocking receive calls for win32 (2022-10-28 14:32:09 +0200)

----------------------------------------------------------------
* Fix and test the VISTR instruction on s390x
* Some more small s390x fixes and maintainer updates
* Make sure to remove all temporary files from qtests
* OpenBSD VM test update to version 7.2
* Add sndio to FreeBSD tests
* More patches to enable the qtests on Windows

----------------------------------------------------------------
Akihiko Odaki (1):
      tests/qtest/libqos/e1000e: Use e1000_regs.h

Bin Meng (6):
      tests/qtest: Support libqtest to build and run on Windows
      tests/qtest: device-plug-test: Reverse the usage of double/single quotes
      tests/qtest: Use EXIT_FAILURE instead of magic number
      tests/qtest: libqtest: Introduce qtest_wait_qemu()
      tests/qtest: libqos: Do not build virtio-9p unconditionally
      tests/qtest: libqtest: Correct the timeout unit of blocking receive calls for win32

Brad Smith (2):
      tests/vm: update openbsd to release 7.2
      tests: Add sndio to the FreeBSD CI containers / VM

Christian Borntraeger (1):
      MAINTAINERS: target/s390x/: add Ilya as reviewer

Claudio Imbrenda (1):
      s390x/pv: remove semicolon from macro definition

Cornelia Huck (1):
      s390x: step down as general arch maintainer

Nico Boehr (1):
      s390x/tod-kvm: don't save/restore the TOD in PV guests

Thomas Huth (5):
      tests/tcg/s390x: Test compiler flags only once, not every time
      target/s390x: Fix emulation of the VISTR instruction
      tests/tcg/s390x: Add a test for the vistr instruction
      tests/qtest/tpm: Clean up remainders of swtpm
      tests/qtest/cxl-test: Remove temporary directories after testing

Xuzhou Cheng (3):
      accel/qtest: Support qtest accelerator for Windows
      tests/qtest: Use send/recv for socket communication
      tests/qtest: migration-test: Make sure QEMU process "to" exited after migration is canceled

 hw/net/e1000_regs.h                                |   1 +
 include/hw/core/cpu.h                              |   1 +
 include/qemu/sockets.h                             |  13 ++
 tests/qtest/libqtest.h                             |   9 +
 tests/qtest/tpm-util.h                             |   1 +
 accel/dummy-cpus.c                                 |  14 +-
 hw/s390x/pv.c                                      |   2 +-
 hw/s390x/tod-kvm.c                                 |   9 +
 softmmu/cpus.c                                     |   9 +-
 tests/qtest/cxl-test.c                             |   3 +
 tests/qtest/dbus-vmstate-test.c                    |   2 +-
 tests/qtest/device-plug-test.c                     |  16 +-
 tests/qtest/libqmp.c                               |   5 +-
 tests/qtest/libqos/e1000e.c                        | 119 ++++-------
 tests/qtest/libqtest.c                             | 151 +++++++++++--
 tests/qtest/migration-test.c                       |   8 +-
 tests/qtest/tpm-crb-swtpm-test.c                   |   5 +-
 tests/qtest/tpm-tis-device-swtpm-test.c            |   5 +-
 tests/qtest/tpm-tis-swtpm-test.c                   |   5 +-
 tests/qtest/tpm-util.c                             |  19 ++
 tests/tcg/s390x/vistr.c                            |  45 ++++
 util/osdep.c                                       |  22 ++
 target/s390x/tcg/translate_vx.c.inc                |   2 +-
 .gitlab-ci.d/cirrus/freebsd-12.vars                |   2 +-
 .gitlab-ci.d/cirrus/freebsd-13.vars                |   2 +-
 MAINTAINERS                                        |   3 +-
 accel/meson.build                                  |   2 +-
 accel/qtest/meson.build                            |   3 +-
 tests/docker/dockerfiles/alpine.docker             |   3 +-
 tests/docker/dockerfiles/centos8.docker            |   2 +-
 tests/docker/dockerfiles/debian-amd64-cross.docker | 235 ++++++++++----------
 tests/docker/dockerfiles/debian-amd64.docker       | 237 +++++++++++----------
 tests/docker/dockerfiles/debian-arm64-cross.docker | 233 ++++++++++----------
 tests/docker/dockerfiles/debian-armel-cross.docker | 231 ++++++++++----------
 tests/docker/dockerfiles/debian-armhf-cross.docker | 233 ++++++++++----------
 .../dockerfiles/debian-mips64el-cross.docker       | 227 ++++++++++----------
 .../docker/dockerfiles/debian-mipsel-cross.docker  | 227 ++++++++++----------
 .../docker/dockerfiles/debian-ppc64el-cross.docker | 231 ++++++++++----------
 tests/docker/dockerfiles/debian-s390x-cross.docker | 229 ++++++++++----------
 tests/docker/dockerfiles/fedora.docker             | 230 ++++++++++----------
 tests/docker/dockerfiles/opensuse-leap.docker      |   3 +-
 tests/docker/dockerfiles/ubuntu2004.docker         | 235 ++++++++++----------
 tests/lcitool/libvirt-ci                           |   2 +-
 tests/lcitool/projects/qemu.yml                    |   1 +
 tests/qtest/libqos/meson.build                     |   6 +-
 tests/tcg/s390x/Makefile.target                    |  31 ++-
 tests/vm/freebsd                                   |   3 +
 tests/vm/openbsd                                   |   7 +-
 48 files changed, 1667 insertions(+), 1417 deletions(-)
 create mode 100644 tests/tcg/s390x/vistr.c


