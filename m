Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB6D47D56B
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 17:53:52 +0100 (CET)
Received: from localhost ([::1]:47280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n04sB-0008Mv-A2
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 11:53:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1n04qx-0006J4-0k
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 11:52:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58031)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1n04qo-0006Rj-Cw
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 11:52:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640191945;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xNcwX8e0cjHXXEaZ52oFlLVyXhJ2lNu9Kqz48iAP17E=;
 b=G4Tp3FfvufXgOU9w+bnQSaVbdjEou50az9xqP1A2fSOSXi3oFswVzNTF1sfOkefN6okfeh
 8vysSwSq78DNRyH+y73CPXHt4PhfZvGKnQ4MQtyPXxPAZWuAd48Dor2YPQJXaA9IUs3Gbt
 N3GBBiRgnT0as+yDdig+rG1jMeQAMrg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-605-2jid_I_bMpyS7beYGYAQNg-1; Wed, 22 Dec 2021 11:52:17 -0500
X-MC-Unique: 2jid_I_bMpyS7beYGYAQNg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 45D5C18C8C02;
 Wed, 22 Dec 2021 16:52:16 +0000 (UTC)
Received: from localhost (unknown [10.39.194.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DCBD984A1D;
 Wed, 22 Dec 2021 16:52:15 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 1/3] iotests/testrunner.py: add doc string for run_test()
Date: Wed, 22 Dec 2021 17:52:06 +0100
Message-Id: <20211222165208.693159-2-hreitz@redhat.com>
In-Reply-To: <20211222165208.693159-1-hreitz@redhat.com>
References: <20211222165208.693159-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

We are going to modify these methods and will add more documentation in
further commit. As a preparation add basic documentation.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20211203122223.2780098-2-vsementsov@virtuozzo.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Tested-by: John Snow <jsnow@redhat.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/testrunner.py | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/tests/qemu-iotests/testrunner.py b/tests/qemu-iotests/testrunner.py
index 0e29c2fddd..fa842252d3 100644
--- a/tests/qemu-iotests/testrunner.py
+++ b/tests/qemu-iotests/testrunner.py
@@ -220,6 +220,12 @@ def find_reference(self, test: str) -> str:
         return f'{test}.out'
 
     def do_run_test(self, test: str) -> TestResult:
+        """
+        Run one test
+
+        :param test: test file path
+        """
+
         f_test = Path(test)
         f_bad = Path(f_test.name + '.out.bad')
         f_notrun = Path(f_test.name + '.notrun')
@@ -287,6 +293,13 @@ def do_run_test(self, test: str) -> TestResult:
 
     def run_test(self, test: str,
                  test_field_width: Optional[int] = None) -> TestResult:
+        """
+        Run one test and print short status
+
+        :param test: test file path
+        :param test_field_width: width for first field of status format
+        """
+
         last_el = self.last_elapsed.get(test)
         start = datetime.datetime.now().strftime('%H:%M:%S')
 
-- 
2.33.1


