Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F74D6F1571
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 12:29:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psLLl-0006Ga-GB; Fri, 28 Apr 2023 06:29:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1psLLe-0006GM-Jd
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 06:29:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1psLLc-0007KN-Rz
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 06:29:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682677744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=bir+7Tmbl8j7k7CFv2DSj8BlC7ZH7P38CSkMPy48XjU=;
 b=JfUnHp6bZS8ZkKyA+e75odkXk5XD/QqaCTYmYcP9c7BllgQs2tuvh5xXgKr5Zh/z+FO1ho
 Y+BDoR/j6nOzRP6i2o/8EnjGU3dAQ8P7exX+7p4GKj6QjzUsMMp0UHGNMVYzHU/bg0Usrg
 j1/b96n8jx/zBlsSGZOFkL0hisRErDI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-526-NBwM3ybUM3al7BxCgzfwig-1; Fri, 28 Apr 2023 06:29:02 -0400
X-MC-Unique: NBwM3ybUM3al7BxCgzfwig-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5EB2D29AA388;
 Fri, 28 Apr 2023 10:29:02 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3DC4F40C2064;
 Fri, 28 Apr 2023 10:29:02 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3AFEA21E6608; Fri, 28 Apr 2023 12:29:01 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Subject: [PULL 00/17] QAPI patches patches for 2023-04-28
Date: Fri, 28 Apr 2023 12:28:44 +0200
Message-Id: <20230428102901.1685375-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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

The following changes since commit cc5ee50fff9dbac0aac32cd892a7163c7babcca1:

  Merge tag 'pull-testing-docs-270423-1' of https://gitlab.com/stsquad/qemu into staging (2023-04-27 16:46:17 +0100)

are available in the Git repository at:

  https://repo.or.cz/qemu/armbru.git tags/pull-qapi-2023-04-28

for you to fetch changes up to e2e9e567f0e23971cac35ba1dee7edb51085b5f7:

  docs/devel/qapi-code-gen: Describe some doc markup pitfalls (2023-04-28 11:48:34 +0200)

----------------------------------------------------------------
QAPI patches patches for 2023-04-28

----------------------------------------------------------------
Markus Armbruster (17):
      qga/qapi-schema: Tidy up documentation of guest-fsfreeze-status
      qga/qapi-schema: Fix a misspelled reference
      qapi: Fix misspelled references
      qapi: Fix up references to long gone error classes
      qapi/block-core: Clean up after removal of dirty bitmap @status
      qapi: @foo should be used to reference, not ``foo``
      qapi: Tidy up examples
      qapi: Delete largely misleading "Stability Considerations"
      qapi: Fix bullet list markup in documentation
      qapi: Fix unintended definition lists in documentation
      qga/qapi-schema: Fix member documentation markup
      qapi: Fix argument documentation markup
      qapi: Replace ad hoc "since" documentation by member documentation
      qapi: Fix misspelled section tags in doc comments
      qapi: Format since information the conventional way: (since X.Y)
      qapi storage-daemon/qapi: Fix documentation section structure
      docs/devel/qapi-code-gen: Describe some doc markup pitfalls

 docs/devel/qapi-code-gen.rst         | 62 +++++++++++++++++++++++++--
 docs/interop/firmware.json           |  6 +--
 qapi/block-core.json                 | 82 ++++++++++++++++++------------------
 qapi/block-export.json               |  7 +--
 qapi/block.json                      |  2 +-
 qapi/char.json                       |  4 +-
 qapi/control.json                    |  2 +-
 qapi/cryptodev.json                  |  4 ++
 qapi/job.json                        |  4 +-
 qapi/machine-target.json             |  2 +-
 qapi/machine.json                    | 30 +++++++------
 qapi/migration.json                  | 37 ++++++++++------
 qapi/misc.json                       | 13 +++---
 qapi/net.json                        | 27 +++++-------
 qapi/qapi-schema.json                | 24 +----------
 qapi/qdev.json                       |  2 +-
 qapi/qom.json                        |  4 +-
 qapi/rdma.json                       |  2 +-
 qapi/replay.json                     |  3 ++
 qapi/run-state.json                  | 11 +++--
 qapi/stats.json                      |  3 +-
 qapi/tpm.json                        |  3 +-
 qapi/trace.json                      |  1 +
 qapi/ui.json                         | 12 +++---
 qapi/yank.json                       | 21 ++++-----
 qga/qapi-schema.json                 | 10 ++---
 storage-daemon/qapi/qapi-schema.json | 22 +++++++---
 27 files changed, 231 insertions(+), 169 deletions(-)

-- 
2.39.2


