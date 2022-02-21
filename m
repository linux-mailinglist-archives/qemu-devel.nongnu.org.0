Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C714BD98B
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 13:07:01 +0100 (CET)
Received: from localhost ([::1]:50886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM7T2-0005je-Ay
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 07:07:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nM7Mm-0003QZ-OX
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 07:00:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43150)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nM7MV-0000ZD-FZ
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 07:00:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645444813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=lkSIDK0Oauz+YUStUvQJ6P4N8qFnvbwOYMILTlHPw6I=;
 b=c1gV4QYaN0272rdwA9SxWs2NICusn3t/CxpP+Uh1ZQaHBn6mBHSh+hHC7ZNo9edokczwyw
 Fk7K85ppd7OySAXC8YFkXhGwTVq+w6afOAj5jpf1hsoWcmOF3yKl+H7WzRoAIuC98e7xbZ
 UGzBw75vZKIgdWEGyKcBkNjpJhAaIyY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-64-lBLmjtl9Pj-ACTSrHWhLpg-1; Mon, 21 Feb 2022 07:00:12 -0500
X-MC-Unique: lBLmjtl9Pj-ACTSrHWhLpg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8538B8144E0;
 Mon, 21 Feb 2022 12:00:11 +0000 (UTC)
Received: from thuth.com (unknown [10.39.195.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B10A773167;
 Mon, 21 Feb 2022 12:00:10 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/25] qtest patches and misc header clean-ups
Date: Mon, 21 Feb 2022 12:59:43 +0100
Message-Id: <20220221120008.600114-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

 Hi!

The following changes since commit e670f6d825d4dee248b311197fd4048469d6772b:

  Merge remote-tracking branch 'remotes/legoater/tags/pull-ppc-20220218' into staging (2022-02-20 15:05:41 +0000)

are available in the Git repository at:

  https://gitlab.com/thuth/qemu.git tags/pull-request-2022-02-21

for you to fetch changes up to 975592f5523fdf8708e4b53da937cf4805b1b79a:

  hw/tricore: Remove unused and incorrect header (2022-02-21 10:36:50 +0100)

----------------------------------------------------------------
* Improve virtio-net failover test
* Some small fixes for the qtests
* Misc header cleanups by Philippe

----------------------------------------------------------------
Dr. David Alan Gilbert (2):
      tests/x86: Use 'pc' machine type for old hardware tests
      tests/x86: Use 'pc' machine type for hotplug tests

Eric Auger (1):
      tests/qtest/vhost-user-test.c: Use vhostforce=on

Laurent Vivier (7):
      tests/qtest: failover: clean up pathname of tests
      tests/qtest: failover: use a macro for check_one_card()
      tests/qtest: failover: check the feature is correctly provided
      tests/qtest: failover: check missing guest feature
      tests/qtest: failover: check migration with failover off
      tests/qtest: failover: test migration if the guest doesn't support failover
      tests/qtest: failover: migration abort test with failover off

Michael S. Tsirkin (1):
      erst: drop cast to long long

Philippe Mathieu-Daudé (12):
      hw/tpm: Clean includes
      hw/remote: Add missing include
      hw/acpi/memory_hotplug: Remove unused 'hw/acpi/pc-hotplug.h' header
      qtest: Add missing 'hw/qdev-core.h' include
      exec/ramblock: Add missing includes
      core/ptimers: Remove unnecessary 'sysemu/cpus.h' include
      target: Add missing "qemu/timer.h" include
      linux-user: Add missing "qemu/timer.h" include
      softmmu/runstate: Clean headers
      exec/exec-all: Move 'qemu/log.h' include in units requiring it
      hw/m68k/mcf: Add missing 'exec/hwaddr.h' header
      hw/tricore: Remove unused and incorrect header

Thomas Huth (2):
      tests/qtest/ide-test: Remove bad retry_isa test
      scripts: Remove the old switch-timer-api script

 bsd-user/signal.c                       |   1 +
 hw/acpi/memory_hotplug.c                |   1 -
 hw/arm/omap1.c                          |   1 +
 hw/core/ptimer.c                        |   1 -
 hw/display/omap_dss.c                   |   1 +
 hw/gpio/omap_gpio.c                     |   1 +
 hw/input/tsc210x.c                      |   1 +
 hw/remote/proxy-memory-listener.c       |   1 +
 hw/tpm/tpm_crb.c                        |   1 +
 hw/tpm/tpm_ppi.c                        |   4 +-
 hw/tpm/tpm_ppi.h                        |   4 +-
 include/exec/exec-all.h                 |   2 -
 include/exec/ramblock.h                 |   2 +
 include/hw/m68k/mcf.h                   |   1 +
 include/hw/tricore/triboard.h           |   1 -
 linux-user/i386/cpu_loop.c              |   1 +
 linux-user/ppc/cpu_loop.c               |   1 +
 monitor/misc.c                          |   1 +
 plugins/api.c                           |   1 +
 scripts/switch-timer-api                | 178 -------
 softmmu/qtest.c                         |   1 +
 softmmu/runstate.c                      |   3 +-
 target/alpha/helper.c                   |   2 +-
 target/arm/cpu.c                        |   1 +
 target/arm/helper.c                     |   2 +
 target/arm/m_helper.c                   |   1 +
 target/arm/mte_helper.c                 |   1 +
 target/avr/helper.c                     |   1 +
 target/cris/helper.c                    |   1 +
 target/hexagon/internal.h               |   2 +
 target/hexagon/translate.h              |   1 +
 target/hppa/cpu.c                       |   1 +
 target/hppa/helper.c                    |   2 +-
 target/hppa/mem_helper.c                |   1 +
 target/hppa/op_helper.c                 |   1 +
 target/i386/helper.c                    |   1 +
 target/i386/tcg/int_helper.c            |   1 +
 target/i386/tcg/misc_helper.c           |   1 +
 target/i386/tcg/sysemu/seg_helper.c     |   1 +
 target/i386/tcg/sysemu/svm_helper.c     |   1 +
 target/m68k/op_helper.c                 |   1 +
 target/microblaze/cpu.c                 |   1 +
 target/microblaze/mmu.c                 |   1 +
 target/microblaze/op_helper.c           |   1 +
 target/mips/tcg/exception.c             |   1 +
 target/mips/tcg/sysemu/special_helper.c |   1 +
 target/mips/tcg/translate.h             |   1 +
 target/openrisc/interrupt.c             |   1 +
 target/openrisc/mmu.c                   |   1 +
 target/ppc/excp_helper.c                |   1 +
 target/ppc/misc_helper.c                |   1 +
 target/riscv/csr.c                      |   1 +
 target/s390x/tcg/excp_helper.c          |   1 +
 target/s390x/tcg/mem_helper.c           |   1 +
 target/sparc/helper.c                   |   1 +
 target/sparc/ldst_helper.c              |   1 +
 target/sparc/mmu_helper.c               |   1 +
 target/tricore/helper.c                 |   2 +-
 target/xtensa/dbg_helper.c              |   1 +
 target/xtensa/exc_helper.c              |   1 +
 target/xtensa/fpu_helper.c              |   1 +
 target/xtensa/helper.c                  |   1 +
 target/xtensa/mmu_helper.c              |   1 +
 target/xtensa/win_helper.c              |   1 +
 tests/qtest/device-plug-test.c          |  20 +-
 tests/qtest/drive_del-test.c            |  35 +-
 tests/qtest/erst-test.c                 |   2 +-
 tests/qtest/fdc-test.c                  |   2 +-
 tests/qtest/hd-geo-test.c               |  16 +-
 tests/qtest/i440fx-test.c               |   2 +-
 tests/qtest/ide-test.c                  |  16 +-
 tests/qtest/ivshmem-test.c              |   7 +-
 tests/qtest/vhost-user-test.c           |   2 +-
 tests/qtest/virtio-net-failover.c       | 911 +++++++++++++++++++++++++-------
 74 files changed, 853 insertions(+), 416 deletions(-)
 delete mode 100755 scripts/switch-timer-api


