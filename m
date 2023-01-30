Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 667FB6806D7
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 09:04:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMP8T-0001ol-DJ; Mon, 30 Jan 2023 03:03:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMP8L-0001oA-KE
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 03:03:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMP8I-0000xz-Bd
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 03:03:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675065797;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=tllhWixMvsLc+rXqcYVpA8F2qKz4J+vdT86oFXotoEE=;
 b=EXc0NBXrWC99xW02FlurykWHJUgEA93MVwZTl8PaG8ijy0oN7V05yrv9QnwKyDTqVGwiGu
 juG3/nkpqtHPStU5a4ekqmYXUsHCBD1IHyfTukbD0ypwDdt9vuAwi9uS/dlm9+OFhz4nAg
 p4rm4YkVdngUs3szofH/oQOm1KiP/FA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-393-3iXQ4sQ5MomTwODdDrzcWw-1; Mon, 30 Jan 2023 03:03:13 -0500
X-MC-Unique: 3iXQ4sQ5MomTwODdDrzcWw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 59B2F3C0DDCB;
 Mon, 30 Jan 2023 08:03:12 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F0BFF492B01;
 Mon, 30 Jan 2023 08:03:08 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Fam Zheng <fam@euphon.net>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-s390x@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 qemu-block@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 David Hildenbrand <david@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PULL 0/5] Next patches
Date: Mon, 30 Jan 2023 09:03:02 +0100
Message-Id: <20230130080307.1792-1-quintela@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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

The following changes since commit 13356edb87506c148b163b8c7eb0695647d00c2a:

  Merge tag 'block-pull-request' of https://gitlab.com/stefanha/qemu into staging (2023-01-24 09:45:33 +0000)

are available in the Git repository at:

  https://gitlab.com/juan.quintela/qemu.git tags/next-pull-request

for you to fetch changes up to 07181bd32c39007855e25eb5675e9210e9ccd8da:

  migration: simplify migration_iteration_run() (2023-01-30 08:55:04 +0100)

----------------------------------------------------------------
Migration PULL request

Hi

- Peter Xu fix for crash on hosts with guest page bigger than host
- The parts that are reviewed of my vfio series

Please, apply.

----------------------------------------------------------------

Juan Quintela (4):
  migration: No save_live_pending() method uses the QEMUFile parameter
  migration: Split save_live_pending() into state_pending_*
  migration: Remove unused threshold_size parameter
  migration: simplify migration_iteration_run()

Peter Xu (1):
  migration: Fix migration crash when target psize larger than host

 docs/devel/migration.rst       | 18 ++++++-----
 docs/devel/vfio-migration.rst  |  4 +--
 include/migration/register.h   | 17 ++++++-----
 migration/savevm.h             | 10 +++---
 hw/s390x/s390-stattrib.c       | 11 ++++---
 hw/vfio/migration.c            | 20 ++++++------
 migration/block-dirty-bitmap.c | 14 ++++-----
 migration/block.c              | 13 ++++----
 migration/migration.c          | 42 ++++++++++++++-----------
 migration/ram.c                | 56 +++++++++++++++++++++++++++-------
 migration/savevm.c             | 39 ++++++++++++++++++-----
 hw/vfio/trace-events           |  2 +-
 migration/trace-events         |  7 +++--
 13 files changed, 163 insertions(+), 90 deletions(-)

-- 
2.39.1


