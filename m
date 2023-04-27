Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9766F027B
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 10:27:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prwx8-0001H6-Ei; Thu, 27 Apr 2023 04:26:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1prwx6-0001GX-Kw
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 04:26:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1prwx2-0001El-Ex
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 04:26:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682583963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=VrJpOJM0ir5X8TTTreA2ujFH3D1dHX9vLPHw+C3bsEE=;
 b=Ovwpx/XVKRxvZeYhbEJ6kP9ioxTCVT6nL16y7/oYKJU+UO56y7NNcKKPJ0a5vK1j3aMeD4
 ZM4aedG1sqVxX4GZQb6Jy/dWn/WKqBh818YvNmS1fVihr12KsnCHUUnTkqbmhV/NVvNgdI
 Al5eEEXbP4ov0EH7k3pwUdsO2O9/FK4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-121-Q6DtWKStMxKsnWPpRgi9kg-1; Thu, 27 Apr 2023 04:25:59 -0400
X-MC-Unique: Q6DtWKStMxKsnWPpRgi9kg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4E8FF185A790
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 08:25:59 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 47139C15BA0;
 Thu, 27 Apr 2023 08:25:58 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Peter Xu <peterx@redhat.com>,
 Leonardo Bras <leobras@redhat.com>
Subject: [PULL 0/7] Migration 20230426 patches
Date: Thu, 27 Apr 2023 10:25:50 +0200
Message-Id: <20230427082557.20994-1-quintela@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

The following changes since commit c3f9aa8e488db330197c9217e38555f6772e8f07:

  Merge tag 'pull-qapi-2023-04-26' of https://repo.or.cz/qemu/armbru into staging (2023-04-26 07:23:32 +0100)

are available in the Git repository at:

  https://gitlab.com/juan.quintela/qemu.git tags/migration-20230426-pull-request

for you to fetch changes up to a67cceb071b76cc1631c67c11c845ffc4aa0803e:

  vmstate-static-checker: Recognize "num" field (2023-04-27 10:18:26 +0200)

----------------------------------------------------------------
Migration Pull request (take2)

With respect to the last PULL request:
- fix compilation on hosts without userfaultd.

Please, apply.

----------------------------------------------------------------

Juan Quintela (3):
  MAINTAINERS: Add Leonardo and Peter as reviewers
  migration: Move migrate_use_tls() to options.c
  migration: Move qmp_migrate_set_parameters() to options.c

Leonardo Bras (1):
  migration: Disable postcopy + multifd migration

Peter Xu (3):
  migration: Allow postcopy_ram_supported_by_host() to report err
  migration/vmstate-dump: Dump array size too as "num"
  vmstate-static-checker: Recognize "num" field

 MAINTAINERS                       |   2 +
 migration/migration.c             | 429 -----------------------------
 migration/migration.h             |   2 -
 migration/options.c               | 442 +++++++++++++++++++++++++++++-
 migration/options.h               |  12 +
 migration/postcopy-ram.c          |  60 ++--
 migration/postcopy-ram.h          |   3 +-
 migration/savevm.c                |   6 +-
 migration/tls.c                   |   3 +-
 scripts/vmstate-static-checker.py |  13 +-
 10 files changed, 501 insertions(+), 471 deletions(-)

-- 
2.40.0


