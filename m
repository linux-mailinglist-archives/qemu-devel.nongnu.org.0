Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0356C12B2
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 14:06:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peFAy-0001BV-IR; Mon, 20 Mar 2023 09:03:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1peFAt-00019c-VN
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 09:03:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1peFAo-00069m-K2
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 09:03:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679317416;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fqS5SpHjMy+UOPQtzFcO8KNYiL/u3gmhzEzG7rXuJFA=;
 b=JJ1jaHMckLmqBWs2OAZwCZ6aoFybbane04pXShJJGu9U3vfrUcIpcughr0xy50munfD0+J
 ihYyidSoaHgVf0oa0ldkdQR6uLW9wB8nJq9DPImdyPY0PThNDiczsYulB4qbB54Mhnevn3
 L9we1fTR2R0y4j51A8HsVulKZh+55jY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-553-OAahlXEQNvW3CzSm8vlmQQ-1; Mon, 20 Mar 2023 09:03:33 -0400
X-MC-Unique: OAahlXEQNvW3CzSm8vlmQQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C581F385557F;
 Mon, 20 Mar 2023 13:03:32 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2DC1EC15BA0;
 Mon, 20 Mar 2023 13:03:32 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 00/24] s390x and misc patches for 8.0-rc1
Date: Mon, 20 Mar 2023 14:03:06 +0100
Message-Id: <20230320130330.406378-1-thuth@redhat.com>
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

The following changes since commit 74c581b6452394e591f13beba9fea2ec0688e2f5:

  Merge tag 'trivial-branch-for-8.0-pull-request' of https://gitlab.com/laurent_vivier/qemu into staging (2023-03-17 14:22:01 +0000)

are available in the Git repository at:

  https://gitlab.com/thuth/qemu.git tags/pull-request-2023-03-20

for you to fetch changes up to 48805df9c22a0700fba4b3b548fafaa21726ca68:

  replace TABs with spaces (2023-03-20 12:43:50 +0100)

----------------------------------------------------------------
* Mark Nios II as orphan
* Many s390x emulation fixes
* Disable flaky complete_in_standby blockjob unit test
* White space cleanups in various files

----------------------------------------------------------------
Bernhard Beschow (1):
      qemu/osdep: Switch position of "extern" and "G_NORETURN"

Ilya Leoshkevich (19):
      target/s390x: Fix LPSW
      target/s390x: Implement Early Exception Recognition
      tests/tcg/s390x: Add PSW modification tests
      target/s390x: Fix R[NOX]SBG with T=1
      tests/tcg/s390x: Add rxsbg.c
      target/s390x: Fix EXECUTE of relative long instructions
      tests/tcg/s390x: Add ex-relative-long.c
      target/s390x: Handle branching to odd addresses
      target/s390x: Handle EXECUTE of odd addresses
      target/s390x: Handle LGRL from non-aligned addresses
      target/s390x: Handle LRL and LGFRL from non-aligned addresses
      target/s390x: Handle LLGFRL from non-aligned addresses
      target/s390x: Handle CRL and CGFRL with non-aligned addresses
      target/s390x: Handle CGRL and CLGRL with non-aligned addresses
      target/s390x: Handle CLRL and CLGFRL with non-aligned addresses
      target/s390x: Handle STRL to non-aligned addresses
      target/s390x: Handle STGRL to non-aligned addresses
      target/s390x: Update do_unaligned_access() comment
      tests/tcg/s390x: Test unaligned accesses

Peter Maydell (1):
      tests/unit/test-blockjob: Disable complete_in_standby test

Thomas Huth (2):
      MAINTAINERS: Mark the Nios II CPU as orphan
      target/s390x/tcg/mem_helper: Remove bad assert() statement

Yeqi Fu (1):
      replace TABs with spaces

 MAINTAINERS                                 |    6 +-
 tests/tcg/s390x/pgm-specification.mak       |   15 +
 include/crypto/aes.h                        |    8 +-
 include/crypto/desrfb.h                     |   16 +-
 include/disas/dis-asm.h                     |   68 +-
 include/elf.h                               | 1800 +++++++++++++--------------
 include/exec/cpu-all.h                      |    2 +-
 include/hw/acpi/acpi.h                      |    4 +-
 include/hw/elf_ops.h                        |   42 +-
 include/hw/pci/pci_bridge.h                 |   10 +-
 include/hw/pcmcia.h                         |   32 +-
 include/hw/scsi/scsi.h                      |    2 +-
 include/hw/sd/sd.h                          |    8 +-
 include/hw/virtio/virtio.h                  |    2 +-
 include/qemu/bitmap.h                       |   52 +-
 include/qemu/compiler.h                     |    4 +-
 include/qemu/osdep.h                        |    2 +-
 include/qemu/uri.h                          |   32 +-
 pc-bios/optionrom/optionrom.h               |  262 ++--
 target/s390x/cpu.h                          |   11 +
 target/s390x/tcg/insn-data.h.inc            |   46 +-
 chardev/baum.c                              |   66 +-
 hw/char/parallel.c                          |   24 +-
 hw/char/serial.c                            |   68 +-
 hw/core/loader.c                            |   42 +-
 hw/dma/etraxfs_dma.c                        |  834 ++++++-------
 hw/gpio/max7310.c                           |   22 +-
 hw/input/ads7846.c                          |   54 +-
 hw/rtc/m48t59.c                             |  150 +--
 hw/rtc/twl92230.c                           |  160 +--
 hw/scsi/scsi-bus.c                          |    4 +-
 hw/sd/sd.c                                  |  184 +--
 hw/watchdog/wdt_ib700.c                     |    2 +-
 softmmu/physmem.c                           |    2 +-
 target/s390x/cpu.c                          |   26 +
 target/s390x/tcg/excp_helper.c              |    7 +-
 target/s390x/tcg/mem_helper.c               |   14 +-
 target/s390x/tcg/translate.c                |   79 +-
 tests/tcg/s390x/ex-relative-long.c          |  156 +++
 tests/tcg/s390x/pgm-specification-user.c    |   37 +
 tests/tcg/s390x/rxsbg.c                     |   46 +
 tests/unit/test-blockjob.c                  |    9 +-
 tests/unit/test-rcu-list.c                  |    2 +-
 util/bitops.c                               |    8 +-
 util/envlist.c                              |  202 +--
 tests/tcg/s390x/Makefile.softmmu-target     |   20 +-
 tests/tcg/s390x/Makefile.target             |   12 +
 tests/tcg/s390x/br-odd.S                    |   16 +
 tests/tcg/s390x/cgrl-unaligned.S            |   16 +
 tests/tcg/s390x/clrl-unaligned.S            |   16 +
 tests/tcg/s390x/crl-unaligned.S             |   16 +
 tests/tcg/s390x/ex-odd.S                    |   17 +
 tests/tcg/s390x/exrl-ssm-early.S            |   43 +
 tests/tcg/s390x/lgrl-unaligned.S            |   16 +
 tests/tcg/s390x/llgfrl-unaligned.S          |   16 +
 tests/tcg/s390x/lpsw.S                      |   36 +
 tests/tcg/s390x/lpswe-early.S               |   38 +
 tests/tcg/s390x/lpswe-unaligned.S           |   18 +
 tests/tcg/s390x/lrl-unaligned.S             |   16 +
 tests/tcg/s390x/pgm-specification-softmmu.S |   40 +
 tests/tcg/s390x/softmmu.ld                  |   20 +
 tests/tcg/s390x/ssm-early.S                 |   41 +
 tests/tcg/s390x/stgrl-unaligned.S           |   16 +
 tests/tcg/s390x/stosm-early.S               |   41 +
 tests/tcg/s390x/strl-unaligned.S            |   16 +
 65 files changed, 2952 insertions(+), 2140 deletions(-)
 create mode 100644 tests/tcg/s390x/pgm-specification.mak
 create mode 100644 tests/tcg/s390x/ex-relative-long.c
 create mode 100644 tests/tcg/s390x/pgm-specification-user.c
 create mode 100644 tests/tcg/s390x/rxsbg.c
 create mode 100644 tests/tcg/s390x/br-odd.S
 create mode 100644 tests/tcg/s390x/cgrl-unaligned.S
 create mode 100644 tests/tcg/s390x/clrl-unaligned.S
 create mode 100644 tests/tcg/s390x/crl-unaligned.S
 create mode 100644 tests/tcg/s390x/ex-odd.S
 create mode 100644 tests/tcg/s390x/exrl-ssm-early.S
 create mode 100644 tests/tcg/s390x/lgrl-unaligned.S
 create mode 100644 tests/tcg/s390x/llgfrl-unaligned.S
 create mode 100644 tests/tcg/s390x/lpsw.S
 create mode 100644 tests/tcg/s390x/lpswe-early.S
 create mode 100644 tests/tcg/s390x/lpswe-unaligned.S
 create mode 100644 tests/tcg/s390x/lrl-unaligned.S
 create mode 100644 tests/tcg/s390x/pgm-specification-softmmu.S
 create mode 100644 tests/tcg/s390x/softmmu.ld
 create mode 100644 tests/tcg/s390x/ssm-early.S
 create mode 100644 tests/tcg/s390x/stgrl-unaligned.S
 create mode 100644 tests/tcg/s390x/stosm-early.S
 create mode 100644 tests/tcg/s390x/strl-unaligned.S


