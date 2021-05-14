Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12DC5380DB1
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 17:59:46 +0200 (CEST)
Received: from localhost ([::1]:51798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhaE5-0005mK-1A
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 11:59:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lhZyt-000533-Pu
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:44:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lhZyn-0003uJ-V1
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:44:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621007037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=J0sPiWCxfjiaKrcMXwwfq8uKK2QYTsGFvPcn8p5431Y=;
 b=IW+Kw68ZUdo7lfDB9emwD8R5sjQqC56KRC8APKCXZggBu6b61cw8XasUCqk0Or3HnGu9Sf
 YoBwKxJ3wWx5BdpgBFzs60BL6p52jyN4hgjG2qCH6xvk7Jrs1TK6ZlLlz7zQ77UWDv++73
 CC5pgK11SFpKVUBlQCXvSechJgH4Q8M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-37-93vvBtBeO5GCTp5Aj4tbuA-1; Fri, 14 May 2021 11:43:54 -0400
X-MC-Unique: 93vvBtBeO5GCTp5Aj4tbuA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2882AA0CAE;
 Fri, 14 May 2021 15:43:53 +0000 (UTC)
Received: from localhost (ovpn-114-49.ams2.redhat.com [10.36.114.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BE8E52BFE9;
 Fri, 14 May 2021 15:43:52 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 0/4] iotests/297: Cover tests/
Date: Fri, 14 May 2021 17:43:47 +0200
Message-Id: <20210514154351.629027-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v1: https://lists.nongnu.org/archive/html/qemu-block/2021-03/msg01471.html
v2: https://lists.nongnu.org/archive/html/qemu-block/2021-05/msg00492.html


Hi,

When reviewing Vladimir’s new addition to tests/, I noticed that 297 so
far does not cover named tests.  That isn’t so good.

This series makes it cover them, and because tests/ is rather sparse at
this point, I decided to also fix up the two tests in there that don’t
pass pylint’s scrutiny yet.  I think it would be nice if we could keep
all of tests/ clean.


v3:
- Fixed patch 3: Turns out replacing `lambda self: mc(self)` by just
  `mc` (as pylint suggests) breaks the test.  So leave it as it is and
  instead disable the warning locally.


git-backport-diff against v3:

Key:
[----] : patches are identical
[####] : number of functional differences between upstream/downstream patch
[down] : patch is downstream-only
The flags [FC] indicate (F)unctional and (C)ontextual differences, respectively

001/4:[----] [--] 'iotests/297: Drop 169 and 199 from the skip list'
002/4:[----] [--] 'migrate-bitmaps-postcopy-test: Fix pylint warnings'
003/4:[0005] [FC] 'migrate-bitmaps-test: Fix pylint warnings'
004/4:[----] [--] 'iotests/297: Cover tests/'


Max Reitz (4):
  iotests/297: Drop 169 and 199 from the skip list
  migrate-bitmaps-postcopy-test: Fix pylint warnings
  migrate-bitmaps-test: Fix pylint warnings
  iotests/297: Cover tests/

 tests/qemu-iotests/297                        |  7 ++--
 .../tests/migrate-bitmaps-postcopy-test       | 13 +++---
 tests/qemu-iotests/tests/migrate-bitmaps-test | 41 +++++++++++--------
 3 files changed, 34 insertions(+), 27 deletions(-)

-- 
2.31.1


