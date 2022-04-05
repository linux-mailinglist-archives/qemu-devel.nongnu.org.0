Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C96634F2A50
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 12:54:43 +0200 (CEST)
Received: from localhost ([::1]:42088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbgpe-0007mQ-U2
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 06:54:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nbgWr-00021b-3J
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 06:35:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nbgWl-0008Ti-2Z
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 06:35:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649154898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=k65astNimqhI4SEDmOlzHx9R1gbsTMOk93a0bIBKazk=;
 b=SVSJa9QHNuK1Q7Nq/RXvcRvQnC2xDpjuJtFuRBTgar9MxaBNEQGeLOHLc7zgwo2ocihnYg
 8Vznn9/flG5/tQJn5WNvc6h6qGTMvLyz0RMTfkbSBLbGcp73mJ5dxv+3BBixzLFkjhDGVO
 7gEzlQ4UClYWv7h57yU/i+QZ31T1/Kk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-222-zslRdJHuO3KMtYUr4df-xA-1; Tue, 05 Apr 2022 06:34:57 -0400
X-MC-Unique: zslRdJHuO3KMtYUr4df-xA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DCDC91010360;
 Tue,  5 Apr 2022 10:34:56 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BC63840CF8F7;
 Tue,  5 Apr 2022 10:34:56 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A21E321E6906; Tue,  5 Apr 2022 12:34:55 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/10] QAPI patches patches for 2022-04-05
Date: Tue,  5 Apr 2022 12:34:45 +0200
Message-Id: <20220405103455.4145273-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I double-checked these patches affect *only* generated documentation.
Safe enough for 7.0, I think.  But I'm quite content to hold on to
them until after the release, if that's preferred.

The following changes since commit 20661b75ea6093f5e59079d00a778a972d6732c5:

  Merge tag 'pull-ppc-20220404' of https://github.com/legoater/qemu into staging (2022-04-04 15:48:55 +0100)

are available in the Git repository at:

  git://repo.or.cz/qemu/armbru.git tags/pull-qapi-2022-04-05

for you to fetch changes up to 8230f3389c7d7215d0c3946d415f54b3e9c07f73:

  qapi: Fix calc-dirty-rate example (2022-04-05 12:30:45 +0200)

----------------------------------------------------------------
QAPI patches patches for 2022-04-05

----------------------------------------------------------------
Markus Armbruster (1):
      qapi: Fix calc-dirty-rate example

Victor Toso (9):
      qapi: fix example of netdev_add command
      qapi: fix examples: replay-break and replay-seek
      qapi: fix example of query-named-block-nodes command
      qapi: fix example of query-spice command
      qapi: fix example of query-vnc command
      qapi: fix example of query-colo-status command
      qapi: fix example of trace-event-get-state command
      qapi: fix example of query-cpus-fast command
      qapi: fix example of query-memdev command

 qapi/block-core.json | 1 +
 qapi/machine.json    | 4 ++--
 qapi/migration.json  | 4 ++--
 qapi/net.json        | 2 +-
 qapi/replay.json     | 4 ++--
 qapi/trace.json      | 2 +-
 qapi/ui.json         | 3 +++
 7 files changed, 12 insertions(+), 8 deletions(-)

-- 
2.35.1


