Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC1B3FDEC6
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 17:36:12 +0200 (CEST)
Received: from localhost ([::1]:35326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLSHb-0007ZN-Ss
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 11:36:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mLRz2-00041W-9f
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 11:17:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mLRz0-0003SI-L2
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 11:16:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630509418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2usmsG2NMXyCm3Z8vG6OJ9Z1sEtTNOVRGMIcpXu7YC8=;
 b=apD+L0rMsmCrF/feEVupZO2UHR2wuAnTngSKbdwfBwQ9sxTTL0zE+AwaSjVszpAL/p5Eff
 JKnASDwoGvn8A/u/gR6kLhzz/l88MSvJJVx3tgwxOeSnsYazGt4YL8WXNlUgvKlBTxxWBX
 5C7HFzkPaXZqkK9la0sB4DL5Mp7Icpg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-FCJiay8GOza2DLUWf9bn8Q-1; Wed, 01 Sep 2021 11:16:56 -0400
X-MC-Unique: FCJiay8GOza2DLUWf9bn8Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 80335801A93;
 Wed,  1 Sep 2021 15:16:55 +0000 (UTC)
Received: from localhost (unknown [10.39.193.250])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 154C46A8F5;
 Wed,  1 Sep 2021 15:16:54 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 16/56] docs/devel/testing: add -p option to the debug section
 of QEMU iotests
Date: Wed,  1 Sep 2021 17:15:39 +0200
Message-Id: <20210901151619.689075-17-hreitz@redhat.com>
In-Reply-To: <20210901151619.689075-1-hreitz@redhat.com>
References: <20210901151619.689075-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Emanuele Giuseppe Esposito <eesposit@redhat.com>

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20210809090114.64834-17-eesposit@redhat.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 docs/devel/testing.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index 8ebcf85a31..4a0abbf23d 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -249,6 +249,10 @@ a failing test:
 * ``-d`` (debug) just increases the logging verbosity, showing
   for example the QMP commands and answers.
 
+* ``-p`` (print) redirects QEMU’s stdout and stderr to the test output,
+  instead of saving it into a log file in
+  ``$TEST_DIR/qemu-machine-<random_string>``.
+
 Test case groups
 ----------------
 
-- 
2.31.1


