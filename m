Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B11F64CE57
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 17:48:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5Uu0-0004w8-KR; Wed, 14 Dec 2022 11:46:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p5Utx-0004vS-JO
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 11:46:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p5Utv-0002OF-IR
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 11:46:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671036394;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rH4jwWoRhYKD4sPiJ9PY6nwJ5YFrlWSOLFC8hiNqeTw=;
 b=d0CEiwkAQ7wwBs/6b6ItiKZukMaulmNBm03F5iJfCwKoXoP+gLGX/aeV8W2edEpbOJGLhj
 PXWbvbPOe9M7Px6aAmLkPn0HtiRGgwIeu9wpAhIktgx9s+58IJ8ppSniTWiA7xXwrRTAWL
 kOK6vkZy38P8f+chS99K8ObrM/r2SKQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638-b4ULdjRQOOa9tJWTdGS3Lw-1; Wed, 14 Dec 2022 11:46:32 -0500
X-MC-Unique: b4ULdjRQOOa9tJWTdGS3Lw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A1DBD87A384;
 Wed, 14 Dec 2022 16:46:32 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5B27EC15BAD;
 Wed, 14 Dec 2022 16:46:32 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 31F4321E6900; Wed, 14 Dec 2022 17:46:29 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PULL 00/14] Miscellaneous patches for 2022-12-14
Date: Wed, 14 Dec 2022 17:46:15 +0100
Message-Id: <20221214164629.919880-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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

The following changes since commit ea3a008d2d9ced9c4f93871c823baee237047f93:

  Update VERSION for v7.2.0-rc4 (2022-12-06 19:53:34 -0500)

are available in the Git repository at:

  https://repo.or.cz/qemu/armbru.git tags/pull-misc-2022-12-14

for you to fetch changes up to 6c5aaee4b61eb8bf60c7c30365432710b4346421:

  ppc4xx_sdram: Simplify sdram_ddr_size() to return (2022-12-14 16:19:35 +0100)

----------------------------------------------------------------
Miscellaneous patches for 2022-12-14

----------------------------------------------------------------
Markus Armbruster (14):
      Drop more useless casts from void * to pointer
      error: Drop some obviously superfluous error_propagate()
      error: Drop a few superfluous ERRP_GUARD()
      error: Move ERRP_GUARD() to the beginning of the function
      monitor: Simplify monitor_fd_param()'s error handling
      monitor: Use ERRP_GUARD() in monitor_init()
      qemu-config: Make config_parse_qdict() return bool
      qemu-config: Use ERRP_GUARD() where obviously appropriate
      sockets: Use ERRP_GUARD() where obviously appropriate
      qapi: Use returned bool to check for failure (again)
      io: Tidy up fat-fingered parameter name
      cleanup: Tweak and re-run return_directly.cocci
      block/vmdk: Simplify vmdk_co_create() to return directly
      ppc4xx_sdram: Simplify sdram_ddr_size() to return

 scripts/coccinelle/return_directly.cocci |  5 +--
 include/hw/pci/pci.h                     |  7 +---
 include/io/channel.h                     |  2 +-
 include/qemu/config-file.h               |  2 +-
 target/avr/cpu.h                         |  4 +-
 accel/kvm/kvm-all.c                      |  5 +--
 block/blkdebug.c                         |  4 +-
 block/copy-before-write.c                |  1 -
 block/vmdk.c                             | 28 ++++++--------
 bsd-user/elfload.c                       |  2 +-
 contrib/plugins/cache.c                  |  8 ++--
 contrib/vhost-user-blk/vhost-user-blk.c  |  2 +-
 dump/dump.c                              |  2 -
 hw/9pfs/9p-synth.c                       | 14 ++-----
 hw/arm/armsse.c                          |  3 +-
 hw/arm/virt.c                            | 14 +++----
 hw/char/sifive_uart.c                    |  4 +-
 hw/core/machine.c                        |  3 +-
 hw/core/qdev-clock.c                     |  2 +-
 hw/core/qdev-properties-system.c         |  5 +--
 hw/core/qdev.c                           |  2 -
 hw/hyperv/vmbus.c                        | 10 ++---
 hw/i386/pc.c                             |  5 +--
 hw/net/cadence_gem.c                     |  2 +-
 hw/net/virtio-net.c                      |  2 +-
 hw/nvme/ctrl.c                           |  4 +-
 hw/pci/msi.c                             |  1 -
 hw/ppc/ppc4xx_sdram.c                    | 15 ++------
 hw/rdma/vmw/pvrdma_cmd.c                 | 66 +++++++++++---------------------
 hw/rdma/vmw/pvrdma_qp_ops.c              |  6 +--
 hw/remote/vfio-user-obj.c                |  1 -
 hw/virtio/vhost-user.c                   |  6 +--
 hw/virtio/vhost-vdpa.c                   |  2 +-
 hw/virtio/virtio-balloon.c               | 20 +++++-----
 hw/virtio/virtio-iommu.c                 |  3 +-
 hw/virtio/virtio-mem.c                   | 10 +----
 iothread.c                               |  2 +-
 linux-user/syscall.c                     |  2 +-
 migration/dirtyrate.c                    | 10 +----
 migration/tls.c                          |  6 +--
 monitor/misc.c                           | 14 ++-----
 monitor/monitor.c                        | 12 ++----
 monitor/qmp-cmds.c                       |  4 +-
 net/colo-compare.c                       | 13 ++-----
 qga/commands-win32.c                     |  8 ++--
 replay/replay-time.c                     |  5 +--
 semihosting/console.c                    |  4 +-
 softmmu/memory.c                         | 11 +-----
 softmmu/physmem.c                        |  9 +----
 target/i386/hax/hax-all.c                |  2 +-
 target/i386/kvm/kvm.c                    |  5 +--
 target/loongarch/cpu.c                   |  4 +-
 target/mips/tcg/dsp_helper.c             | 15 ++------
 target/riscv/debug.c                     |  6 +--
 target/riscv/vector_helper.c             | 28 ++++----------
 tests/bench/benchmark-crypto-akcipher.c  |  6 +--
 tests/qtest/erst-test.c                  |  5 +--
 tests/qtest/hexloader-test.c             |  6 +--
 tests/qtest/pvpanic-pci-test.c           |  6 +--
 tests/qtest/pvpanic-test.c               |  6 +--
 tests/qtest/test-filter-mirror.c         |  6 +--
 tests/qtest/virtio-ccw-test.c            |  6 +--
 tests/tcg/aarch64/system/semiheap.c      |  4 +-
 tests/tcg/multiarch/sha512.c             |  9 +----
 tools/virtiofsd/fuse_lowlevel.c          | 24 +++---------
 ui/util.c                                |  1 -
 util/qemu-config.c                       | 46 ++++++++++------------
 util/qemu-sockets.c                      | 26 +++++--------
 util/thread-context.c                    | 10 +----
 util/vfio-helpers.c                      |  2 +-
 70 files changed, 188 insertions(+), 407 deletions(-)

-- 
2.37.3


