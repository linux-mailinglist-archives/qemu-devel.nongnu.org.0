Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A50B30C6AB
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 17:57:57 +0100 (CET)
Received: from localhost ([::1]:60214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6z00-0003Jh-B7
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 11:57:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l6yYJ-0005KZ-8I
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 11:29:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l6yYH-0000HV-Hu
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 11:29:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612283356;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E2W1HGEgCNWOCZS4CT3q/hTS9q/xlepHrVHCPnJh7Cs=;
 b=UAPV3U5HylB0BsKYL3qd10CCfT4/TmngKGaSm5vLrpLIYVswm//dtLnE25G4a6jZ/Hrsww
 sG3RjDGUi74J4phBTzhYDQiHOame7TtBykUKpr9jfbR3iTLiiO1ICcpKGtjuLciHyFnaw6
 ODsnXNfXcOa/Ts29bO1xt4JCfZp6+kQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-137-1gLX7cI5PEeJYWN_BGqKdg-1; Tue, 02 Feb 2021 11:29:11 -0500
X-MC-Unique: 1gLX7cI5PEeJYWN_BGqKdg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C7F881005501;
 Tue,  2 Feb 2021 16:29:10 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-112-19.ams2.redhat.com [10.36.112.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 35C8F5D749;
 Tue,  2 Feb 2021 16:29:08 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL v2 07/10] iotests: Fix -makecheck output
Date: Tue,  2 Feb 2021 17:28:31 +0100
Message-Id: <20210202162834.269789-8-kwolf@redhat.com>
In-Reply-To: <20210202162834.269789-1-kwolf@redhat.com>
References: <20210202162834.269789-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
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


