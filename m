Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D697A60C6D6
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 10:47:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onFVB-0006I8-LU; Tue, 25 Oct 2022 04:41:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1onEwZ-0004dO-FS
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 04:06:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1onEwV-0007uM-8T
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 04:05:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666685145;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=FFZIhj3wyLAGWBTCWnWZRj8/X0PMMvgaVtIkYO4BK3w=;
 b=Cbz2nG3wA0LKZ3wYD8yLlf1ClCAp+hy4F5J8nJ+4ylYo93cK02cQGNfR8+TiPk3ySrtJbC
 71auJdGi8bx8fO+Si1CEguDamX5Gvge8xM5Rvyz782yqJ2GuheecAgC0pAAVhGSIX/OjXG
 SQXJWYd8BXHD6WBZxMkm53BDxhGpJEw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-510-Qnhm9Q2vMXa8zj0ZMSRyHA-1; Tue, 25 Oct 2022 04:05:42 -0400
X-MC-Unique: Qnhm9Q2vMXa8zj0ZMSRyHA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 65276805B72
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 08:05:42 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.118])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 194DB2028E98;
 Tue, 25 Oct 2022 08:05:42 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 15BA721E6936; Tue, 25 Oct 2022 10:05:41 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com
Subject: [PULL 00/28] QAPI patches patches for 2022-10-25
Date: Tue, 25 Oct 2022 10:05:13 +0200
Message-Id: <20221025080541.271547-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.503,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The following changes since commit e750a7ace492f0b450653d4ad368a77d6f660fb8:

  Merge tag 'pull-9p-20221024' of https://github.com/cschoenebeck/qemu into staging (2022-10-24 14:27:12 -0400)

are available in the Git repository at:

  git://repo.or.cz/qemu/armbru.git tags/pull-qapi-2022-10-25

for you to fetch changes up to 9e0ce16f76dc73cc17899d5c745cc23659a9ab2e:

  qapi: Drop temporary logic to support conversion step by step (2022-10-25 08:18:31 +0200)

----------------------------------------------------------------
QAPI patches patches for 2022-10-25

----------------------------------------------------------------
Markus Armbruster (28):
      docs/devel/qapi-code-gen: Update example to match current code
      qapi: Tidy up whitespace in generated code
      docs/devel/qapi-code-gen: Extend example for next commit's change
      qapi: Start to elide redundant has_FOO in generated C
      qapi tests: Elide redundant has_FOO in generated C
      qapi acpi: Elide redundant has_FOO in generated C
      qapi audio: Elide redundant has_FOO in generated C
      qapi block: Elide redundant has_FOO in generated C
      qapi chardev: Elide redundant has_FOO in generated C
      qapi crypto: Elide redundant has_FOO in generated C
      qapi dump: Elide redundant has_FOO in generated C
      qapi job: Elide redundant has_FOO in generated C
      qapi machine: Elide redundant has_FOO in generated C
      qapi migration: Elide redundant has_FOO in generated C
      qapi misc: Elide redundant has_FOO in generated C
      qapi net: Elide redundant has_FOO in generated C
      qapi pci: Elide redundant has_FOO in generated C
      qapi qdev qom: Elide redundant has_FOO in generated C
      qapi replay: Elide redundant has_FOO in generated C
      qapi rocker: Elide redundant has_FOO in generated C
      qapi run-state: Elide redundant has_FOO in generated C
      qapi stats: Elide redundant has_FOO in generated C
      qapi tpm: Elide redundant has_FOO in generated C
      qapi transaction: Elide redundant has_FOO in generated C
      qapi ui: Elide redundant has_FOO in generated C
      qapi virtio: Elide redundant has_FOO in generated C
      qapi qga: Elide redundant has_FOO in generated C
      qapi: Drop temporary logic to support conversion step by step

 docs/devel/qapi-code-gen.rst             |  29 +++++-
 docs/devel/writing-monitor-commands.rst  |  14 +--
 include/monitor/monitor.h                |   3 +-
 audio/alsaaudio.c                        |   2 +-
 audio/audio.c                            |   6 +-
 audio/audio_legacy.c                     |  17 ++-
 audio/ossaudio.c                         |   8 +-
 audio/paaudio.c                          |  12 +--
 audio/wavaudio.c                         |   2 +-
 backends/tpm/tpm_passthrough.c           |   2 -
 block/block-backend.c                    |   2 +-
 block/copy-before-write.c                |   2 +-
 block/dirty-bitmap.c                     |   1 -
 block/export/export.c                    |   2 +-
 block/export/vduse-blk.c                 |   3 +-
 block/gluster.c                          |   3 -
 block/monitor/block-hmp-cmds.c           |  48 ++++-----
 block/qapi-sysemu.c                      |  73 +++++--------
 block/qapi.c                             |  62 ++++-------
 block/qcow.c                             |  10 +-
 block/qcow2.c                            |  18 ++--
 block/qed.c                              |   2 +-
 block/quorum.c                           |   2 +-
 block/rbd.c                              |  15 +--
 block/ssh.c                              |   2 +-
 blockdev-nbd.c                           |   9 +-
 blockdev.c                               | 173 ++++++++++++-------------------
 blockjob.c                               |   2 -
 chardev/char-file.c                      |   4 +-
 chardev/char-socket.c                    |  10 +-
 chardev/char-udp.c                       |   1 -
 chardev/char.c                           |   6 +-
 crypto/block-luks.c                      |  16 +--
 dump/dump.c                              |   4 +-
 hw/acpi/core.c                           |  14 +--
 hw/acpi/cpu.c                            |   1 -
 hw/acpi/memory_hotplug.c                 |   3 +-
 hw/core/machine-hmp-cmds.c               |   2 +-
 hw/core/machine-qmp-cmds.c               |   9 +-
 hw/core/machine.c                        |  10 +-
 hw/core/numa.c                           |   8 +-
 hw/core/qdev.c                           |   2 +-
 hw/mem/pc-dimm.c                         |   1 -
 hw/net/rocker/rocker_of_dpa.c            |  13 +--
 hw/net/virtio-net.c                      |   3 +-
 hw/nvram/fw_cfg.c                        |   2 +-
 hw/pci/pci.c                             |   2 -
 hw/ppc/spapr.c                           |   2 +-
 hw/ppc/spapr_drc.c                       |   3 +-
 hw/virtio/virtio-mem-pci.c               |   4 +-
 hw/virtio/virtio-pmem-pci.c              |   1 -
 hw/virtio/virtio.c                       |   1 -
 job-qmp.c                                |   3 +-
 migration/block-dirty-bitmap.c           |   4 +-
 migration/colo.c                         |   1 -
 migration/migration.c                    |  27 ++---
 monitor/hmp-cmds.c                       |  84 +++++++--------
 monitor/misc.c                           |  21 ++--
 monitor/qmp-cmds.c                       |  11 +-
 nbd/server.c                             |   2 +-
 net/announce.c                           |   8 +-
 net/hub.c                                |   2 +-
 net/l2tpv3.c                             |   2 +-
 net/net.c                                |  25 +++--
 net/slirp.c                              |   4 +-
 net/socket.c                             |  18 ++--
 net/tap-win32.c                          |   2 +-
 net/tap.c                                |  51 +++++----
 qemu-img.c                               |  13 ++-
 qemu-nbd.c                               |   2 -
 qga/commands-posix.c                     |  33 ++----
 qga/commands-win32.c                     |  40 ++-----
 qga/commands.c                           |  11 +-
 qom/qom-qmp-cmds.c                       |   7 +-
 replay/replay-debugging.c                |   1 -
 softmmu/runstate.c                       |  18 +---
 softmmu/vl.c                             |   2 +-
 target/arm/monitor.c                     |   1 -
 target/i386/cpu-sysemu.c                 |   7 +-
 target/i386/cpu.c                        |   1 -
 target/s390x/cpu_models_sysemu.c         |   1 -
 tests/qtest/fuzz/qos_fuzz.c              |   3 +-
 tests/qtest/qmp-cmd-test.c               |   2 +-
 tests/unit/test-char.c                   |   1 -
 tests/unit/test-crypto-block.c           |   6 --
 tests/unit/test-qmp-cmds.c               |  26 +++--
 tests/unit/test-qmp-event.c              |   4 +-
 tests/unit/test-qobject-input-visitor.c  |   2 +-
 tests/unit/test-qobject-output-visitor.c |   2 -
 tests/unit/test-visitor-serialization.c  |   3 +-
 ui/console.c                             |   4 +-
 ui/input.c                               |   4 +-
 ui/spice-core.c                          |   5 -
 ui/vnc.c                                 |  10 --
 util/qemu-config.c                       |  17 +--
 scripts/qapi/commands.py                 |   9 +-
 scripts/qapi/events.py                   |   3 +-
 scripts/qapi/gen.py                      |   2 +-
 scripts/qapi/schema.py                   |  14 +++
 scripts/qapi/types.py                    |   2 +-
 scripts/qapi/visit.py                    |  17 ++-
 101 files changed, 468 insertions(+), 716 deletions(-)

-- 
2.37.3


