Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B968340CC09
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 19:55:41 +0200 (CEST)
Received: from localhost ([::1]:48756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQZ8G-0000z5-9d
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 13:55:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQZ6S-0006K8-E3
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 13:53:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQZ6N-0006c5-52
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 13:53:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631728422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=joD4WMD27Tc41sGzuYQQdUF+MK11b76h19wdcVkn+wY=;
 b=TypZiSsM4Q0Qbj3KU4pTMyKHE3pMvdAxDEE32z5GXqgOQ2rXFwSA1TazjCZvnranGEW3eP
 2edjHPNeYFyINGiv8p6MYNZqbE/xZXe9GEHiAF9RUlHP/kaRTF2YS3M6zR913H7WYCyiLX
 l8/q62dBMBO9ChukeUGHWl5/po9qoa8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-512-bAUZDa1OM1SNJXGaTa7SfQ-1; Wed, 15 Sep 2021 13:53:41 -0400
X-MC-Unique: bAUZDa1OM1SNJXGaTa7SfQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2DF461084683;
 Wed, 15 Sep 2021 17:53:40 +0000 (UTC)
Received: from localhost (unknown [10.39.192.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C918E19736;
 Wed, 15 Sep 2021 17:53:39 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 09/32] iotests: Fix use-{list,dict}-literal warnings
Date: Wed, 15 Sep 2021 19:52:55 +0200
Message-Id: <20210915175318.853225-10-hreitz@redhat.com>
In-Reply-To: <20210915175318.853225-1-hreitz@redhat.com>
References: <20210915175318.853225-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.39, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

pylint proposes using `[]` instead of `list()` and `{}` instead of
`dict()`, because it is faster.  That seems simple enough, so heed its
advice.

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20210824153540.177128-3-hreitz@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/iotests.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index d8c64d4c11..ce06cf5630 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -703,7 +703,7 @@ def hmp_qemu_io(self, drive: str, cmd: str,
 
     def flatten_qmp_object(self, obj, output=None, basestr=''):
         if output is None:
-            output = dict()
+            output = {}
         if isinstance(obj, list):
             for i, item in enumerate(obj):
                 self.flatten_qmp_object(item, output, basestr + str(i) + '.')
@@ -716,7 +716,7 @@ def flatten_qmp_object(self, obj, output=None, basestr=''):
 
     def qmp_to_opts(self, obj):
         obj = self.flatten_qmp_object(obj)
-        output_list = list()
+        output_list = []
         for key in obj:
             output_list += [key + '=' + obj[key]]
         return ','.join(output_list)
-- 
2.31.1


