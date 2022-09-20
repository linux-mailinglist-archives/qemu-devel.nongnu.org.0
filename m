Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E0E5BEE94
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 22:32:43 +0200 (CEST)
Received: from localhost ([::1]:42164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oajv7-00059m-Lg
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 16:32:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oafHX-0007bc-CR
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 11:35:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oafHV-0001NU-TF
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 11:35:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663688129;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o9p2eTBrLWazRVcP+0OLxsQAxWbOWz03dd5BORnSVQU=;
 b=E4apdiqdypQIJ3AVp8jBo0BR1DOe6vTZf45X8X52IATqvbjiNq5AKN8uwkJozRdUE+nPdD
 wgpW1H4+ypZcKyWyCnUJW5F27mB5AET975VdeOqbD5lZMH3O+MxxyfNMj1pdjASWpWAUYd
 KZdGHGpmWRGYQrFX+P272g/wRfX7PZY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-447-asc1lYY2OiWEsTzWrDHazw-1; Tue, 20 Sep 2022 11:35:27 -0400
X-MC-Unique: asc1lYY2OiWEsTzWrDHazw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C1CAD8027F5;
 Tue, 20 Sep 2022 15:35:26 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.218])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 96C02492B04;
 Tue, 20 Sep 2022 15:35:25 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 06/15] tests: Fix error strings
Date: Tue, 20 Sep 2022 17:35:03 +0200
Message-Id: <20220920153512.187283-7-thuth@redhat.com>
In-Reply-To: <20220920153512.187283-1-thuth@redhat.com>
References: <20220920153512.187283-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Juan Quintela <quintela@redhat.com>

They were copy-pasted from e1000e and never changed.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Message-Id: <20220902165126.1482-7-quintela@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/e1000-test.c  | 2 +-
 tests/qtest/es1370-test.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/e1000-test.c b/tests/qtest/e1000-test.c
index c387984ef6..4e0d7a5607 100644
--- a/tests/qtest/e1000-test.c
+++ b/tests/qtest/e1000-test.c
@@ -35,7 +35,7 @@ static void *e1000_get_driver(void *obj, const char *interface)
         return &e1000->dev;
     }
 
-    fprintf(stderr, "%s not present in e1000e\n", interface);
+    fprintf(stderr, "%s not present in e1000\n", interface);
     g_assert_not_reached();
 }
 
diff --git a/tests/qtest/es1370-test.c b/tests/qtest/es1370-test.c
index adccdac1be..97ab65c435 100644
--- a/tests/qtest/es1370-test.c
+++ b/tests/qtest/es1370-test.c
@@ -28,7 +28,7 @@ static void *es1370_get_driver(void *obj, const char *interface)
         return &es1370->dev;
     }
 
-    fprintf(stderr, "%s not present in e1000e\n", interface);
+    fprintf(stderr, "%s not present in es1370\n", interface);
     g_assert_not_reached();
 }
 
-- 
2.31.1


