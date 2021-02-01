Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4BD30AC54
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 17:12:17 +0100 (CET)
Received: from localhost ([::1]:42046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6boG-0000Iz-OH
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 11:12:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l6bme-0007bl-ID
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 11:10:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l6bma-0000yF-5l
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 11:10:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612195830;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=0Z+hLznX0OAxLMUO/WoOWFUNhPAcYwQICJwAOBKsdf4=;
 b=fUI/oj3dNaNT8PoQEn2TzpS7fgql+sxO36fAZt/Mns3yKkFwXcujlWs6yzAy8vWZeO9EB4
 9xa4V1pB0m93YrmINnViBC4CqBK2Y/qVmMp3mnf3pJsWnMAFmq+73cVzypVz7NVa7pM51G
 562gYNtfglaM84hB2Om6IXN6IKECEws=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-bVgc4chCM2KtC275e8h9UQ-1; Mon, 01 Feb 2021 11:10:28 -0500
X-MC-Unique: bVgc4chCM2KtC275e8h9UQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 29A3E107ACE4;
 Mon,  1 Feb 2021 16:10:27 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-112-72.ams2.redhat.com [10.36.112.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 30D8D10013C0;
 Mon,  1 Feb 2021 16:10:26 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH] iotests: Fix -makecheck output
Date: Mon,  1 Feb 2021 17:10:24 +0100
Message-Id: <20210201161024.127921-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For -makecheck, the old 'check' implementation skipped the output when
starting a test. It only had the condensed output at the end of a test.

testrunner.py prints the normal output when starting a test even for
-makecheck. This output contains '\r' at the end so that it can be
overwritten with the result at the end of the test. However, for
-makecheck this is shorter output in a different format, so effectively
we end up with garbled output that mixes both output forms.

Revert to the old behaviour of only printing a message after the test
had completed in -makecheck mode.

Fixes: d74c754c924ca34e90b7c96ce2f5609d82c0e628
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/testrunner.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/testrunner.py b/tests/qemu-iotests/testrunner.py
index 25754e9a09..1fc61fcaa3 100644
--- a/tests/qemu-iotests/testrunner.py
+++ b/tests/qemu-iotests/testrunner.py
@@ -301,8 +301,10 @@ class TestRunner(ContextManager['TestRunner']):
         last_el = self.last_elapsed.get(test)
         start = datetime.datetime.now().strftime('%H:%M:%S')
 
-        self.test_print_one_line(test=test, starttime=start, lasttime=last_el,
-                                 end='\r', test_field_width=test_field_width)
+        if not self.makecheck:
+            self.test_print_one_line(test=test, starttime=start,
+                                     lasttime=last_el, end='\r',
+                                     test_field_width=test_field_width)
 
         res = self.do_run_test(test)
 
-- 
2.29.2


