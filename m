Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C524528A48
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 18:27:15 +0200 (CEST)
Received: from localhost ([::1]:37044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqdYw-0005E5-Ki
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 12:27:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nqcnf-0001wE-WE
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:38:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nqcnd-0008DT-84
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:38:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652715499;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=DuUhQfFoh41RT7PKEqzc2YFz3HYYn5T1WUuLf1vk9Dk=;
 b=Yhc7CS1Li6IZMpoNKzeHqMP3MP0gu/jTYMAGo4J562FlO26iSruMm0rhFc97cH4wuP7w/p
 8RHI6X2g8BydqD1YXUkHFWQOCbBVw1Mu62h0IU23SbzMW4CRhAG61Hg0/aKqBW0Ui0NdQ2
 WQir1MaToAVFk1JKQYHr3MZ2PjSznf0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-542--Lj0eIgGNeWc4wMOJ3r54A-1; Mon, 16 May 2022 11:38:18 -0400
X-MC-Unique: -Lj0eIgGNeWc4wMOJ3r54A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 456E6811E90
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 15:38:18 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.39.194.215])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 36E8715228C6;
 Mon, 16 May 2022 15:38:17 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, quintela@redhat.com, peterx@redhat.com,
 leobras@redhat.com, berrange@redhat.com
Subject: [PULL 00/17] migration queue
Date: Mon, 16 May 2022 16:37:55 +0100
Message-Id: <20220516153812.127155-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

The following changes since commit 10c2a0c5e7d48e590d945c017b5b8af5b4c89a3c:

  Merge tag 'or1k-pull-request-20220515' of https://github.com/stffrdhrn/qemu into staging (2022-05-15 16:56:27 -0700)

are available in the Git repository at:

  https://gitlab.com/dagrh/qemu.git tags/pull-migration-20220516a

for you to fetch changes up to 5b1d9bab2da4fca3a3caee97c430e5709cb32b7b:

  multifd: Implement zero copy write in multifd migration (multifd-zero-copy) (2022-05-16 13:56:24 +0100)

----------------------------------------------------------------
Migration pull 2022-05-16

(This replaces the 28th April through 10th May sets)
Compared to that last set it just has the Alpine
uring check that Leo has added; although that's also
now fixed upstream in Alpine.

It contains:
  TLS test fixes from Dan
  Zerocopy migration feature from Leo

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

----------------------------------------------------------------
Daniel P. Berrangé (9):
      tests: fix encoding of IP addresses in x509 certs
      tests: add more helper macros for creating TLS x509 certs
      tests: add migration tests of TLS with PSK credentials
      tests: add migration tests of TLS with x509 credentials
      tests: convert XBZRLE migration test to use common helper
      tests: convert multifd migration tests to use common helper
      tests: add multifd migration tests of TLS with PSK credentials
      tests: add multifd migration tests of TLS with x509 credentials
      tests: ensure migration status isn't reported as failed

Leonardo Bras (8):
      meson.build: Fix docker-test-build@alpine when including linux/errqueue.h
      QIOChannel: Add flags on io_writev and introduce io_flush callback
      QIOChannelSocket: Implement io_writev zero copy flag & io_flush for CONFIG_LINUX
      migration: Add zero-copy-send parameter for QMP/HMP for Linux
      migration: Add migrate_use_tls() helper
      multifd: multifd_send_sync_main now returns negative on error
      multifd: Send header packet without flags if zero-copy-send is enabled
      multifd: Implement zero copy write in multifd migration (multifd-zero-copy)

 chardev/char-io.c                    |   2 +-
 hw/remote/mpqemu-link.c              |   2 +-
 include/io/channel-socket.h          |   2 +
 include/io/channel.h                 |  38 +-
 io/channel-buffer.c                  |   1 +
 io/channel-command.c                 |   1 +
 io/channel-file.c                    |   1 +
 io/channel-socket.c                  | 118 ++++-
 io/channel-tls.c                     |   1 +
 io/channel-websock.c                 |   1 +
 io/channel.c                         |  49 +-
 meson.build                          |  12 +
 migration/channel.c                  |   3 +-
 migration/migration.c                |  52 ++-
 migration/migration.h                |   6 +
 migration/multifd.c                  |  74 ++-
 migration/multifd.h                  |   4 +-
 migration/ram.c                      |  29 +-
 migration/rdma.c                     |   1 +
 migration/socket.c                   |  12 +-
 monitor/hmp-cmds.c                   |   6 +
 qapi/migration.json                  |  24 +
 scsi/pr-manager-helper.c             |   2 +-
 tests/qtest/meson.build              |  12 +-
 tests/qtest/migration-helpers.c      |  13 +
 tests/qtest/migration-helpers.h      |   1 +
 tests/qtest/migration-test.c         | 867 +++++++++++++++++++++++++++++++----
 tests/unit/crypto-tls-psk-helpers.c  |  18 +-
 tests/unit/crypto-tls-psk-helpers.h  |   1 +
 tests/unit/crypto-tls-x509-helpers.c |  16 +-
 tests/unit/crypto-tls-x509-helpers.h |  53 +++
 tests/unit/test-crypto-tlssession.c  |  11 +-
 tests/unit/test-io-channel-socket.c  |   1 +
 33 files changed, 1295 insertions(+), 139 deletions(-)


