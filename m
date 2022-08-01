Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 825E2586E78
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 18:18:56 +0200 (CEST)
Received: from localhost ([::1]:33682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIY87-000142-An
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 12:18:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oIXlI-000339-VF
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 11:55:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oIXlE-0001Mk-73
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 11:55:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659369315;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=MBCySXJLaRV1InxuwH8wuEsUYx2jurHaPDn/zdo8JY0=;
 b=UjfqsjqHvNpQPKk9KLdvZ4rbtfHy0sAlqeHU/LqZ4vOtxlflMgff5o6qFRIBiNlKYTYOGu
 qDpSZ3qyKfdBFklyUsL+6mhle6djxVQ42MxjPl2YhEknnqzwPf6crx4nCzrtvzwrxOlbHr
 Y3F7+iKBWBnyjwJH/3gC7BWkC6ytpjo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-443-WLUtkUGnOv-IEeRMrI47GQ-1; Mon, 01 Aug 2022 11:55:12 -0400
X-MC-Unique: WLUtkUGnOv-IEeRMrI47GQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A74AC811E84;
 Mon,  1 Aug 2022 15:55:11 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2598518EA8;
 Mon,  1 Aug 2022 15:55:08 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Juan Quintela <quintela@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 berrange@redhat.com
Subject: [PULL 0/7] Testing and wording fixes
Date: Mon,  1 Aug 2022 17:54:59 +0200
Message-Id: <20220801155506.254316-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

 Hi!

The following changes since commit 3916603e0c1d909e14e09d5ebcbdaa9c9e21adf3:

  Merge tag 'pull-la-20220729' of https://gitlab.com/rth7680/qemu into staging (2022-07-29 17:39:17 -0700)

are available in the Git repository at:

  https://gitlab.com/thuth/qemu.git tags/pull-request-2022-08-01

for you to fetch changes up to 1bca64a3f0490861c03ceb849821ebf42c926f82:

  tests/qtest/migration-test: Run the dirty ring tests only with the x86 target (2022-08-01 16:30:18 +0200)

----------------------------------------------------------------
- Some fixes for various tests
- Improve wordings in some files

----------------------------------------------------------------
Daniel P. Berrangé (1):
  misc: fix commonly doubled up words

Ilya Leoshkevich (1):
  tests/tcg/linux-test: Fix random hangs in test_socket

Peter Xu (2):
  migration-test: Use migrate_ensure_converge() for auto-converge
  migration-test: Allow test to run without uffd

Thomas Huth (3):
  tests/unit/test-qga: Replace the word 'blacklist' in the guest agent
    unit test
  trivial: Fix duplicated words
  tests/qtest/migration-test: Run the dirty ring tests only with the x86
    target

 docs/devel/qom.rst                            |  4 +-
 docs/interop/live-block-operations.rst        |  4 +-
 docs/system/arm/cpu-features.rst              |  2 +-
 docs/system/devices/cxl.rst                   |  2 +-
 docs/system/s390x/bootdevices.rst             |  2 +-
 docs/system/tls.rst                           |  2 +-
 docs/tools/qemu-pr-helper.rst                 |  4 +-
 hw/usb/u2f.h                                  |  2 +-
 include/hw/qdev-core.h                        |  2 +-
 include/user/safe-syscall.h                   |  2 +-
 block/linux-aio.c                             |  2 +-
 block/qcow2-bitmap.c                          |  8 +-
 contrib/plugins/cache.c                       |  2 +-
 hw/arm/omap2.c                                |  2 +-
 hw/core/clock.c                               |  2 +-
 hw/intc/arm_gicv3_redist.c                    |  2 +-
 hw/misc/iotkit-secctl.c                       |  2 +-
 hw/misc/iotkit-sysctl.c                       |  4 +-
 hw/misc/mac_via.c                             |  2 +-
 hw/s390x/s390-ccw.c                           |  2 +-
 linux-user/i386/cpu_loop.c                    |  2 +-
 pc-bios/s390-ccw/virtio-scsi.c                |  2 +-
 target/arm/helper.c                           |  2 +-
 target/arm/translate.c                        |  2 +-
 target/i386/cpu.c                             |  2 +-
 tests/qtest/microbit-test.c                   |  6 +-
 tests/qtest/migration-test.c                  | 74 ++++++++-----------
 tests/tcg/multiarch/linux/linux-test.c        |  2 +-
 tests/unit/test-qga.c                         |  6 +-
 tools/virtiofsd/fuse_virtio.c                 |  2 +-
 ui/vdagent.c                                  |  2 +-
 tcg/i386/tcg-target.c.inc                     |  2 +-
 python/Makefile                               |  2 +-
 python/qemu/utils/__init__.py                 |  2 +-
 tests/docker/dockerfiles/debian-native.docker |  2 +-
 35 files changed, 76 insertions(+), 88 deletions(-)

-- 
2.31.1


