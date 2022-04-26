Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBB6510A2D
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 22:17:50 +0200 (CEST)
Received: from localhost ([::1]:46292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njRd7-0003RF-Bf
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 16:17:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1njRam-0008G3-Uk
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 16:15:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20222)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1njRaj-0007f3-Os
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 16:15:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651004120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=C7Ak45Z7cufuKyZzY9qklR9EziQ+oKIjuR5JZM3gcEU=;
 b=GEKQ4vXK5RFSESY9z0a/ukf43E3UIg13DHxLEFFhxBty2dowxj3i6isfAkbYRnpcRQ6nLU
 oYmQJODBM8PoFTD2Jx0Hr/e0MEoWsIWAtHvYzFF5eh6/MAE8bDGjrTN+YyHXUAXIcokSM4
 uVQWE9ul8OYi+v5vC7LIobDWBO2NsNE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-121-xM7boiU-OPS0d0TbsPn1ug-1; Tue, 26 Apr 2022 16:15:18 -0400
X-MC-Unique: xM7boiU-OPS0d0TbsPn1ug-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 16630185A794
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 20:15:18 +0000 (UTC)
Received: from blue.redhat.com (unknown [10.2.16.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D5A4355620D
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 20:15:17 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/13] NBD patches through 2022-04-26
Date: Tue, 26 Apr 2022 15:15:01 -0500
Message-Id: <20220426201514.170410-1-eblake@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
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

The following changes since commit 80a172de5592b5c33aa6bc30da6f16c4ad1ae390:

  Merge tag 'trivial-branch-for-7.1-pull-request' of https://gitlab.com/laurent_vivier/qemu into staging (2022-04-26 07:54:22 -0700)

are available in the Git repository at:

  https://repo.or.cz/qemu/ericb.git tags/pull-nbd-2022-04-26

for you to fetch changes up to 620c5cb5da57dc97f655e6218e7ca9bc896394a2:

  nbd: document what is protected by the CoMutexes (2022-04-26 13:16:42 -0500)

----------------------------------------------------------------
nbd patches for 2022-04-26

- Paolo Bonzini: thread-safety improvements to NBD client
- Vladimir Sementsov-Ogievsky: finer-grained selection of bitmaps during
  nbd-export

----------------------------------------------------------------
Paolo Bonzini (9):
      nbd: safeguard against waking up invalid coroutine
      nbd: mark more coroutine_fns
      nbd: remove peppering of nbd_client_connected
      nbd: keep send_mutex/free_sema handling outside nbd_co_do_establish_connection
      nbd: use a QemuMutex to synchronize yanking, reconnection and coroutines
      nbd: code motion and function renaming
      nbd: move s->state under requests_lock
      nbd: take receive_mutex when reading requests[].receiving
      nbd: document what is protected by the CoMutexes

Vladimir Sementsov-Ogievskiy (3):
      qapi: rename BlockDirtyBitmapMergeSource to BlockDirtyBitmapOrStr
      qapi: nbd-export: allow select bitmaps by node/name pair
      iotests/223: check new possibility of exporting bitmaps by node/name

 qapi/block-core.json                   |   6 +-
 qapi/block-export.json                 |   5 +-
 block/coroutines.h                     |   5 +-
 include/block/block_int-global-state.h |   2 +-
 block/monitor/bitmap-qmp-cmds.c        |   6 +-
 block/nbd.c                            | 286 +++++++++++++++++----------------
 blockdev-nbd.c                         |   8 +-
 nbd/server.c                           |  63 +++++---
 qemu-img.c                             |   8 +-
 qemu-nbd.c                             |  11 +-
 tests/qemu-iotests/223                 |  16 ++
 tests/qemu-iotests/223.out             |  47 +++++-
 12 files changed, 282 insertions(+), 181 deletions(-)

-- 
2.35.1


