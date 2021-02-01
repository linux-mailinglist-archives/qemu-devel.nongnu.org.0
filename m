Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A75D930B012
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 20:10:08 +0100 (CET)
Received: from localhost ([::1]:49674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6eaN-0005OC-Ee
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 14:10:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l6eXw-0003hy-Oj
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 14:07:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l6eXt-0000M6-Sn
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 14:07:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612206452;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=1kwe3erWtsE0pUNEc8JBMnddlkMEAQYIVb/LNC9ZnkM=;
 b=WozrcInz3/pIg8wERM/zNO4CqB1Xf5vx3I65GqztnlvI14lhkCeJErh/o1WHyvcDfL/s5E
 d8huq5NFOt4UfvJ5Z5CVgpXVWoLqhLJRGaZ0zApNdCN6vet5OjgNKl+NqnhELvzPfCPvmf
 WBGjZaU9P67lYWpgI9vi6vGkVlBmgg8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-271-Lhr4HZlgN3SVdTRQI9qeaw-1; Mon, 01 Feb 2021 14:07:30 -0500
X-MC-Unique: Lhr4HZlgN3SVdTRQI9qeaw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75AD3801817;
 Mon,  1 Feb 2021 19:07:29 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-112-72.ams2.redhat.com [10.36.112.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 71D1460C66;
 Mon,  1 Feb 2021 19:07:28 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 0/6] Block layer patches
Date: Mon,  1 Feb 2021 20:07:14 +0100
Message-Id: <20210201190720.245732-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 74208cd252c5da9d867270a178799abd802b9338:

  Merge remote-tracking branch 'remotes/berrange-gitlab/tags/misc-fixes-pull-request' into staging (2021-01-29 19:51:25 +0000)

are available in the Git repository at:

  git://repo.or.cz/qemu/kevin.git tags/for-upstream

for you to fetch changes up to 47c9af7f4c78d03986aecc9afb0aab9b19d77cb5:

  iotests: Fix -makecheck output (2021-02-01 17:58:49 +0100)

----------------------------------------------------------------
Block layer patches:

- Fix double processing of nodes in bdrv_set_aio_context()
- Fix potential hang in block export shutdown
- iotests: Some more fixups for the 'check' rewrite
- MAINTAINERS: Add Vladimir as co-maintainer for Block Jobs

----------------------------------------------------------------
Kevin Wolf (1):
      iotests: Fix -makecheck output

Sergio Lopez (2):
      block: Avoid processing BDS twice in bdrv_set_aio_context_ignore()
      block: move blk_exp_close_all() to qemu_cleanup()

Vladimir Sementsov-Ogievskiy (3):
      MAINTAINERS: Add Vladimir as co-maintainer for Block Jobs
      iotests/297: pylint: ignore too many statements
      iotests: check: return 1 on failure

 block.c                              | 35 +++++++++++++++++++++++++++--------
 qemu-nbd.c                           |  1 +
 softmmu/runstate.c                   |  9 +++++++++
 storage-daemon/qemu-storage-daemon.c |  1 +
 tests/qemu-iotests/testrunner.py     | 10 +++++++---
 MAINTAINERS                          | 10 ++++++++++
 tests/qemu-iotests/check             |  5 ++++-
 tests/qemu-iotests/pylintrc          |  2 ++
 8 files changed, 61 insertions(+), 12 deletions(-)


