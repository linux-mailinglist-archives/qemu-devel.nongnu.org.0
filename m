Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C65CB35152E
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 15:31:31 +0200 (CEST)
Received: from localhost ([::1]:52272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRxQ2-0003Hi-TM
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 09:31:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lRxNB-0001JT-Ga
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 09:28:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lRxN4-0004Ck-8Q
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 09:28:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617283704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=iZ1KAfLOgXVH3pllxuCQQZTJfHnu6Rj5Ivj33xDs4n8=;
 b=i1vy3M7w39ulBqehFxTekP8ER//PL45sby2CfjD/oB/8w5J8XvqPwAS5iUfLMWnitprsoT
 +fWh4f/p99YGWybr8QHRAUafcv0hFA43fwW4S8RBbIQe2FrXyP1ol+Gg94uO8mLo+18eXJ
 EvOWpITaalSWd2weQFAeZfnT+hJcO/o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-44CVKXEpMOC9bKEJURhc8w-1; Thu, 01 Apr 2021 09:28:21 -0400
X-MC-Unique: 44CVKXEpMOC9bKEJURhc8w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B466C190D340;
 Thu,  1 Apr 2021 13:28:20 +0000 (UTC)
Received: from localhost (ovpn-114-60.ams2.redhat.com [10.36.114.60])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0430A646D6;
 Thu,  1 Apr 2021 13:28:16 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 0/2] iotests/qsd-jobs: Use common.qemu for the QSD
Date: Thu,  1 Apr 2021 15:28:13 +0200
Message-Id: <20210401132815.139575-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
 Stefan Hajnoczi <stefanha@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

(Alternative to: “iotests/qsd-jobs: Filter events in the first test”)

Hi,

The qsd-jobs test has kind of unreliable output, because sometimes the
job is ready before ‘quit’, and sometimes it is not.  This series
presents one approach to fix that, which is to extend common.qemu to
allow running the storage daemon instead of qemu, and then to use that
in qsd-jobs to wait for the BLOCK_JOB_READY event before issuing the
‘quit’ command.

I took patch 1 from my “qcow2: Improve refcount structure rebuilding”
series.
(https://lists.nongnu.org/archive/html/qemu-block/2021-03/msg00654.html)

As noted above, this series is an alternative to “iotests/qsd-jobs:
Filter events in the first test”.  I like this series here better
because I’d prefer it if tests that do QMP actually check the output so
they control what’s really happening.
On the other hand, this may be too complicated for 6.0, and we might
want to fix qsd-jobs in 6.0.


Max Reitz (2):
  iotests/common.qemu: Allow using the QSD
  iotests/qsd-jobs: Use common.qemu for the QSD

 tests/qemu-iotests/common.qemu        | 53 +++++++++++++++++++++-----
 tests/qemu-iotests/tests/qsd-jobs     | 55 ++++++++++++++++++++-------
 tests/qemu-iotests/tests/qsd-jobs.out | 10 ++++-
 3 files changed, 92 insertions(+), 26 deletions(-)

-- 
2.29.2


