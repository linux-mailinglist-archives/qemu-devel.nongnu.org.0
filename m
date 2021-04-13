Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D75235E04A
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 15:41:09 +0200 (CEST)
Received: from localhost ([::1]:40196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWJHw-0003ug-Dt
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 09:41:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lWJG8-00034k-83
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 09:39:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lWJG6-00058I-8n
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 09:39:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618321152;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=iWuBk9zJk5Mgl0YarRB3NMjBZ3oG+4IkzUmHkiwJLao=;
 b=BgTU9nEmU/dPiabbwH8TBblU9iBNKJe72ak5tyTxCSmo7LdkOkplf/qO7WGfQI/Vg2EDRs
 Mbx2e03FQF2ziwRcOt3AOHWBD73O1f2nrLUIcykoQfRa9d2ECSJLnqWut4Tlbv6bhV08B5
 uuYAjj0zEYTL83pO6hXpKtC/StThKdE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-539-5Ev3J3K9M7yBMn8Jp2RLqA-1; Tue, 13 Apr 2021 09:39:07 -0400
X-MC-Unique: 5Ev3J3K9M7yBMn8Jp2RLqA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BAE5B107ACC7;
 Tue, 13 Apr 2021 13:39:05 +0000 (UTC)
Received: from localhost (ovpn-114-55.ams2.redhat.com [10.36.114.55])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E8ED50AD6;
 Tue, 13 Apr 2021 13:39:05 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 0/1] Block patch for 6.0-rc3
Date: Tue, 13 Apr 2021 15:39:02 +0200
Message-Id: <20210413133903.545695-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit dce628a97fde2594f99d738883a157f05aa0a14f:

  Merge remote-tracking branch 'remotes/dg-gitlab/tags/ppc-for-6.0-20210412' into staging (2021-04-13 13:05:07 +0100)

are available in the Git repository at:

  https://github.com/XanClic/qemu.git tags/pull-block-2021-04-13

for you to fetch changes up to 0267101af64292c9a84fd9319a763ddfbce9ddc7:

  block/nbd: fix possible use after free of s->connect_thread (2021-04-13 15:35:12 +0200)

(This is the patch for which Vladimir has sent a pull request yesterday.)

----------------------------------------------------------------
Block patches for 6.0-rc3:
- Use-after-free fix for block/nbd.c

----------------------------------------------------------------
Vladimir Sementsov-Ogievskiy (1):
  block/nbd: fix possible use after free of s->connect_thread

 block/nbd.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

-- 
2.29.2


