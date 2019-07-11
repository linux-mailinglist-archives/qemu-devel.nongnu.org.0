Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10103654CC
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Jul 2019 12:56:31 +0200 (CEST)
Received: from localhost ([::1]:40394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hlWkY-0004YL-8Q
	for lists+qemu-devel@lfdr.de; Thu, 11 Jul 2019 06:56:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45744)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <quintela@redhat.com>) id 1hlWf3-0004le-9Z
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 06:50:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1hlWf1-0004Od-U7
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 06:50:49 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48604)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1hlWf1-0004Nh-MW
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 06:50:47 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0AF6181F01;
 Thu, 11 Jul 2019 10:44:18 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.36.118.16])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0A90460600;
 Thu, 11 Jul 2019 10:44:15 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 11 Jul 2019 12:43:53 +0200
Message-Id: <20190711104412.31233-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Thu, 11 Jul 2019 10:44:18 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 00/19] Migration patches
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 kvm@vger.kernel.org, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 6df2cdf44a82426f7a59dcb03f0dd2181ed7fd=
fa:

  Update version for v4.1.0-rc0 release (2019-07-09 17:21:53 +0100)

are available in the Git repository at:

  https://github.com/juanquintela/qemu.git tags/migration-pull-request

for you to fetch changes up to 0b47e79b3d04f500b6f3490628905ec5884133df:

  migration: allow private destination ram with x-ignore-shared (2019-07-=
11 12:30:40 +0200)

----------------------------------------------------------------
Migration pull request

----------------------------------------------------------------

Juan Quintela (3):
  migration: fix multifd_recv event typo
  migration-test: rename parameter to parameter_int
  migration-test: Add migration multifd test

Peng Tao (1):
  migration: allow private destination ram with x-ignore-shared

Peter Xu (10):
  migration: No need to take rcu during sync_dirty_bitmap
  memory: Don't set migration bitmap when without migration
  bitmap: Add bitmap_copy_with_{src|dst}_offset()
  memory: Pass mr into snapshot_and_clear_dirty
  memory: Introduce memory listener hook log_clear()
  kvm: Update comments for sync_dirty_bitmap
  kvm: Persistent per kvmslot dirty bitmap
  kvm: Introduce slots lock for memory listener
  kvm: Support KVM_CLEAR_DIRTY_LOG
  migration: Split log_clear() into smaller chunks

Wei Yang (5):
  migration/multifd: call multifd_send_sync_main when sending
    RAM_SAVE_FLAG_EOS
  migration/xbzrle: update cache and current_data in one place
  cutils: remove one unnecessary pointer operation
  migration/multifd: sync packet_num after all thread are done
  migratioin/ram.c: reset complete_round when we gets a queued page

 accel/kvm/kvm-all.c          |  260 +-
 accel/kvm/trace-events       |    1 +
 exec.c                       |   15 +-
 include/exec/memory.h        |   19 +
 include/exec/memory.h.rej    |   26 +
 include/exec/ram_addr.h      |   92 +-
 include/exec/ram_addr.h.orig |  488 ++++
 include/qemu/bitmap.h        |    9 +
 include/sysemu/kvm_int.h     |    4 +
 memory.c                     |   56 +-
 memory.c.rej                 |   17 +
 migration/migration.c        |    4 +
 migration/migration.h        |   27 +
 migration/migration.h.orig   |  315 +++
 migration/ram.c              |   93 +-
 migration/ram.c.orig         | 4599 ++++++++++++++++++++++++++++++++++
 migration/ram.c.rej          |   33 +
 migration/trace-events       |    3 +-
 migration/trace-events.orig  |  297 +++
 tests/Makefile.include       |    2 +
 tests/migration-test.c       |  103 +-
 tests/test-bitmap.c          |   72 +
 util/bitmap.c                |   85 +
 util/cutils.c                |    8 +-
 24 files changed, 6545 insertions(+), 83 deletions(-)
 create mode 100644 include/exec/memory.h.rej
 create mode 100644 include/exec/ram_addr.h.orig
 create mode 100644 memory.c.rej
 create mode 100644 migration/migration.h.orig
 create mode 100644 migration/ram.c.orig
 create mode 100644 migration/ram.c.rej
 create mode 100644 migration/trace-events.orig
 create mode 100644 tests/test-bitmap.c

--=20
2.21.0


