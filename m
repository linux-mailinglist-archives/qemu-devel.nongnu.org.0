Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A676E95A8
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 15:19:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppUAw-0001Ue-1Z; Thu, 20 Apr 2023 09:18:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppUAi-0001Tj-V9
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:18:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppUAf-0005bK-NO
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:18:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681996675;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=iw5GDNDyagwCH4R5MJ74HBcVGqC1Gn2yZ5zo5Vf8MlI=;
 b=f1gXffiQgwgXooel/d134dnrS4o0zkzBT8be3zQ9oFTQIDGtDInAmIg21aVet7eknsbtFR
 wtmSi/wrIoRAdHpbOoskQVYpfg3WMVCBirWr1TivKMn64LEsoMLVZMxAbxlb1+PaCFfJxN
 oyBTXC1QckIDSHKyU+OMj5BPH+at71Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-623-tEi0xlTWOm-hoKEc5LjZrQ-1; Thu, 20 Apr 2023 09:17:53 -0400
X-MC-Unique: tEi0xlTWOm-hoKEc5LjZrQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 097D4101A553
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 13:17:53 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 47379C16024;
 Thu, 20 Apr 2023 13:17:52 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 00/20] Migration 20230420 patches
Date: Thu, 20 Apr 2023 15:17:31 +0200
Message-Id: <20230420131751.28534-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The following changes since commit 2d82c32b2ceaca3dc3da5e36e10976f34bfcb598:

  Open 8.1 development tree (2023-04-20 10:05:25 +0100)

are available in the Git repository at:

  https://gitlab.com/juan.quintela/qemu.git tags/migration-20230420-pull-request

for you to fetch changes up to cdf07846e6fe07a2e20c93eed5902114dc1d3dcf:

  migration: Pass migrate_caps_check() the old and new caps (2023-04-20 15:10:58 +0200)

----------------------------------------------------------------
Migration Pull request

This series include everything reviewed for migration:

- fix for disk stop/start (eric)
- detect filesystem of hostmem (peter)
- rename qatomic_mb_read (paolo)
- whitespace cleanup (李皆俊)
  I hope copy and paste work for the name O:-)
- atomic_counters series (juan)
- two first patches of capabilities (juan)

Please apply,

----------------------------------------------------------------

Eric Blake (1):
  migration: Handle block device inactivation failures better

Juan Quintela (14):
  migration: Merge ram_counters and ram_atomic_counters
  migration: Update atomic stats out of the mutex
  migration: Make multifd_bytes atomic
  migration: Make dirty_sync_missed_zero_copy atomic
  migration: Make precopy_bytes atomic
  migration: Make downtime_bytes atomic
  migration: Make dirty_sync_count atomic
  migration: Make postcopy_requests atomic
  migration: Make dirty_pages_rate atomic
  migration: Make dirty_bytes_last_sync atomic
  migration: Rename duplicate to zero_pages
  migration: Rename normal to normal_pages
  migration: rename enabled_capabilities to capabilities
  migration: Pass migrate_caps_check() the old and new caps

Paolo Bonzini (1):
  postcopy-ram: do not use qatomic_mb_read

Peter Xu (3):
  util/mmap-alloc: qemu_fd_getfs()
  vl.c: Create late backends before migration object
  migration/postcopy: Detect file system on dest host

李皆俊 (1):
  migration: remove extra whitespace character for code style

 include/qemu/mmap-alloc.h |   7 ++
 migration/migration.c     | 167 +++++++++++++++++---------------------
 migration/migration.h     |   2 +-
 migration/multifd.c       |  10 +--
 migration/postcopy-ram.c  |  36 ++++++--
 migration/ram.c           |  73 ++++++++---------
 migration/ram.h           |  34 ++++----
 migration/rdma.c          |   4 +-
 migration/savevm.c        |   6 +-
 softmmu/vl.c              |   9 +-
 util/mmap-alloc.c         |  28 +++++++
 11 files changed, 209 insertions(+), 167 deletions(-)

-- 
2.39.2


