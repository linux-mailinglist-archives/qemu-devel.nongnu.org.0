Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4086EF9E3
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 20:14:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prjdX-0003bn-BB; Wed, 26 Apr 2023 14:13:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1prjdU-0003bf-GJ
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 14:13:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1prjdS-0000l6-R8
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 14:13:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682532778;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=MWW4Wn+3BHL3jzYEz5aKoW6bluvJ0JP9MFXSeBs+fQ8=;
 b=h59D1Jr1QEnabvCQz/20HeBh4HVYDGAzFJLuX7ARoEID6SPeF16DgG1MBs3NWJfqS6604S
 ki2FeyXVsMzNNZ1pLlUV3VUmT4z6uLdWrSTeoqSEduSPDeMr2LspmElNXsrzdl+0WFCsoY
 EazjKqD6zTACh1lBjGZPh8LKlv6Ntuk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-59-_pZvLuhtMc-KsSpjaMS8ag-1; Wed, 26 Apr 2023 14:12:56 -0400
X-MC-Unique: _pZvLuhtMc-KsSpjaMS8ag-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4AA7481B153
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 18:12:56 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0E0971121314;
 Wed, 26 Apr 2023 18:12:54 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Juan Quintela <quintela@redhat.com>, John Snow <jsnow@redhat.com>,
 Leonardo Bras <leobras@redhat.com>
Subject: [PULL 0/7] Migration 20230426 patches
Date: Wed, 26 Apr 2023 20:12:46 +0200
Message-Id: <20230426181253.13286-1-quintela@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
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

The following changes since commit 9c894df3a37d675652390f7dbbe2f65b7bad7efa:

  migration: Create migrate_max_bandwidth() function (2023-04-24 15:01:47 +0200)

are available in the Git repository at:

  https://gitlab.com/juan.quintela/qemu.git tags/migration-20230426-pull-request

for you to fetch changes up to 7b5cd8ff519e9fe3df6cda65428a6f1aa28a6ced:

  vmstate-static-checker: Recognize "num" field (2023-04-26 19:17:55 +0200)

----------------------------------------------------------------
Migration Pull request

Hi

This PULL request is on top of migration-20230424 already queued by
Richard.

It contains:
- MAINTAINERS: make peter and leo reviewers for migration (juan)
- Disable postcopy + multifd together. It needs at least to call
  send_sync before it will work. (juan)
- Improve postcopy error messages (peter)
- vmstate checker: Compare sizes of arrays correctly (peter)
- Move more capability functions to options.c (juan)

Please, apply.

Subject: [PULL 00/30] Migration 20230424 patches
Based-on: <20230424132730.70752-1-quintela@redhat.com>

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
 migration/postcopy-ram.c          |  59 ++--
 migration/postcopy-ram.h          |   3 +-
 migration/savevm.c                |   6 +-
 migration/tls.c                   |   3 +-
 scripts/vmstate-static-checker.py |  13 +-
 10 files changed, 501 insertions(+), 470 deletions(-)

-- 
2.40.0


