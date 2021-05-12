Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A078237D0FF
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 19:48:16 +0200 (CEST)
Received: from localhost ([::1]:45864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgsxz-0001Mh-JQ
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 13:48:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lgstO-00030n-Rh
 for qemu-devel@nongnu.org; Wed, 12 May 2021 13:43:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45216)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lgstL-0006c5-T3
 for qemu-devel@nongnu.org; Wed, 12 May 2021 13:43:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620841407;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fgK8UwBZ0N3R83rM+wIBLgOL5B0pZ+lJrxc+ksQaZKM=;
 b=iTH4dse7tD068qTo0qy7kBRUPDlQfSCK38F7TzQHNhX9nIo4xg7xcGjvGPzsVI2pAKLtie
 zH19Pa2umIvChBvQeJsFCu0TdrBnTWEvhcmfx6UEscJUlUMMQeCPIB6bW9M91RlRAAQgM3
 LD1UeLdPRZ2vmfq21cQz2Of69lHLkuM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-58-9oXpbUCbMKqo7y86wowEIA-1; Wed, 12 May 2021 13:43:23 -0400
X-MC-Unique: 9oXpbUCbMKqo7y86wowEIA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C49B6801817;
 Wed, 12 May 2021 17:43:22 +0000 (UTC)
Received: from localhost (ovpn-114-121.ams2.redhat.com [10.36.114.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AA1975C8AA;
 Wed, 12 May 2021 17:43:20 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 0/4] iotests/297: Cover tests/
Date: Wed, 12 May 2021 19:43:14 +0200
Message-Id: <20210512174318.59466-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


Hi,

When reviewing Vladimir’s new addition to tests/, I noticed that 297 so
far does not cover named tests.  That isn’t so good.

This series makes it cover them, and because tests/ is rather sparse at
this point, I decided to also fix up the two tests in there that don’t
pass pylint’s scrutiny yet.  I think it would be nice if we could keep
all of tests/ clean.


v2:
- Changed patch 2 as per Vladimir’s suggestion
  (i.e. don’t let discards1_sha256 and all_discards_sha256 be class
  variables at all)


git-backport-diff against v1:

Key:
[----] : patches are identical
[####] : number of functional differences between upstream/downstream patch
[down] : patch is downstream-only
The flags [FC] indicate (F)unctional and (C)ontextual differences, respectively

001/4:[----] [--] 'iotests/297: Drop 169 and 199 from the skip list'
002/4:[0016] [FC] 'migrate-bitmaps-postcopy-test: Fix pylint warnings'
003/4:[----] [--] 'migrate-bitmaps-test: Fix pylint warnings'
004/4:[----] [--] 'iotests/297: Cover tests/'


Max Reitz (4):
  iotests/297: Drop 169 and 199 from the skip list
  migrate-bitmaps-postcopy-test: Fix pylint warnings
  migrate-bitmaps-test: Fix pylint warnings
  iotests/297: Cover tests/

 tests/qemu-iotests/297                        |  7 ++--
 .../tests/migrate-bitmaps-postcopy-test       | 13 ++++---
 tests/qemu-iotests/tests/migrate-bitmaps-test | 38 ++++++++++---------
 3 files changed, 31 insertions(+), 27 deletions(-)

-- 
2.31.1


