Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D9C30B02F
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 20:19:09 +0100 (CET)
Received: from localhost ([::1]:35480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6ej6-00035D-He
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 14:19:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l6eYC-0003wX-TF
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 14:07:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l6eY7-0000Te-Cn
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 14:07:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612206466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E2W1HGEgCNWOCZS4CT3q/hTS9q/xlepHrVHCPnJh7Cs=;
 b=ZB38GLaFKGbIseIWateKkpKzZ6vBAk6BB3QDZ8kDQ0GB6kcBQsTup/GW+u29+csOafjDYh
 nYadaaqaZjwsMvHJ54D5T5Z4FalkemL5Ur15MB8Je438wLBoF1PVDt3CcqJPgUnrmW0VxC
 Orw+oX/P6jiwRupU9a/Hol/nCR5QfYs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-otynvm3sN3-Vi43tla98gw-1; Mon, 01 Feb 2021 14:07:44 -0500
X-MC-Unique: otynvm3sN3-Vi43tla98gw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE0461800D41;
 Mon,  1 Feb 2021 19:07:42 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-112-72.ams2.redhat.com [10.36.112.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 004E960C05;
 Mon,  1 Feb 2021 19:07:41 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 6/6] iotests: Fix -makecheck output
Date: Mon,  1 Feb 2021 20:07:20 +0100
Message-Id: <20210201190720.245732-7-kwolf@redhat.com>
In-Reply-To: <20210201190720.245732-1-kwolf@redhat.com>
References: <20210201190720.245732-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
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
Message-Id: <20210201161024.127921-1-kwolf@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
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


