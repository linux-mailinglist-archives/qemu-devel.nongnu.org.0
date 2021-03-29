Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 453E334D11F
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 15:30:04 +0200 (CEST)
Received: from localhost ([::1]:49052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQrxz-0002de-AA
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 09:30:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lQruu-0006OX-Mf
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 09:26:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35275)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lQrut-0002xd-68
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 09:26:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617024410;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+zJ2a3FUrd852wYFH+3gurn0ueQaOMm7b7sg41oo/XY=;
 b=YeslCwIpSDyJ03pvbuOE2hLOmDtUafw8k/sLw+rROplalWzNYfRNIMsQIANBcytiy30hyq
 vu1qNf8+72+/Oqv9EHiVElpn5TWOe0ZYTE1XJ+jvZlYaRJrZKVQd3v3S0fg10DdpNvJG6o
 WTXEgBPBHmLxy6uX9ayaQLItSFVzyX0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499-gG-nwJmCNvS9LfCYaDzUSg-1; Mon, 29 Mar 2021 09:26:36 -0400
X-MC-Unique: gG-nwJmCNvS9LfCYaDzUSg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 868D980A1AC;
 Mon, 29 Mar 2021 13:26:34 +0000 (UTC)
Received: from localhost (ovpn-113-119.ams2.redhat.com [10.36.113.119])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 252FA18219;
 Mon, 29 Mar 2021 13:26:33 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 0/4] iotests/297: Cover tests/
Date: Mon, 29 Mar 2021 15:26:28 +0200
Message-Id: <20210329132632.68901-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

Hi,

When reviewing Vladimir’s new addition to tests/, I noticed that 297 so
far does not cover named tests.  That isn’t so good.

This series makes it cover them, and because tests/ is rather sparse at
this point, I decided to also fix up the two tests in there that don’t
pass pylint’s scrutiny yet.  I think it would be nice if we could keep
all of tests/ clean.


Max Reitz (4):
  iotests/297: Drop 169 and 199 from the skip list
  migrate-bitmaps-postcopy-test: Fix pylint warnings
  migrate-bitmaps-test: Fix pylint warnings
  iotests/297: Cover tests/

 tests/qemu-iotests/297                        |  7 ++--
 .../tests/migrate-bitmaps-postcopy-test       |  3 ++
 tests/qemu-iotests/tests/migrate-bitmaps-test | 38 ++++++++++---------
 3 files changed, 27 insertions(+), 21 deletions(-)

-- 
2.29.2


