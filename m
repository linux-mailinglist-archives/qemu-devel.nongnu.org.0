Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6111614AC19
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jan 2020 23:35:29 +0100 (CET)
Received: from localhost ([::1]:51744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iwCye-0001Uw-45
	for lists+qemu-devel@lfdr.de; Mon, 27 Jan 2020 17:35:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47121)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1iwCwn-0008SX-AC
 for qemu-devel@nongnu.org; Mon, 27 Jan 2020 17:33:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1iwCwl-0002uN-8M
 for qemu-devel@nongnu.org; Mon, 27 Jan 2020 17:33:32 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:49590
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1iwCwk-0002tW-SG
 for qemu-devel@nongnu.org; Mon, 27 Jan 2020 17:33:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580164410;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=hKJ8I+MJr07dbsve0YtV9GwRTOSO0i2qP/mZ/YyxbAo=;
 b=hNtUwOCEt4B+U2eZ5sokPcXfdCjTHcNiwf2rcwRMJZUjluGHZl1/cUoFRt/J6nLRcMpNlQ
 cNAvi6Ye/P9tZdJH43JQARf63RtYZedAyFSx77AFLZ49xkdsvlOP0qR4fngYRsapO4lOy2
 f+0Q+7JIIj/zSY2TcYigcG2BpXg8T8Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-415-jS3v7VZMP7uxUtA9y6ZmOA-1; Mon, 27 Jan 2020 17:33:26 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5FF338010DD
 for <qemu-devel@nongnu.org>; Mon, 27 Jan 2020 22:33:25 +0000 (UTC)
Received: from secure.mitica (ovpn-116-64.ams2.redhat.com [10.36.116.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1AFBD3B7;
 Mon, 27 Jan 2020 22:33:22 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/19] 10 next patches
Date: Mon, 27 Jan 2020 23:33:02 +0100
Message-Id: <20200127223321.2742-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: jS3v7VZMP7uxUtA9y6ZmOA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 207.211.31.81
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
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 105b07f1ba462ec48b27e5cb74ddf81c6a79364c=
:

  Merge remote-tracking branch 'remotes/cohuck/tags/s390x-20200127' into st=
aging (2020-01-27 13:02:36 +0000)

are available in the Git repository at:

  https://github.com/juanquintela/qemu.git tags/10_next-pull-request

for you to fetch changes up to 3189f80ee7b44c968796e63f81c92c915fccdb08:

  migration/compress: compress QEMUFile is not writable (2020-01-27 20:47:2=
4 +0100)

----------------------------------------------------------------
Migration pull request

This pull request include:
- simplify get_qlist (eric)
- fix null in multifd_send_terminate_threads (zhimin)
- small fix for compress (wei)
- migrate multifd + cancel fixes (juan)
- migrate compression: the bits that are reviewed (juan)

----------------------------------------------------------------

Eric Auger (1):
  migration: Simplify get_qlist

Juan Quintela (16):
  migration-test: Use g_free() instead of free()
  multifd: Make sure that we don't do any IO after an error
  qemu-file: Don't do IO after shutdown
  migration: Don't send data if we have stopped
  migration-test: Make sure that multifd and cancel works
  migration: Create migration_is_running()
  ram_addr: Split RAMBlock definition
  multifd: multifd_send_pages only needs the qemufile
  multifd: multifd_queue_page only needs the qemufile
  multifd: multifd_send_sync_main only needs the qemufile
  multifd: Use qemu_target_page_size()
  migration: Make checkpatch happy with comments
  multifd: Make multifd_save_setup() get an Error parameter
  multifd: Make multifd_load_setup() get an Error parameter
  multifd: Add multifd-method parameter
  multifd: Split multifd code into its own file

Wei Yang (1):
  migration/compress: compress QEMUFile is not writable

Zhimin Feng (1):
  migration/multifd: fix nullptr access in
    multifd_send_terminate_threads

 MAINTAINERS                  |    1 +
 hw/core/qdev-properties.c    |   13 +
 include/exec/ram_addr.h      |   40 +-
 include/exec/ramblock.h      |   64 +++
 include/hw/qdev-properties.h |    3 +
 include/qemu/queue.h         |   19 +-
 migration/Makefile.objs      |    1 +
 migration/migration.c        |   82 ++-
 migration/migration.h        |    3 +-
 migration/multifd.c          |  899 ++++++++++++++++++++++++++++++
 migration/multifd.h          |  139 +++++
 migration/qemu-file.c        |   38 +-
 migration/ram.c              | 1004 +---------------------------------
 migration/ram.h              |    7 -
 migration/rdma.c             |    2 +-
 migration/savevm.c           |    4 +-
 migration/vmstate-types.c    |   10 +-
 monitor/hmp-cmds.c           |   13 +
 qapi/migration.json          |   30 +-
 tests/qtest/migration-test.c |  126 ++++-
 20 files changed, 1410 insertions(+), 1088 deletions(-)
 create mode 100644 include/exec/ramblock.h
 create mode 100644 migration/multifd.c
 create mode 100644 migration/multifd.h

--=20
2.24.1


