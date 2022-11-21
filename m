Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F946322F5
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 14:01:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox6OR-0001YR-HN; Mon, 21 Nov 2022 07:59:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ox6OO-0001Wc-Dm
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 07:59:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ox6OM-0006Ns-8R
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 07:59:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669035556;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6cA5vw11LLvoiKCPpS2dx3Sk36Qtp4npgO8GCpQGd4I=;
 b=XGXJtAqvvtDW91Z7oU0cGFeDCkvkCxIvVjEKQGvB9qT6gCl4UZO4Ychj4JAqJMkWO2EPIV
 kyFIgqRmP+BLoJwOCd8GKLTQVeg/GLvA8eQHeAX0nSA08rYbnFvzslL5uwVP3r0Tq2aCAC
 N994du9h8rvE9y1BGi9noFIVrRiLlIo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-646-j6DwWERTOdq5cQXFD-7jtg-1; Mon, 21 Nov 2022 07:59:13 -0500
X-MC-Unique: j6DwWERTOdq5cQXFD-7jtg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0D88E185A78F;
 Mon, 21 Nov 2022 12:59:13 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.227])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 75436C15BB3;
 Mon, 21 Nov 2022 12:59:10 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Fam Zheng <fam@euphon.net>, Juan Quintela <quintela@redhat.com>,
 qemu-block@nongnu.org, David Hildenbrand <david@redhat.com>,
 Peter Xu <peterx@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 0/8] Next patches
Date: Mon, 21 Nov 2022 13:58:59 +0100
Message-Id: <20221121125907.62469-1-quintela@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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

The following changes since commit a082fab9d259473a9d5d53307cf83b1223301181:

  Merge tag 'pull-ppc-20221117' of https://gitlab.com/danielhb/qemu into staging (2022-11-17 12:39:38 -0500)

are available in the Git repository at:

  https://gitlab.com/juan.quintela/qemu.git tags/next-pull-request

for you to fetch changes up to b5280437a7f49cf617cdd99bbbe2c7bd1652408b:

  migration: Block migration comment or code is wrong (2022-11-21 11:58:10 +0100)

----------------------------------------------------------------
Migration PULL request (take 3)

Hi

Drop everything that is not a bug fix:
- fixes by peter
- fix comment on block creation (me)
- fix return values from qio_channel_block()

Please, apply.

(take 1)
It includes:
- Leonardo fix for zero_copy flush
- Fiona fix for return value of readv/writev
- Peter Xu cleanups
- Peter Xu preempt patches
- Patches ready from zero page (me)
- AVX2 support (ling)
- fix for slow networking and reordering of first packets (manish)

Please, apply.

----------------------------------------------------------------

Fiona Ebner (1):
  migration/channel-block: fix return value for
    qio_channel_block_{readv,writev}

Juan Quintela (1):
  migration: Block migration comment or code is wrong

Leonardo Bras (1):
  migration/multifd/zero-copy: Create helper function for flushing

Peter Xu (5):
  migration: Fix possible infinite loop of ram save process
  migration: Fix race on qemu_file_shutdown()
  migration: Disallow postcopy preempt to be used with compress
  migration: Use non-atomic ops for clear log bitmap
  migration: Disable multifd explicitly with compression

 include/exec/ram_addr.h   | 11 +++++-----
 include/exec/ramblock.h   |  3 +++
 include/qemu/bitmap.h     |  1 +
 migration/block.c         |  4 ++--
 migration/channel-block.c |  6 ++++--
 migration/migration.c     | 18 ++++++++++++++++
 migration/multifd.c       | 30 ++++++++++++++++----------
 migration/qemu-file.c     | 27 ++++++++++++++++++++---
 migration/ram.c           | 27 ++++++++++++++---------
 util/bitmap.c             | 45 +++++++++++++++++++++++++++++++++++++++
 10 files changed, 139 insertions(+), 33 deletions(-)

-- 
2.38.1


