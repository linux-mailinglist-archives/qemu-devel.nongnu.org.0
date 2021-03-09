Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C64332366
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 11:55:24 +0100 (CET)
Received: from localhost ([::1]:52312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJa1L-0003V4-0U
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 05:55:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lJZsn-0004xJ-AO
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 05:46:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lJZse-0006a4-4U
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 05:46:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615286782;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+qd7vIKUC1+KyIAr5234AQz2M6SFtJXudJmpRyBdXsA=;
 b=YqBgJ4wKQ9CILADQgI9OdSUauD1snU0CQ6WjcKyTX6Kk2onetBcXu1OdtSqS2ss/ZB2cfx
 E9B4RJCS5SZ17yS0chsYlQdtrHoQmDO/JIroz0nzLUbnfNVlE10V0vfj8B6YNOnIvawv2M
 tbhtPPFTUkPYYYwK1VaxziHoS7JzEh4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-kbN7H_MqPAmTYREscN5gMQ-1; Tue, 09 Mar 2021 05:46:20 -0500
X-MC-Unique: kbN7H_MqPAmTYREscN5gMQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75C03801817
 for <qemu-devel@nongnu.org>; Tue,  9 Mar 2021 10:46:19 +0000 (UTC)
Received: from thuth.com (ovpn-112-40.ams2.redhat.com [10.36.112.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CD4EE60C04
 for <qemu-devel@nongnu.org>; Tue,  9 Mar 2021 10:46:18 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/14] Gitlab, testing and misc patches
Date: Tue,  9 Mar 2021 11:46:03 +0100
Message-Id: <20210309104617.714908-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

the following changes since commit 229a834518b950d56fd1bc94923276504d0ee9d4:

  Merge remote-tracking branch 'remotes/philmd-gitlab/tags/renesas-20210306' into staging (2021-03-08 15:45:48 +0000)

are available in the Git repository at:

  https://gitlab.com/thuth/qemu.git tags/pull-request-2021-03-09

for you to fetch changes up to 65a9d3807e9a0ffd9f9719416a07be41b6f39e94:

  bsd-user: Add new maintainers (2021-03-09 11:26:32 +0100)

Gitlab-CI run can be found here:

 https://gitlab.com/thuth/qemu/-/pipelines/267522743

----------------------------------------------------------------
* Add some missing gitlab-CI job dependencies
* Re-enable "make check SPEED=slow"
* Improve the gitlab-pipeline-status script
* Clean up inclusing of qtest.h headers
* Improve libqos/qgraph documentation
* Fix downloading problem in the acceptance tests
* Remove deprecated target tilegx
* Add new bsd-user maintainers
----------------------------------------------------------------

Chen Qun (1):
  qtest: delete superfluous inclusions of qtest.h

Cleber Rosa (5):
  scripts/ci/gitlab-pipeline-status: split utlity function for HTTP GET
  scripts/ci/gitlab-pipeline-status: give more information on failures
  scripts/ci/gitlab-pipeline-status: give more info when pipeline not
    found
  Acceptance Tests: restore downloading of VM images
  Acceptance Tests: restore filtering of tests by target arch

Emanuele Giuseppe Esposito (2):
  libqos/qgraph: format qgraph comments for sphinx documentation
  docs/devel/qgraph: improve qgraph documentation

Philippe Mathieu-Daudé (3):
  docker: Alpine build job depends on Alpine container
  docker: EDK2 build job depends on EDK2 container
  docker: OpenSBI build job depends on OpenSBI container

Thomas Huth (2):
  meson: Re-enable the possibility to run "make check SPEED=slow"
  Remove deprecated target tilegx

Warner Losh (1):
  bsd-user: Add new maintainers

 .gitlab-ci.d/edk2.yml                         |    1 +
 .gitlab-ci.d/opensbi.yml                      |    1 +
 .gitlab-ci.yml                                |    5 +-
 MAINTAINERS                                   |    6 +-
 accel/tcg/cpu-exec.c                          |    1 -
 blockdev.c                                    |    1 -
 configure                                     |    2 +-
 default-configs/targets/tilegx-linux-user.mak |    1 -
 docs/devel/index.rst                          |    1 +
 docs/devel/qgraph.rst                         |  568 ++++
 docs/devel/qtest.rst                          |    8 +
 docs/system/deprecated.rst                    |    8 -
 docs/system/removed-features.rst              |   14 +
 hw/9pfs/9p.c                                  |    1 -
 hw/arm/armv7m.c                               |    1 -
 hw/arm/mainstone.c                            |    1 -
 hw/arm/xlnx-zcu102.c                          |    1 -
 hw/arm/z2.c                                   |    1 -
 hw/i386/pc.c                                  |    1 -
 hw/misc/ivshmem.c                             |    1 -
 hw/ppc/ppc440_bamboo.c                        |    1 -
 hw/ppc/prep.c                                 |    1 -
 hw/ppc/sam460ex.c                             |    1 -
 hw/ppc/spapr_caps.c                           |    1 -
 hw/ppc/spapr_pci_vfio.c                       |    1 -
 hw/ppc/spapr_vio.c                            |    1 -
 hw/ppc/virtex_ml507.c                         |    1 -
 hw/riscv/spike.c                              |    1 -
 hw/rx/rx62n.c                                 |    1 -
 include/elf.h                                 |    2 -
 include/exec/poison.h                         |    1 -
 linux-user/elfload.c                          |   23 -
 linux-user/syscall_defs.h                     |   10 +-
 linux-user/tilegx/cpu_loop.c                  |  287 --
 linux-user/tilegx/signal.c                    |  178 --
 linux-user/tilegx/sockbits.h                  |    1 -
 linux-user/tilegx/syscall_nr.h                |  327 ---
 linux-user/tilegx/target_cpu.h                |   44 -
 linux-user/tilegx/target_elf.h                |   14 -
 linux-user/tilegx/target_fcntl.h              |   11 -
 linux-user/tilegx/target_signal.h             |   23 -
 linux-user/tilegx/target_structs.h            |   46 -
 linux-user/tilegx/target_syscall.h            |   44 -
 linux-user/tilegx/termbits.h                  |    1 -
 net/net.c                                     |    1 -
 scripts/ci/gitlab-pipeline-status             |   25 +-
 scripts/mtest2make.py                         |    2 +-
 softmmu/cpu-timers.c                          |    1 -
 target/meson.build                            |    1 -
 target/ppc/translate_init.c.inc               |    1 -
 target/tilegx/cpu-param.h                     |   17 -
 target/tilegx/cpu.c                           |  182 --
 target/tilegx/cpu.h                           |  160 --
 target/tilegx/helper.c                        |  147 -
 target/tilegx/helper.h                        |   23 -
 target/tilegx/meson.build                     |   13 -
 target/tilegx/opcode_tilegx.h                 | 1406 ----------
 target/tilegx/simd_helper.c                   |  165 --
 target/tilegx/spr_def_64.h                    |  212 --
 target/tilegx/translate.c                     | 2437 -----------------
 tests/Makefile.include                        |    5 +-
 tests/qtest/libqos/qgraph.h                   |  450 +--
 util/main-loop.c                              |    1 -
 util/qemu-timer.c                             |    1 -
 64 files changed, 741 insertions(+), 6154 deletions(-)
 delete mode 100644 default-configs/targets/tilegx-linux-user.mak
 create mode 100644 docs/devel/qgraph.rst
 delete mode 100644 linux-user/tilegx/cpu_loop.c
 delete mode 100644 linux-user/tilegx/signal.c
 delete mode 100644 linux-user/tilegx/sockbits.h
 delete mode 100644 linux-user/tilegx/syscall_nr.h
 delete mode 100644 linux-user/tilegx/target_cpu.h
 delete mode 100644 linux-user/tilegx/target_elf.h
 delete mode 100644 linux-user/tilegx/target_fcntl.h
 delete mode 100644 linux-user/tilegx/target_signal.h
 delete mode 100644 linux-user/tilegx/target_structs.h
 delete mode 100644 linux-user/tilegx/target_syscall.h
 delete mode 100644 linux-user/tilegx/termbits.h
 delete mode 100644 target/tilegx/cpu-param.h
 delete mode 100644 target/tilegx/cpu.c
 delete mode 100644 target/tilegx/cpu.h
 delete mode 100644 target/tilegx/helper.c
 delete mode 100644 target/tilegx/helper.h
 delete mode 100644 target/tilegx/meson.build
 delete mode 100644 target/tilegx/opcode_tilegx.h
 delete mode 100644 target/tilegx/simd_helper.c
 delete mode 100644 target/tilegx/spr_def_64.h
 delete mode 100644 target/tilegx/translate.c

-- 
2.27.0


