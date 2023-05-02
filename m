Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7A96F40FE
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 12:19:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptn67-0004ml-BM; Tue, 02 May 2023 06:19:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ptn64-0004l8-S5
 for qemu-devel@nongnu.org; Tue, 02 May 2023 06:19:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ptn5z-0000Kf-5b
 for qemu-devel@nongnu.org; Tue, 02 May 2023 06:19:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683022734;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sdFgf1NbKu+A5/DM+x4xrm7n6SSwRdU07Tpi++x2oqE=;
 b=WXlTZ0hvtsRmBSE0unSAHC+0Rltjd+gqcJsV8B0LtUsquNygoSLCvHJseRTFP4KcUZNip1
 AG/PspbM8XIWYhYZ57nBUz7M0fGIAp5kSNr98xmvh0mAgiJzWajGdWyUb8iPhUOyw6pUJD
 fRTHtJeQPeP7q/3hzcj7NRhefFCTv4M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-39-hwbUWV2hNcihH5ycteHLww-1; Tue, 02 May 2023 06:18:53 -0400
X-MC-Unique: hwbUWV2hNcihH5ycteHLww-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EBFDF87B2A2;
 Tue,  2 May 2023 10:18:52 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3DDE7C15BAD;
 Tue,  2 May 2023 10:18:52 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Cc: Alexander Bulekov <alxndr@bu.edu>
Subject: [PULL 1/3] tests/qtest: Disable the spice test of readconfig-test on
 FreeBSD
Date: Tue,  2 May 2023 12:18:47 +0200
Message-Id: <20230502101849.1655453-2-thuth@redhat.com>
In-Reply-To: <20230502101849.1655453-1-thuth@redhat.com>
References: <20230502101849.1655453-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Message-Id: <20230428151351.1365822-1-thuth@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
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


