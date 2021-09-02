Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B813FEB92
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 11:49:55 +0200 (CEST)
Received: from localhost ([::1]:46322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLjM2-0001ci-SV
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 05:49:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mLjCy-000217-As
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 05:40:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57211)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mLjCt-0008Dc-E1
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 05:40:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630575624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=kvpUC82fy8/P1f9kSLafFmTqj4qabG4Cr88PVYLENH0=;
 b=aAqes7yAhPrJyLgvHJZIs5kNiX5If9gwPePyWYgjxtRtdMuilZdWkCNbg9fAbb0hUfBiZy
 5GcgIOe+hfOBsD/FzjQ+/dYrDEo9epVLnwcFPeM7huWjpyrqkS9ijfLs8mJcAHY1gZwWfb
 uaBfPzSQh+teXBqpi4IHjWgimfQIRaU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-x7aQjCn0OTeYdfsA0W_w2A-1; Thu, 02 Sep 2021 05:40:21 -0400
X-MC-Unique: x7aQjCn0OTeYdfsA0W_w2A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 037AF188E3C1;
 Thu,  2 Sep 2021 09:40:20 +0000 (UTC)
Received: from localhost (unknown [10.39.193.237])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7928F60C4A;
 Thu,  2 Sep 2021 09:40:19 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 0/5] iotests/297: Cover tests/
Date: Thu,  2 Sep 2021 11:40:12 +0200
Message-Id: <20210902094017.32902-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v1: https://lists.nongnu.org/archive/html/qemu-block/2021-03/msg01471.html
v2: https://lists.nongnu.org/archive/html/qemu-block/2021-05/msg00492.html
v3: https://lists.nongnu.org/archive/html/qemu-block/2021-05/msg00569.html


Hi,

Sorry for the long delay, here is v4 to make our lint checking iotest
297 cover the tests/ subdirectory.


v4:
- Fixed the explanatory comment in patch 3 as suggested by Vladimir
- Added patch 4


git-backport-diff against v3:

Key:
[----] : patches are identical
[####] : number of functional differences between upstream/downstream patch
[down] : patch is downstream-only
The flags [FC] indicate (F)unctional and (C)ontextual differences, respectively

001/5:[----] [-C] 'iotests/297: Drop 169 and 199 from the skip list'
002/5:[----] [--] 'migrate-bitmaps-postcopy-test: Fix pylint warnings'
003/5:[0006] [FC] 'migrate-bitmaps-test: Fix pylint warnings'
004/5:[down] 'mirror-top-perms: Fix AbnormalShutdown path'
005/5:[----] [--] 'iotests/297: Cover tests/'


Hanna Reitz (5):
  iotests/297: Drop 169 and 199 from the skip list
  migrate-bitmaps-postcopy-test: Fix pylint warnings
  migrate-bitmaps-test: Fix pylint warnings
  mirror-top-perms: Fix AbnormalShutdown path
  iotests/297: Cover tests/

 tests/qemu-iotests/297                        |  7 +--
 .../tests/migrate-bitmaps-postcopy-test       | 13 +++---
 tests/qemu-iotests/tests/migrate-bitmaps-test | 43 +++++++++++--------
 tests/qemu-iotests/tests/mirror-top-perms     |  2 +-
 4 files changed, 37 insertions(+), 28 deletions(-)

-- 
2.31.1


