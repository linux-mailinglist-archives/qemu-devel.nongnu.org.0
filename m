Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2543FEB84
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 11:45:48 +0200 (CEST)
Received: from localhost ([::1]:35196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLjI3-0002QQ-2P
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 05:45:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mLjCw-0001wh-JO
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 05:40:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mLjCs-0008DB-8j
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 05:40:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630575624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t6OF07sb0SyCVTfZxQfE2VDis2lkR5Ytc7hTqjhrYzQ=;
 b=Tvz/2OUD2HTWl9Zk9PYdGaY+LnoOsoE5LAFQ2W8rhC2TuvHCkryT9v6mBzjiAEp7xWuAUr
 hqiV73FuOJj3LExauhxo9kmk2jZVqAY66xz0fe8LDXi2UlYgTo506p+MZBnu6jPo6kaa4k
 Nhp2ZK3wEf65gufYVjSoqEQmOjauwh4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-600-j6XREpLZOQyPAwj_4rg5TQ-1; Thu, 02 Sep 2021 05:40:23 -0400
X-MC-Unique: j6XREpLZOQyPAwj_4rg5TQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 13987188E3CA;
 Thu,  2 Sep 2021 09:40:22 +0000 (UTC)
Received: from localhost (unknown [10.39.193.237])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B02213ADB;
 Thu,  2 Sep 2021 09:40:21 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 1/5] iotests/297: Drop 169 and 199 from the skip list
Date: Thu,  2 Sep 2021 11:40:13 +0200
Message-Id: <20210902094017.32902-2-hreitz@redhat.com>
In-Reply-To: <20210902094017.32902-1-hreitz@redhat.com>
References: <20210902094017.32902-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

169 and 199 have been renamed and moved to tests/ (commit a44be0334be:
"iotests: rename and move 169 and 199 tests"), so we can drop them from
the skip list.

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/297 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
index 345b617b34..c7d709cf50 100755
--- a/tests/qemu-iotests/297
+++ b/tests/qemu-iotests/297
@@ -29,7 +29,7 @@ import iotests
 SKIP_FILES = (
     '030', '040', '041', '044', '045', '055', '056', '057', '065', '093',
     '096', '118', '124', '132', '136', '139', '147', '148', '149',
-    '151', '152', '155', '163', '165', '169', '194', '196', '199', '202',
+    '151', '152', '155', '163', '165', '194', '196', '202',
     '203', '205', '206', '207', '208', '210', '211', '212', '213', '216',
     '218', '219', '224', '228', '234', '235', '236', '237', '238',
     '240', '242', '245', '246', '248', '255', '256', '257', '258', '260',
-- 
2.31.1


