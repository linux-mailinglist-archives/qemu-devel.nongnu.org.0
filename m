Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6267C5FC7BA
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 16:50:38 +0200 (CEST)
Received: from localhost ([::1]:33274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oid49-0006Qp-Ei
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 10:50:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oicni-0005GS-NF
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 10:33:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oicnc-0006ku-U9
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 10:33:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665585212;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lJlP5MOU0pLgqjxqhbAT+8OY0yYhs5lsBqASSmeazUA=;
 b=dqbSe0lkh+E/pntf244KqWICP2GjOx0g9aZ3OITvUToDIcV+x1TnwFHU/Wt2Naw0fsqd+9
 VQm6ntRv3OF4Rjh2DMXFT73C/JfdDyKdrZ3IJ2eO9iBmmkcyG2N/LjYLf6wsXkRmr81BWn
 YDW3vOZY0vcwHMHOLmw188topoFkiLE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-362-b5IqFWkiND28g5fjg6zFeA-1; Wed, 12 Oct 2022 10:33:28 -0400
X-MC-Unique: b5IqFWkiND28g5fjg6zFeA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8A5A0382ECCB;
 Wed, 12 Oct 2022 14:33:28 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.235])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C6D482144B20;
 Wed, 12 Oct 2022 14:33:27 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: Michael Labiuk <michael.labiuk@virtuozzo.com>
Subject: [PULL 08/16] tests/x86: Fix comment typo in drive_del-test
Date: Wed, 12 Oct 2022 16:33:08 +0200
Message-Id: <20221012143316.988561-9-thuth@redhat.com>
In-Reply-To: <20221012143316.988561-1-thuth@redhat.com>
References: <20221012143316.988561-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Michael Labiuk <michael.labiuk@virtuozzo.com>

Signed-off-by: Michael Labiuk <michael.labiuk@virtuozzo.com>
Message-Id: <20220929223547.1429580-7-michael.labiuk@virtuozzo.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/drive_del-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/drive_del-test.c b/tests/qtest/drive_del-test.c
index 467e752b0d..44b9578801 100644
--- a/tests/qtest/drive_del-test.c
+++ b/tests/qtest/drive_del-test.c
@@ -327,7 +327,7 @@ static void test_blockdev_add_device_add_and_del(void)
     qts = qtest_init(machine_addition);
 
     /*
-     * blockdev_add/device_add and device_del.  The it drive is used by a
+     * blockdev_add/device_add and device_del. The drive is used by a
      * device that unplugs after reset, but it doesn't go away.
      */
     blockdev_add_with_media(qts);
-- 
2.31.1


