Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7633713C1
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 12:47:57 +0200 (CEST)
Received: from localhost ([::1]:59056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldW7I-0005GE-A0
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 06:47:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ldW4X-0003dw-Mg
 for qemu-devel@nongnu.org; Mon, 03 May 2021 06:45:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ldW4V-0003K6-OZ
 for qemu-devel@nongnu.org; Mon, 03 May 2021 06:45:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620038702;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=X0mze4+CQOh3CRlBwmVB2xGCf+evDpbbOzNZfF88MKw=;
 b=SyT+o73ByU3sIn77qoFSXFhJvjyCOp8Ch9NkEm5boEPF7OUPD6trd6SrKZTNyXv7OW8Qqt
 ra6W2ozZn/EeOfO4dtysdfM1caECOGaC8Y2EuX5Wvcw9PkPYxuEwpfjs0zpIwzyNqOp3hU
 c2xXDFLDJuQ4uGhh0JUQ2M9SNmWv9HE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-156-jPq76nmRPeGak5JYCqls-g-1; Mon, 03 May 2021 06:44:59 -0400
X-MC-Unique: jPq76nmRPeGak5JYCqls-g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DCFF11854E30;
 Mon,  3 May 2021 10:44:58 +0000 (UTC)
Received: from thuth.com (ovpn-112-122.ams2.redhat.com [10.36.112.122])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 27D255D9D5;
 Mon,  3 May 2021 10:44:57 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 00/10] Gitlab-CI, qtest, moxie removal and misc patches
Date: Mon,  3 May 2021 12:44:46 +0200
Message-Id: <20210503104456.1036472-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

 Hi Peter,

the following changes since commit 53c5433e84e8935abed8e91d4a2eb813168a0ecf:

  Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-tcg-20210501' into staging (2021-05-02 12:02:46 +0100)

are available in the Git repository at:

  https://gitlab.com/thuth/qemu.git tags/pull-request-2021-05-03

for you to fetch changes up to 8f582fa290e5d5d0a00db23eaf1ab1bb3d3ae68d:

  util/compatfd.c: Replaced a malloc call with g_malloc. (2021-05-03 11:40:40 +0200)

----------------------------------------------------------------
* Removal of the deprecated moxie target
* Replace some YAML anchors by "extends" in the Gitlab-CI
* Some small improvements for using the qtests
* Some other small misc patches
----------------------------------------------------------------

Mahmoud Mandour (1):
      util/compatfd.c: Replaced a malloc call with g_malloc.

Philippe Mathieu-Daudé (3):
      gitlab-ci: Replace YAML anchors by extends (container_job)
      gitlab-ci: Replace YAML anchors by extends (native_build_job)
      gitlab-ci: Replace YAML anchors by extends (native_test_job)

Stefan Hajnoczi (3):
      libqos/qgraph: fix "UNAVAILBLE" typo
      docs/devel/qgraph: add troubleshooting information
      libqtest: refuse QTEST_QEMU_BINARY=qemu-kvm

Thomas Huth (3):
      Remove the deprecated moxie target
      tests/docker/dockerfiles: Add ccache to containers where it was missing
      include/sysemu: Poison all accelerator CONFIG switches in common code

 .gitlab-ci.d/containers.yml                        |  76 +-
 .gitlab-ci.yml                                     | 110 +--
 MAINTAINERS                                        |   8 -
 default-configs/devices/moxie-softmmu.mak          |   5 -
 default-configs/targets/moxie-softmmu.mak          |   2 -
 disas/meson.build                                  |   1 -
 disas/moxie.c                                      | 360 ---------
 docs/devel/qgraph.rst                              |  58 ++
 docs/system/deprecated.rst                         |   8 -
 docs/system/removed-features.rst                   |   7 +
 fpu/softfloat-specialize.c.inc                     |   2 +-
 hw/Kconfig                                         |   1 -
 hw/meson.build                                     |   1 -
 hw/moxie/Kconfig                                   |   3 -
 hw/moxie/meson.build                               |   4 -
 hw/moxie/moxiesim.c                                | 157 ----
 include/disas/dis-asm.h                            |   1 -
 include/elf.h                                      |   3 -
 include/exec/poison.h                              |   6 +-
 include/hw/elf_ops.h                               |   8 -
 include/sysemu/arch_init.h                         |   1 -
 include/sysemu/hax.h                               |   4 +
 include/sysemu/hvf.h                               |   4 +
 include/sysemu/whpx.h                              |   4 +
 meson.build                                        |   1 -
 qapi/machine.json                                  |   2 +-
 qapi/misc-target.json                              |   2 +-
 softmmu/arch_init.c                                |   2 -
 target/meson.build                                 |   1 -
 target/moxie/cpu-param.h                           |  17 -
 target/moxie/cpu.c                                 | 161 ----
 target/moxie/cpu.h                                 | 123 ---
 target/moxie/helper.c                              | 120 ---
 target/moxie/helper.h                              |   5 -
 target/moxie/machine.c                             |  19 -
 target/moxie/machine.h                             |   1 -
 target/moxie/meson.build                           |  14 -
 target/moxie/mmu.c                                 |  32 -
 target/moxie/mmu.h                                 |  19 -
 target/moxie/translate.c                           | 892 ---------------------
 tests/docker/dockerfiles/alpine.docker             |   1 +
 tests/docker/dockerfiles/fedora-i386-cross.docker  |   1 +
 tests/docker/dockerfiles/fedora-win32-cross.docker |   1 +
 tests/docker/dockerfiles/fedora-win64-cross.docker |   1 +
 tests/docker/dockerfiles/opensuse-leap.docker      |   1 +
 tests/qtest/boot-serial-test.c                     |   8 -
 tests/qtest/libqos/qgraph.c                        |   2 +-
 tests/qtest/libqtest.c                             |   9 +-
 tests/qtest/machine-none-test.c                    |   1 -
 tests/qtest/meson.build                            |   2 -
 util/compatfd.c                                    |   8 +-
 51 files changed, 193 insertions(+), 2087 deletions(-)
 delete mode 100644 default-configs/devices/moxie-softmmu.mak
 delete mode 100644 default-configs/targets/moxie-softmmu.mak
 delete mode 100644 disas/moxie.c
 delete mode 100644 hw/moxie/Kconfig
 delete mode 100644 hw/moxie/meson.build
 delete mode 100644 hw/moxie/moxiesim.c
 delete mode 100644 target/moxie/cpu-param.h
 delete mode 100644 target/moxie/cpu.c
 delete mode 100644 target/moxie/cpu.h
 delete mode 100644 target/moxie/helper.c
 delete mode 100644 target/moxie/helper.h
 delete mode 100644 target/moxie/machine.c
 delete mode 100644 target/moxie/machine.h
 delete mode 100644 target/moxie/meson.build
 delete mode 100644 target/moxie/mmu.c
 delete mode 100644 target/moxie/mmu.h
 delete mode 100644 target/moxie/translate.c


