Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA792DEE59
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Dec 2020 12:02:50 +0100 (CET)
Received: from localhost ([::1]:59202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqa0g-0005DQ-0n
	for lists+qemu-devel@lfdr.de; Sat, 19 Dec 2020 06:02:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kqZtp-0004ic-E8
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 05:55:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33353)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kqZtj-0007EW-Mn
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 05:55:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608375338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/Wwgk9TFvIQSEIcaahv+oC0Qe5rA28K6HXhK0Cae8Dk=;
 b=cjRQg0nJMDVX/NdriyW4MWXClq4/zDYlys1Nh8diFgCxwB7MH3TjuPyJJN5/OAWOMVRmEd
 goxWW+wcWl0kdQ2VfQndQYnVeXHZEFdLhr/Te7s/Fpr0uKspz8pxAtczA3FAlFmaWaSbPt
 XbJgj/FxJpMEOeapv73tzlunW4PHyik=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-rOg9IBAnPcqg3vMi1HbeAw-1; Sat, 19 Dec 2020 05:55:35 -0500
X-MC-Unique: rOg9IBAnPcqg3vMi1HbeAw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2C547801817;
 Sat, 19 Dec 2020 10:55:34 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B88BA5D9D7;
 Sat, 19 Dec 2020 10:55:33 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4714E1130358; Sat, 19 Dec 2020 11:55:32 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/33] QAPI patches patches for 2020-12-19
Date: Sat, 19 Dec 2020 11:54:59 +0100
Message-Id: <20201219105532.1734134-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit a05f8ecd88f15273d033b6f044b850a8af84a5b8:

  Merge remote-tracking branch 'remotes/alistair/tags/pull-riscv-to-apply-20201217-1' into staging (2020-12-18 11:12:35 +0000)

are available in the Git repository at:

  git://repo.or.cz/qemu/armbru.git tags/pull-qapi-2020-12-19

for you to fetch changes up to 4ac76ba414ecb94f086d73621775d8b38b6f0a43:

  qobject: Make QString immutable (2020-12-19 10:39:41 +0100)

----------------------------------------------------------------
QAPI patches patches for 2020-12-19

----------------------------------------------------------------
Eric Blake (3):
      rocker: Revamp fp_port_get_info
      migration: Refactor migrate_cap_add
      qapi: Use QAPI_LIST_PREPEND() where possible

Markus Armbruster (30):
      tests/check-qjson: Don't skip funny QNumber to JSON conversions
      tests/check-qjson: Examine QNum more thoroughly
      tests/check-qjson: Cover number 2^63
      tests/check-qjson: Replace redundant large_number()
      tests/check-qnum: Cover qnum_to_string() for "unround" argument
      qobject: Fix qnum_to_string() to use sufficient precision
      test-string-output-visitor: Cover "unround" number
      string-output-visitor: Fix to use sufficient precision
      test-visitor-serialization: Drop insufficient precision workaround
      test-visitor-serialization: Clean up test_primitives()
      hmp: Simplify how qmp_human_monitor_command() gets output
      monitor: Use GString instead of QString for output buffer
      qobject: Make qobject_to_json_pretty() take a pretty argument
      qobject: Use GString instead of QString to accumulate JSON
      qobject: Change qobject_to_json()'s value to GString
      Revert "qstring: add qstring_free()"
      hw/rdma: Replace QList by GQueue
      qobject: Move internals to qobject-internal.h
      qmp: Fix tracing of non-string command IDs
      block: Avoid qobject_get_try_str()
      Revert "qobject: let object_property_get_str() use new API"
      qobject: Drop qobject_get_try_str()
      qobject: Drop qstring_get_try_str()
      qobject: Factor quoted_str() out of to_json()
      qobject: Factor JSON writer out of qobject_to_json()
      migration: Replace migration's JSON writer by the general one
      json: Use GString instead of QString to accumulate strings
      keyval: Use GString to accumulate value strings
      block: Use GString instead of QString to build filenames
      qobject: Make QString immutable

 docs/devel/writing-qmp-commands.txt |  12 +-
 hw/net/rocker/rocker_fp.h           |   2 +-
 hw/rdma/rdma_backend_defs.h         |   2 +-
 hw/rdma/rdma_utils.h                |  15 ++-
 include/migration/vmstate.h         |   7 +-
 include/qapi/qmp/json-writer.h      |  35 +++++
 include/qapi/qmp/qbool.h            |   2 -
 include/qapi/qmp/qdict.h            |   2 -
 include/qapi/qmp/qjson.h            |   4 +-
 include/qapi/qmp/qlist.h            |   2 -
 include/qapi/qmp/qnull.h            |   2 -
 include/qapi/qmp/qnum.h             |   3 -
 include/qapi/qmp/qobject.h          |   9 +-
 include/qapi/qmp/qstring.h          |  14 +-
 include/qemu/typedefs.h             |   4 +-
 migration/qjson.h                   |  29 -----
 monitor/monitor-internal.h          |   2 +-
 qobject/qobject-internal.h          |  39 ++++++
 block.c                             |  23 ++--
 block/gluster.c                     |   4 +-
 block/qapi.c                        |   7 +-
 block/rbd.c                         |   2 +-
 chardev/char.c                      |  20 ++-
 hw/core/machine-qmp-cmds.c          |   6 +-
 hw/core/machine.c                   |  11 +-
 hw/display/virtio-gpu.c             |   2 +-
 hw/intc/s390_flic_kvm.c             |   2 +-
 hw/net/rocker/rocker.c              |   8 +-
 hw/net/rocker/rocker_fp.c           |  17 ++-
 hw/net/rocker/rocker_of_dpa.c       |  20 +--
 hw/net/virtio-net.c                 |  21 +--
 hw/nvram/eeprom93xx.c               |   2 +-
 hw/nvram/fw_cfg.c                   |   2 +-
 hw/pci/msix.c                       |   2 +-
 hw/pci/pci.c                        |   4 +-
 hw/pci/shpc.c                       |   2 +-
 hw/rdma/rdma_backend.c              |  10 +-
 hw/rdma/rdma_utils.c                |  29 +++--
 hw/rtc/twl92230.c                   |   2 +-
 hw/scsi/scsi-bus.c                  |   2 +-
 hw/usb/redirect.c                   |   7 +-
 hw/virtio/virtio.c                  |   4 +-
 migration/migration.c               |  29 ++---
 migration/postcopy-ram.c            |   7 +-
 migration/qjson.c                   | 114 -----------------
 migration/savevm.c                  |  53 ++++----
 migration/vmstate-types.c           |  38 +++---
 migration/vmstate.c                 |  52 ++++----
 monitor/hmp-cmds.c                  |  13 +-
 monitor/misc.c                      |  31 ++---
 monitor/monitor.c                   |  20 ++-
 monitor/qmp-cmds-control.c          |  10 +-
 monitor/qmp.c                       |  46 ++++---
 qapi/string-output-visitor.c        |   2 +-
 qemu-img.c                          |  38 +++---
 qga/commands-posix-ssh.c            |   7 +-
 qga/commands-posix.c                |  47 ++-----
 qga/commands-win32.c                |  32 ++---
 qga/commands.c                      |   6 +-
 qga/main.c                          |  22 +---
 qobject/json-parser.c               |  30 ++---
 qobject/json-writer.c               | 247 ++++++++++++++++++++++++++++++++++++
 qobject/qbool.c                     |   1 +
 qobject/qdict.c                     |   1 +
 qobject/qjson.c                     | 144 +++++----------------
 qobject/qlist.c                     |   1 +
 qobject/qnull.c                     |   1 +
 qobject/qnum.c                      |  28 +---
 qobject/qobject.c                   |   1 +
 qobject/qstring.c                   | 117 +++--------------
 qom/object.c                        |   9 +-
 qom/object_interfaces.c             |   4 +-
 qom/qom-hmp-cmds.c                  |   7 +-
 qom/qom-qmp-cmds.c                  |  29 ++---
 target/alpha/machine.c              |   2 +-
 target/arm/helper.c                 |   6 +-
 target/arm/machine.c                |   6 +-
 target/arm/monitor.c                |  13 +-
 target/avr/machine.c                |   4 +-
 target/hppa/machine.c               |   4 +-
 target/i386/cpu.c                   |   6 +-
 target/microblaze/machine.c         |   2 +-
 target/mips/cpu.c                   |   6 +-
 target/mips/machine.c               |   4 +-
 target/openrisc/machine.c           |   2 +-
 target/ppc/machine.c                |  10 +-
 target/s390x/cpu_models.c           |  12 +-
 target/sparc/machine.c              |   2 +-
 tests/check-qjson.c                 | 195 ++++++++++++++--------------
 tests/check-qnum.c                  |   8 +-
 tests/check-qobject.c               |   3 +-
 tests/check-qstring.c               |  16 ---
 tests/qtest/libqtest.c              |  20 ++-
 tests/test-clone-visitor.c          |   7 +-
 tests/test-qobject-output-visitor.c |  42 +++---
 tests/test-string-output-visitor.c  |   4 +-
 tests/test-visitor-serialization.c  | 181 ++++++++------------------
 trace/qmp.c                         |  22 ++--
 ui/input.c                          |  16 +--
 ui/vnc.c                            |  21 +--
 util/keyval.c                       |  11 +-
 util/qemu-config.c                  |  14 +-
 target/ppc/translate_init.c.inc     |  12 +-
 migration/meson.build               |   1 -
 qobject/meson.build                 |   5 +-
 105 files changed, 975 insertions(+), 1263 deletions(-)
 create mode 100644 include/qapi/qmp/json-writer.h
 delete mode 100644 migration/qjson.h
 create mode 100644 qobject/qobject-internal.h
 delete mode 100644 migration/qjson.c
 create mode 100644 qobject/json-writer.c

-- 
2.26.2


