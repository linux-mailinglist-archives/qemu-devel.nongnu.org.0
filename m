Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0FD76D5FD0
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 14:01:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjfJs-0002Lh-Sa; Tue, 04 Apr 2023 07:59:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pjfJq-0002LD-7j
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 07:59:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pjfJn-0007vo-Dh
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 07:59:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680609558;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=DpHq0BiNvoueD0k8apUTdVOXOcOjnJYHMmRLGtaLfBw=;
 b=faAX+nbTxDD79WhmnYyvVjXGql/SuudaoFXdpLILp9DnhOpbzQBCymcW6TCv7r5YyW+QPz
 j5WH3Cp40KG7ME3aFdxNzPevCn1RXiJaOGg/aOmBYgiKzuYzr4vXY3N8Rs8UVGOSdkDs2h
 xWCsyx0Z57ITsORHrSFuLlfXPGjwi+4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-387-h6OLT4bjOcmyo9x4t7cZQw-1; Tue, 04 Apr 2023 07:59:15 -0400
X-MC-Unique: h6OLT4bjOcmyo9x4t7cZQw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7DE083C0E452;
 Tue,  4 Apr 2023 11:59:14 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C72941415117;
 Tue,  4 Apr 2023 11:59:13 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BE8C321E6926; Tue,  4 Apr 2023 13:59:12 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: michael.roth@amd.com, eblake@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com, pbonzini@redhat.com, marcandre.lureau@redhat.com,
 arei.gonglei@huawei.com, pizhenwei@bytedance.com, jsnow@redhat.com,
 vsementsov@yandex-team.ru, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, quintela@redhat.com, jasowang@redhat.com,
 yuval.shaia.ml@gmail.com, stefanha@redhat.com, kraxel@redhat.com,
 kkostiuk@redhat.com, qemu-block@nongnu.org
Subject: [PATCH 00/16] qapi qga/qapi-schema: Doc fixes
Date: Tue,  4 Apr 2023 13:58:56 +0200
Message-Id: <20230404115912.2829251-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

It's always nice to get doc fixes into the release, but if it's too
late, it's too late.

Generated code does not change, except for the last patch, which moves
a bit of code without changing it.

Markus Armbruster (16):
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

 docs/devel/qapi-code-gen.rst         |  8 ++-
 docs/interop/firmware.json           |  6 +-
 qapi/block-core.json                 | 82 ++++++++++++++--------------
 qapi/block.json                      |  2 +-
 qapi/char.json                       |  4 +-
 qapi/control.json                    |  2 +-
 qapi/cryptodev.json                  |  4 ++
 qapi/job.json                        |  4 +-
 qapi/machine-target.json             |  2 +-
 qapi/machine.json                    | 26 +++++----
 qapi/migration.json                  | 37 ++++++++-----
 qapi/misc.json                       |  6 +-
 qapi/net.json                        | 25 +++------
 qapi/qapi-schema.json                | 24 +-------
 qapi/qdev.json                       |  2 +-
 qapi/qom.json                        |  4 +-
 qapi/rdma.json                       |  2 +-
 qapi/replay.json                     |  3 +
 qapi/run-state.json                  |  6 +-
 qapi/stats.json                      |  3 +-
 qapi/tpm.json                        |  3 +-
 qapi/trace.json                      |  1 +
 qapi/ui.json                         | 12 ++--
 qga/qapi-schema.json                 | 10 ++--
 storage-daemon/qapi/qapi-schema.json | 22 +++++---
 25 files changed, 154 insertions(+), 146 deletions(-)

-- 
2.39.2


