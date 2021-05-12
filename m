Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E2D37D104
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 19:51:58 +0200 (CEST)
Received: from localhost ([::1]:58464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgt1Z-0001O9-EE
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 13:51:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lgstP-00034W-VQ
 for qemu-devel@nongnu.org; Wed, 12 May 2021 13:43:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52255)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lgstN-0006dV-MQ
 for qemu-devel@nongnu.org; Wed, 12 May 2021 13:43:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620841409;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TBBhCa9kpR+FjWdHhTQB8NP3iSw5WyqZmTaKDGsqKHo=;
 b=CbYS4g5NJmtwLMhZJ17nzhMyQNxuyPJwfg6xq6rmMzzP5IPz+2eGpXdQ9++IL8HtJjDsE6
 jfYEF23sDWoBg2Ea7brc+Xla1cTk2R1IoBrVHbCceemXN8E+smWhKnZqPYyf7fwfqQ/fir
 VhyaqR2Ef2JlidcGfSGCXP8DMlaI/Ew=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-3MKRk9UMOU6nV8c-YnYhsg-1; Wed, 12 May 2021 13:43:25 -0400
X-MC-Unique: 3MKRk9UMOU6nV8c-YnYhsg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C405D1B18BC1;
 Wed, 12 May 2021 17:43:24 +0000 (UTC)
Received: from localhost (ovpn-114-121.ams2.redhat.com [10.36.114.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D7852CE3A;
 Wed, 12 May 2021 17:43:24 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 1/4] iotests/297: Drop 169 and 199 from the skip list
Date: Wed, 12 May 2021 19:43:15 +0200
Message-Id: <20210512174318.59466-2-mreitz@redhat.com>
In-Reply-To: <20210512174318.59466-1-mreitz@redhat.com>
References: <20210512174318.59466-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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

169 and 199 have been renamed and moved to tests/ (commit a44be0334be:
"iotests: rename and move 169 and 199 tests"), so we can drop them from
the skip list.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/297 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
index a37910b42d..e3244d40a0 100755
--- a/tests/qemu-iotests/297
+++ b/tests/qemu-iotests/297
@@ -29,7 +29,7 @@ import iotests
 SKIP_FILES = (
     '030', '040', '041', '044', '045', '055', '056', '057', '065', '093',
     '096', '118', '124', '132', '136', '139', '147', '148', '149',
-    '151', '152', '155', '163', '165', '169', '194', '196', '199', '202',
+    '151', '152', '155', '163', '165', '194', '196', '202',
     '203', '205', '206', '207', '208', '210', '211', '212', '213', '216',
     '218', '219', '222', '224', '228', '234', '235', '236', '237', '238',
     '240', '242', '245', '246', '248', '255', '256', '257', '258', '260',
-- 
2.31.1


