Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5507F682A20
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 11:14:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMndB-0002dI-Eu; Tue, 31 Jan 2023 05:12:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMnd4-0002TF-0B
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 05:12:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMnd0-0002Yh-U5
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 05:12:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675159957;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0qwmNctkBIRSRWUWQyCcS2Cb8oWJUu8VOrorByu2uSM=;
 b=fqoP/p6wfadzMUT8DVAjVQQ2pMdv04eOlQjvwWYV5PZ4NlEWNvc7O3PdVh1YLz+6AaCcco
 PEjNchn++w8mAz5+5gNEMB0Tt0CQswy9lUr/NKDZpICUIAGLpc028zwapSN8ptpb7/igBr
 U4Gz6+2LyzKzHYMR32CWRXgVwm4cc34=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-300-0KlVESzNOMyFjPa1pd1lCA-1; Tue, 31 Jan 2023 05:12:34 -0500
X-MC-Unique: 0KlVESzNOMyFjPa1pd1lCA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 60BB93C025B7;
 Tue, 31 Jan 2023 10:12:33 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.188])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 54611C15BAD;
 Tue, 31 Jan 2023 10:12:32 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 20/27] tests/qtest/vnc-display-test: Disable on Darwin
Date: Tue, 31 Jan 2023 11:11:58 +0100
Message-Id: <20230131101205.1499867-21-thuth@redhat.com>
In-Reply-To: <20230131101205.1499867-1-thuth@redhat.com>
References: <20230131101205.1499867-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

This test is failing in gtk-vnc on Darwin:

  $ make check-qtest-aarch64
  ...
  19/20 qemu:qtest+qtest-aarch64 / qtest-aarch64/vnc-display-test
  ERROR **: 10:42:35.488: vnc-error: Unsupported auth type 17973672

While QEMU picks the sigaltstack coroutine backend, gtk-vnc uses
the ucontext coroutine backend, which might be broken on Darwin.

Disable this test (current problem being investigated in this thread:
https://lore.kernel.org/qemu-devel/Y8kw6X6keB5l53nl@redhat.com/).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230119120514.28778-4-philmd@linaro.org>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/vnc-display-test.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/vnc-display-test.c b/tests/qtest/vnc-display-test.c
index df468c7b22..e52a4326ec 100644
--- a/tests/qtest/vnc-display-test.c
+++ b/tests/qtest/vnc-display-test.c
@@ -19,7 +19,7 @@ typedef struct Test {
     GMainLoop *loop;
 } Test;
 
-#if !defined(WIN32)
+#if !defined(WIN32) && !defined(CONFIG_DARWIN)
 
 static void on_vnc_error(VncConnection* self,
                          const char* msg)
@@ -41,6 +41,9 @@ test_setup(Test *test)
 #ifdef WIN32
     g_test_skip("Not supported on Windows yet");
     return false;
+#elif defined(CONFIG_DARWIN)
+    g_test_skip("Broken on Darwin");
+    return false;
 #else
     int pair[2];
 
-- 
2.31.1


