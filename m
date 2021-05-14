Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6AF238099E
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 14:34:04 +0200 (CEST)
Received: from localhost ([::1]:49128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhX11-0002gy-Ry
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 08:34:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lhWju-000180-H4
 for qemu-devel@nongnu.org; Fri, 14 May 2021 08:16:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lhWji-0005CH-1k
 for qemu-devel@nongnu.org; Fri, 14 May 2021 08:16:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620994569;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j/wH9psoh9uMcU1oiJdjRiAj7sIw/rh8zckC3ACOccw=;
 b=DY3SYd97p3XNnnvVWVG7Rn5OrdKVg7MLomZ5XOeFFeFf1s1oAR4gvNy/lel9pU+jSYARfa
 U/Q3hXjWw0WxS1XQn1/TzhfhuwlCwozAN1hPsXc1xLh1iQSCUok+iL1LZOHZIh/jVw7HHz
 ONe+OdyblsmXAK/ciNV/YKtTBWXjLSA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-T4djApgdMyumESE89WRzGQ-1; Fri, 14 May 2021 08:16:07 -0400
X-MC-Unique: T4djApgdMyumESE89WRzGQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC543801817;
 Fri, 14 May 2021 12:16:05 +0000 (UTC)
Received: from thuth.com (ovpn-112-191.ams2.redhat.com [10.36.112.191])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0B0EF6060F;
 Fri, 14 May 2021 12:16:04 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 13/20] tests/qtest/rtc-test: Remove pointless NULL check
Date: Fri, 14 May 2021 14:15:11 +0200
Message-Id: <20210514121518.832729-14-thuth@redhat.com>
In-Reply-To: <20210514121518.832729-1-thuth@redhat.com>
References: <20210514121518.832729-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

In rtc-test.c we know that s is non-NULL because qtest_start()
will return a non-NULL value, and we assume this when we
pass s to qtest_irq_intercept_in(). So we can drop the
initial assignment of NULL and the "if (s)" condition at
the end of the function.

Fixes: Coverity CID 1432353
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210503165525.26221-3-peter.maydell@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/rtc-test.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/tests/qtest/rtc-test.c b/tests/qtest/rtc-test.c
index 402ce2c609..8126ab1bdb 100644
--- a/tests/qtest/rtc-test.c
+++ b/tests/qtest/rtc-test.c
@@ -686,7 +686,7 @@ static void periodic_timer(void)
 
 int main(int argc, char **argv)
 {
-    QTestState *s = NULL;
+    QTestState *s;
     int ret;
 
     g_test_init(&argc, &argv, NULL);
@@ -712,9 +712,7 @@ int main(int argc, char **argv)
 
     ret = g_test_run();
 
-    if (s) {
-        qtest_quit(s);
-    }
+    qtest_quit(s);
 
     return ret;
 }
-- 
2.27.0


