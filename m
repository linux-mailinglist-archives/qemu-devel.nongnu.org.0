Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E506114284F
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jan 2020 11:38:58 +0100 (CET)
Received: from localhost ([::1]:33700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itUSP-0000TP-GD
	for lists+qemu-devel@lfdr.de; Mon, 20 Jan 2020 05:38:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36927)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1itUNa-0003b4-N8
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 05:34:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1itUNW-0001FC-Ps
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 05:33:58 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:53650
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1itUNW-0001Ed-ML
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 05:33:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579516434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=wmVetT6Wmd1qdK97OqNgXmPvOKikUGYsOBMzDsWtpng=;
 b=UhIyEODRGJsAoEKG3HLAUa0lDVd4wQPzSROz+rIcOt5Ib9yRiQsILaiyw4/IrRE7/n/ZbB
 6Ujs/4GWoFz01lUh5VjKrzhHy/xSL9gJ5MktOoMwGnjbVl6f0KbxaOAPhymyfJdFSA5blZ
 /SICvyUx14OcEVYLyLgrgSwM4Sif+ZI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-YkgNYRasP5i4PR72-XoDyw-1; Mon, 20 Jan 2020 05:33:52 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C1E58800D48;
 Mon, 20 Jan 2020 10:33:50 +0000 (UTC)
Received: from secure.mitica (ovpn-116-207.ams2.redhat.com [10.36.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0F4C8860E5;
 Mon, 20 Jan 2020 10:33:40 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/29] Migration pull patches
Date: Mon, 20 Jan 2020 11:33:11 +0100
Message-Id: <20200120103340.25118-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: YkgNYRasP5i4PR72-XoDyw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: Laurent Vivier <lvivier@redhat.com>, Corey Minyard <cminyard@mvista.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Stefan Weil <sw@weilnetz.de>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 7fb38daf256bd1bcbcb5ea556422283d0d55a1b1=
:

  Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20200=
117-1' into staging (2020-01-17 17:27:20 +0000)

are available in the Git repository at:

  https://github.com/juanquintela/qemu.git tags/migration-pull-pull-request

for you to fetch changes up to ddac5cb2d95774cd019bfaf93c54ffd921095fea:

  multifd: Be consistent about using uint64_t (2020-01-20 09:17:07 +0100)

----------------------------------------------------------------
Migration pull request (take 5)

Making history short:

* having your machine named x32 to really be a 32bit guest helps for
  testing 32bits
* disabling CONFIG_XEN on i686 makes rdma_addr_t be a 32bit value

After this, and patch sent on Friday, I got this pull request to:
* compile on x86_64
* pass tests on x86_64
* compile on i686
* pass tests on i686 (with rdma_dma_t 32 bits)
* cross-compile for windows 32bits
* cross-compile for windows 64bits

Please apply, Juan.

----------------------------------------------------------------

Alexey Romko (1):
  Bug #1829242 correction.

Daniel Henrique Barboza (1):
  ram.c: remove unneeded labels

Dr. David Alan Gilbert (1):
  migration: Rate limit inside host pages

Eric Auger (1):
  migration: Support QLIST migration

Fangrui Song (1):
  migration: Fix incorrect integer->float conversion caught by clang

Jiahui Cen (2):
  migration/multifd: fix nullptr access in terminating multifd threads
  migration/multifd: fix destroyed mutex access in terminating multifd
    threads

Juan Quintela (5):
  multifd: Initialize local variable
  migration-test: Add migration multifd test
  migration: Make sure that we don't call write() in case of error
  migration-test: introduce functions to handle string parameters
  multifd: Be consistent about using uint64_t

Laurent Vivier (1):
  runstate: ignore finishmigrate -> prelaunch transition

Marc-Andr=C3=A9 Lureau (1):
  misc: use QEMU_IS_ALIGNED

Peter Xu (3):
  migration: Define VMSTATE_INSTANCE_ID_ANY
  migration: Change SaveStateEntry.instance_id into uint32_t
  apic: Use 32bit APIC ID for migration instance ID

Scott Cheloha (2):
  migration: add savevm_state_handler_remove()
  migration: savevm_state_handler_insert: constant-time element
    insertion

Wei Yang (8):
  migration/postcopy: reduce memset when it is zero page and
    matches_target_page_size
  migration/postcopy: wait for decompress thread in precopy
  migration/postcopy: count target page number to decide the
    place_needed
  migration/postcopy: set all_zero to true on the first target page
  migration/postcopy: enable random order target page arrival
  migration/postcopy: enable compress during postcopy
  migration/multifd: clean pages after filling packet
  migration/multifd: not use multifd during postcopy

Yury Kotov (2):
  migration: Fix the re-run check of the migrate-incoming command
  migration/ram: Yield periodically to the main loop

 backends/dbus-vmstate.c      |   3 +-
 exec.c                       |   4 +-
 hw/arm/stellaris.c           |   2 +-
 hw/core/qdev.c               |   3 +-
 hw/display/ads7846.c         |   2 +-
 hw/i2c/core.c                |   2 +-
 hw/input/stellaris_input.c   |   3 +-
 hw/intc/apic_common.c        |   7 +-
 hw/misc/max111x.c            |   3 +-
 hw/net/eepro100.c            |   3 +-
 hw/pci/pci.c                 |   2 +-
 hw/ppc/spapr.c               |   2 +-
 hw/timer/arm_timer.c         |   2 +-
 hw/tpm/tpm_emulator.c        |   3 +-
 include/migration/register.h |   2 +-
 include/migration/vmstate.h  |  25 ++++-
 include/qemu/queue.h         |  39 +++++++
 migration/migration.c        |  72 ++++++-------
 migration/migration.h        |   1 +
 migration/ram.c              | 196 +++++++++++++++++++++++++----------
 migration/savevm.c           |  61 ++++++++---
 migration/trace-events       |   9 +-
 migration/vmstate-types.c    |  70 +++++++++++++
 stubs/vmstate.c              |   2 +-
 tests/qtest/migration-test.c |  93 +++++++++++++++++
 tests/test-vmstate.c         | 170 ++++++++++++++++++++++++++++++
 vl.c                         |  10 +-
 27 files changed, 659 insertions(+), 132 deletions(-)

--=20
2.24.1


