Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FF713A3C5
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jan 2020 10:28:19 +0100 (CET)
Received: from localhost ([::1]:35004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irIUk-0005si-4n
	for lists+qemu-devel@lfdr.de; Tue, 14 Jan 2020 04:28:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57045)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1irISt-0004Gq-VW
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 04:26:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1irISs-0006G1-1A
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 04:26:23 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:51425
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1irISr-0006Fg-TR
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 04:26:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578993981;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=mJKKWE1UzMu4GfpEm/19JU/n+PvAuNFbFMEj8jZ27+g=;
 b=eudWhbYCkD752Kf1/U7jmjNd43dnug7INX/8P3oZLTfWayyjU6A17wTOHuycg6E9dZ7K0q
 I9eeAKnneUv7lcxdbhDZgVBlNDieAPKzHP2tP+PR4Mf1y7r3lQcomiUtw6PsNaMzMa5kzh
 FlaWi7R/oH9h5G5UN7oznhaSLdfBNmE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-7-9kiTu082ND2g28L8kecVEg-1; Tue, 14 Jan 2020 04:26:19 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2104D1800D78;
 Tue, 14 Jan 2020 09:26:17 +0000 (UTC)
Received: from secure.mitica (ovpn-116-207.ams2.redhat.com [10.36.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C6DCD19756;
 Tue, 14 Jan 2020 09:26:07 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/29] Migration pull patches (second try)
Date: Tue, 14 Jan 2020 10:25:37 +0100
Message-Id: <20200114092606.1761-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: 9kiTu082ND2g28L8kecVEg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Richard Henderson <rth@twiddle.net>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 3c8a6575985b1652b45bfa670b5e1907d642cfa0=
:

  Merge remote-tracking branch 'remotes/kraxel/tags/usb-20200113-pull-reque=
st' into staging (2020-01-13 14:19:57 +0000)

are available in the Git repository at:

  https://github.com/juanquintela/qemu.git tags/migration-pull-pull-request

for you to fetch changes up to 4eafab585c091050b5ae63130f46fe46ac919c3a:

  migration: Support QLIST migration (2020-01-14 10:17:12 +0100)

----------------------------------------------------------------
Migration pull request
- updated QList patch
- initialize local msg variable

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

Juan Quintela (4):
  multifd: Initialize local variable
  migration-test: Add migration multifd test
  migration: Make sure that we don't call write() in case of error
  migration-test: introduce functions to handle string parameters

Laurent Vivier (2):
  migration-test: ppc64: fix FORTH test program
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
 include/qemu/queue.h         |  39 ++++++++
 migration/migration.c        |  72 +++++++-------
 migration/migration.h        |   1 +
 migration/ram.c              | 183 ++++++++++++++++++++++++++---------
 migration/savevm.c           |  61 ++++++++----
 migration/trace-events       |   9 +-
 migration/vmstate-types.c    |  70 ++++++++++++++
 stubs/vmstate.c              |   2 +-
 tests/qtest/migration-test.c |  97 ++++++++++++++++++-
 tests/test-vmstate.c         | 170 ++++++++++++++++++++++++++++++++
 vl.c                         |  10 +-
 27 files changed, 653 insertions(+), 129 deletions(-)

--=20
2.24.1


