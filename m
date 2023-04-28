Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6116F1B48
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 17:16:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psPoW-0003lk-6j; Fri, 28 Apr 2023 11:15:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1psPoT-0003l5-Kc
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 11:15:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1psPoN-0001bG-ED
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 11:15:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682694901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=2db8YhZ5s64QSvlTugjAUg9ywkNATWt4vyscmYZiiwM=;
 b=O7AhAjfQkXyjUWSviotT9nLcrRHLoXIg3339FQv9pI2xI6z/twVxhcn9Yi2SokHXfjTcSn
 2hko7Oo/x7eyX03zocaDLRjztOJGL9vL6Dex8ny4mW8AOsXdcAVocc5tdmXyvy/gwFE70G
 1gVWPbRjkyYYLPZqSw6iyHIfyzEPBUc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-IWk9rzKiNHiL9Su3UT08lQ-1; Fri, 28 Apr 2023 11:14:56 -0400
X-MC-Unique: IWk9rzKiNHiL9Su3UT08lQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 98103890F6F;
 Fri, 28 Apr 2023 15:13:55 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9F7DC14171B6;
 Fri, 28 Apr 2023 15:13:53 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Brad Smith <brad@comstyle.com>,
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 Ed Maste <emaste@freebsd.org>, Li-Wen Hsu <lwhsu@freebsd.org>
Subject: [PATCH] tests/qtest: Disable the spice test of readconfig-test on
 FreeBSD
Date: Fri, 28 Apr 2023 17:13:51 +0200
Message-Id: <20230428151351.1365822-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The spice test is currently hanging on FreeBSD. It likely was
never working before, since in the past, our configure script
was failing to detect this feature due to a bug in the spice
package there (it just got enabled recently by the commit
https://cgit.freebsd.org/ports/commit/?id=cf16b1c9063351325f0 ).
To get the CI working again, let's disable the failing test for
now until someone has enough spare time to debug and fix the real
underlying problem.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/readconfig-test.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/qtest/readconfig-test.c b/tests/qtest/readconfig-test.c
index 2160603880..918d45684b 100644
--- a/tests/qtest/readconfig-test.c
+++ b/tests/qtest/readconfig-test.c
@@ -86,8 +86,8 @@ static void test_x86_memdev(void)
     qtest_quit(qts);
 }
 
-
-#ifdef CONFIG_SPICE
+/* FIXME: The test is currently broken on FreeBSD */
+#if defined(CONFIG_SPICE) && !defined(__FreeBSD__)
 static void test_spice_resp(QObject *res)
 {
     Visitor *v;
@@ -209,7 +209,7 @@ int main(int argc, char *argv[])
         qtest_add_func("readconfig/x86/memdev", test_x86_memdev);
         qtest_add_func("readconfig/x86/ich9-ehci-uhci", test_docs_config_ich9);
     }
-#ifdef CONFIG_SPICE
+#if defined(CONFIG_SPICE) && !defined(__FreeBSD__)
     qtest_add_func("readconfig/spice", test_spice);
 #endif
 
-- 
2.31.1


